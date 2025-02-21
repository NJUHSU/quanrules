# Makefile
FILES = .


# 变量定义
REPO_URL := <your_repo_url>  # 替换为你的 Git 仓库 URL，例如： https://github.com/your-username/your-repo.git
COMMIT_MSG_DEFAULT := auto commit msg      # 默认的提交信息

# 目标： pull - 从 Git 仓库拉取代码
pull:
#	@echo "执行 git pull..."
#	# 假设你的主要分支是 main，如果不是请替换为你的分支名
	git pull origin main  
#	@echo "git pull 完成。"

# 目标： push - 提交本地更改并推送到 GitHub 仓库
push:
#	@echo "执行 git push..."
	git add .
	git commit -m "${COMMIT_MSG_DEFAULT}"
	git push origin main  
#	# 假设你的主要分支是 main，如果不是请替换为你的分支名
#	@echo "git push 完成。"

# 默认目标 (当只输入 make 时执行) - 显示帮助信息
.DEFAULT_GOAL := help
help:
	@echo "Makefile 使用方法:"
	@echo "  make pull     - 从 Git 仓库拉取最新代码。"
	@echo "  make push     - 提交本地更改并推送到 Git 仓库，默认提交信息为 '${COMMIT_MSG_DEFAULT}'。"
	@echo "  make push MSG='你的提交信息' - 提交本地更改并推送到 Git 仓库，使用自定义提交信息。"
	@echo "请先配置 REPO_URL 变量为你的仓库地址。"

# 允许在 make push 时自定义 MSG 变量来修改提交信息
ifneq ($(MSG),)
COMMIT_MSG = $(MSG)
else
COMMIT_MSG = $(COMMIT_MSG_DEFAULT)
endif
export COMMIT_MSG

.PHONY: push pull
