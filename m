Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2F1A25
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 15:16:12 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndCor-0005k2-Pm; Sat, 09 Apr 2022 17:16:09 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 8/8] staging: r8188eu: remove the bInSuspend loop
Date: Sat,  9 Apr 2022 17:15:57 +0200
Message-Id: <20220409151557.207980-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409151557.207980-1-martin@kaiser.cx>
References: <20220409151557.207980-1-martin@kaiser.cx>
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
the suspend and resume affects the whole system, not just the usb device.

 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 717a9bb26c19..093794414d67 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -369,10 +369,6 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 	while (pwrpriv->ps_processing && time_before(jiffies, timeout))
 		msleep(10);
 
-	/* System suspend is not allowed to wakeup */
-	while (pwrpriv->bInSuspend && time_before(jiffies, timeout))
-		msleep(10);
-
 	/* I think this should be check in IPS, LPS, autosuspend functions... */
 	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		goto exit;
-- 
2.30.2

