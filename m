Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2210EB
	for <linux-staging@lists.linux.dev>; Thu, 26 May 2022 12:53:52 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VESIaaa_1653569624;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VESIaaa_1653569624)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 26 May 2022 20:53:44 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] staging: r8188eu: Fix one kernel-doc comment
Date: Thu, 26 May 2022 20:53:42 +0800
Message-Id: <20220526125342.78264-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove one warning found by running scripts/kernel-doc,
which is caused by using 'make W=1'.

drivers/staging/r8188eu/core/rtw_ieee80211.c:720: warning: expecting
prototype for ieee802_11_parse_elems(). Prototype was for
rtw_ieee802_11_parse_elems() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 385a9ed8eff7..781819478403 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -707,7 +707,7 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 }
 
 /**
- * ieee802_11_parse_elems - Parse information elements in management frames
+ * rtw_ieee802_11_parse_elems - Parse information elements in management frames
  * @start: Pointer to the start of IEs
  * @len: Length of IE buffer in octets
  * @elems: Data structure for parsed elements
-- 
2.20.1.7.g153144c

