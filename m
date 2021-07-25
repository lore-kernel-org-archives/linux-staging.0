Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A716D10
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 15:59:33 +0000 (UTC)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m7gXF-0000SM-Ko; Sun, 25 Jul 2021 17:59:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/18] staging: rtl8188eu: remove HW_VAR_TXPAUSE
Date: Sun, 25 Jul 2021 17:58:47 +0200
Message-Id: <20210725155902.32433-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "HAL layer variable" HW_VAR_TXPAUSE is not used in this driver.
Remove its define and the code for setting and for reading a value.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c  | 6 ------
 drivers/staging/rtl8188eu/include/hal_intf.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 633feae0fca5..79e86ed8798e 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -1178,9 +1178,6 @@ void rtw_hal_set_hwreg(struct adapter *Adapter, u8 variable, u8 *val)
 			usb_write8(Adapter, REG_INIRTS_RATE_SEL, RateIndex);
 		}
 		break;
-	case HW_VAR_TXPAUSE:
-		usb_write8(Adapter, REG_TXPAUSE, *((u8 *)val));
-		break;
 	case HW_VAR_BCN_FUNC:
 		hw_var_set_bcn_func(Adapter, variable, val);
 		break;
@@ -1613,9 +1610,6 @@ void rtw_hal_get_hwreg(struct adapter *Adapter, u8 variable, u8 *val)
 	case HW_VAR_BASIC_RATE:
 		*((u16 *)(val)) = Adapter->HalData->BasicRateSet;
 		fallthrough;
-	case HW_VAR_TXPAUSE:
-		val[0] = usb_read8(Adapter, REG_TXPAUSE);
-		break;
 	case HW_VAR_BCN_VALID:
 		/* BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL+2 */
 		val[0] = (BIT(0) & usb_read8(Adapter, REG_TDECTRL + 2)) ? true : false;
diff --git a/drivers/staging/rtl8188eu/include/hal_intf.h b/drivers/staging/rtl8188eu/include/hal_intf.h
index e2ce71db3fa1..ad0a6bd5f510 100644
--- a/drivers/staging/rtl8188eu/include/hal_intf.h
+++ b/drivers/staging/rtl8188eu/include/hal_intf.h
@@ -18,7 +18,6 @@ enum hw_variables {
 	HW_VAR_BSSID,
 	HW_VAR_INIT_RTS_RATE,
 	HW_VAR_BASIC_RATE,
-	HW_VAR_TXPAUSE,
 	HW_VAR_BCN_FUNC,
 	HW_VAR_CORRECT_TSF,
 	HW_VAR_CHECK_BSSID,
-- 
2.20.1

