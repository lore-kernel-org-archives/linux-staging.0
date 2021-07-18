Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05B173
	for <linux-staging@lists.linux.dev>; Sun, 18 Jul 2021 17:54:56 +0000 (UTC)
Received: from dslb-178-004-206-019.178.004.pools.vodafone-ip.de ([178.4.206.19] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m5AjG-0006oR-2J; Sun, 18 Jul 2021 19:37:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/10] staging: rtl8188eu: remove the "trigger gpio 0" hal variable
Date: Sun, 18 Jul 2021 19:36:02 +0200
Message-Id: <20210718173610.894-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718173610.894-1-martin@kaiser.cx>
References: <20210718173610.894-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hal variable to trigger gpio 0 seems to be a leftover from debugging
code that was removed. An empty function is called when this variable is
written to.

Remove the empty function and the variable itself. It should be safe to
remove an entry from the hw_variables enum as this enum is used only
within the rtl8188eu driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c  | 8 --------
 drivers/staging/rtl8188eu/include/hal_intf.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 56de6071eb72..26c445a77e35 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -1002,11 +1002,6 @@ void rtw_hal_read_chip_info(struct adapter *Adapter)
 	readAdapterInfo_8188EU(Adapter);
 }
 
-#define GPIO_DEBUG_PORT_NUM 0
-static void rtl8192cu_trigger_gpio_0(struct adapter *adapt)
-{
-}
-
 static void ResumeTxBeacon(struct adapter *adapt)
 {
 	struct hal_data_8188e *haldata = adapt->HalData;
@@ -1550,9 +1545,6 @@ void rtw_hal_set_hwreg(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_TRIGGER_GPIO_0:
-		rtl8192cu_trigger_gpio_0(Adapter);
-		break;
 	case HW_VAR_RPT_TIMER_SETTING:
 		{
 			u16 min_rpt_time = (*(u16 *)val);
diff --git a/drivers/staging/rtl8188eu/include/hal_intf.h b/drivers/staging/rtl8188eu/include/hal_intf.h
index 2e3e933781eb..2eb4f1fa75bb 100644
--- a/drivers/staging/rtl8188eu/include/hal_intf.h
+++ b/drivers/staging/rtl8188eu/include/hal_intf.h
@@ -74,7 +74,6 @@ enum hw_variables {
 	HW_VAR_TDLS_RS_RCR,
 	HW_VAR_TDLS_DONE_CH_SEN,
 	HW_VAR_INITIAL_GAIN,
-	HW_VAR_TRIGGER_GPIO_0,
 	HW_VAR_BT_SET_COEXIST,
 	HW_VAR_BT_ISSUE_DELBA,
 	HW_VAR_CURRENT_ANTENNA,
-- 
2.20.1

