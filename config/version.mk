# Copyright (C) 2020 Aospify
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

AOSPIFY_CODENAME := R
AOSPIFY_REVISION := 2
AOSPIFY_SUBREVISION := 0

AOSPIFY_VERSION := $(AOSPIFY_REVISION).$(AOSPIFY_SUBREVISION)
AOSPIFY_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

ifndef AOSPIFY_BUILDTYPE
    AOSPIFY_BUILDTYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst aosp_,,$(TARGET_PRODUCT_SHORT))

AOSPIFY_BUILD_ID := $(AOSPIFY_VERSION)-$(AOSPIFY_CODENAME)-$(AOSPIFY_BUILDTYPE)-$(TARGET_PRODUCT_SHORT)-$(AOSPIFY_BUILD_DATE)
AOSPIFY_BUILD_FINGERPRINT := Aospify/$(AOSPIFY_VERSION)/$(TARGET_PRODUCT_SHORT)/$(AOSPIFY_BUILD_DATE)

# Apply it to build.prop
AOSPIFY_PROPERTIES += \
    ro.aospify.fingerprint=$(AOSPIFY_BUILD_FINGERPRINT) \
    ro.aospify.version=$(AOSPIFY_VERSION) \
    ro.aospify.build_id=Aospify-$(AOSPIFY_BUILD_ID)

ifeq ($(AOSPIFY_BUILDTYPE),OFFICIAL)
    AOSPIFY_PROPERTIES += ro.ota.aospify.build_id=$(AOSPIFY_BUILD_ID)
endif
