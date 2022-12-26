Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF917EA
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 11:12:27 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NgZfd16gPzW2b
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 19:04:09 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4NgZfD4wj4z4xCvL
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 19:03:48 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4NgZf34N5kz9tyJY
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 19:03:39 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NgZdt03fKz8QrkZ;
	Mon, 26 Dec 2022 19:03:30 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl2.zte.com.cn with SMTP id 2BQB3Ldg067680;
	Mon, 26 Dec 2022 19:03:21 +0800 (+08)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid14;
	Mon, 26 Dec 2022 19:03:24 +0800 (CST)
Date: Mon, 26 Dec 2022 19:03:24 +0800 (CST)
X-Zmail-TransId: 2b0363a97f7cffffffffc5a1085d
X-Mailer: Zmail v1.0
Message-ID: <202212261903245548969@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <gustavoars@kernel.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.panda@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIHN0YWdpbmc6IGtzNzAxMDogdXNlIHN0cnNjcHkoKSB0byBpbnN0ZWFkIG9mIHN0cm5jcHkoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 2BQB3Ldg067680
X-FangMail-Bounce-Flag: 1672052619.63A97F8A.000
X-FangMail-Outinfo: 1672052619/63A97F8A.000/4NgZf34N5kz9tyJY/yang.yang29@zte.com.cn/1
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 63A97FA8.001 by FangMail milter!
X-FangMail-Envelope: 1672052649/4NgZfd16gPzW2b/63A97FA8.001/10.35.20.165/[10.35.20.165]/mxde.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63A97FA8.001/4NgZfd16gPzW2b

From: Xu Panda <xu.panda@zte.com.cn>

The implementation of strscpy() is more robust and safer.
That's now the recommended way to copy NUL-terminated strings.

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/staging/ks7010/ks_wlan_net.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 044c807ca022..e03c87f0bfe7 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -382,8 +382,7 @@ static int ks_wlan_get_nick(struct net_device *dev,
 		return -EPERM;

 	/* for SLEEP MODE */
-	strncpy(extra, priv->nick, 16);
-	extra[16] = '\0';
+	strscpy(extra, priv->nick, 17);
 	dwrq->data.length = strlen(extra) + 1;

 	return 0;
-- 
2.15.2
