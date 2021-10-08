Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91762C85
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 10:06:09 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id k23so7212791pji.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KUHB0swnVu/KYbAl644YyqO7PSS/qaz1tm73DfYZaVs=;
        b=KjcoqE6YX7cIYNyMM5PYyjs3wF5Gr2V320ljZVdIb+8BUaW/8M5CCYKaLtzNoZGRUe
         uX7RLS8mMIbBVIyHfU4+FZU7qGeetDJtcCyahAW9TugFrTxmLr2rwzbIgcHNJDICBion
         2QHzwmrXqPVSsePpTXgSsGzmNzcRd3RM8c36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KUHB0swnVu/KYbAl644YyqO7PSS/qaz1tm73DfYZaVs=;
        b=UCqIMPDWIlnZ8CnmS962QdG9oFAriOFbKjsunapcXK0P0BLfaqMTkuToNJWF9S8Ff9
         N6AZg2UmjwmVHrcJzC9HmGvqe+axdjV1z/SYo2oTkrYNU25SGfk/9BvLo4IDlZdxhnPe
         5VRKrOxph92BhK+dmHhEU7VGIgD7W2AQcS9nWZlMQn2a22H1zfb7ixHrQ95iKpOvTXrX
         Yz9Y2ivIeoJXRfA+WPXBCHX9nYxBTIMKDVHHYcond/DxmH+ffAmTA9lt9fmgeb1Puoaw
         kRc+ekpsTzMG6zEMqcHkFC9ZC0Sl+oPx7hjX/4O4VIdPw6YRliRZcKp2RRrd2S8u8VS5
         FRYA==
X-Gm-Message-State: AOAM530+UVe4+TnPwRyEU6D6ZRHx+OQQPn1QKc94VlmMULLCX3Ndgkpz
	eTtJ2Iu29fo7CNwMikURgLj7sA==
X-Google-Smtp-Source: ABdhPJxkBdREzfd4W+kfYcgYxTKjv3LHKdMoe+zGfcZMc2uCzCDqxRU5AMNwaiX+5Rzy51jDyTfhwQ==
X-Received: by 2002:a17:90a:b706:: with SMTP id l6mr11379699pjr.200.1633687569261;
        Fri, 08 Oct 2021 03:06:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad8d:f936:2048:d735])
        by smtp.gmail.com with ESMTPSA id a7sm2082255pfn.150.2021.10.08.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 03:06:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] media: rkvdec: Do not override sizeimage for output format
Date: Fri,  8 Oct 2021 18:04:22 +0800
Message-Id: <20211008100423.739462-2-wenst@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211008100423.739462-1-wenst@chromium.org>
References: <20211008100423.739462-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rkvdec H.264 decoder currently overrides sizeimage for the output
format. This causes issues when userspace requires and requests a larger
buffer, but ends up with one of insufficient size.

Instead, only provide a default size if none was requested. This fixes
the video_decode_accelerator_tests from Chromium failing on the first
frame due to insufficient buffer space. It also aligns the behavior
of the rkvdec driver with the Hantro and Cedrus drivers.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 76e97cbe2512..951e19231da2 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -1015,8 +1015,9 @@ static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
 	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
 
 	fmt->num_planes = 1;
-	fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
-				      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
+	if (!fmt->plane_fmt[0].sizeimage)
+		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
+					      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
 	return 0;
 }
 
-- 
2.33.0.882.g93a45727a2-goog

