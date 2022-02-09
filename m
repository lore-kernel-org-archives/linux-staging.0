Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF85F2C9C
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 03:27:43 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1644377262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x2Il0JhrH5EsFOuJtqhIRhFIoWPTf3W77jR9wKs31rI=;
	b=MIeHlyZMMutX70dqI+O6N/jG+BC92D2SkQNXDJlIW739n5beUj/tcgyAadqp9ZvWKgY8aP
	8tSl4OFpUmeR69s9H84qSRY6fVpyNKAG83N3HBbOR6rYMKyffEllbw81HWjx0CHyRh1916
	q5ekMfe8dl/bpBhb+yNNq0FGazgzV3M=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Len Baker <len.baker@gmx.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: video: Make use of the helper macro LIST_HEAD()
Date: Wed,  9 Feb 2022 11:27:13 +0800
Message-Id: <20220209032715.38437-1-cai.huoqing@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

Replace "struct list_head head = LIST_HEAD_INIT(head)" with
"LIST_HEAD(head)" to simplify the code.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index b7858e47145f..ffa97ef21ea5 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -52,7 +52,7 @@ struct comp_fh {
 	u32 offs;
 };
 
-static struct list_head video_devices = LIST_HEAD_INIT(video_devices);
+static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);
 
 static inline bool data_ready(struct most_video_dev *mdev)
-- 
2.25.1

