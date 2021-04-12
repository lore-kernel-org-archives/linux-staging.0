Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE04470
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 14:18:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 20so2487133pll.7
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=gE1tFWhSzbHqAI5X9ftQT0mEeaEBuCfbMLq9XJpCJgo=;
        b=kAr42R2krMprDasFsl+izamVChxE+LZ8Vd0aPw47+CCHoupj1Qgnq68hh9kaimTv7F
         37gTXi1cEh+NQk9l6uzuQrdIhj/8ScTKyLBVwYcOjRw9TDXI0peJmFyFq4ikp5qLPnzX
         fXZA72Vq8jWSg0VH0W7sfejshHq75rG60XhYxtyYvEwAThHqqIsFMZN6YEOUwTQWUuzh
         IIDTwHv7zQfSZXfOsovIERUgBePRT/8dJFfoWIc0HkJ8n5vCTJyCVaBu8e9rntDVYWXZ
         7nu29nmtdJzotxfPnQeWQ4tMZ6IxdL9d3i/LmtAqO7DlXrbp5Pj3xdetRHlCrKt+lMP3
         gANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=gE1tFWhSzbHqAI5X9ftQT0mEeaEBuCfbMLq9XJpCJgo=;
        b=eCWxyBBDGwv69ocoR/uLOXVsIEFH5muyUsY1jIjSlwdA6lfNHTCOhnKIHSrAPDwBEb
         /WnmGrQ2jWWZiuY6jHxHXxW6OrG7yzascFu2VJxmVQauobrhAjEtWu+LdLvOMsX6B8jw
         t6PThLIuncR2qCEza8AAYsmc22iEecP6nsjfbaeCdu9FrQGiUEFfwhjQA7JL3R4zfIg9
         SnmqThRrh1QOta/6j87FWfo+k4tfvhQyq03cC4ihvHn7nBvB993wWq9sX4rJIKSqpQ8W
         HGnVAek9C65e5MPDmyyowYDN6edP6s7ZLp7G/stxm7OBQ87rC/ZkLgl7+SjswUeDsotN
         NrHQ==
X-Gm-Message-State: AOAM533NiFQF7TbniZDRF6yJYleSAJwv2okAzQl1CWPqKIFXskvVNXn6
	yUCKEkvS1kkGRIOiwb78EtQ=
X-Google-Smtp-Source: ABdhPJy1IOQSh91XC3ctGh4jru7zmv9U5bKzAJBmvP804WFF9A+NhYzJx1RaM2WGdTkFa91OwV6kOg==
X-Received: by 2002:a17:902:ac89:b029:e6:d199:29ac with SMTP id h9-20020a170902ac89b02900e6d19929acmr26586468plr.46.1618237134354;
        Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id gb15sm11274248pjb.32.2021.04.12.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
Date: Mon, 12 Apr 2021 19:48:45 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: Subject: [PATCH] staging: media: meson: vdec: declare u32 as static
 const
Message-ID: <YHRWxeXA9m+Gt+e+@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
This indicates the value of canvas indexes will remain constant throughout execution.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..ea86e9e1c447 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
+	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
+	static const u32[] canvas4 = { 24, 0 };
 
-	amvdec_set_canvases(sess,
-			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
-			    (u32[]){ 24, 0 });
+	amvdec_set_canvases(sess, canvas3, canvas4);
 
 	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
 		h264->max_refs, sess->num_dst_bufs);
-- 
2.30.2

