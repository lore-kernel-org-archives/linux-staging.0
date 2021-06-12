Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6036D0D
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 18:01:18 +0000 (UTC)
Received: from dslb-188-097-213-151.188.097.pools.vodafone-ip.de ([188.97.213.151] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ls7wa-0003B8-88; Sat, 12 Jun 2021 20:01:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/6] staging: rtl8188eu: remove another write-only member
Date: Sat, 12 Jun 2021 20:00:18 +0200
Message-Id: <20210612180019.20387-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210612180019.20387-1-martin@kaiser.cx>
References: <20210612180019.20387-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bAPKThermalMeterIgnore in struct hal_data_8188e is never read and can
be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/rtl8188eu/include/rtl8188e_hal.h  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index 95b27b4df705..0b46af1755ed 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -567,7 +567,6 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
 
 	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail) {
-		pHalData->bAPKThermalMeterIgnore = true;
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
 	}
 	DBG_88E("ThermalMeter = 0x%x\n", pHalData->EEPROMThermalMeter);
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 20049bdf39f5..0bfab5990d27 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -208,7 +208,6 @@ struct hal_data_8188e {
 
 	u8	bTXPowerDataReadFromEEPORM;
 	u8	EEPROMThermalMeter;
-	u8	bAPKThermalMeterIgnore;
 
 	bool	EepromOrEfuse;
 
-- 
2.20.1

