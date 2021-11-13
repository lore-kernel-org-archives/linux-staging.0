Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFD2C82
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 18:55:55 +0000 (UTC)
Received: from dslb-188-096-147-224.188.096.pools.vodafone-ip.de ([188.96.147.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mlyBs-0002H8-Ug; Sat, 13 Nov 2021 19:55:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/15] staging: r8188eu: use efuse map length define directly
Date: Sat, 13 Nov 2021 19:55:11 +0100
Message-Id: <20211113185518.23941-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211113185518.23941-1-martin@kaiser.cx>
References: <20211113185518.23941-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The length of the efuse data section is constant. We can use the
corresponding define directly, there's no need to get the length
from rtl8188e_EFUSE_GetEfuseDefinition.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_efuse.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 2999313dfe69..1a999d41483b 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -6,6 +6,7 @@
 #include "../include/osdep_service.h"
 #include "../include/drv_types.h"
 #include "../include/rtw_efuse.h"
+#include "../include/rtl8188e_hal.h"
 
 /*------------------------Define local variable------------------------------*/
 u8 fakeEfuseBank;
@@ -234,17 +235,13 @@ void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata)
 void EFUSE_ShadowMapUpdate(struct adapter *pAdapter)
 {
 	struct eeprom_priv *pEEPROM = &pAdapter->eeprompriv;
-	u16 mapLen = 0;
-
-	rtl8188e_EFUSE_GetEfuseDefinition(pAdapter, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
 
 	if (pEEPROM->bautoload_fail_flag) {
-		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
+		memset(pEEPROM->efuse_eeprom_data, 0xFF, EFUSE_MAP_LEN_88E);
 		return;
 	}
 
 	rtl8188e_EfusePowerSwitch(pAdapter, true);
-	rtl8188e_EFUSE_GetEfuseDefinition(pAdapter, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
-	rtl8188e_ReadEFuse(pAdapter, 0, mapLen, pEEPROM->efuse_eeprom_data);
+	rtl8188e_ReadEFuse(pAdapter, 0, EFUSE_MAP_LEN_88E, pEEPROM->efuse_eeprom_data);
 	rtl8188e_EfusePowerSwitch(pAdapter, false);
 }
-- 
2.20.1

