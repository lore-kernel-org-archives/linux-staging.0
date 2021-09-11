Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2243FD4
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:16:02 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP3nT-0006bt-Qe; Sat, 11 Sep 2021 16:15:59 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/12] staging: r8188eu: setting HW_VAR_SET_RPWM does nothing
Date: Sat, 11 Sep 2021 16:15:11 +0200
Message-Id: <20210911141521.24901-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911141521.24901-1-martin@kaiser.cx>
References: <20210911141521.24901-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the HW_VAR_SET_RPWM "hardware variable" is an empty operation.

Remove the call to set HW_VAR_SET_RPWM, the calculation of the value to be
set and the definition of HW_VAR_SET_RPWM itself.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 5 -----
 drivers/staging/r8188eu/hal/usb_halinit.c  | 2 --
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 3 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index f9ee917895c7..daae91f82e97 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -195,7 +195,6 @@ static void pwr_state_check_handler(struct timer_list *t)
  */
 void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 {
-	u8	rpwm;
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 
 	pslv = PS_STATE(pslv);
@@ -215,12 +214,8 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 			return;
 	}
 
-	rpwm = pslv | pwrpriv->tog;
-
 	pwrpriv->rpwm = pslv;
 
-	rtw_hal_set_hwreg(padapter, HW_VAR_SET_RPWM, (u8 *)(&rpwm));
-
 	pwrpriv->tog += 0x80;
 	pwrpriv->cpwm = pslv;
 
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index c5347c5459d6..62d9e656e1db 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1742,8 +1742,6 @@ static void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write8(Adapter, REG_RXDMA_AGG_PG_TH, threshold);
 		}
 		break;
-	case HW_VAR_SET_RPWM:
-		break;
 	case HW_VAR_H2C_FW_PWRMODE:
 		{
 			u8 psmode = (*(u8 *)val);
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c1e120593574..192d79604d12 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -63,7 +63,6 @@ enum hw_variables {
 	HW_VAR_AMPDU_MIN_SPACE,
 	HW_VAR_AMPDU_FACTOR,
 	HW_VAR_RXDMA_AGG_PG_TH,
-	HW_VAR_SET_RPWM,
 	HW_VAR_H2C_FW_PWRMODE,
 	HW_VAR_H2C_FW_JOINBSSRPT,
 	HW_VAR_FWLPS_RF_ON,
-- 
2.20.1

