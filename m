Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A211033C3
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 16:15:02 +0000 (UTC)
Received: from dslb-178-004-201-227.178.004.pools.vodafone-ip.de ([178.4.201.227] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oFeFs-0004kT-UO; Sun, 24 Jul 2022 18:14:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: handle errors from ReadAdapterInfo8188EU
Date: Sun, 24 Jul 2022 18:14:05 +0200
Message-Id: <20220724161405.146488-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ReadAdapterInfo8188EU to return 0 for success or a negative
error code. Don't use the infamous _SUCCESS and _FAIL defines.

Handle returned errors in rtw_usb_if1_init, this will eventually fail the
probing of the r8188eu driver.

Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 7 ++++---
 drivers/staging/r8188eu/include/hal_intf.h | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c  | 3 ++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 421fe7c40390..08d4b5dfd430 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -922,7 +922,7 @@ static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool
 	}
 }
 
-void ReadAdapterInfo8188EU(struct adapter *Adapter)
+int ReadAdapterInfo8188EU(struct adapter *Adapter)
 {
 	struct eeprom_priv *eeprom = &Adapter->eeprompriv;
 	struct led_priv *ledpriv = &Adapter->ledpriv;
@@ -933,13 +933,13 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 	/* check system boot selection */
 	res = rtw_read8(Adapter, REG_9346CR, &eeValue);
 	if (res)
-		return;
+		return -1;
 
 	eeprom->bautoload_fail_flag	= !(eeValue & EEPROM_EN);
 
 	efuse_buf = kmalloc(EFUSE_MAP_LEN_88E, GFP_KERNEL);
 	if (!efuse_buf)
-		return;
+		return -1;
 	memset(efuse_buf, 0xFF, EFUSE_MAP_LEN_88E);
 
 	if (!(eeValue & BOOT_FROM_EEPROM) && !eeprom->bautoload_fail_flag) {
@@ -961,6 +961,7 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 
 	ledpriv->bRegUseLed = true;
 	kfree(efuse_buf);
+	return 0;
 }
 
 static void ResumeTxBeacon(struct adapter *adapt)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 819d0dc6e6dc..985dffeef2cd 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -16,7 +16,7 @@ enum hw_variables {
 typedef s32 (*c2h_id_filter)(u8 id);
 
 void rtl8188eu_interface_configure(struct adapter *adapt);
-void ReadAdapterInfo8188EU(struct adapter *Adapter);
+int ReadAdapterInfo8188EU(struct adapter *Adapter);
 void rtl8188eu_init_default_value(struct adapter *adapt);
 void rtl8188e_SetHalODMVar(struct adapter *Adapter, void *pValue1, bool bSet);
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index cc2b44f60c46..e1a0447fd1e7 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -332,7 +332,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	rtl8188eu_interface_configure(padapter);
 
 	/* step read efuse/eeprom data and get mac_addr */
-	ReadAdapterInfo8188EU(padapter);
+	if (ReadAdapterInfo8188EU(padapter) < 0)
+		goto handle_dualmac;
 
 	/* step 5. */
 	if (rtw_init_drv_sw(padapter) == _FAIL)
-- 
2.30.2

