Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F163548D9;
	Sun, 27 Feb 2022 14:50:31 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id cm8so14091240edb.3;
        Sun, 27 Feb 2022 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OfaQxvNgMBgVBVbh1U+wBEbHSjlkePlNsaFk++CJO/A=;
        b=jWJnE1IxsQxmFtj/7wUA06044ZoLdn+WoSI4PhuUZYB7xEl2X3Y1efVw/ceQ8D5YFA
         0taHOo8EXyDrXtx2bbqvX2BDCgttbT29hBufa5lc5u9QQLNhrz5OoqNc9mEwkfwGFiRD
         1OcpyD/V/MJFC4/AG0c0RGHR3NnW+D0a7m4mPE0tFC31bOjCUTTsmDJaMSjBEjgMN7As
         UElRUevIIjC5PI3amBRmQ5nSK1FmXP/IzxtcabZkH7qsdWBGhO/WM61SgCzhql6jT9UM
         0dcO76SUrRR2yZSb0oyzHonzY6Y33mCrpy5xGrmNIQCo2kStUwo8EDst8caAH5o/bU8U
         TaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OfaQxvNgMBgVBVbh1U+wBEbHSjlkePlNsaFk++CJO/A=;
        b=MB8UnQEbuoTeu16VD+wiTVFJGdKC9KWE3TyoE5SyPOKfy+mYj6nBq6lQnS51HuqMss
         R2LJgeuBWtWM4zQpXqWJHhT38tjPi6/49zM2BS/155c5ATY41rADHnKjiVZa6fCJpBt2
         pZM1qW6LCOPJR2X0PNcnx4DA5qxb3FLNruDYsSdA3oHbwGX42YaVWB8oEFU8CdYBxeEV
         DKX13Y4v4OnEKvQO3tKiCNLb4+HQKKBFsQNuqya8ee0Ba1PjlOHQZz9gzInRDw4p7F+P
         M2bZ0zS2txNUBZJJma732iAIW0BwyXP2w0bccAjf9XarfJp5LUXxdBVBdFaizsKm8VQh
         JmgQ==
X-Gm-Message-State: AOAM5319xWDeu14ueN+rDcc+NnfC7iVaFf46hMjTNW/G+0uNJf5A0VVJ
	+21siyMX8PE4FMwz7CYpp9I=
X-Google-Smtp-Source: ABdhPJyDSwZ5SFyTYb4xCunkFA4mylMDYXcPzpygzBsB+uEoEDogghqGdrYYbzUneMXJcGR0SRselA==
X-Received: by 2002:aa7:d7c8:0:b0:3f9:3b65:f2b3 with SMTP id e8-20020aa7d7c8000000b003f93b65f2b3mr15310530eds.389.1645973430285;
        Sun, 27 Feb 2022 06:50:30 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3501887ejj.142.2022.02.27.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:50:29 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [RFC PATCH 1/8] media: Add P010 tiled format
Date: Sun, 27 Feb 2022 15:49:19 +0100
Message-Id: <20220227144926.3006585-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Add P010 tiled format

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
[rebased and updated pixel format name]
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 drivers/media/v4l2-core/v4l2-ioctl.c  | 1 +
 include/uapi/linux/videodev2.h        | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index df34b2a283bc..1db0020e08c0 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -277,6 +277,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_P010_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .hdiv = 2, .vdiv = 2 },
 
 		/* YUV planar formats, non contiguous variant */
 		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9ac557b8e146..048f326c57b9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1302,6 +1302,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/CbCr 4:2:0 (4x4 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 Linear)"; break;
+	case V4L2_PIX_FMT_P010_4L4:	descr = "P010 tiled"; break;
 	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index df8b9c486ba1..772dbadd1a24 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -628,6 +628,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12_4L4 v4l2_fourcc('V', 'T', '1', '2')   /* 12  Y/CbCr 4:2:0  4x4 tiles */
 #define V4L2_PIX_FMT_NV12_16L16 v4l2_fourcc('H', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12_32L32 v4l2_fourcc('S', 'T', '1', '2') /* 12  Y/CbCr 4:2:0 32x32 tiles */
+#define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
 
 /* Tiled YUV formats, non contiguous planes */
 #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 tiles */
-- 
2.35.1

