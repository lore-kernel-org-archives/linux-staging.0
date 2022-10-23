Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413F2F59
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 17:08:29 +0000 (UTC)
Received: from ipservice-092-217-070-181.092.217.pools.vodafone-ip.de ([92.217.70.181] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1omeSS-0000Rj-4e; Sun, 23 Oct 2022 19:08:20 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: bCardDisableWOHSM is write-only
Date: Sun, 23 Oct 2022 19:08:08 +0200
Message-Id: <20221023170808.46233-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221023170808.46233-1-martin@kaiser.cx>
References: <20221023170808.46233-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bCardDisableWOHSM in struct adapter is only written but never read.
It can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c   | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 1bd0c8f3a358..8fef5759c36a 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -167,7 +167,6 @@ struct adapter {
 
 	s32	bDriverStopped;
 	s32	bSurpriseRemoved;
-	s32	bCardDisableWOHSM;
 
 	u8	hw_init_completed;
 	s8	signal_strength;
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 38e324754c8f..970f380bac96 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -620,7 +620,6 @@ static int _netdev_open(struct net_device *pnetdev)
 	if (!padapter->bup) {
 		padapter->bDriverStopped = false;
 		padapter->bSurpriseRemoved = false;
-		padapter->bCardDisableWOHSM = false;
 
 		status = rtw_hal_init(padapter);
 		if (status == _FAIL)
@@ -686,7 +685,6 @@ static int  ips_netdrv_open(struct adapter *padapter)
 
 	padapter->bDriverStopped = false;
 	padapter->bSurpriseRemoved = false;
-	padapter->bCardDisableWOHSM = false;
 
 	status = rtw_hal_init(padapter);
 	if (status == _FAIL)
@@ -718,13 +716,11 @@ int rtw_ips_pwr_up(struct adapter *padapter)
 
 void rtw_ips_pwr_down(struct adapter *padapter)
 {
-	padapter->bCardDisableWOHSM = true;
 	padapter->net_closed = true;
 
 	rtw_led_control(padapter, LED_CTL_POWER_OFF);
 
 	rtw_ips_dev_unload(padapter);
-	padapter->bCardDisableWOHSM = false;
 }
 
 static void rtw_fifo_cleanup(struct adapter *adapter)
-- 
2.30.2

