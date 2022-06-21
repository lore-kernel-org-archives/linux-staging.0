Received: from smtpbg.qq.com (smtpbg123.qq.com [175.27.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB872EA4
	for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 16:32:10 +0000 (UTC)
X-QQ-mid: bizesmtp69t1655829036tfx7nzyp
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 00:30:32 +0800 (CST)
X-QQ-SSF: 0100000000700090B000B00A0000000
X-QQ-FEAT: 3uawQE1sH+31Ay2K6gElJWinJAdqzjeIt8OFw1HZMTMZM77O/MQHNR7K0rmPh
	EuQdhhHqVys3Q9Xv6RFCAf8zS5Ef4lGgSzw0chF03YKveV9T85fXp5hM+FX3cSmKrbWUR7G
	6xLoJ2uMEIrpm1Ap9RvPcSD683ix2xf0AhrLAz+dA9diCYtgXYWAp/NL1cNv7E9GuPI6HCO
	0DyuHxTSPFhWn04B+MckXT0Bw7TDO6eaJGFyo2179BckWnfK1jpajO524NPIh/0dcOJFVn2
	7SGNQ+3LtYYV2fWHDA1FCwozyPEE+utP3XkTHaGnV5oDx2rzOKM526xxM3lfJ8MikNaDssN
	zzEP7LVLlTS3pO/ajM=
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	jiangjian@cdjrlc.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: av7110: Remove duplicate 'with' in two places.
Date: Wed, 22 Jun 2022 00:30:30 +0800
Message-Id: <20220621163030.27179-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

file: ./drivers/staging/media/av7110/av7110.c
line: 2367
         * reset with with MASK_31 to MC1
changed to
         * reset with MASK_31 to MC1

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index d74ee0ecfb36..df81a9b744c2 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -2364,7 +2364,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 		budgetpatch = 0;
 		/* autodetect the presence of budget patch
 		 * this only works if saa7146 has been recently
-		 * reset with with MASK_31 to MC1
+		 * reset with MASK_31 to MC1
 		 *
 		 * will wait for VBI_B event (vertical blank at port B)
 		 * and will reset GPIO3 after VBI_B is detected.
-- 
2.17.1

