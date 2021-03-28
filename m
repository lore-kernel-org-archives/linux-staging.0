Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBAB5F
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 22:45:17 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id a11so8178344qto.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=nsEmdX6mc+ybUXc2Qg6U7WBlqgMs1mkM3+2oHxyzbWkHy5FonGwB+0RRKYSCEShtVZ
         SkVKyu/K+4s3d5pIpfTWJA6uIrh/6ECdm8/Gt4aFrR1dG9kiG7iG8WBxHXovZTUOuXzN
         QT+yZ/uAH+6dvOxZB4Y+BHtrZ3HvUzGwpeitMHmE/iQ8yWYq7ZVcUJrfGejWTCX1t/0Q
         V16nreJSl2wLxlm8EoAr30fsv2Q0KFynXDIuZA9CiOkf0ylWNeEI3y8hJlgRjqNZD9H8
         5j+eVkqHqYpuGFnuciPIUJuimU47AWOYAkg7G6DcIvwEW7d/g1wcO5+CTliTII81l+L+
         jB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=b9iCLh/NhQdKTiDpg0oc2nthQDnOWjYAnxFVedY+hruFc5yj8dyDNXHcAHJ0vxAA3G
         rukT25Unwt9gH6TlMcbSWW33Ybh3RH9BGAE24sY4T5DvsxGlZzNSCz67nUoobbFcz6Fp
         pqcbPQah4s9JrTp+mGp3jYXSz75dNIr7oBJ23/LENBRTgzRnbp096AmXek6f4LXfRHwx
         15kLuYzibwZN/QIN2wpn1kjcmtGMt/gn3S7HZucybFyCbsMujEZxLCTXvS/5Z/HdHzb/
         Hnf15QhtoXLs13fGWenRThj73FWIEAvQXVrYbMm7OcAdLiDLoXylosWsaX3F1sjPH2ch
         3cIA==
X-Gm-Message-State: AOAM530a71xOH0EjEXiyn+wu1AqoJhkJUkN2a6giiC7nZCdjDNKzL7i3
	1hpGtt3x48Zc33MzE3R+npw=
X-Google-Smtp-Source: ABdhPJxYLqkBm8dJsbUCNagLo5grTrrqPgxi2R6LQPcesM1Lc6lP/+8e4ZQAQg/MHjkCzYw22ztkXQ==
X-Received: by 2002:ac8:45c9:: with SMTP id e9mr19842001qto.178.1616971516583;
        Sun, 28 Mar 2021 15:45:16 -0700 (PDT)
Received: from localhost.localdomain ([177.189.249.24])
        by smtp.googlemail.com with ESMTPSA id q24sm11668595qki.120.2021.03.28.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 15:45:16 -0700 (PDT)
From: Rodrigo Figueiredo Zaiden <rodrigoffzz@gmail.com>
To: 
Cc: rodrigoffzz@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: add ibuf_ctrl_rmgr.c to ISP2401 build only
Date: Sun, 28 Mar 2021 19:43:04 -0300
Message-Id: <20210328224304.90918-1-rodrigoffzz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_VIDEO_ATOMISP_ISP2401 is not set, sparse shows
the following warnings:

drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6: warning: symbol 'ia_css_isys_ibuf_rmgr_init' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:40:6: warning: symbol 'ia_css_isys_ibuf_rmgr_uninit' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:46:6: warning: symbol 'ia_css_isys_ibuf_rmgr_acquire' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:106:6: warning: symbol 'ia_css_isys_ibuf_rmgr_release' was not declared. Should it be static?

The symbols stated as not declared are actually declared
under ISP2401 definition in ia_css_isys.h.
So, the file ibuf_ctrl_rmgr.c should be compiled only when
ISP2401 is enabled.

Signed-off-by: Rodrigo Figueiredo Zaiden <rodrigoffzz@gmail.com>
---
 drivers/staging/media/atomisp/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1dfad0dd02d0..555f2efa35b7 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -126,7 +126,6 @@ atomisp-objs += \
 	pci/runtime/inputfifo/src/inputfifo.o \
 	pci/runtime/isp_param/src/isp_param.o \
 	pci/runtime/isys/src/csi_rx_rmgr.o \
-	pci/runtime/isys/src/ibuf_ctrl_rmgr.o \
 	pci/runtime/isys/src/isys_dma_rmgr.o \
 	pci/runtime/isys/src/isys_init.o \
 	pci/runtime/isys/src/isys_stream2mmio_rmgr.o \
@@ -175,7 +174,8 @@ obj-cht = \
 	pci/css_2401_system/host/ibuf_ctrl.o \
 	pci/css_2401_system/host/isys_dma.o \
 	pci/css_2401_system/host/isys_irq.o \
-	pci/css_2401_system/host/isys_stream2mmio.o
+	pci/css_2401_system/host/isys_stream2mmio.o \
+	pci/runtime/isys/src/ibuf_ctrl_rmgr.o
 
 INCLUDES += \
 	-I$(atomisp)/ \
-- 
2.25.1

