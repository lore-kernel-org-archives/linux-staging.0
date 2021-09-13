Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7223FC3
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 18:53:12 +0000 (UTC)
Received: from 250.57.4.146.static.wline.lns.sme.cust.swisscom.ch ([146.4.57.250] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mPr4n-0005CM-S7; Mon, 13 Sep 2021 20:53:09 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 6/8] staging: r8188eu: rtw_set_ips_deny is not used
Date: Mon, 13 Sep 2021 20:51:08 +0200
Message-Id: <20210913185110.3065-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913185110.3065-1-martin@kaiser.cx>
References: <20210911141521.24901-1-martin@kaiser.cx>
 <20210913185110.3065-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_set_ips_deny function since it's not used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
- rebased against today's staging-testing branch

 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 6 ------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 4500d60c3777..d901ac7aea4d 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -371,12 +371,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	timer_setup(&pwrctrlpriv->pwr_state_check_timer, pwr_state_check_handler, 0);
 }
 
-inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
-{
-	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
-	pwrpriv->ips_deny_time = jiffies + rtw_ms_to_systime(ms);
-}
-
 /*
 * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
 * @adapter: pointer to struct adapter structure
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index c4f5cca8df08..9e4b4eef4d27 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -153,7 +153,6 @@ s32 LPS_RF_ON_check(struct adapter *adapter, u32 delay_ms);
 void LPS_Enter(struct adapter *adapter);
 void LPS_Leave(struct adapter *adapter);
 
-void rtw_set_ips_deny(struct adapter *adapter, u32 ms);
 int _rtw_pwr_wakeup(struct adapter *adapter, u32 ips_defer_ms,
 		    const char *caller);
 #define rtw_pwr_wakeup(adapter)						\
-- 
2.20.1

