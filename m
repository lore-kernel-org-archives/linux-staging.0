Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0274C60
	for <linux-staging@lists.linux.dev>; Wed,  3 Aug 2022 22:29:24 +0000 (UTC)
Received: from [192.168.192.146] (port=37218 helo=nx64de-df6d00)
	by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <gszymaszek@short.pl>)
	id 1oJMrY-0008TZ-5K; Thu, 04 Aug 2022 00:29:14 +0200
Date: Thu, 4 Aug 2022 00:29:10 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Grzegorz Szymaszek <gszymaszek@short.pl>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 3/3] staging: r8188eu: make driver metadata macro names more
 consistent
Message-ID: <7cc838a1e7f64c9aa88deffdb7986fbe55753be8.1659565180.git.gszymaszek@short.pl>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
References: <6c83e05e5dbccff5630ccfed9e40bf84c889b647.1659565180.git.gszymaszek@short.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c83e05e5dbccff5630ccfed9e40bf84c889b647.1659565180.git.gszymaszek@short.pl>

Rename DRIVERVERSION to DRV_VERSION so that it looks more alike the
other macros, DRV_NAME and FW_*, and matches the most popular (as it
seems from a quick review) conventions in other drivers.

Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
---
 drivers/staging/r8188eu/include/drv_types.h | 5 ++---
 drivers/staging/r8188eu/os_dep/os_intfs.c   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index f51b83515953..3328c66d1ef1 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -10,8 +10,6 @@
 #ifndef __DRV_TYPES_H__
 #define __DRV_TYPES_H__
 
-#define DRV_NAME "r8188eu"
-
 #include "osdep_service.h"
 #include "wlan_bssdef.h"
 #include "rtw_ht.h"
@@ -36,7 +34,8 @@
 #include "rtl8188e_hal.h"
 #include "rtw_fw.h"
 
-#define DRIVERVERSION	"v4.1.4_6773.20130222"
+#define DRV_NAME	"r8188eu"
+#define DRV_VERSION	"v4.1.4_6773.20130222"
 #define FW_RTL8188EU	"rtlwifi/rtl8188eufw.bin"
 
 struct registry_priv {
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 5985054da935..d9abd2a98e1b 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -17,7 +17,7 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
 MODULE_AUTHOR("Realtek Semiconductor Corp.");
-MODULE_VERSION(DRIVERVERSION);
+MODULE_VERSION(DRV_VERSION);
 MODULE_FIRMWARE(FW_RTL8188EU);
 
 #define CONFIG_BR_EXT_BRNAME "br0"
-- 
2.35.1
