Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244592C82
	for <linux-staging@lists.linux.dev>; Sat, 11 Dec 2021 09:16:29 +0000 (UTC)
X-QQ-mid: bizesmtp39t1639214080tw1e00jy
Received: from localhost.localdomain (unknown [182.132.179.213])
	by esmtp6.qq.com (ESMTP) with 
	id ; Sat, 11 Dec 2021 17:14:39 +0800 (CST)
X-QQ-SSF: 01000000008000D0H000B00A0000000
X-QQ-FEAT: Lg5IqoGaTUgN7XQ3N7S7FwNtz5DDynVfo7MHXh6ZEglsDDRHhNkoI6vuS8HML
	HivY8m9Phq/uREtD3XIrcLUMim/igcB6MHHsiGKaQ3Wg6iAEwRnYiVcIxXmYgabomUo6XKr
	ri8AiODTzCg85916Jf/+PJFcNWiFrtiw/PSOASTzffyBg93z7Du8LZBRKPlGHxYkL39Kpz+
	BXlzbUTNTesb0h1crcPOez21DjBv7J7+C9Sp/JorQZd8k3mV2vxIxaWeTXc2Jui2YXshH8O
	3ysC0SATK8F7vnFoThCpMS6XrJyPX986Vnuruo9BBaxXtzCweWev4VuIfaY+UdzEbMgxsA4
	ku9c0GBZLkPMqm4MCqADMTO8VaelWhRwmRBEkPj1ydijfV6+Ug=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: gregkh@linuxfoundation.org
Cc: lee.jones@linaro.org,
	wangborong@cdjrlc.com,
	coldcity@gmail.com,
	len.baker@gmx.com,
	dev.dragon@bk.ru,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: remove some repeated words in some comments
Date: Sat, 11 Dec 2021 17:14:22 +0800
Message-Id: <20211211091422.260442-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam1

The double `new' in the comment in line 1349 and `to' in the comment in
line 2030 are repeated. Remove the repeated words from these comments.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 1a193f900779..1a43979939a8 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -1346,7 +1346,7 @@ inline void ieee80211_softmac_new_net(struct ieee80211_device *ieee, struct ieee
 
 	short apset, ssidset, ssidbroad, apmatch, ssidmatch;
 
-	/* we are interested in new new only if we are not associated
+	/* we are interested in new only if we are not associated
 	 * and we are not associating / authenticating
 	 */
 	if (ieee->state != IEEE80211_NOLINK)
@@ -2027,7 +2027,7 @@ ieee80211_rx_frame_softmac(struct ieee80211_device *ieee, struct sk_buff *skb,
  * N = MAX_PACKET_SIZE / MIN_FRAG_THRESHOLD.
  * In this way you need just one and the 802.11 stack
  * will take care of buffering fragments and pass them to
- * to the driver later, when it wakes the queue.
+ * the driver later, when it wakes the queue.
  */
 void ieee80211_softmac_xmit(struct ieee80211_txb *txb, struct ieee80211_device *ieee)
 {
-- 
2.34.1

