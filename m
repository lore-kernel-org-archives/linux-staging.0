Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFA02C80
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 17:52:34 +0000 (UTC)
Received: from dslb-188-104-061-167.188.104.pools.vodafone-ip.de ([188.104.61.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mZczv-0001WC-Ih; Sun, 10 Oct 2021 19:52:31 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/11] staging: r8188eu: RfOnOffDetect is unused
Date: Sun, 10 Oct 2021 19:51:56 +0200
Message-Id: <20211010175204.24029-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010175204.24029-1-martin@kaiser.cx>
References: <20211010175204.24029-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the RfOnOffDetect function, which is not used.

Suggested-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 18 ------------------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 94a2b3e32fe7..f6db5b05e6e7 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -599,24 +599,6 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
 	DBG_88E("%s,Cur_ant:(%x)%s\n", __func__, haldata->CurAntenna, (haldata->CurAntenna == Antenna_A) ? "Antenna_A" : "Antenna_B");
 }
 
-enum rt_rf_power_state RfOnOffDetect(struct adapter *adapt)
-{
-	u8 val8;
-	enum rt_rf_power_state rfpowerstate = rf_off;
-
-	if (adapt->pwrctrlpriv.bHWPowerdown) {
-		val8 = rtw_read8(adapt, REG_HSISR);
-		DBG_88E("pwrdown, 0x5c(BIT(7))=%02x\n", val8);
-		rfpowerstate = (val8 & BIT(7)) ? rf_off : rf_on;
-	} else { /*  rf on/off */
-		rtw_write8(adapt, REG_MAC_PINMUX_CFG, rtw_read8(adapt, REG_MAC_PINMUX_CFG) & ~(BIT(3)));
-		val8 = rtw_read8(adapt, REG_GPIO_IO_SEL);
-		DBG_88E("GPIO_IN=%02x\n", val8);
-		rfpowerstate = (val8 & BIT(3)) ? rf_on : rf_off;
-	}
-	return rfpowerstate;
-}	/*  HalDetectPwrDownMode */
-
 u32 rtl8188eu_hal_init(struct adapter *Adapter)
 {
 	u8 value8 = 0;
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index e412ef71b54b..47a20702e376 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -143,8 +143,6 @@ int ips_leave(struct adapter *padapter);
 
 void rtw_ps_processor(struct adapter *padapter);
 
-enum rt_rf_power_state RfOnOffDetect(struct adapter *iadapter);
-
 s32 LPS_RF_ON_check(struct adapter *adapter, u32 delay_ms);
 void LPS_Enter(struct adapter *adapter);
 void LPS_Leave(struct adapter *adapter);
-- 
2.20.1

