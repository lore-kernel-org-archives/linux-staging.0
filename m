Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D6A49
	for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 15:54:12 +0000 (UTC)
Received: from dslb-188-096-141-066.188.096.pools.vodafone-ip.de ([188.96.141.66] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nqGZM-0006NT-NJ; Sun, 15 May 2022 17:54:08 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/5] staging: r8188eu: remove obsolete comments
Date: Sun, 15 May 2022 17:53:58 +0200
Message-Id: <20220515155401.352742-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220515155401.352742-1-martin@kaiser.cx>
References: <20220515155401.352742-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some comments in HalPwrSeqCmd.c that contain no useful information.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
index 5b91aec6a7e3..150ea380c39e 100644
--- a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
@@ -1,30 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-/*++
-
-Module Name:
-	HalPwrSeqCmd.c
-
-Abstract:
-	Implement HW Power sequence configuration CMD handling routine for Realtek devices.
-
-Major Change History:
-	When       Who               What
-	---------- ---------------   -------------------------------
-	2011-10-26 Lucas            Modify to be compatible with SD4-CE driver.
-	2011-07-07 Roger            Create.
-
---*/
-
 #include "../include/HalPwrSeqCmd.h"
 
-/*	Description: */
-/*		This routine deals with the Power Configuration CMDs parsing
- *		for RTL8723/RTL8188E Series IC.
- *	Assumption:
- *		We should follow specific format which was released from HW SD.
- */
 u8 HalPwrSeqCmdParsing(struct adapter *padapter, struct wl_pwr_cfg pwrseqcmd[])
 {
 	struct wl_pwr_cfg pwrcfgcmd = {0};
-- 
2.30.2

