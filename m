Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE142591
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:26 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADyD-0005n0-Cb; Sat, 09 Jul 2022 19:10:17 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/14] staging: r8188eu: always initialise efuse buffer with 0xff
Date: Sat,  9 Jul 2022 19:09:52 +0200
Message-Id: <20220709171000.180481-7-martin@kaiser.cx>
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

If BOOT_FROM_EEPROM is set, efuse_buf is not initialised before it is
passed to functions that read from it.

The buffer will be filled with 0x00 in this case like all local variables.
However, the parsing functions expect the buffer to be filled with 0xFF if
reading eeprom/efuse data failed. Fill the buffer with 0xFF before we try
to read the data.

Please note that this problem existed before we started using a local
buffer. Adapter->eeprompriv->efuse_eeprom_data was allocated as a part of
struct adapter by a vzalloc call in rtw_usb_if1_init.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 807d8ce8cbfc..258ab963cf8a 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -940,14 +940,12 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 
 	eeprom->bautoload_fail_flag	= !(eeValue & EEPROM_EN);
 
-	if (!(eeValue & BOOT_FROM_EEPROM)) {
-		if (eeprom->bautoload_fail_flag) {
-			memset(efuse_buf, 0xFF, sizeof(efuse_buf));
-		} else {
-			rtl8188e_EfusePowerSwitch(Adapter, true);
-			rtl8188e_ReadEFuse(Adapter, 0, EFUSE_MAP_LEN_88E, efuse_buf);
-			rtl8188e_EfusePowerSwitch(Adapter, false);
-		}
+	memset(efuse_buf, 0xFF, sizeof(efuse_buf));
+
+	if (!(eeValue & BOOT_FROM_EEPROM) && !eeprom->bautoload_fail_flag) {
+		rtl8188e_EfusePowerSwitch(Adapter, true);
+		rtl8188e_ReadEFuse(Adapter, 0, EFUSE_MAP_LEN_88E, efuse_buf);
+		rtl8188e_EfusePowerSwitch(Adapter, false);
 	}
 
 	/* parse the eeprom/efuse content */
-- 
2.30.2

