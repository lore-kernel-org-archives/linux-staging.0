Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDB51C11
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:23 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADyA-0005n0-2L; Sat, 09 Jul 2022 19:10:14 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/14] staging: r8188eu: remove EepromOrEfuse from struct eeprom_priv
Date: Sat,  9 Jul 2022 19:09:48 +0200
Message-Id: <20220709171000.180481-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220709171000.180481-1-martin@kaiser.cx>
References: <20220709171000.180481-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EepromOrEfuse flag in struct eeprom_priv is used only in the
ReadAdapterInfo8188EU function. We can remove EepromOrEfuse from struct
eeprom_priv.

As the meaning of EepromOrEfuse isn't obvious, there is a macro
is_boot_from_eeprom that's used for checking the value. We don't need the
macro, writing the check as !(eeValue & BOOT_FROM_EEPROM) makes it clear
what is checked.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c    | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h   | 2 --
 drivers/staging/r8188eu/include/rtw_eeprom.h | 1 -
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 1a08de85a6ae..2bfd9751c685 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -937,10 +937,9 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 	if (res)
 		return;
 
-	eeprom->EepromOrEfuse		= (eeValue & BOOT_FROM_EEPROM);
 	eeprom->bautoload_fail_flag	= !(eeValue & EEPROM_EN);
 
-	if (!is_boot_from_eeprom(Adapter))
+	if (!(eeValue & BOOT_FROM_EEPROM))
 		EFUSE_ShadowMapUpdate(Adapter);
 
 	/* parse the eeprom/efuse content */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index b81144932d9a..fc972d65189f 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -21,8 +21,6 @@ enum hw_variables {
 
 typedef s32 (*c2h_id_filter)(u8 id);
 
-#define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
-
 void rtl8188eu_interface_configure(struct adapter *adapt);
 void ReadAdapterInfo8188EU(struct adapter *Adapter);
 void rtl8188eu_init_default_value(struct adapter *adapt);
diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index d8d48ace356c..40c61f7a03be 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -12,7 +12,6 @@
 struct eeprom_priv {
 	u8		bautoload_fail_flag;
 	u8		mac_addr[ETH_ALEN] __aligned(2); /* PermanentAddress */
-	u8		EepromOrEfuse;
 	u8		efuse_eeprom_data[HWSET_MAX_SIZE_512] __aligned(4);
 };
 
-- 
2.30.2

