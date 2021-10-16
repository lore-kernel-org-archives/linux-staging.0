Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5436C29CA
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 11:30:37 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mbhta-00046d-Br; Sat, 16 Oct 2021 13:30:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/8] staging: r8188eu: remove empty trigger gpio code
Date: Sat, 16 Oct 2021 13:30:01 +0200
Message-Id: <20211016113008.27549-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211016113008.27549-1-martin@kaiser.cx>
References: <20211016113008.27549-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hal variable HW_VAR_TRIGGER_GPIO_0 and the rtl8192cu_trigger_gpio_0
function are not used. Remove them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 8 --------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index abbd107ad3c1..cdc602fa9af8 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1087,11 +1087,6 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 	_ReadAdapterInfo8188EU(Adapter);
 }
 
-#define GPIO_DEBUG_PORT_NUM 0
-static void rtl8192cu_trigger_gpio_0(struct adapter *adapt)
-{
-}
-
 static void ResumeTxBeacon(struct adapter *adapt)
 {
 	struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
@@ -1657,9 +1652,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_TRIGGER_GPIO_0:
-		rtl8192cu_trigger_gpio_0(Adapter);
-		break;
 	case HW_VAR_RPT_TIMER_SETTING:
 		{
 			u16 min_rpt_time = (*(u16 *)val);
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 408168284b3f..d777ad9071e2 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -55,7 +55,6 @@ enum hw_variables {
 	HW_VAR_TDLS_RS_RCR,
 	HW_VAR_TDLS_DONE_CH_SEN,
 	HW_VAR_INITIAL_GAIN,
-	HW_VAR_TRIGGER_GPIO_0,
 	HW_VAR_BT_SET_COEXIST,
 	HW_VAR_BT_ISSUE_DELBA,
 	HW_VAR_CURRENT_ANTENNA,
-- 
2.20.1

