Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757682F36
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 19:37:50 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1neio9-0005fr-Mt; Wed, 13 Apr 2022 21:37:41 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 7/8] staging: r8188eu: remove the bInSuspend loop
Date: Wed, 13 Apr 2022 21:36:53 +0200
Message-Id: <20220413193654.258507-8-martin@kaiser.cx>
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

Remove the loop in rtw_pwr_wakeup that waits while the system is
suspended.

pwrpriv->bInSuspend is set in rtw_suspend and cleared in rtw_resume. These
functions are the .suspend and .resume functions of the struct usb_driver
for r8188eu.

A usb_driver's suspend and resume functions are called when the entire
system goes into suspend or runtime suspend.

All of the code paths for rtw_pwr_wakeup start at ioctl handlers.

We can remove the loop that checks bInSuspend. It's not possible to call
an ioctl while the entire system is suspended.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---

I tried to track down who calls suspend and resume of an usb_driver. My
understanding is that all of these calls come from the pm layer and that
the suspend and resume affect the whole system, not just the usb device.

 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 605210d89f32..6990808ef353 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -379,10 +379,6 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 	while (pwrpriv->ps_processing && time_before(jiffies, timeout))
 		msleep(10);
 
-	/* System suspend is not allowed to wakeup */
-	while (pwrpriv->bInSuspend && time_before(jiffies, timeout))
-		msleep(10);
-
 	/* I think this should be check in IPS, LPS, autosuspend functions... */
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		ret = _SUCCESS;
-- 
2.30.2

