Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AA871
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:11:32 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso9051704pjb.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=29Kz76z7ZOP2iBx6/3DXnAWj3+GXDiiIznMC8bIFGsc=;
        b=HCWAtwaBVQdx3DeevYRszuLqOubsNmDDTOTU+FUgQJHr5WOPHzKY87DtFvsPI+S/81
         QR2Gk6DnFiU7zXEedpL+oq4LOUtxyg/lImKv8ezFR7EdoMoVQSNQLHIRLdjVv7XqWJws
         YGI9DeOoohjqarltgk4Fx+sy2IJ3LcRCnH4OII2+i/AKfoulTZHV2ZsmzrWG968gDgD1
         mcyiN/l+u3pl6Kh3xjmOZuaFH/61ucMxERgSLrl2UZaLj66WFwAb4fvHbJog9pkbE7mU
         AH2yjEx19AvArSSuSmm6RoOsDYo7gsx1mHjrND7Q5oFIW2/VIk3+gaRsKRHNyarn1rmy
         TrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=29Kz76z7ZOP2iBx6/3DXnAWj3+GXDiiIznMC8bIFGsc=;
        b=m/+x+uNY12fYjj+MIHSRBGYWOq1TLGKPK+H5oT51B+KUirfB50yfPSN1iWyqIX/bPp
         x78pFlvSOqQifCOv0UjAvVvE1yyP5rKBf3R1sAPECZeR7rSuQTIigXKAZEWcOcC+k4Ee
         nRcQWQG3gSE2j5hzndCzecIcUXjZxeDy5QS8lhnvbgg+0DLGvafBoXJ3wtZwD205zYye
         F+PWcRUNhMjSaXvapJ+jcx6Wa3t60z6dYBFBMfDUad46yddGLVz2QAcK9cew4KgTkvzX
         rKpJOrBZCg87gUqi+5bGKEeluXNRc/ZgGniAjhYRKxIy6ddjPQLHDCs+1W1JbaKQXBPz
         hMWg==
X-Gm-Message-State: AOAM532IlTLxEMQRu4UCybQw9JE5kiuLYX6jfy17oeltVWqKiH0fDG6j
	95paGC5DNOxWa8CO+HnmUTI=
X-Google-Smtp-Source: ABdhPJxc6+6O8gxrJL3OrEMe9mC+xOVJwaNQrJLDCo+F68glOIdvGxDa5YlD1mPqJsydBllGi86BYA==
X-Received: by 2002:a17:90b:390f:: with SMTP id ob15mr244765pjb.100.1618323091571;
        Tue, 13 Apr 2021 07:11:31 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id ms8sm2519954pjb.57.2021.04.13.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:11:31 -0700 (PDT)
Date: Tue, 13 Apr 2021 19:41:20 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: media: meson: vdec: declare u32 as static const
Message-ID: <YHWmiBYAbOUw5YrY@kali>
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

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
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

