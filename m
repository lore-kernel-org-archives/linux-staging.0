Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA3258B
	for <linux-staging@lists.linux.dev>; Wed,  6 Jul 2022 18:29:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so9661387wme.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Jul 2022 11:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2bRAz+V8z3pbOVqJIvMC22fUwjtIMw6EhAN0Gm4k1FY=;
        b=miWWCHqgX9+cNJIAA+hGwGKjjHXe/e2nn6A2ApevKTQP6jpyPOAKTDSlC04B1S3kuR
         js93xv19t9mp12q+k788vFTDsTQR8OSaA8DdvXG3O/wdYyV8NbYaIHDvkD/NPPBdA9eQ
         P7tFKMaW7yQoHMRDI5+QDw2wrLDk9j3+A1VwP7HClPJlq0l6lbffuBaeI3H6c/KE79V1
         lURYEjsLFa+WHjJAOmc68m1jMhgngavWp3baL8e4FtkxkzTYFvwa1pL+k8C5y2ia7E5r
         XKGgeLNp1LaLzaN9v9rBAyPkxuhBmkyNL1GwtqlB/3P7cQRMjWvFWNU5cVuMjsEndAkQ
         ZQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2bRAz+V8z3pbOVqJIvMC22fUwjtIMw6EhAN0Gm4k1FY=;
        b=hAX/Ub1JlXG3oKR8WZKzvGCMnnu7w/f4EzSOsFfONwbLpONHcKyVt4+BCEARca10Et
         lPWvbKIAMVuP/wbGJzrlp0toptvk/7OogZ6v/WYjsS9HQRXWWLhVHXeBWdXEyuwLTSvk
         3igecdA7m3oiY0klI1KhLGgHXpuxbPry4o+twZyKCfI8IXfIpljTL/f7wnNGI3OoEOOy
         UZGCDjjtNrx8SIIOPlxMoBfZycBA0mRLwWjtle76pWGCHaeql4r/KHN4HGu7lAqUT48z
         3MzTYEZ0/QabI4y4SGSgBvYQnAzFC8fHwnZip+AalNPxjNTfaT27rPMYluKgBToPnLt0
         6G/Q==
X-Gm-Message-State: AJIora9BDeEluJvmMwJBi8G2L2jADoLPhAbRCoHzL0RLAU14DZCfXS4s
	LkJvTpZ3Y3+5MHFofS0benc=
X-Google-Smtp-Source: AGRyM1vCgYRYlyrNQ8s7hMV5pQYcLqocChJlpFqO05hUHknwmryQnbY68ISabmphPDEBZeHQFkzGrQ==
X-Received: by 2002:a05:600c:a07:b0:39e:da6e:fc49 with SMTP id z7-20020a05600c0a0700b0039eda6efc49mr42986943wmp.143.1657132152988;
        Wed, 06 Jul 2022 11:29:12 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm5142406wru.28.2022.07.06.11.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:29:12 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 1/7] media: Add P010 tiled format
Date: Wed,  6 Jul 2022 20:28:55 +0200
Message-Id: <20220706182901.78949-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220706182901.78949-1-jernej.skrabec@gmail.com>
References: <20220706182901.78949-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Add P010 tiled format

Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
[rebased, updated pixel format name and added description]
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../media/v4l/pixfmt-yuv-planar.rst            | 18 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-common.c          |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c           |  1 +
 include/uapi/linux/videodev2.h                 |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index a900ff66911a..faba259a2b92 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -116,6 +116,13 @@ All components are stored with the same number of bits per component.
       - Cb, Cr
       - Yes
       - Linear
+    * - V4L2_PIX_FMT_P010_4L4
+      - 'T010'
+      - 10
+      - 4:2:0
+      - Cb, Cr
+      - Yes
+      - 4x4 tiles
     * - V4L2_PIX_FMT_NV16
       - 'NV16'
       - 8
@@ -528,11 +535,12 @@ number of lines as the luma plane.
       - Cr\ :sub:`33`
 
 .. _V4L2_PIX_FMT_P010:
+.. _V4L2-PIX-FMT-P010-4L4:
 
-P010
-----
+P010 and tiled P010
+-------------------
 
-Like NV12 with 10 bits per component, expanded to 16 bits.
+P010 is like NV12 with 10 bits per component, expanded to 16 bits.
 Data in the 10 high bits, zeros in the 6 low bits, arranged in little endian order.
 
 .. flat-table:: Sample 4x4 P010 Image
@@ -570,6 +578,10 @@ Data in the 10 high bits, zeros in the 6 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+``V4L2_PIX_FMT_P010_4L4`` stores pixels in 4x4 tiles, and stores tiles linearly
+in memory. The line stride must be aligned to multiple of 8 and image height to
+a multiple of 4. The layouts of the luma and chroma planes are identical.
+
 .. raw:: latex
 
     \endgroup
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 1e38ad8906a2..e0fbe6ba4b6c 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -278,6 +278,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_P010_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .hdiv = 2, .vdiv = 2 },
 
 		/* YUV planar formats, non contiguous variant */
 		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e2526701294e..7aa3af389b51 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1310,6 +1310,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/CbCr 4:2:0 (4x4 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 Linear)"; break;
+	case V4L2_PIX_FMT_P010_4L4:	descr = "10-bit Y/CbCr 4:2:0 (4x4 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5311ac4fde35..32bedeb04152 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -630,6 +630,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12_4L4 v4l2_fourcc('V', 'T', '1', '2')   /* 12  Y/CbCr 4:2:0  4x4 tiles */
 #define V4L2_PIX_FMT_NV12_16L16 v4l2_fourcc('H', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12_32L32 v4l2_fourcc('S', 'T', '1', '2') /* 12  Y/CbCr 4:2:0 32x32 tiles */
+#define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
 
 /* Tiled YUV formats, non contiguous planes */
 #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 tiles */
-- 
2.37.0

