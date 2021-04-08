Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD0029CA
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 09:52:05 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R821e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UUsn2It_1617875480;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UUsn2It_1617875480)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 08 Apr 2021 17:51:30 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] staging: ks7010: remove useless variable
Date: Thu,  8 Apr 2021 17:51:19 +0800
Message-Id: <1617875479-58849-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

drivers/staging/ks7010/ks_hostif.c:929:19: warning: variable ‘noise’ set
but not used [-Wunused-but-set-variable].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/ks7010/ks_hostif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 8bc3b7d..499161d 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -926,14 +926,13 @@ void hostif_bss_scan_confirm(struct ks_wlan_private *priv)
 void hostif_phy_information_confirm(struct ks_wlan_private *priv)
 {
 	struct iw_statistics *wstats = &priv->wstats;
-	u8 rssi, signal, noise;
+	u8 rssi, signal;
 	u8 link_speed;
 	u32 transmitted_frame_count, received_fragment_count;
 	u32 failed_count, fcs_error_count;
 
 	rssi = get_byte(priv);
 	signal = get_byte(priv);
-	noise = get_byte(priv);
 	link_speed = get_byte(priv);
 	transmitted_frame_count = get_dword(priv);
 	received_fragment_count = get_dword(priv);
-- 
1.8.3.1

