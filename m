Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71076389472
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054644; cv=none; b=aewIgD/oRuv74mXr0oGhV7Scnq83BO3Q6MITBVDbdVTrIGTV2DEdVIj0UtDfuWf8zC2MYxnJxJpSLTcj0BQ4etLCSRQjcD9zoXep4Ma79fWLQtGrtGXOqXQJBaZz/FgXpgtc4GK/YeS2BTeHttBNElxv9KqVsZTFG6ypu78tk+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054644; c=relaxed/simple;
	bh=+PQM96hqsPvIkWG34/bJvl9Vl8P1Anp0+8VbF48QW90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgSf9xJlUdTPoN96gnHwv9ACZj06FDFd0O3PQ2zzwmqCFXj6uEYgpVjEDsQUykAiZ1uRvkx0GjFXAARxb/S1f/tlZL0oqSqOCspMF5Axjnb4A3ickfvs7os5d86EF8fTfw5FPSDLqJFWkF7FMM6jbKkrtMvq5iEo5byYd4mjDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mrm2kw/f; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mrm2kw/f"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3338975f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054642; x=1770659442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX40CpC9zTbC5QExNYh9/vufeOH8vmjwNZh+PMILogE=;
        b=Mrm2kw/f9D47B5tt9TDW/x+lwsaYDSf+MmViAeoDjQ4TKsq+5Wsy9+6kKcDa0meuFZ
         Npf8gZhZOigR4IbJH9snrN4IkUjbaqWaQc4FKnF8Qr5lOVB7AoosQt5cnCOwWNk+S9oq
         lX2lZ8vWttYSECrbhve+yzxFSXO+ajbsRh3oy50ullU7gFZ3zYYs5512AAuHzwox5iVI
         /BpiHiInweN01Z9ZKNGw0GHK7Rst5G3vTiSeZOBhd7rr9vK/l98X7nGxlkyIbgmdCeGe
         x9kaOW1W6yaohQ6vQhTmLzncpfOaKuSQXlbWCFA5nTD4PzHkLSjRfYdhPlpSgvHrSgGA
         wfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054642; x=1770659442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hX40CpC9zTbC5QExNYh9/vufeOH8vmjwNZh+PMILogE=;
        b=E5+Cs/Lkb/gl1rQKe+ou+uwErRCH4aC+8moBE74zVlUIUO5K6ybnZJerVwKYfkegs9
         w19xjErQCtwCwmAQUr60K3TEKNvBUe7JG2iVFH1ls8kgdhjSx+bg4WNDJ9wNoLv/+WwE
         HO4hFJJ5fQXHQItjp2sUlCxz3zGBJ4bpKTfSvgJJgjyI1jXelq33JdpMyuHRfL56GN3W
         M776Jz2buCme47YSHlkil6xDSss33Su26C5nnx59643SOAzS/4njJxDCVBir/VqI0yJk
         ldhVPxW7/XIQEZY8XIUEC1veZxe5X7Vn6/9J4rQypGf0ZbIsLF7n/WlPEUR+107Nb78y
         HQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV6t83hyNrdGntqM+xACvFBPPHkErtjvhQJAApGtA6opV0zbduPOUGRthA2qYymOdLtO3IMxjqUmBQZfs4@lists.linux.dev
X-Gm-Message-State: AOJu0YwhC4Huzicce1vqQ5YNuYPeqrQN4Pk5JvqorUM8ja2oKq0iabkx
	qdy9TWo3gVqvdb30af3FV7qxvI16bW7tRBKuA4ThEjUYboBsLxiPS6VZ
X-Gm-Gg: AZuq6aITa6hQd91R/zmSqGdnN+l/UcCJpXkU/2xjm6hvxBZDv9YEkZc03c+g9NAdqhX
	lJlqqKH5mDdzNKWdiKgHzjSEvGgtoHnS03XQ4mBpBwm6y/1u2kPN6CBASJ6ZXdxYX9keebYRUL0
	KUz2ZRfWXOT8Aq49fgokzQJnksAxqDiLPKA9cGl4wOKYGXB6+wI6MIYupHvPQKRDzn1xSGQQiC9
	XqmPk8WbghcSRBHFGa8nmoFglU1kFlJse+Y/vwPFakB6+IthzE3B1yhfGzj/zXMupuRHJ2JzNPR
	swINxTiTtajrS6+aJFvSi3TOUJLkwvp10LfV0UH3vjzRic6qsV4Mjf9nSez4gJuI5qERA8qE8aZ
	vjfvD03ASgpjdbUiuSIWyk+rBWhLZOLeAXeVczQ1MlR2/XKwoSfLWJcmUkUxs+sXWtYDFutg8+Q
	NjQXA7GBcx6uNyHi52+2hXtOF8451DhtXO31HtbSZj7qyTH/xQ
X-Received: by 2002:adf:cd11:0:b0:435:9e32:2b78 with SMTP id ffacd0b85a97d-435f3a7b46emr13958833f8f.1.1770054641736;
        Mon, 02 Feb 2026 09:50:41 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:41 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 3/4] media: ipu3: avoid ending lines with paranthesis
Date: Mon,  2 Feb 2026 19:50:32 +0200
Message-ID: <20260202175033.8640-4-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't end line with paranthesis.

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 13 +++++--------
 drivers/staging/media/ipu3/ipu3.c     |  3 +--
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index e990eb5b3..832581547 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1226,8 +1226,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 
 	for (j = IMGU_ABI_PARAM_CLASS_CONFIG; j < IMGU_ABI_PARAM_CLASS_NUM; j++)
 		for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++) {
-			if (imgu_css_dma_buffer_resize(
-			    imgu,
+			if (imgu_css_dma_buffer_resize(imgu,
 			    &css_pipe->binary_params_cs[j - 1][i],
 			    bi->info.isp.sp.mem_initializers.params[j][i].size))
 				goto out_of_memory;
@@ -2298,13 +2297,11 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 	if (obgrid)
 		imgu_css_pool_put(&css_pipe->pool.obgrid);
 	if (vmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_VMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_VMEM0]);
 	if (dmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_DMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_DMEM0]);
 
 fail_no_put:
 	return r;
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index c33186208..fe343d368 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -556,8 +556,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
 			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
 			buf->vid_buf.vbb.sequence =
-				atomic_inc_return(
-				&imgu_pipe->nodes[node].sequence);
+				atomic_inc_return(&imgu_pipe->nodes[node].sequence);
 			dev_dbg(&imgu->pci_dev->dev, "vb2 buffer sequence %d",
 				buf->vid_buf.vbb.sequence);
 		}
-- 
2.51.0

