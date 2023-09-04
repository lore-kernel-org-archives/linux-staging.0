Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB9C142
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 15:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2FFC433C9;
	Mon,  4 Sep 2023 15:05:22 +0000 (UTC)
Message-ID: <cbc3645d-a6bc-90eb-b945-54846e03c838@xs4all.nl>
Date: Mon, 4 Sep 2023 17:05:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 11/18] media: videobuf2: Be more flexible on the number
 of queue stored buffers
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-12-benjamin.gaignard@collabora.com>
 <37e5e418-c38a-b863-ffdf-72ce300cf227@xs4all.nl>
 <319d6103-26c3-bc02-3f80-90e653c8ee37@collabora.com>
 <b3561832-b7e4-f612-4729-fd4ca8234602@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <b3561832-b7e4-f612-4729-fd4ca8234602@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A follow-up to my follow-up...

I realized that it is wise to do the allocation with mmap_lock held, since that is also
held when freeing q->bufs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-core.c   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index fe15e583b52a..dd25937c6dc8 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -818,7 +818,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
 	unsigned int i;
-	int ret;
+	int ret = 0;

 	if (q->streaming) {
 		dprintk(q, 1, "streaming active\n");
@@ -859,12 +859,6 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 			return 0;
 	}

-	if (!q->bufs) {
-		q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
-		if (!q->bufs)
-			return -ENOMEM;
-	}
-
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
@@ -877,8 +871,14 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	 * in the queue_setup op.
 	 */
 	mutex_lock(&q->mmap_lock);
+	if (!q->bufs)
+		q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
+	if (!q->bufs)
+		ret = -ENOMEM;
 	q->memory = memory;
 	mutex_unlock(&q->mmap_lock);
+	if (ret)
+		return ret;
 	set_queue_coherency(q, non_coherent_mem);

 	/*
@@ -984,19 +984,13 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
 	bool no_previous_buffers = !q->num_buffers;
-	int ret;
+	int ret = 0;

 	if (q->num_buffers == q->max_allowed_buffers) {
 		dprintk(q, 1, "maximum number of buffers already allocated\n");
 		return -ENOBUFS;
 	}

-	if (!q->bufs) {
-		q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
-		if (!q->bufs)
-			return -ENOMEM;
-	}
-
 	if (no_previous_buffers) {
 		if (q->waiting_in_dqbuf && *count) {
 			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
@@ -1009,7 +1003,13 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		 */
 		mutex_lock(&q->mmap_lock);
 		q->memory = memory;
+		if (!q->bufs)
+			q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
+		if (!q->bufs)
+			ret = -ENOMEM;
 		mutex_unlock(&q->mmap_lock);
+		if (ret)
+			return ret;
 		q->waiting_for_buffers = !q->is_output;
 		set_queue_coherency(q, non_coherent_mem);
 	} else {
-- 
2.40.1


