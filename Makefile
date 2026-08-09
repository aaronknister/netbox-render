.PHONY: release

release:
ifndef VERSION
	$(error Usage: make release VERSION=x.y.z)
endif
	@echo "Releasing v$(VERSION)..."
	sed -i '' 's/__version__ = ".*"/__version__ = "$(VERSION)"/' netbox_render/version.py
	git add netbox_render/version.py
	git commit -m "chore: bump version to $(VERSION)"
	git push origin main
	git tag "v$(VERSION)"
	git push origin "v$(VERSION)"
	@echo "Tag v$(VERSION) pushed. Workflow will publish to PyPI."
