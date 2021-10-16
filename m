Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228962C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 17:36:07 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mbnbI-0006dq-0Z; Sat, 16 Oct 2021 19:36:04 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/3] staging: r8188eu: Makefile: remove unused driver config
Date: Sat, 16 Oct 2021 19:35:42 +0200
Message-Id: <20211016173544.25376-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211016173544.25376-1-martin@kaiser.cx>
References: <20211016173544.25376-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove config settings from the Makefile that are related to
unused or deleted features.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/Makefile | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index 1e0cb819f7f3..fccf7e6d1520 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -4,8 +4,6 @@ EXTRA_CFLAGS += -O1
 
 ccflags-y += -D__CHECK_ENDIAN__
 
-CONFIG_WOWLAN = n
-
 OUTSRC_FILES :=				\
 		hal/HalHWImg8188E_MAC.o	\
 		hal/HalHWImg8188E_BB.o	\
@@ -36,10 +34,6 @@ OUTSRC_FILES :=				\
 		hal/usb_halinit.o	\
 		hal/usb_ops_linux.o
 
-RTL871X = rtl8188e
-
-HCI_NAME = usb
-
 _OS_INTFS_FILES :=				\
 			os_dep/ioctl_linux.o	\
 			os_dep/mlme_linux.o	\
@@ -52,10 +46,6 @@ _OS_INTFS_FILES :=				\
 
 _HAL_INTFS_FILES += $(OUTSRC_FILES)
 
-ifeq ($(CONFIG_WOWLAN), y)
-EXTRA_CFLAGS += -DCONFIG_WOWLAN
-endif
-
 SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc.*/powerpc/; s/armv.l/arm/; s/aarch64/arm64/;")
 
 ARCH ?= $(SUBARCH)
-- 
2.20.1

