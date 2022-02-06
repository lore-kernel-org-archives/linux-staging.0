Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C242CA4
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 16:18:28 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGkF7-0001bS-5x; Sun, 06 Feb 2022 17:18:25 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/14] staging: r8188eu: remove unused struct adapter components
Date: Sun,  6 Feb 2022 17:18:05 +0100
Message-Id: <20220206161809.423031-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206161809.423031-1-martin@kaiser.cx>
References: <20220206161809.423031-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a number of unused components from struct adapter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 1260cacbae64..4553cfda0aa4 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -161,7 +161,6 @@ static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
 
 struct adapter {
 	int	pid[3];/* process id from UI, 0:wps, 1:hostapd, 2:dhcpcd */
-	int	bDongle;/* build-in module or external dongle */
 
 	struct dvobj_priv *dvobj;
 	struct	mlme_priv mlmepriv;
@@ -186,20 +185,11 @@ struct adapter {
 	s32	bSurpriseRemoved;
 	s32	bCardDisableWOHSM;
 
-	u32	IsrContent;
-	u32	ImrContent;
-
 	u8	EepromAddressSize;
 	u8	hw_init_completed;
-	u8	bDriverIsGoingToUnload;
-	u8	init_adpt_in_progress;
-	u8	bHaltInProgress;
 	s8	signal_strength;
 
 	void *cmdThread;
-	void *evtThread;
-	void *xmitThread;
-	void *recvThread;
 	void (*intf_start)(struct adapter *adapter);
 	void (*intf_stop)(struct adapter *adapter);
 	struct  net_device *pnetdev;
@@ -219,7 +209,6 @@ struct adapter {
 
 	int net_closed;
 	u8 bFWReady;
-	u8 bBTFWReady;
 	u8 bReadPortCancel;
 	u8 bWritePortCancel;
 	u8 bRxRSSIDisplay;
-- 
2.30.2

