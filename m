Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758D71C14
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:24 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADyG-0005n0-HT; Sat, 09 Jul 2022 19:10:20 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/14] staging: r8188eu: offset is always 0 in rtl8188e_ReadEFuse
Date: Sat,  9 Jul 2022 19:09:56 +0200
Message-Id: <20220709171000.180481-11-martin@kaiser.cx>
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

The offset parameter of rtl8188e_ReadEFuse is always 0. Remove the
parameter and use 0 in the function body.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 6 +++---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 2 +-
 drivers/staging/r8188eu/include/hal_intf.h      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 24699e99edff..674ba420a272 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -531,21 +531,21 @@ static void Hal_EfuseReadEFuse88E(struct adapter *Adapter,
 	kfree(eFuseWord);
 }
 
-void rtl8188e_ReadEFuse(struct adapter *Adapter, u16 _offset, u16 _size_byte, u8 *pbuf)
+void rtl8188e_ReadEFuse(struct adapter *Adapter, u16 _size_byte, u8 *pbuf)
 {
 	int ret = _FAIL;
 	if (rtw_IOL_applied(Adapter)) {
 		rtl8188eu_InitPowerOn(Adapter);
 
 		iol_mode_enable(Adapter, 1);
-		ret = iol_read_efuse(Adapter, _offset, _size_byte, pbuf);
+		ret = iol_read_efuse(Adapter, 0, _size_byte, pbuf);
 		iol_mode_enable(Adapter, 0);
 
 		if (_SUCCESS == ret)
 			return;
 	}
 
-	Hal_EfuseReadEFuse88E(Adapter, _offset, _size_byte, pbuf);
+	Hal_EfuseReadEFuse88E(Adapter, 0, _size_byte, pbuf);
 }
 
 void rtl8188e_read_chip_version(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 5151cded145b..1821ec4440cd 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -942,7 +942,7 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 
 	if (!(eeValue & BOOT_FROM_EEPROM) && !eeprom->bautoload_fail_flag) {
 		rtl8188e_EfusePowerSwitch(Adapter, true);
-		rtl8188e_ReadEFuse(Adapter, 0, EFUSE_MAP_LEN_88E, efuse_buf);
+		rtl8188e_ReadEFuse(Adapter, EFUSE_MAP_LEN_88E, efuse_buf);
 		rtl8188e_EfusePowerSwitch(Adapter, false);
 	}
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index fc972d65189f..a8499c643c76 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -27,7 +27,7 @@ void rtl8188eu_init_default_value(struct adapter *adapt);
 void rtl8188e_SetHalODMVar(struct adapter *Adapter, void *pValue1, bool bSet);
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 PwrState);
-void rtl8188e_ReadEFuse(struct adapter *Adapter, u16 _offset, u16 _size_byte, u8 *pbuf);
+void rtl8188e_ReadEFuse(struct adapter *Adapter, u16 _size_byte, u8 *pbuf);
 
 void hal_notch_filter_8188e(struct adapter *adapter, bool enable);
 
-- 
2.30.2

