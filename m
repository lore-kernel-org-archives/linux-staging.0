Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117972
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 12:57:11 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id pf4-20020a17090b1d84b029016f6699c3f2so3566299pjb.0
        for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 05:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NEMvFyS18P5cftlbD6eQ1AwuZhrAFjZ8m++eEi7Zvp4=;
        b=NB3Tnxdo9kDLe2Bi09gNLIU9WWb7jtpM3y2BQQznCYCVA9ylsjvzN4N179Ogz0A7BH
         qDNnnE370C8YRZIOO0LWTSsiG/poEZ1VXlGO0pr+O5qiG1ZaUddPQ1D1klKRPY0UoxiT
         zWwBa/xvCwufx3zpfzW1OtoXEA4tEhk0JvZHmTmNR7ZVtcPuwgNz8A6rhjiwax6qunId
         3wJpFtLj+g2lOFuk2AsxdsBk1ABg3KvW4H0IqK2zButA7EuVgmoRWQC/q3xbXrh5NlfU
         K6/5c0wHW090cAZqKdmZYeua13njLnzCqMCL+lSIMHmkVdea5WG190EyTrR+LlU+vsQ2
         8Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NEMvFyS18P5cftlbD6eQ1AwuZhrAFjZ8m++eEi7Zvp4=;
        b=oUaPNU/NOpBvEYomYSycwWibf3KGFXN+nyaED8MB023rpFu+D4PhRMT5XBfFUkFgxl
         RNbObdZLQnJBmqOs3RLStkxlHMTnfrJn8TqvYrA9xFbLAuuBIQtZAnPH+PJAaUPHsCCS
         XeEpfKMEpKFc656s7WLw4KWd5kLOKcPzVF93ApLAo+NjzQ2mfwrZTj+P1+q2o1jOXcBh
         u1eT8ovP/A5YLmL/tLEUVuReH2+ZybGHX+QSWDPEIlbZAaD0abze7CEp88ToDNOpQK+Z
         DiQ+XXLVoUkIfuThCbltcIwD5U8UNgUjrIVeP4VHwDf8oAL6Ukdg/swqsbmi1k8WFICI
         Osmw==
X-Gm-Message-State: AOAM531/fu+KIvQ58jUI6ICbqCCnsrzZ95pZaCNpUkbDJhcKUga3wzfL
	yN1+qJp5BzZ58taimpYQsWw=
X-Google-Smtp-Source: ABdhPJxq2skko6hT7WAdZ8XJ4MFeYCt4USuct+irJN/hebx2+vSZZO8601KL5ql3Pmo1gN7RSlQ/TQ==
X-Received: by 2002:a17:902:ac81:b029:122:1809:40e with SMTP id h1-20020a170902ac81b02901221809040emr9498905plr.79.1624193831403;
        Sun, 20 Jun 2021 05:57:11 -0700 (PDT)
Received: from ojas ([122.177.154.120])
        by smtp.gmail.com with ESMTPSA id b1sm13215203pgb.91.2021.06.20.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 05:57:11 -0700 (PDT)
Date: Sun, 20 Jun 2021 18:27:01 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: gregkh@linuxfoundation.org, stefan.wahren@i2se.com, arnd@arndb.de,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] staging: vchiq: Make creation of vchiq cdev optional
Message-ID: <80d4ad6cb3129d7c6e7e66f3d358c6dea82c509b.1624185152.git.ojaswin98@gmail.com>
References: <cover.1624185152.git.ojaswin98@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624185152.git.ojaswin98@gmail.com>

Before this commit, vchiq cdev (/dev/vchiq) was always created during
platform initialization. Introduce a new Kconfig option
CONFIG_VCHIQ_CDEV which determines the cdev needs to be created or not.
Also modify the predefined config files to have this option set to
"yes".

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 arch/arm/configs/bcm2709_defconfig                     |  1 +
 arch/arm/configs/bcm2711_defconfig                     |  1 +
 arch/arm/configs/bcmrpi_defconfig                      |  1 +
 drivers/staging/vc04_services/Kconfig                  | 10 ++++++++++
 drivers/staging/vc04_services/Makefile                 |  5 ++++-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.h      |  9 +++++++++
 6 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/bcm2709_defconfig b/arch/arm/configs/bcm2709_defconfig
