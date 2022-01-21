Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E7168
	for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 11:55:38 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0V2RJRP6_1642765797;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0V2RJRP6_1642765797)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 21 Jan 2022 19:50:02 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] staging: pi433: using div64_u64() instead of do_div()
Date: Fri, 21 Jan 2022 19:49:55 +0800
Message-Id: <20220121114955.96979-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean the following coccicheck warning:

./drivers/staging/pi433/rf69.c:286:1-7: WARNING: do_div() does a
64-by-32 division, please consider using div64_u64 instead.

./drivers/staging/pi433/rf69.c:332:1-7: WARNING: do_div() does a
64-by-32 division, please consider using div64_u64 instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/pi433/rf69.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index d64df072d8e8..ae4adeb00ce1 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -283,7 +283,7 @@ int rf69_set_deviation(struct spi_device *spi, u32 deviation)
 
 	// calculate register settings
 	f_reg = deviation * factor;
-	do_div(f_reg, f_step);
+	div64_u64(f_reg, f_step);
 
 	msb = (f_reg & 0xff00) >> 8;
 	lsb = (f_reg & 0xff);
@@ -329,7 +329,7 @@ int rf69_set_frequency(struct spi_device *spi, u32 frequency)
 
 	// calculate reg settings
 	f_reg = frequency * factor;
-	do_div(f_reg, f_step);
+	div64_u64(f_reg, f_step);
 
 	msb = (f_reg & 0xff0000) >> 16;
 	mid = (f_reg & 0xff00)   >>  8;
-- 
2.20.1.7.g153144c

