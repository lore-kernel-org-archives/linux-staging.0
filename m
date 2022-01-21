Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC7173
	for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 10:09:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r132-20020a1c448a000000b0034e043aaac7so3946042wma.5
        for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 02:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=755EAAMLKn2GC7CnfLRWApvXb+oreFqhTCeSHGLuHFg=;
        b=CmJ/5VmXVrVQWTolPbmXo37lvgGAP+zQbecETc29WGSXU0f+K40+TJZU0xLTw3g/zj
         IFUR9h1wVGl6gD8I05Zx33rSnHop4TpkLXUB11kN+WfNZcGibQGG3Cg1Bcgid5jlYRKH
         1xIu/GWxT/lSZ79LtVn98ra8f6+oiPe23v+f9EiyJNn40Ill7amp7jjADAtcLj+ue2dI
         3NYa3qczrMMBWybFn2E7yaAIUOTanrkKhlx/kw2An35tZFbVt6/EA+OKELgbu8SJ7NMt
         FirxbebyC634mktd1FUysxBWRNpte7AgUZQ/T5YY6A2EcZCF8CZok0stSXIqUAWhoPSg
         9J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=755EAAMLKn2GC7CnfLRWApvXb+oreFqhTCeSHGLuHFg=;
        b=DQcpiBxXJ1WqF7sd43Fhp3gyeTX+KD/odW+8VLtWVR+OCyqWUPt/TxHOueYdDNqGxi
         onI9sEfVlMkAQ5dji+gl2nZQQnxPC+KeREHprdTIRLbuXA25RLgcheJ3+X5NavSCV3HC
         n0JWSpqQruhOjvo5yH66WycRubOCQ7rqN0EHR7EIYFPeXKJJCM1UGWISr+5tVg7aOzS0
         K37cJa/pIDVttpice02CNCZ4lpAdF34meQRE2M2A+M3GtSb4FioI6qsXYjN5oB26s8nZ
         yVN3noXXW4LMPhmsgA9OTqdEuKx1oqub7Rc8D/0WED7YDf/5of2PcSZTSWBc8oy2SQVM
         SYwA==
X-Gm-Message-State: AOAM531sSKyZiXx6nzRaibIi4dc17NMAoOItZs9urbhK1nzJ3y2LRMo4
	3Fy3mokFGqWFUBIjucKtiPU=
X-Google-Smtp-Source: ABdhPJznQC8DZvs8AssOKDbunj1nJkikXBwpuDltZnam/K9grn13pBTQeuJ7DGTF9msgMGgM+vumug==
X-Received: by 2002:a05:6000:1a89:: with SMTP id f9mr3197304wry.41.1642759748816;
        Fri, 21 Jan 2022 02:09:08 -0800 (PST)
Received: from localhost.localdomain ([141.72.243.13])
        by smtp.gmail.com with ESMTPSA id g7sm5479526wmq.28.2022.01.21.02.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 02:09:08 -0800 (PST)
From: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
To: mosescb.dev@gmail.com
Cc: gregkh@linuxfoundation.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: [PATCH v2] drivers: staging: media: omap4iss: Use BIT macro instead of left shifting
Date: Fri, 21 Jan 2022 11:08:37 +0100
Message-Id: <20220121100837.337094-2-mosescb.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121100837.337094-1-mosescb.dev@gmail.com>
References: <20220121093722.320082-1-mosescb.dev@gmail.com>
 <20220121100837.337094-1-mosescb.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a BIT(nr) macro available in Linux Kernel,
which does the same thing.

Example:  1 << 7  is same as BIT(7)

Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
---
 drivers/staging/media/omap4iss/iss_video.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
index 526281bf0051..1724ed03ce9d 100644
--- a/drivers/staging/media/omap4iss/iss_video.h
+++ b/drivers/staging/media/omap4iss/iss_video.h
@@ -53,19 +53,19 @@ enum iss_pipeline_stream_state {
 
 enum iss_pipeline_state {
 	/* The stream has been started on the input video node. */
-	ISS_PIPELINE_STREAM_INPUT = 1,
+	ISS_PIPELINE_STREAM_INPUT = BIT(0),
 	/* The stream has been started on the output video node. */
-	ISS_PIPELINE_STREAM_OUTPUT = (1 << 1),
+	ISS_PIPELINE_STREAM_OUTPUT = BIT(1),
 	/* At least one buffer is queued on the input video node. */
-	ISS_PIPELINE_QUEUE_INPUT = (1 << 2),
+	ISS_PIPELINE_QUEUE_INPUT = BIT(2),
 	/* At least one buffer is queued on the output video node. */
-	ISS_PIPELINE_QUEUE_OUTPUT = (1 << 3),
+	ISS_PIPELINE_QUEUE_OUTPUT = BIT(3),
 	/* The input entity is idle, ready to be started. */
-	ISS_PIPELINE_IDLE_INPUT = (1 << 4),
+	ISS_PIPELINE_IDLE_INPUT = BIT(4),
 	/* The output entity is idle, ready to be started. */
-	ISS_PIPELINE_IDLE_OUTPUT = (1 << 5),
+	ISS_PIPELINE_IDLE_OUTPUT = BIT(5),
 	/* The pipeline is currently streaming. */
-	ISS_PIPELINE_STREAM = (1 << 6),
+	ISS_PIPELINE_STREAM = BIT(6),
 };
 
 /*
@@ -119,9 +119,9 @@ struct iss_buffer {
 
 enum iss_video_dmaqueue_flags {
 	/* Set if DMA queue becomes empty when ISS_PIPELINE_STREAM_CONTINUOUS */
-	ISS_VIDEO_DMAQUEUE_UNDERRUN = (1 << 0),
+	ISS_VIDEO_DMAQUEUE_UNDERRUN = BIT(0),
 	/* Set when queuing buffer to an empty DMA queue */
-	ISS_VIDEO_DMAQUEUE_QUEUED = (1 << 1),
+	ISS_VIDEO_DMAQUEUE_QUEUED = BIT(1),
 };
 
 #define iss_video_dmaqueue_flags_clr(video)	\
-- 
2.30.2

