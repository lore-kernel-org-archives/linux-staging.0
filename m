Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255F2510D
	for <linux-staging@lists.linux.dev>; Mon,  4 Dec 2023 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fpiHlguw"
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0085F6607090;
	Mon,  4 Dec 2023 13:23:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696233;
	bh=oOWz24gQ5YvCYqxsrt9/vTKzJDstMTwD0f8jUu4NRTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fpiHlguwrMYeN1mEYBkELVL33tKiT1KR1nwYsrEn7jLbmYp4MWuEE2MQQ89kigGaS
	 yiQkxZn5OjeQE6coLIgMLBpL6BUnC8Hxzlg44paOrvCSuKR3YBpPHmPc9zkaHWY4NV
	 vU6EeU0+6cVc/8WmEtol8w1LDdFE6uEA5k4yN+zchWyxCK+X+OI/A3ozs8+fJ3hmBK
	 ZixewklE7l4VrRbXm1HKQs4N/xwTNfA7icvXNmILAHbE4B/dBzM3N+zDaeAmIwEckF
	 GmmQriTDYBxHDpJi4NRMUBVg+itb6l75/d9niz8NrIf3jmVvYh+2SxyAnz1VXzBgx/
	 inX3JLYW+QaSg==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH v2 09/36] media: ipu3: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:56 +0100
Message-Id: <20231204132323.22811-10-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver uses min_buffers_needed which vb2 uses to ensure
start_streaming is called when at least 'min_buffers_needed'
buffers are queued. However, this driver doesn't need this,
it can stream fine without any buffers queued.
Just drop this unnecessary restriction.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@intel.com>
CC: Tianshu Qiu <tian.shu.qiu@intel.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 0fe2b858da83..7f9104411edc 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1197,8 +1197,6 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 			sizeof(struct imgu_vb2_buffer);
 	vbq->buf_struct_size = imgu->buf_struct_size;
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	/* can streamon w/o buffers */
-	vbq->min_buffers_needed = 0;
 	vbq->drv_priv = imgu;
 	vbq->lock = &node->lock;
 	r = vb2_queue_init(vbq);
-- 
2.39.2

