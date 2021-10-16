Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AF2C80
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 11:30:40 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mbhtd-00046d-8z; Sat, 16 Oct 2021 13:30:37 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/8] staging: r8188eu: remove unused function prototypes
Date: Sat, 16 Oct 2021 13:30:04 +0200
Message-Id: <20211016113008.27549-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211016113008.27549-1-martin@kaiser.cx>
References: <20211016113008.27549-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove prototypes of functions that aren't present in this driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index ee4b26ecd19d..084bccc5dcb9 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -194,18 +194,10 @@ void PHY_SetBWMode8188E(struct adapter *adapter,
 
 /*  channel switch related funciton */
 void PHY_SwChnl8188E(struct adapter *adapter, u8 channel);
-/*  Call after initialization */
-void ChkFwCmdIoDone(struct adapter *adapter);
 
 /*  BB/MAC/RF other monitor API */
 void PHY_SetRFPathSwitch_8188E(struct adapter *adapter,	bool main);
 
-void PHY_SwitchEphyParameter(struct adapter *adapter);
-
-void PHY_EnableHostClkReq(struct adapter *adapter);
-
-bool SetAntennaConfig92C(struct adapter *adapter, u8 defaultant);
-
 void storePwrIndexDiffRateOffset(struct adapter *adapter, u32 regaddr,
 				 u32 mask, u32 data);
 /*--------------------------Exported Function prototype---------------------*/
-- 
2.20.1

