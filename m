Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740D70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:43:17 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso3875858pjg.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8Muu/9WdfBgf9XGzBb/oUnmSPxJfSkGD9Nopu5TItCA=;
        b=t3Ri2SNL5+EIJHCO7rV0ZBDAuEnogEiAwxV5x0DtpbyJocT6i2WoGDYeINTw4XNjNY
         CoGAhswVk2+FCbxNGJLJAbLbWVNO+z9TFj9Szwr5W8fb4oJ5vrFn4Alm/cIijGbfJ6dN
         Lo0kgHFnheU8pDkOg5hHZc1WPmMq/6uU9ypeCur2JSeaZoiV3JBIADdYzJ48u46YSuJz
         QERBXv537o/d9RPTE4svky7HLqPMY8tev5/ngiOtvWIrzk/rLyTrWJ8Wrp3pOIpPY7YG
         Tz9cAPfWi4OzuuAQCTSe9magjw5EwyOP5Mh858MfiqYke60Sm1YFx+cLQ5jf73BWpHMP
         1/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8Muu/9WdfBgf9XGzBb/oUnmSPxJfSkGD9Nopu5TItCA=;
        b=pvcUC7o7DNa9QS4qYHJerzAhDxkBtaM0hnoD3MDXDUORi5xmb00UGVnW8zcUA84P/x
         3dX/gfCCWGVzz6p0essLB8vVsOtLjh8emr+Vx+IjN6TBFp0aj3Z//ZAVAMEOMN63zjrN
         b2i//XQN95vjuA2Gkt4a2yHAlYWJFCoCsA08QZfv4L1rfDQtQV7zJo5EY2XFD0SnXrcH
         vv2a5XbbVMSHNJ9w0RQwMrVKKUHTTf2tOhukaKg0twGsmmyljvVE2iT7O2XKvwV661AU
         qm6aWXayJbxCZiBV1/E+6SO+mO+wrf9rVpgT5gq9R8Cxx2pgNVpZMZy+kN/dWgfL3LOQ
         BfPw==
X-Gm-Message-State: AOAM5320NBMvUivFPz2VFjWzEnBhRbV6O/MMh2APAYVrR/AeRDsZVku0
	VtuN8vqblhxGx2b4zLuxZ00=
X-Google-Smtp-Source: ABdhPJz/c8JF8Y0C2ZrFun4nbKLfAk7fOQL/bMOCYWVt3pDXLg0kd7q1MYv+v6audMkS+3vUsB62nQ==
X-Received: by 2002:a17:90b:e0d:: with SMTP id ge13mr614712pjb.189.1618328597240;
        Tue, 13 Apr 2021 08:43:17 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id k3sm14555276pgq.57.2021.04.13.08.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:43:16 -0700 (PDT)
Date: Tue, 13 Apr 2021 21:13:09 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: [PATCH v4] staging: media: meson: vdec: declare u32 as static const
Message-ID: <YHW8DWNUAmp4mXm3@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
This indicates the value of canvas indexes will remain constant
throughout execution.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v3:- Made commit message under 75 characters per line.
Changes from v2:- Rebased this patch and made changes against mainline code
Changes from v1:- Rectified mistake by declaring u32 as static const
properly as static const u32 canvas'x'[]

 drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..80141b89a9f6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
+	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
+	static const u32 canvas4[] = { 24, 0 };
 
-	amvdec_set_canvases(sess,
-			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
-			    (u32[]){ 24, 0 });
+	amvdec_set_canvases(sess, canvas3, canvas4);
 
 	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
 		h264->max_refs, sess->num_dst_bufs);
-- 
2.30.2

