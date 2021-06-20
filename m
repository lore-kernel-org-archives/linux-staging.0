Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483570
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 17:53:35 +0000 (UTC)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lv1dV-00012S-Pr; Sun, 20 Jun 2021 19:53:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/13] staging: rtl8188eu: remove RT_TRACE prints from pwrseqcmd.c
Date: Sun, 20 Jun 2021 19:52:58 +0200
Message-Id: <20210620175301.14988-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210620175301.14988-1-martin@kaiser.cx>
References: <20210620175301.14988-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eventually, all driver-specific debug prints should be removed.
Take another step in that direction.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/pwrseqcmd.c | 24 -----------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
index fb3b0f5e8f28..cec2ff879f5d 100644
--- a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
+++ b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
@@ -25,27 +25,12 @@ u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
 	do {
 		pwrcfgcmd = pwrseqcmd[aryidx];
 
-		RT_TRACE(_module_hal_init_c_, _drv_info_,
-			 ("%s: offset(%#x) cut_msk(%#x)"
-			  " cmd(%#x)"
-			  "msk(%#x) value(%#x)\n",
-			  __func__,
-			  GET_PWR_CFG_OFFSET(pwrcfgcmd),
-			  GET_PWR_CFG_CUT_MASK(pwrcfgcmd),
-			  GET_PWR_CFG_CMD(pwrcfgcmd),
-			  GET_PWR_CFG_MASK(pwrcfgcmd),
-			  GET_PWR_CFG_VALUE(pwrcfgcmd)));
-
 		/* Only Handle the command whose CUT is matched */
 		if (GET_PWR_CFG_CUT_MASK(pwrcfgcmd) & cut_vers) {
 			switch (GET_PWR_CFG_CMD(pwrcfgcmd)) {
 			case PWR_CMD_READ:
-				RT_TRACE(_module_hal_init_c_, _drv_info_,
-					 ("%s: PWR_CMD_READ\n", __func__));
 				break;
 			case PWR_CMD_WRITE:
-				RT_TRACE(_module_hal_init_c_, _drv_info_,
-					 ("%s: PWR_CMD_WRITE\n", __func__));
 				offset = GET_PWR_CFG_OFFSET(pwrcfgcmd);
 
 				/*  Read the value from system register */
@@ -59,9 +44,6 @@ u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
 				usb_write8(padapter, offset, value);
 				break;
 			case PWR_CMD_POLLING:
-				RT_TRACE(_module_hal_init_c_, _drv_info_,
-					 ("%s: PWR_CMD_POLLING\n", __func__));
-
 				poll_bit = false;
 				offset = GET_PWR_CFG_OFFSET(pwrcfgcmd);
 				do {
@@ -79,8 +61,6 @@ u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
 				} while (!poll_bit);
 				break;
 			case PWR_CMD_DELAY:
-				RT_TRACE(_module_hal_init_c_, _drv_info_,
-					 ("%s: PWR_CMD_DELAY\n", __func__));
 				if (GET_PWR_CFG_VALUE(pwrcfgcmd) == PWRSEQ_DELAY_US)
 					udelay(GET_PWR_CFG_OFFSET(pwrcfgcmd));
 				else
@@ -88,12 +68,8 @@ u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
 				break;
 			case PWR_CMD_END:
 				/* When this command is parsed, end the process */
-				RT_TRACE(_module_hal_init_c_, _drv_info_,
-					 ("%s: PWR_CMD_END\n", __func__));
 				return true;
 			default:
-				RT_TRACE(_module_hal_init_c_, _drv_err_,
-					 ("%s: Unknown CMD!!\n", __func__));
 				break;
 			}
 		}
-- 
2.20.1

