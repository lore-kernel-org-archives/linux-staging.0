Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2D6AC2;
	Mon, 24 Oct 2022 20:15:34 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id d26so7573829eje.10;
        Mon, 24 Oct 2022 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz8kU4WpE9TC4fsj366svqLLQU9rq3YiiGANcwE6/pc=;
        b=GD1VrjxnsI5PdS5Ql5clVdZZo3LcKOQlsk6Vyf7xKb8cFzGMJBN37iLlAIx/IxjfWG
         HHCEZ+i07Ndortqa/MXILhU7jraNG5CK57RmJVEKicdQxow7TqU3tQvrI6Z6wwqoXGeh
         oulyQoHw56xVdN8hDLx+9DhBr9TIHnsEMwzIeSrvKQqzb0QFYjFL+h+fjCWXs7ja4syg
         x5XTNBoV7oAM1htM7qDnRQnu1LrFFVEjwCQz6/ol6f0FH+oIc4byVyF3R+BgxjThRz/t
         AQtrTo4XIJVnvwpOpK1vzYKVRPVi48caLA5B6hZTrJxB+rhI9D3Sn2sq5V4x90idMyOD
         ptNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz8kU4WpE9TC4fsj366svqLLQU9rq3YiiGANcwE6/pc=;
        b=a2YHeExS7mKDPKSWG1Cb3ym/zksE1F8cXIkCCBVyIBfPh2HWVK3CZ+I0lv5NLWR8FN
         neNUXnfI8jTEzoFOha+nNF3d3a6dXZMRTiJq1TbdD8JBIul2Uo2Vaxe7H8F01ZPNBoEe
         5PK89An2CXN+H+K3yPhcUictmNf1fz6mbj106xdOcPoKPu0K8Etdu9x1yhQ3H9pwYGWO
         dc6vcVF+bmALNVPsbu3XKpPSVYONf553Ngkavafw553GKCTLECRrVIshhb1qYyBtWtX2
         SRPgB7AfiXQc2hrNhIQJZpiZdmWEhLThNjRyYrsuSP1aZyjj42T/h1iJrKV85kbGmpt0
         TPAA==
X-Gm-Message-State: ACrzQf0ejGlpYNI+R/CweLAx/+CzQnxM8m0lCwUDV0zagB5Y88GGR0KH
	GFmSQJIqhaUmKnTFXs0lqefrqRO6Suq4lw==
X-Google-Smtp-Source: AMsMyM5N6rY36kWtuD+4fCLoz4ya1DelpBdN2ddXXk7isg8bqu/m5BZOIv42mzcm7xNI4Z2j31FPHA==
X-Received: by 2002:a17:907:b17:b0:78b:b909:e91a with SMTP id h23-20020a1709070b1700b0078bb909e91amr28116924ejl.687.1666642532756;
        Mon, 24 Oct 2022 13:15:32 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:32 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 03/11] media: cedrus: use helper to set default formats
Date: Mon, 24 Oct 2022 22:15:07 +0200
Message-Id: <20221024201515.34129-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024201515.34129-1-jernej.skrabec@gmail.com>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that set output format helper is available, let's use that for
setting default values. Advantage of this is that values will be always
valid. Current code produced invalid default values for V3s SoC, which
doesn't support MPEG2 decoding.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 55c54dfdc585..2f284a58d787 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -361,16 +361,8 @@ static int cedrus_open(struct file *file)
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
 		goto err_ctrls;
 	}
-	ctx->dst_fmt.pixelformat = V4L2_PIX_FMT_NV12_32L32;
-	cedrus_prepare_format(&ctx->dst_fmt);
-	ctx->src_fmt.pixelformat = V4L2_PIX_FMT_MPEG2_SLICE;
-	/*
-	 * TILED_NV12 has more strict requirements, so copy the width and
-	 * height to src_fmt to ensure that is matches the dst_fmt resolution.
-	 */
-	ctx->src_fmt.width = ctx->dst_fmt.width;
-	ctx->src_fmt.height = ctx->dst_fmt.height;
-	cedrus_prepare_format(&ctx->src_fmt);
+
+	cedrus_reset_out_format(ctx);
 
 	v4l2_fh_add(&ctx->fh);
 
-- 
2.38.1