index 7eb4418d7fea..444c80b97e2c 100644
--- a/arch/arm/configs/bcm2709_defconfig
+++ b/arch/arm/configs/bcm2709_defconfig
@@ -1314,6 +1314,7 @@ CONFIG_FB_TFT_UC1701=m
 CONFIG_FB_TFT_UPD161704=m
 CONFIG_FB_TFT_WATTEROTT=m
 CONFIG_BCM2835_VCHIQ=y
+CONFIG_VCHIQ_CDEV=y
 CONFIG_SND_BCM2835=m
 CONFIG_VIDEO_BCM2835=m
 CONFIG_VIDEO_CODEC_BCM2835=m
diff --git a/arch/arm/configs/bcm2711_defconfig b/arch/arm/configs/bcm2711_defconfig
index 299e4d95e4ca..f323fb7f29e2 100644
--- a/arch/arm/configs/bcm2711_defconfig
+++ b/arch/arm/configs/bcm2711_defconfig
@@ -1352,6 +1352,7 @@ CONFIG_FB_TFT_UC1701=m
 CONFIG_FB_TFT_UPD161704=m
 CONFIG_FB_TFT_WATTEROTT=m
 CONFIG_BCM2835_VCHIQ=y
+CONFIG_VCHIQ_CDEV=y
 CONFIG_SND_BCM2835=m
 CONFIG_VIDEO_BCM2835=m
 CONFIG_VIDEO_CODEC_BCM2835=m
diff --git a/arch/arm/configs/bcmrpi_defconfig b/arch/arm/configs/bcmrpi_defconfig
index e270865d89cc..92216ce77d11 100644
--- a/arch/arm/configs/bcmrpi_defconfig
+++ b/arch/arm/configs/bcmrpi_defconfig
@@ -1325,6 +1325,7 @@ CONFIG_FB_TFT_UC1701=m
 CONFIG_FB_TFT_UPD161704=m
 CONFIG_FB_TFT_WATTEROTT=m
 CONFIG_BCM2835_VCHIQ=y
+CONFIG_VCHIQ_CDEV=y
 CONFIG_SND_BCM2835=m
 CONFIG_VIDEO_BCM2835=m
 CONFIG_VIDEO_CODEC_BCM2835=m
diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index 8b912617bfec..7c22554cdd20 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -19,6 +19,16 @@ config BCM2835_VCHIQ
 		Defaults to Y when the Broadcom Videocore services
 		are included in the build, N otherwise.
 
+if BCM2835_VCHIQ
+
+config VCHIQ_CDEV
+	bool "VCHIQ Character Driver"
+	help
+		Enable the creation of VCHIQ character driver to help
+		communicate with the Videocore platform.
+
+endif
+
 source "drivers/staging/vc04_services/bcm2835-audio/Kconfig"
 
 source "drivers/staging/vc04_services/bcm2835-camera/Kconfig"
diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index 700cd62fe346..cc6371386a62 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -7,7 +7,10 @@ vchiq-objs := \
    interface/vchiq_arm/vchiq_2835_arm.o \
    interface/vchiq_arm/vchiq_debugfs.o \
    interface/vchiq_arm/vchiq_connected.o \
-   interface/vchiq_arm/vchiq_dev.o \
+
+ifdef CONFIG_VCHIQ_CDEV
+vchiq-objs += interface/vchiq_arm/vchiq_dev.o
+endif
 
 obj-$(CONFIG_SND_BCM2835)		+= bcm2835-audio/
 obj-$(CONFIG_VIDEO_BCM2835)		+= bcm2835-camera/
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index bc9af1a0c764..a99cca0cb23b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -172,12 +172,21 @@ vchiq_instance_get_trace(struct vchiq_instance *instance);
 extern void
 vchiq_instance_set_trace(struct vchiq_instance *instance, int trace);
 
+#if IS_ENABLED(CONFIG_VCHIQ_CDEV)
+
 extern void
 vchiq_deregister_chrdev(void);
 
 extern int
 vchiq_register_chrdev(struct device *parent);
 
+#else
+
+static inline void vchiq_deregister_chrdev(void) { }
+static inline int vchiq_register_chrdev(struct device *parent) { return 0; }
+
+#endif /* IS_ENABLED(CONFIG_VCHIQ_CDEV) */
+
 extern enum vchiq_status
 service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 		 unsigned int handle, void *bulk_userdata);
-- 
2.25.1

