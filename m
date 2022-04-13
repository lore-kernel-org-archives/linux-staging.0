Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C692F33
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 19:37:48 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1neio8-0005fr-4F; Wed, 13 Apr 2022 21:37:40 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 5/8] staging: r8188eu: use kernel functions for timeout handling
Date: Wed, 13 Apr 2022 21:36:51 +0200
Message-Id: <20220413193654.258507-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220413193654.258507-1-martin@kaiser.cx>
References: <20220409151557.207980-1-martin@kaiser.cx>
 <20220413193654.258507-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the kernel functions to set a timeout and to check if it's expired.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index ff96e5229b52..2ad6105e6ec4 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -372,8 +372,8 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	unsigned long timeout = jiffies + msecs_to_jiffies(3000);
 	int ret = _SUCCESS;
-	u32 start = jiffies;
 	u32 ips_deffer_ms;
 
 	/* the ms will prevent from falling into IPS after wakeup */
@@ -382,11 +382,11 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 	if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
 		pwrpriv->ips_deny_time = jiffies + rtw_ms_to_systime(ips_deffer_ms);
 
-	while (pwrpriv->ps_processing && rtw_get_passing_time_ms(start) <= 3000)
+	while (pwrpriv->ps_processing && time_before(jiffies, timeout))
 		msleep(10);
 
 	/* System suspend is not allowed to wakeup */
-	while (pwrpriv->bInSuspend && rtw_get_passing_time_ms(start) <= 3000)
+	while (pwrpriv->bInSuspend && time_before(jiffies, timeout))
 		msleep(10);
 
 	/* I think this should be check in IPS, LPS, autosuspend functions... */
-- 
2.30.2

