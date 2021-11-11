Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56E52C85
	for <linux-staging@lists.linux.dev>; Thu, 11 Nov 2021 21:27:15 +0000 (UTC)
Received: from ipservice-092-217-091-158.092.217.pools.vodafone-ip.de ([92.217.91.158] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mlHb8-0006fH-IS; Thu, 11 Nov 2021 22:27:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/7] staging: r8188eu: merge three small functions
Date: Thu, 11 Nov 2021 22:26:43 +0100
Message-Id: <20211111212644.9011-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211111212644.9011-1-martin@kaiser.cx>
References: <20211111212644.9011-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ReadAdapterInfo8188EU calls _ReadAdapterInfo8188EU.
_ReadAdapterInfo8188EU calls _ReadPROMContent.

Each of these functions is small and has only one caller. Move all
their code into ReadAdapterInfo8188EU.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 119523d9c38a..004622f7a85f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1018,13 +1018,14 @@ readAdapterInfo_8188EU(
 	_ReadLEDSetting(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 }
 
-static void _ReadPROMContent(
-	struct adapter *Adapter
-	)
+void ReadAdapterInfo8188EU(struct adapter *Adapter)
 {
 	struct eeprom_priv *eeprom = &Adapter->eeprompriv;
 	u8 eeValue;
 
+	/*  Read EEPROM size before call any EEPROM function */
+	Adapter->EepromAddressSize = GetEEPROMSize8188E(Adapter);
+
 	/* check system boot selection */
 	eeValue = rtw_read8(Adapter, REG_9346CR);
 	eeprom->EepromOrEfuse		= (eeValue & BOOT_FROM_EEPROM) ? true : false;
@@ -1037,21 +1038,6 @@ static void _ReadPROMContent(
 	readAdapterInfo_8188EU(Adapter);
 }
 
-static int _ReadAdapterInfo8188EU(struct adapter *Adapter)
-{
-	_ReadPROMContent(Adapter);
-
-	return _SUCCESS;
-}
-
-void ReadAdapterInfo8188EU(struct adapter *Adapter)
-{
-	/*  Read EEPROM size before call any EEPROM function */
-	Adapter->EepromAddressSize = GetEEPROMSize8188E(Adapter);
-
-	_ReadAdapterInfo8188EU(Adapter);
-}
-
 static void ResumeTxBeacon(struct adapter *adapt)
 {
 	struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
-- 
2.20.1

