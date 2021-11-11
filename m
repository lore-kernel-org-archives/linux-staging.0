Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFAD2C85
	for <linux-staging@lists.linux.dev>; Thu, 11 Nov 2021 21:27:13 +0000 (UTC)
Received: from ipservice-092-217-091-158.092.217.pools.vodafone-ip.de ([92.217.91.158] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mlHb6-0006fH-R0; Thu, 11 Nov 2021 22:27:04 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/7] staging: r8188eu: remove autoload check
Date: Thu, 11 Nov 2021 22:26:41 +0100
Message-Id: <20211111212644.9011-4-martin@kaiser.cx>
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

In Hal_InitPGData88E, the same code is run, regardless of
bautoload_fail_flag.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 566b49fd7478..019e67a7989f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1312,18 +1312,8 @@ s32 InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy)
 void
 Hal_InitPGData88E(struct adapter *padapter)
 {
-	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
-
-	if (!pEEPROM->bautoload_fail_flag) { /*  autoload OK. */
-		if (!is_boot_from_eeprom(padapter)) {
-			/*  Read EFUSE real map to shadow. */
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI, false);
-		}
-	} else {/* autoload fail */
-		/* update to default value 0xFF */
-		if (!is_boot_from_eeprom(padapter))
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI, false);
-	}
+	if (!is_boot_from_eeprom(padapter))
+		EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI, false);
 }
 
 void
-- 
2.20.1

