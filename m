Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B12C94
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 19:54:38 +0000 (UTC)
Received: from dslb-188-096-142-022.188.096.pools.vodafone-ip.de ([188.96.142.22] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mdHfX-0007Cd-EC; Wed, 20 Oct 2021 21:54:35 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: remove unused defines and enums
Date: Wed, 20 Oct 2021 21:54:01 +0200
Message-Id: <20211020195401.12931-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211020195401.12931-1-martin@kaiser.cx>
References: <20211020195401.12931-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a couple of unused defines and an unused enum
from rtl8188e_cmd.h.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtl8188e_cmd.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_cmd.h b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
index 01404b774ebd..1e01c1662f9a 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_cmd.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
@@ -27,15 +27,6 @@ enum RTL8188E_H2C_CMD_ID {
 	/* Class DM */
 	H2C_DM_MACID_CFG		= 0x40,
 	H2C_DM_TXBF			= 0x41,
-
-	/* Class BT */
-	H2C_BT_COEX_MASK		= 0x60,
-	H2C_BT_COEX_GPIO_MODE		= 0x61,
-	H2C_BT_DAC_SWING_VAL		= 0x62,
-	H2C_BT_PSD_RST			= 0x63,
-
-	/* Class */
-	 H2C_RESET_TSF			= 0xc0,
 };
 
 struct cmd_msg_parm {
@@ -44,10 +35,6 @@ struct cmd_msg_parm {
 	u8 buf[6];
 };
 
-enum {
-	PWRS
-};
-
 struct setpwrmode_parm {
 	u8 Mode;/* 0:Active,1:LPS,2:WMMPS */
 	u8 SmartPS_RLBM;/* LPS= 0:PS_Poll,1:PS_Poll,2:NullData,WMM= 0:PS_Poll,1:NullData */
-- 
2.20.1

