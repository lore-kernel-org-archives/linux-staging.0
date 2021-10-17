Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7329CA
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:22:18 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id m26so12845387pff.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RCEoG8Wj2tmwZyFp/O9zov7pfmqwLlm4/WHvu/B4JGg=;
        b=Z1p4eOchvxAp5l+wigxWGKeDDJs8rgMtFBNZtjv2J79ZwStYOkwddbXjidCjEoiOxr
         PLHcnizsaha8B1bh3YH2i2ceEn5Y2XUQ0JFSxn2/rgtsvb/Vrvipfrxmprh18Qpzl5bk
         uGdcaHwqzwqVgu7eGFOJCVJSiJ+/AgP8nfMrTjEuh/KfpetwxbxfbkQZjiEICI67kGb8
         ZrgQWnGzNRS/xmylnO6Aylzw1F+roEm3lplVBMuQGNwuoH2raAmV4zq/69uALDB6QP11
         HLOcFjzPjdd8UIvcf6D6+0/l61vMuh/MCllsWkIFfSMVz54VtTXmmaud9ylCV6YQLEnx
         kmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RCEoG8Wj2tmwZyFp/O9zov7pfmqwLlm4/WHvu/B4JGg=;
        b=mbApw/mvm7K52tHZy7Ki9Gs2u9gYdf04v/mZhZ240DEZikrcmAT5kv1rsF/uFdiebw
         F9XX0vYlByHSK/ii2R1gl00mPXyAvhFQs6CmnWTPG3vqm7YWNpMi4jQVCKFJOHHONzR6
         7B4iza9eS+qQxkku5YeJ+p8qg8WWJvZU6bM+YP/5shdXmMQDTd5uMUYxIFN+mtTU8GLi
         DLUtwPeOENbc5wpy2XOODnOVx02KODI8ezcm0myiuk2cLibWDNJFEeFfRGLTut8xbJYm
         X9czhUER93Tf4Ck5qd4rcQKAAs6/q2DFpMLRcK28fa/zBaq1zcTW3iZUjCbQPwbKHo01
         UFXA==
X-Gm-Message-State: AOAM530xG7DSd35/4vSP++VL6vB5neajCke0uquxY31WXhTL7YA6J7/y
	JbmloDm54fqkuMWOqhW0tlE=
X-Google-Smtp-Source: ABdhPJy8wEdxruvSGQ5pt9lgh0xLrvT4JJBQmL2x3YAjOBh+L38/MudY/thtGQOoNk43Ibawc5PrJw==
X-Received: by 2002:a05:6a00:23d6:b0:44d:8426:e2bb with SMTP id g22-20020a056a0023d600b0044d8426e2bbmr19956794pfc.30.1634487738125;
        Sun, 17 Oct 2021 09:22:18 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:17 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Alan <alan@linux.intel.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/17] media: atomisp: pci: release_version is now irci_stable_candrpv_0415_20150521_0458
Date: Mon, 18 Oct 2021 01:19:53 +0900
Message-Id: <20211017161958.44351-14-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we made atomisp work with firmware version
irci_stable_candrpv_0415_20150521_0458 also for ISP2401, the
release_version for ISP2401 is not irci_ecr-master_20150911_0724
anymore.

So, use the same release_version for both ISP2400 and ISP2401 (i.e.,
irci_stable_candrpv_0415_20150521_0458).

Referred to the following diff to make this patch:
- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/staging/media/atomisp/pci/sh_css_firmware.c?id=3c0538fbad9f1d07d588f631e380256d941e3d3a
  ("media: atomisp: get rid of most checks for ISP2401 version")
  changes for file sh_css_firmware.c

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../pci/isp/kernels/hdr/ia_css_hdr.host.c        |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr.host.h        |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr_param.h       |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr_types.h       |  1 -
 .../staging/media/atomisp/pci/sh_css_firmware.c  | 16 +---------------
 5 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
index 698550cc2fcc..85a02b6adb52 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
index 04599ab590cd..83277b683c47 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
index 97a89fd3cfda..998c6d801756 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
index 1b4090880201..175c301ee96a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Release Version: irci_stable_candrpv_0415_20150521_0458 */
-/* Release Version: irci_ecr-master_20150911_0724 */
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index e1a16a50e588..94149647b98b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -56,8 +56,7 @@ static struct firmware_header *firmware_header;
  * which will be replaced with the actual RELEASE_VERSION
  * during package generation. Please do not modify
  */
-static const char *isp2400_release_version = STR(irci_stable_candrpv_0415_20150521_0458);
-static const char *isp2401_release_version = STR(irci_ecr - master_20150911_0724);
+static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
 
 #define MAX_FW_REL_VER_NAME	300
 static char FW_rel_ver_name[MAX_FW_REL_VER_NAME] = "---";
@@ -190,13 +189,6 @@ sh_css_check_firmware_version(struct device *dev, const char *fw_data)
 {
 	struct sh_css_fw_bi_file_h *file_header;
 
-	const char *release_version;
-
-	if (!IS_ISP2401)
-		release_version = isp2400_release_version;
-	else
-		release_version = isp2401_release_version;
-
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
 
@@ -232,12 +224,6 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	struct ia_css_fw_info *binaries;
 	struct sh_css_fw_bi_file_h *file_header;
 	int ret;
-	const char *release_version;
-
-	if (!IS_ISP2401)
-		release_version = isp2400_release_version;
-	else
-		release_version = isp2401_release_version;
 
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
-- 
2.33.1

