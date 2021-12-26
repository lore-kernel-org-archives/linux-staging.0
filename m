Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9ED2C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:08:47 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zd7-0000Fz-Rq; Sun, 26 Dec 2021 20:56:29 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 21/21] staging: r8188eu: rfoff_reason is never initialised
Date: Sun, 26 Dec 2021 20:55:56 +0100
Message-Id: <20211226195556.159471-22-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211226195556.159471-1-martin@kaiser.cx>
References: <20211226195556.159471-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rfoff_reason in struct pwrctrl_priv is never set, its value remains 0.

Remove rfoff_reason, related defines and a check in rtw_led_control
that is always false.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c        | 8 --------
 drivers/staging/r8188eu/include/hal_intf.h    | 6 ------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
 3 files changed, 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 09a9676eb503..ccd43accb7dc 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -207,14 +207,6 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	if (!registry_par->led_enable)
 		return;
 
-	if ((padapter->pwrctrlpriv.rf_pwrstate != rf_on &&
-	     padapter->pwrctrlpriv.rfoff_reason > RF_CHANGE_BY_PS) &&
-	    (LedAction == LED_CTL_TX || LedAction == LED_CTL_RX ||
-	     LedAction == LED_CTL_SITE_SURVEY ||
-	     LedAction == LED_CTL_LINK ||
-	     LedAction == LED_CTL_NO_LINK))
-		return;
-
 	switch (LedAction) {
 	case LED_CTL_START_TO_LINK:
 	case LED_CTL_NO_LINK:
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 6eb630f9b6bf..b5474d199c10 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -100,12 +100,6 @@ enum hal_odm_variable {
 
 typedef s32 (*c2h_id_filter)(u8 id);
 
-#define RF_CHANGE_BY_INIT	0
-#define RF_CHANGE_BY_IPS	BIT(28)
-#define RF_CHANGE_BY_PS		BIT(29)
-#define RF_CHANGE_BY_HW		BIT(30)
-#define RF_CHANGE_BY_SW		BIT(31)
-
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
 
 void rtl8188eu_interface_configure(struct adapter *adapt);
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index a71f2f8f7c43..849e144c90dd 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -57,7 +57,6 @@ struct pwrctrl_priv {
 
 	u8	reg_rfoff;
 	u8	reg_pdnmode; /* powerdown mode */
-	u32	rfoff_reason;
 
 	/* RF OFF Level */
 	u32	cur_ps_level;
-- 
2.30.2

