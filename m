Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFBA173
	for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 09:38:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id q9-20020a7bce89000000b00349e697f2fbso27759772wmj.0
        for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 01:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nyYh7xP6EUU+xIo8vnwkU/S090uLTW/Lq01aKLHJF7k=;
        b=Jr0ZuKwOcAcPB5gZrbjKqC25ycNR15lfHjg2o9aTGuoUZ483EV1HN5Yg9tT4h7JhbP
         9A5Mfth9JvyK838L/dRyw35mlHlrOEC+atr/Jj2Rq4AKntJeE+kwYt2DB/wnF4JraTTS
         8TyVieF1/BlJj/5F9ZQ0ltMDbmP2hkv7865ONbaZ83CwcTij+1xti2VWRGtcSLP4e7M4
         /p2xzTij74P8eCiim5oBciYK6UbWrN9voNSDL1/1/IdD/0fc4NvSroIKfmayw6ymdhJs
         CbkEqrSJGixlTyT+uuEIUrsnb9dl8yzV7kk0CFQveC1b5c3Fj/kd07DNK6qcD0jWqG5x
         fMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nyYh7xP6EUU+xIo8vnwkU/S090uLTW/Lq01aKLHJF7k=;
        b=cCUN5gMshC76n/Wn3BHDDopBzCWZvDdGTRdNPQ/EQC7mrjzNV1fYese4jEp6lnAbvb
         QxksjOfZebNB3GsY3mqZ3nqVGzvkRl17yxj4ED53ZUrwfQctMULzbeYKXmRIwtqanknk
         zS7PzWom1tnY3Yoy5FRclju5LZkjw4TyU3T2UxbhYXPTPZI5l78K5PBwLTm5r777H/+7
         xXQwBemY7iBHm1yCULIjCZ1AfQx8umhQPoDjcJ6Kim+afn3ytkeNG6H944FZHkNftCMl
         OHSGkCeCnIqmytr2Zi20L5IzWJrTvV2KfHHGTWoqlj6HRQHQcVXrJpM7TRGmbCZ/vvS7
         vcyg==
X-Gm-Message-State: AOAM532ZYyUXis7vCbbFwsmrhvsSWa7hXaynMRLoyZOMjxKJYn9O4pFw
	5pz/c5/e3pPkHKj/CQVjojQ=
X-Google-Smtp-Source: ABdhPJyI/Pd63lLeUK0kLIGQcosIJhVUTB9SFkqKXwPdYUMhsNtDHqeXM/jwBrW2uhrD+yW6WhRE9Q==
X-Received: by 2002:a5d:6d0b:: with SMTP id e11mr3275727wrq.460.1642757888862;
        Fri, 21 Jan 2022 01:38:08 -0800 (PST)
Received: from localhost.localdomain ([141.72.243.13])
        by smtp.gmail.com with ESMTPSA id 1sm2414022wry.88.2022.01.21.01.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 01:38:08 -0800 (PST)
From: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Subject: [PATCH] drivers: staging: media: omap4iss: Use BIT macro instead of left shifting
Date: Fri, 21 Jan 2022 10:37:22 +0100
Message-Id: <20220121093722.320082-1-mosescb.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
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
 drivers/staging/media/omap4iss/iss_video.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
index 526281bf0051..ea1cc311384a 100644
--- a/drivers/staging/media/omap4iss/iss_video.h
+++ b/drivers/staging/media/omap4iss/iss_video.h
@@ -55,17 +55,17 @@ enum iss_pipeline_state {
 	/* The stream has been started on the input video node. */
 	ISS_PIPELINE_STREAM_INPUT = 1,
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

