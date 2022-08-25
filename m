Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCAE2F28
	for <linux-staging@lists.linux.dev>; Thu, 25 Aug 2022 12:27:13 +0000 (UTC)
X-QQ-mid: bizesmtp62t1661430412t51laxfj
Received: from localhost.localdomain ( [182.148.14.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Aug 2022 20:26:51 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: ILHsT53NKPijEBeKhvrs7x4kNBMF8sdjP+lC1OBtQpIPBHG5kct3gEo0GsiFm
	DBh2b1t5/0j76TGgiyJj9qGMDi49LEaB4HIOhRRoJnAEY2J9Lu3WmkEbE2MLdoKTHg+LOLq
	D66Rp/iMPjXD8GKEx/xDyJQNyd3rUIO8LbyCIFHqmNICpYt6ITXIV9WJ+/fkvaPWaJQQO/r
	+3IbMzdgT0c9wXAwPIqRn5n7+D51wsOxN5KduS3qJjYzRLFJf6xa+x9VPlXfj6kSe8Svxbq
	6jpY31UWJqwNbPCXVxysHlJ1Otu/E4F0e276SNEV7oZl9ebnt7S0gQWOiJuy+Z3RFDjm2y3
	L41jQYFrpVt4FTlVwT3lMLNEYtX8jA2qMxB98xl95sY9APAz6JnnWUkaaFi2A==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: gregkh@linuxfoundation.org,
	duoming@zju.edu.cn,
	dave@stgolabs.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] staging/rtl8192e: fix repeated words in comments
Date: Thu, 25 Aug 2022 20:26:45 +0800
Message-Id: <20220825122645.27588-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4

 Delete the redundant word 'new'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b5f4d35954a9..9e6d7c5716ff 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1611,7 +1611,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 
 	short apset, ssidset, ssidbroad, apmatch, ssidmatch;
 
-	/* we are interested in new new only if we are not associated
+	/* we are interested in new only if we are not associated
 	 * and we are not associating / authenticating
 	 */
 	if (ieee->state != RTLLIB_NOLINK)
-- 
2.36.1

