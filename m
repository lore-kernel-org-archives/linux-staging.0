Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2782171
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 18:19:42 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id 18so25320809qtz.6
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=eFNW4N0ao0mYhI2AqP1eZXrblovrzgcVjtokOMYUpvRnR9Nes8Qn75ap3G+Iu2v8wr
         TtiXtZnkQssUx5nqkAAtogoZjOPIVivEsg1K1Yb69odrA1+/6RLpKG+Y3bof5GV/tp3l
         7pu+tzkU2nw/WXZ11LR6mtX1gBGdMEyF5LTrO/STURUa4+ZsylpHTC79q8nblQ0mmBDT
         BQRc2tL4r9AtN2TiE31Xm2wegcROcxYaqIc2wKEroFbo6mCPFjaEKaRVm2mgmD+LnGUB
         6c7j/GkQrSgjok9Dc+OOClJBpe/Q1+RsjYrl3zhU+ObJylBnuTTFn+cjXglTFP1UphH8
         wnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=BjgUITG3Evkrjx/XuLEVYMC7Eujmy/quVBthE1ulvrW8nIlXgumAul7pZrKQjF1Inm
         q5BWkCBlUL9Pqbk3VoQGaMK7Ayx7gRnxmrQurMfjyCPpwd/YZvfDEQOpryTaw99L5sWZ
         ZPTDINuhK+2ekR03lBETKYnyt2ciOJIRBSz0qgBm9PG0dCEt39r6CFlZbep23J07Ab1S
         +DpKP5PVdfAKJmPF/HiE4IgG2C/oPEZPkV7E/5JS/nJZhuTfFcU0ejcE5g2Fzg5hHnNW
         WicS/MMnrQ1BpeRccsBHjWWHzUCjQkQ6lJlz31sFaHHde84W/a9gIr69NAyiLYnXr/J+
         4ehQ==
X-Gm-Message-State: AOAM532TQ93RUTcsqLXes2TnMvolMjKIZRwnAKenhULdHWFrM9e9jSl9
	E2DrkZIoFw9rX1XHEkBrfko=
X-Google-Smtp-Source: ABdhPJxNt9CR9bI1aojKn6K6sSFRLVkrcTpKc47KQYxuIxRTaeKPGkF03kQgZE0MXY8J+gK9pnl2/Q==
X-Received: by 2002:aed:2043:: with SMTP id 61mr2163587qta.308.1619288381155;
        Sat, 24 Apr 2021 11:19:41 -0700 (PDT)
Received: from localhost.localdomain ([187.74.38.55])
        by smtp.googlemail.com with ESMTPSA id i21sm6355041qtr.94.2021.04.24.11.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 11:19:40 -0700 (PDT)
From: Rodrigo Figueiredo Zaiden <rodrigoffzz@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rodrigoffzz@gmail.com
Subject: [PATCH] media: atomisp: add ibuf_ctrl_rmgr.c to ISP2401 build only
Date: Sat, 24 Apr 2021 15:18:52 -0300
Message-Id: <20210424181852.64472-1-rodrigoffzz@gmail.com>
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

