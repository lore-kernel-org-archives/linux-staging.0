Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E4B2FB0
	for <linux-staging@lists.linux.dev>; Sun, 18 Jul 2021 17:37:35 +0000 (UTC)
Received: from dslb-178-004-206-019.178.004.pools.vodafone-ip.de ([178.4.206.19] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m5AjN-0006oR-6M; Sun, 18 Jul 2021 19:37:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/10] staging: rtl8188eu: remove constant function parameter
Date: Sun, 18 Jul 2021 19:36:08 +0200
Message-Id: <20210718173610.894-8-martin@kaiser.cx>
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

The rtl88eu_pwrseqcmdparsing function takes a parameter to restrict
commands to certain power cut versions of the rtl8188eu chipset.
This mechanism is not used, the callers always select all versions.

Remove the power cut parameter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/pwrseqcmd.c     | 82 +++++++++----------
 drivers/staging/rtl8188eu/hal/usb_halinit.c   |  9 +-
 drivers/staging/rtl8188eu/include/pwrseqcmd.h |  4 +-
 3 files changed, 42 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
index cec2ff879f5d..f2b973b377dd 100644
--- a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
+++ b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
@@ -11,8 +11,7 @@
 /* This routine deals with the Power Configuration CMDs parsing
  * for RTL8723/RTL8188E Series IC.
  */
