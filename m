Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2082C9D
	for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 18:39:45 +0000 (UTC)
Received: from dslb-188-097-041-189.188.097.pools.vodafone-ip.de ([188.97.41.189] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mz15y-0000Iw-8A; Sun, 19 Dec 2021 19:39:42 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/9] staging: r8188: remove sizes from power transition arrays
Date: Sun, 19 Dec 2021 19:39:19 +0100
Message-Id: <20211219183926.4746-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211219183926.4746-1-martin@kaiser.cx>
References: <20211219183926.4746-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to set the array size explicitly if an array is
initialized with a constant value. Remove the array sizes and
related definitions for the power transition arrays.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c     |  6 +++---
 drivers/staging/r8188eu/include/Hal8188EPwrSeq.h | 12 +++---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
index a1b6f551f3e0..0332286c1fa9 100644
--- a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
+++ b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
@@ -8,21 +8,21 @@
     drivers should parse below arrays and do the corresponding actions
 */
 /* 3 Power on  Array */
-struct wl_pwr_cfg rtl8188E_power_on_flow[RTL8188E_TRANS_CARDEMU_TO_ACT_STEPS + RTL8188E_TRANS_END_STEPS] = {
+struct wl_pwr_cfg rtl8188E_power_on_flow[] = {
 	RTL8188E_TRANS_CARDEMU_TO_ACT
 	RTL8188E_TRANS_END
 };
 
 /* 3Card Disable Array */
 struct wl_pwr_cfg
-rtl8188E_card_disable_flow[RTL8188E_TRANS_ACT_TO_CARDEMU_STEPS + RTL8188E_TRANS_CARDEMU_TO_CARDDIS_STEPS + RTL8188E_TRANS_END_STEPS] = {
+rtl8188E_card_disable_flow[] = {
 	RTL8188E_TRANS_ACT_TO_CARDEMU
 	RTL8188E_TRANS_CARDEMU_TO_CARDDIS
 	RTL8188E_TRANS_END
 };
 
 /* 3 Enter LPS */
-struct wl_pwr_cfg rtl8188E_enter_lps_flow[RTL8188E_TRANS_ACT_TO_LPS_STEPS + RTL8188E_TRANS_END_STEPS] = {
+struct wl_pwr_cfg rtl8188E_enter_lps_flow[] = {
 	/* FW behavior */
 	RTL8188E_TRANS_ACT_TO_LPS
 	RTL8188E_TRANS_END
diff --git a/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h b/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h
index adfba36d4f52..d36a2ab2ec7b 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h
@@ -6,12 +6,6 @@
 
 #include "HalPwrSeqCmd.h"
 
-#define	RTL8188E_TRANS_CARDEMU_TO_ACT_STEPS	10
-#define	RTL8188E_TRANS_ACT_TO_CARDEMU_STEPS	10
-#define	RTL8188E_TRANS_CARDEMU_TO_CARDDIS_STEPS	10
-#define	RTL8188E_TRANS_ACT_TO_LPS_STEPS		15
-#define	RTL8188E_TRANS_END_STEPS		1
-
 #define RTL8188E_TRANS_CARDEMU_TO_ACT														\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
@@ -64,8 +58,8 @@
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value },  comments here*/					\
 	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK,0, PWR_CMD_END, 0, 0}, /*  */
 
-extern struct wl_pwr_cfg rtl8188E_power_on_flow[RTL8188E_TRANS_CARDEMU_TO_ACT_STEPS+RTL8188E_TRANS_END_STEPS];
-extern struct wl_pwr_cfg rtl8188E_card_disable_flow[RTL8188E_TRANS_ACT_TO_CARDEMU_STEPS+RTL8188E_TRANS_CARDEMU_TO_CARDDIS_STEPS+RTL8188E_TRANS_END_STEPS];
-extern struct wl_pwr_cfg rtl8188E_enter_lps_flow[RTL8188E_TRANS_ACT_TO_LPS_STEPS+RTL8188E_TRANS_END_STEPS];
+extern struct wl_pwr_cfg rtl8188E_power_on_flow[];
+extern struct wl_pwr_cfg rtl8188E_card_disable_flow[];
+extern struct wl_pwr_cfg rtl8188E_enter_lps_flow[];
 
 #endif /* __HAL8188EPWRSEQ_H__ */
-- 
2.20.1

