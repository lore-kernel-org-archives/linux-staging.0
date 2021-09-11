Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67473FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:16:03 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP3nU-0006bt-Pc; Sat, 11 Sep 2021 16:16:00 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/12] staging: r8188eu: remove write-only variable cpwm
Date: Sat, 11 Sep 2021 16:15:12 +0200
Message-Id: <20210911141521.24901-4-martin@kaiser.cx>
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

cpwm in struct pwrctrl_priv is never read. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 5 -----
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index daae91f82e97..2a0ee3aac700 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -204,8 +204,6 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 
 	if ((padapter->bSurpriseRemoved) ||
 	    (!padapter->hw_init_completed)) {
-		pwrpriv->cpwm = PS_STATE_S4;
-
 		return;
 	}
 
@@ -217,8 +215,6 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	pwrpriv->rpwm = pslv;
 
 	pwrpriv->tog += 0x80;
-	pwrpriv->cpwm = pslv;
-
 }
 
 static u8 PS_RDY_CHECK(struct adapter *padapter)
@@ -423,7 +419,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->bFwCurrentInPSMode = false;
 
 	pwrctrlpriv->rpwm = 0;
-	pwrctrlpriv->cpwm = PS_STATE_S4;
 
 	pwrctrlpriv->pwr_mode = PS_MODE_ACTIVE;
 	pwrctrlpriv->smart_ps = padapter->registrypriv.smart_ps;
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 6a0efb010d06..c5804a48072b 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -152,8 +152,6 @@ enum { /*  for ips_mode */
 struct pwrctrl_priv {
 	struct semaphore lock;
 	volatile u8 rpwm; /*  requested power state for fw */
-	volatile u8 cpwm; /*  fw current power state. updated when
-			   * 1. read from HCPWM 2. driver lowers power level */
 	volatile u8 tog; /*  toggling */
 	volatile u8 cpwm_tog; /*  toggling */
 
-- 
2.20.1

