Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3F6149
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 20:33:59 +0000 (UTC)
Received: from dslb-094-219-034-255.094.219.pools.vodafone-ip.de ([94.219.34.255] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWOix-0003ce-NR; Mon, 21 Mar 2022 21:33:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/6] staging: r8188eu: remove unused defines for dynamic functions
Date: Mon, 21 Mar 2022 21:30:27 +0100
Message-Id: <20220321203031.143486-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321203031.143486-1-martin@kaiser.cx>
References: <20220321203031.143486-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a couple of DYNAMIC_BB_... defines which are not used
by this driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 752fa433544e..532360c84d66 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -30,26 +30,10 @@
 /*  ====== ODM_ABILITY_E ======== */
 /*  BB ODM section BIT 0-15 */
 #define	DYNAMIC_BB_DIG				BIT(0)
-#define	DYNAMIC_BB_RA_MASK			BIT(1)
 #define	DYNAMIC_BB_DYNAMIC_TXPWR	BIT(2)
-#define	DYNAMIC_BB_BB_FA_CNT			BIT(3)
 
-#define		DYNAMIC_BB_RSSI_MONITOR		BIT(4)
-#define		DYNAMIC_BB_CCK_PD			BIT(5)
 #define		DYNAMIC_BB_ANT_DIV			BIT(6)
-#define		DYNAMIC_BB_PWR_SAVE			BIT(7)
-#define		DYNAMIC_BB_PWR_TRA			BIT(8)
-#define		DYNAMIC_BB_RATE_ADAPTIVE		BIT(9)
-#define		DYNAMIC_BB_PATH_DIV			BIT(10)
-#define		DYNAMIC_BB_PSD				BIT(11)
-
-/*  MAC DM section BIT 16-23 */
-#define		DYNAMIC_MAC_EDCA_TURBO		BIT(16)
-#define		DYNAMIC_MAC_EARLY_MODE		BIT(17)
-
-/*  RF ODM section BIT 24-31 */
-#define		DYNAMIC_RF_TX_PWR_TRACK		BIT(24)
-#define		DYNAMIC_RF_RX_GAIN_TRACK		BIT(25)
+
 #define		DYNAMIC_RF_CALIBRATION		BIT(26)
 
 #define		DYNAMIC_ALL_FUNC_ENABLE		0xFFFFFFF
-- 
2.30.2

