Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33170
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 16:59:24 +0000 (UTC)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lpZdq-0002hw-J7; Sat, 05 Jun 2021 18:59:22 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/9] staging: rtl8188eu: refactor rtw_lps_ctrl_wk_cmd
Date: Sat,  5 Jun 2021 18:58:52 +0200
Message-Id: <20210605165858.3175-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605165858.3175-1-martin@kaiser.cx>
References: <20210605165858.3175-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate memory only if we're asked to enqueue the command for later
processing. Handle memory allocation failures in one place.

There's no need to "goto exit" if we're not doing any cleanup there.

kzalloc already set all of pdrvextra_cmd_parm to 0. We don't have
to set pdrvextra_cmd_parm->pbuf = NULL manually.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_cmd.c | 43 +++++++++---------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index e8d6978ad477..b892763ce1ba 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -870,39 +870,28 @@ static void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 
 u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 {
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_obj	*ph2c;
-	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
-	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	if (enqueue) {
-		ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
-		if (!ph2c) {
-			res = _FAIL;
-			goto exit;
-		}
-
-		pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
-		if (!pdrvextra_cmd_parm) {
-			kfree(ph2c);
-			res = _FAIL;
-			goto exit;
-		}
 
-		pdrvextra_cmd_parm->ec_id = LPS_CTRL_WK_CID;
-		pdrvextra_cmd_parm->type_size = lps_ctrl_type;
-		pdrvextra_cmd_parm->pbuf = NULL;
-
-		init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra_CMD_);
-
-		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-	} else {
+	if (!enqueue) {
 		lps_ctrl_wk_hdl(padapter, lps_ctrl_type);
+		return _SUCCESS;
 	}
 
-exit:
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
+	if (!ph2c || !pdrvextra_cmd_parm) {
+		kfree(ph2c);
+		kfree(pdrvextra_cmd_parm);
+		return _FAIL;
+	}
 
-	return res;
+	pdrvextra_cmd_parm->ec_id = LPS_CTRL_WK_CID;
+	pdrvextra_cmd_parm->type_size = lps_ctrl_type;
+
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra_CMD_);
+	return rtw_enqueue_cmd(pcmdpriv, ph2c);
 }
 
 static void rpt_timer_setting_wk_hdl(struct adapter *padapter, u16 min_time)
-- 
2.20.1

