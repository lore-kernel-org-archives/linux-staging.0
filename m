Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB771
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 15:33:56 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6464591pjh.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b5BqcJY31tpHgoOIg8xmOV3jrrzgv1cy4FkuM4zTOiQ=;
        b=CUxl1BF1GCsbKQS2vXYRlSRgpS/eHacg7Tqw/G4m7NgoJ1iTA612mVny8XU+gKX6R8
         M9cGzIl2svhO3e3mNJlOoFoPHrhRGGtTiDkbbooD48SToLnNm3GXePocG2Mz+8lfXZTT
         sO8WKMGa6tNuw5daAAyfU+q21luJc5zr3bSZLHr3mIAgLMF6vs063Ktby2jM3v2INwdR
         ck+7A82+KDcOyui26cURoKcWXEb2M6FD0zlcOGO2JbG2prgKTZAfZ2ILRjvmnXhQPxRt
         BW8UGGz/UcmEp7vgDIcu9KS5c1Of7DApPFB8csg7PS0QKFkNxqb3ALRpLsggVZSSPJ/B
         zCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b5BqcJY31tpHgoOIg8xmOV3jrrzgv1cy4FkuM4zTOiQ=;
        b=Rq4iV+Q2uu0E1ZXlbt0+sff2ETc1EKEMWBpdrtJXteNBCgvZBDdpiFNNMGudAYM/hz
         3rEn7t9Av8xQ2W6x0nQpbdj/aZOpXXY0u1by2WjBlDwR1LPbMnLmgKEMNQSfL7vJQ4yo
         vaJyhi7Vl/VnpuVDdIEKkbhcVrzlD8A/qZZXDlN6Qnb1oXsMZsngcNgMD2eUoLv1Y41N
         9k1r2lxK/331bLgCERkMjfrmlUohav+qKA2Q0MKHvnrZfFgkqQ7fP4WqX8ALs9J03N6O
         X+Nw3GsdoGs0apSleRUKaJFJ+O4tGv3OeMlmgK42UQOCB7O3Bnp73kNVYQobVALzCaVP
         /JoQ==
X-Gm-Message-State: AOAM531D3rWGRdLKoiGbX4JmVVA0JqxJfvKLmx3la5fVex/g1ZW9r5bk
	AvmzraUu0heWyQRQJRuPgt7JBIOifqZTAQ==
X-Google-Smtp-Source: ABdhPJzPrLqBk4EfNqN/6qhGgPl5xZQ9s9sgZg3n0tPuBPT+cWeirYICyCF7O+B/YUrDAxhUHPHfEQ==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr19999635pji.33.1618068836506;
        Sat, 10 Apr 2021 08:33:56 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id w13sm1005111pfn.219.2021.04.10.08.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:33:56 -0700 (PDT)
Date: Sat, 10 Apr 2021 21:03:48 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3 1/2] media: zoran: add spaces around '<<'
Message-ID: <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1618066787.git.mitaliborkar810@gmail.com>
References: <cover.1618066787.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618066787.git.mitaliborkar810@gmail.com>

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- No changes. 
Changes from v1:- NO changes.

 drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index 71b651add35a..a2a75fd9f535 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -30,13 +30,13 @@
 #define ZR36057_VFESPFR_HOR_DCM          14
 #define ZR36057_VFESPFR_VER_DCM          8
 #define ZR36057_VFESPFR_DISP_MODE        6
-#define ZR36057_VFESPFR_YUV422          (0<<3)
-#define ZR36057_VFESPFR_RGB888          (1<<3)
-#define ZR36057_VFESPFR_RGB565          (2<<3)
-#define ZR36057_VFESPFR_RGB555          (3<<3)
-#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
-#define ZR36057_VFESPFR_PACK24          (1<<1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
+#define ZR36057_VFESPFR_YUV422          (0 << 3)
+#define ZR36057_VFESPFR_RGB888          (1 << 3)
+#define ZR36057_VFESPFR_RGB565          (2 << 3)
+#define ZR36057_VFESPFR_RGB555          (3 << 3)
+#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
+#define ZR36057_VFESPFR_PACK24          (1 << 1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
-- 
2.30.2

