Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8E33FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:16:01 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP3nS-0006bt-JU; Sat, 11 Sep 2021 16:15:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/12] staging: r8188eu: btcoex_rfon is always false
Date: Sat, 11 Sep 2021 16:15:10 +0200
Message-Id: <20210911141521.24901-2-martin@kaiser.cx>
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

btcoex_rfon is always false in this driver. Remove the variable and code
that will never be executed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 7 -------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 353b7bd850d9..f9ee917895c7 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -200,11 +200,6 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 
 	pslv = PS_STATE(pslv);
 
-	if (pwrpriv->btcoex_rfon) {
-		if (pslv < PS_STATE_S4)
-			pslv = PS_STATE_S3;
-	}
-
 	if (pwrpriv->rpwm == pslv)
 		return;
 
@@ -441,8 +436,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 
 	pwrctrlpriv->tog = 0x80;
 
-	pwrctrlpriv->btcoex_rfon = false;
-
 	timer_setup(&pwrctrlpriv->pwr_state_check_timer, pwr_state_check_handler, 0);
 }
 
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 8446dfb50f34..6a0efb010d06 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -188,7 +188,6 @@ struct pwrctrl_priv {
 	u8	power_mgnt;
 	u8	bFwCurrentInPSMode;
 	u32	DelayLPSLastTimeStamp;
-	u8	btcoex_rfon;
 	s32		pnp_current_pwr_state;
 	u8		pnp_bstop_trx;
 
-- 
2.20.1