-u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
-			    struct wl_pwr_cfg pwrseqcmd[])
+u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, struct wl_pwr_cfg pwrseqcmd[])
 {
 	struct wl_pwr_cfg pwrcfgcmd;
 	u8 poll_bit = false;
@@ -25,53 +24,48 @@ u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
 	do {
 		pwrcfgcmd = pwrseqcmd[aryidx];
 
-		/* Only Handle the command whose CUT is matched */
-		if (GET_PWR_CFG_CUT_MASK(pwrcfgcmd) & cut_vers) {
-			switch (GET_PWR_CFG_CMD(pwrcfgcmd)) {
-			case PWR_CMD_READ:
-				break;
-			case PWR_CMD_WRITE:
-				offset = GET_PWR_CFG_OFFSET(pwrcfgcmd);
+		switch (GET_PWR_CFG_CMD(pwrcfgcmd)) {
+		case PWR_CMD_READ:
+			break;
+		case PWR_CMD_WRITE:
+			offset = GET_PWR_CFG_OFFSET(pwrcfgcmd);
 
-				/*  Read the value from system register */
-				value = usb_read8(padapter, offset);
-
-				value &= ~(GET_PWR_CFG_MASK(pwrcfgcmd));
-				value |= (GET_PWR_CFG_VALUE(pwrcfgcmd) &
-					  GET_PWR_CFG_MASK(pwrcfgcmd));
+			/*  Read the value from system register */
+			value = usb_read8(padapter, offset);
 
-				/*  Write the value back to system register */
-				usb_write8(padapter, offset, value);
-				break;
-			case PWR_CMD_POLLING:
-				poll_bit = false;
-				offset = GET_PWR_CFG_OFFSET(pwrcfgcmd);
-				do {
-					value = usb_read8(padapter, offset);
-					value &= GET_PWR_CFG_MASK(pwrcfgcmd);
+			value &= ~(GET_PWR_CFG_MASK(pwrcfgcmd));
+			value |= (GET_PWR_CFG_VALUE(pwrcfgcmd) & GET_PWR_CFG_MASK(pwrcfgcmd));
 
-					if (value == (GET_PWR_CFG_VALUE(pwrcfgcmd) &
-						      GET_PWR_CFG_MASK(pwrcfgcmd)))
-						poll_bit = true;
-					else
-						udelay(10);
+			/*  Write the value back to system register */
+			usb_write8(padapter, offset, value);
+			break;
+		case PWR_CMD_POLLING:
+			poll_bit = false;
+			offset = GET_PWR_CFG_OFFSET(pwrcfgcmd);
+			do {
+				value = usb_read8(padapter, offset);
+				value &= GET_PWR_CFG_MASK(pwrcfgcmd);
 
-					if (poll_count++ > max_poll_count)
-						return false;
-				} while (!poll_bit);
-				break;
-			case PWR_CMD_DELAY:
-				if (GET_PWR_CFG_VALUE(pwrcfgcmd) == PWRSEQ_DELAY_US)
-					udelay(GET_PWR_CFG_OFFSET(pwrcfgcmd));
+				if (value == (GET_PWR_CFG_VALUE(pwrcfgcmd) & GET_PWR_CFG_MASK(pwrcfgcmd)))
+					poll_bit = true;
 				else
-					udelay(GET_PWR_CFG_OFFSET(pwrcfgcmd) * 1000);
-				break;
-			case PWR_CMD_END:
-				/* When this command is parsed, end the process */
-				return true;
-			default:
-				break;
-			}
+					udelay(10);
+
+				if (poll_count++ > max_poll_count)
+					return false;
+			} while (!poll_bit);
+			break;
+		case PWR_CMD_DELAY:
+			if (GET_PWR_CFG_VALUE(pwrcfgcmd) == PWRSEQ_DELAY_US)
+				udelay(GET_PWR_CFG_OFFSET(pwrcfgcmd));
+			else
+				udelay(GET_PWR_CFG_OFFSET(pwrcfgcmd) * 1000);
+			break;
+		case PWR_CMD_END:
+			/* When this command is parsed, end the process */
+			return true;
+		default:
+			break;
 		}
 
 		aryidx++;/* Add Array Index */
diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index e0961919fcf8..ae64678a5a5c 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -88,8 +88,7 @@ u32 rtw_hal_power_on(struct adapter *adapt)
 	if (adapt->HalData->bMacPwrCtrlOn)
 		return _SUCCESS;
 
-	if (!rtl88eu_pwrseqcmdparsing(adapt, PWR_CUT_ALL_MSK,
-				      Rtl8188E_NIC_PWR_ON_FLOW))
+	if (!rtl88eu_pwrseqcmdparsing(adapt, Rtl8188E_NIC_PWR_ON_FLOW))
 		return _FAIL;
 
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
@@ -830,8 +829,7 @@ static void CardDisableRTL8188EU(struct adapter *Adapter)
 	usb_write8(Adapter, REG_CR, 0x0);
 
 	/*  Run LPS WL RFOFF flow */
-	rtl88eu_pwrseqcmdparsing(Adapter, PWR_CUT_ALL_MSK,
-				 Rtl8188E_NIC_LPS_ENTER_FLOW);
+	rtl88eu_pwrseqcmdparsing(Adapter, Rtl8188E_NIC_LPS_ENTER_FLOW);
 
 	/*  2. 0x1F[7:0] = 0		turn off RF */
 
@@ -852,8 +850,7 @@ static void CardDisableRTL8188EU(struct adapter *Adapter)
 	usb_write8(Adapter, REG_32K_CTRL, val8 & (~BIT(0)));
 
 	/*  Card disable power action flow */
-	rtl88eu_pwrseqcmdparsing(Adapter, PWR_CUT_ALL_MSK,
-				 Rtl8188E_NIC_DISABLE_FLOW);
+	rtl88eu_pwrseqcmdparsing(Adapter, Rtl8188E_NIC_DISABLE_FLOW);
 
 	/*  Reset MCU IO Wrapper */
 	val8 = usb_read8(Adapter, REG_RSV_CTRL + 1);
diff --git a/drivers/staging/rtl8188eu/include/pwrseqcmd.h b/drivers/staging/rtl8188eu/include/pwrseqcmd.h
index 05f117e2a105..e364ee450beb 100644
--- a/drivers/staging/rtl8188eu/include/pwrseqcmd.h
+++ b/drivers/staging/rtl8188eu/include/pwrseqcmd.h
@@ -41,12 +41,10 @@ struct wl_pwr_cfg {
 };
 
 #define GET_PWR_CFG_OFFSET(__PWR_CMD)		__PWR_CMD.offset
-#define GET_PWR_CFG_CUT_MASK(__PWR_CMD)		__PWR_CMD.cut_msk
 #define GET_PWR_CFG_CMD(__PWR_CMD)		__PWR_CMD.cmd
 #define GET_PWR_CFG_MASK(__PWR_CMD)		__PWR_CMD.msk
 #define GET_PWR_CFG_VALUE(__PWR_CMD)		__PWR_CMD.value
 
-u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
-			    struct wl_pwr_cfg pwrcfgCmd[]);
+u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, struct wl_pwr_cfg pwrcfgCmd[]);
 
 #endif
-- 
2.20.1

