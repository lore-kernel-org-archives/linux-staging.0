Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D072
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 06:28:01 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id f29so11209559pgm.8
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Nt0fDmT0/sSLx8SXvP12vsQxR8HIersO+xhC1jo5rA0=;
        b=sl3xokFPsQ3gEUalWsbT9Ivb31ReDXvXvicMwxDLicpI0mmNTLYl7/XtErj73GTIRf
         ch/dywOrBxbpxRaRBd9P1UBWjOOs8LgY8RNdAPGAx9aL/Fq5p8C2EDEu1+Z8Zbk64YoO
         cVNrscOHZLiO7J0NhQHadASxDipAD8+0tENdsS2eeTVBpBJRNzleWehCIgAA5JQU03xU
         drDdaJz+IGntTjxCD9arxBgTTgExiw/uQuSqlo2kf7l8BsRWYvtroYt+qHfMc8iEvEko
         RIEwaGxTFo0IPbdDIbHq3Q0tHsf3/K2nTpxzi3Jb0e8ZKKqgo2ELv6QDRFrPy39QK3iP
         soDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Nt0fDmT0/sSLx8SXvP12vsQxR8HIersO+xhC1jo5rA0=;
        b=fDkvA8SakwBQfoRiUngFngcWvBZgSQu3P6m81gmalJze7mi1JpYowHJufIjfIYeNsl
         PSuExJmGQDK3EPi98yAfyWniU+Wotxr8W7Vhs5GuqPGkCk0Ryn+qSck3chXiTvBmGuzY
         XpY5gLIVyXTK9obZxX9PTIPORihz6NIClOwuHGRq/tWbKA0SKaT0S3zyQbV9twk7RxR9
         NROUbWtOq7x9YJ/6B3KbCl+U1sFRqWV9QzizUNfIA64jeKzE06XdY4lPXGaQG/EpbKfv
         dMEX1nwY5BAqWheCJqJFJhZmToVtRXo8AKHMNPUNj4RDSd8rYt61N1qc3TCMPTMlAxoa
         +RdQ==
X-Gm-Message-State: AOAM533pvzuanwwJYuSrGZqkVY86YcOwptsV8AS9DnlOf3vI8csIGXNS
	k3+RTXAmJtn3w/PhpuBRGAg=
X-Google-Smtp-Source: ABdhPJx7nKQA7Syr4pbl0BYerDHY/Ew6JmXr9E2pBqRz9YneKxZHhcBWtQAQpgxTg6nutjBJ2s/XSA==
X-Received: by 2002:a63:fe12:: with SMTP id p18mr30877410pgh.425.1618295280741;
        Mon, 12 Apr 2021 23:28:00 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id f65sm13461382pgc.19.2021.04.12.23.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:28:00 -0700 (PDT)
Date: Tue, 13 Apr 2021 11:57:52 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
Message-ID: <YHU56OM+C2zY34VP@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Declared 32 bit unsigned int as static constant inside a function
appropriately.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- Rectified the mistake by declaring u32 as static const
properly.

 drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index ea86e9e1c447..80141b89a9f6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
-	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
-	static const u32[] canvas4 = { 24, 0 };
+	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
+	static const u32 canvas4[] = { 24, 0 };
 
 	amvdec_set_canvases(sess, canvas3, canvas4);
 
-- 
2.30.2

