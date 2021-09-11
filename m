Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1A3FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:16:04 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP3nV-0006bt-NX; Sat, 11 Sep 2021 16:16:01 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/12] staging: r8188eu: remove write-only variable tog
Date: Sat, 11 Sep 2021 16:15:13 +0200
Message-Id: <20210911141521.24901-5-martin@kaiser.cx>
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

tog in struct pwrctrl_priv is never read. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 4 ----
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 2a0ee3aac700..86841093caa8 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -213,8 +213,6 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	}
 
 	pwrpriv->rpwm = pslv;
-
-	pwrpriv->tog += 0x80;
 }
 
 static u8 PS_RDY_CHECK(struct adapter *padapter)
@@ -424,8 +422,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->smart_ps = padapter->registrypriv.smart_ps;
 	pwrctrlpriv->bcn_ant_mode = 0;
 
-	pwrctrlpriv->tog = 0x80;
-
 	timer_setup(&pwrctrlpriv->pwr_state_check_timer, pwr_state_check_handler, 0);
 }
 
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index c5804a48072b..5be67644ba5f 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -152,7 +152,6 @@ enum { /*  for ips_mode */
 struct pwrctrl_priv {
 	struct semaphore lock;
 	volatile u8 rpwm; /*  requested power state for fw */
-	volatile u8 tog; /*  toggling */
 	volatile u8 cpwm_tog; /*  toggling */
 
 	u8	pwr_mode;
-- 
2.20.1

