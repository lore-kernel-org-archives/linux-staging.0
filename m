Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC0C6D00
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 03:53:10 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UUklzHF_1617767559;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UUklzHF_1617767559)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 07 Apr 2021 11:52:50 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] staging: rtl8192e: rtl8192E_dev: remove unused variable
Date: Wed,  7 Apr 2021 11:52:38 +0800
Message-Id: <1617767558-114050-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c:693:15: warning: variable
‘tmpRegC’ set but not used [-Wunused-but-set-variable].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index ff843d7..8dbb31f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -690,7 +690,7 @@ bool rtl92e_start_adapter(struct net_device *dev)
 	u8 tmpvalue;
 	u8 ICVersion, SwitchingRegulatorOutput;
 	bool bfirmwareok = true;
-	u32 tmpRegA, tmpRegC, TempCCk;
+	u32 tmpRegA, TempCCk;
 	int i = 0;
 	u32 retry_times = 0;
 
@@ -889,8 +889,8 @@ bool rtl92e_start_adapter(struct net_device *dev)
 		if (priv->IC_Cut >= IC_VersionCut_D) {
 			tmpRegA = rtl92e_get_bb_reg(dev, rOFDM0_XATxIQImbalance,
 						    bMaskDWord);
-			tmpRegC = rtl92e_get_bb_reg(dev, rOFDM0_XCTxIQImbalance,
-						    bMaskDWord);
+			rtl92e_get_bb_reg(dev, rOFDM0_XCTxIQImbalance, bMaskDWord);
+
 			for (i = 0; i < TxBBGainTableLength; i++) {
 				if (tmpRegA == dm_tx_bb_gain[i]) {
 					priv->rfa_txpowertrackingindex = (u8)i;
-- 
1.8.3.1

