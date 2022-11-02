Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891AD24F28;
	Wed,  2 Nov 2022 18:08:22 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id 13so47506602ejn.3;
        Wed, 02 Nov 2022 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz8kU4WpE9TC4fsj366svqLLQU9rq3YiiGANcwE6/pc=;
        b=Lu9iDaPkeibob9D2zukTHvmKRrirbpzfH6LT1C6M0zP/qXy54iExH7mDioyv4Ul7Sx
         6QRjy8MQZ+j2abjXnhQcIEmsc23UDoysXuAY+MJJJJmoiscmNOBXQnCnCTXXSDYhJpFq
         KVnNSlVUijf+ZlFCsEdQM7lLeAvW65pZxBILlTiJEdAjG8mD0eRAPjZ/58nR5X4cNBdD
         us1xsek5nl1pl3IyD31KHZjNAnw5Wv0LMiwobX/uFy7PomCQFtN5B2oShrzht1oLfiJ+
         dJ3F3lwCKO4xoYlQ+3DWdfona/UynPlWzKQ/mrii70uT9qIIvujTdVdA+xd2twOp5Duh
         FDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz8kU4WpE9TC4fsj366svqLLQU9rq3YiiGANcwE6/pc=;
        b=eu1Drzc/ZhVUI+Qb5SXh//nAzuwmj0sPvp93b/AKuZU6QgthfB5NGJf4THpQOQCwE8
         3b2BncDWAonPEUe3vd/0VS/u/b5vCA3pV8BfZDNfY4coon2eN8u+EFh1ogWc268lYt5Y
         r5Y/L9mdNJpV5BK1HYWPYsFTx6jduVCGeYYrtU9Cg+Z5CK0A0sxHfzWOycnZVp1UzDSu
         4XD6OFj2MYndRJVzfw3h+DhaGrhDIcSVlsDAIbB8MBaviN/WCIY3ttvNypzNDhagrH5Q
         OKr3h+UDk8gBZsmdi+ayypQzAoAwynEgYylKGvTrvn3kWp3Zv5uEY0EqeJMfxX8x03UB
         tGBg==
X-Gm-Message-State: ACrzQf2hEpEpTlxinBsYsKMpFxmsLHL85ZQlMQGuAU4I90PZWfE65iB9
	ktpIYAPmk9a42GxJ7oyei1KuGejC4hM=
X-Google-Smtp-Source: AMsMyM4iFCLAEnI0uHlhwGw0+az0UFMMmCWDTBTRtbk0uQWbXxdgPdZEkcZEWF+GLLv8aO6NBF5ChQ==
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id d1-20020a170906040100b0073daf730b78mr25917180eja.122.1667412500919;
        Wed, 02 Nov 2022 11:08:20 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gy8-20020a170906f24800b007317f017e64sm5677460ejb.134.2022.11.02.11.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:08:20 -0700 (PDT)
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
Subject: [PATCH v2 03/11] media: cedrus: use helper to set default formats
Date: Wed,  2 Nov 2022 19:08:02 +0100
Message-Id: <20221102180810.267252-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102180810.267252-1-jernej.skrabec@gmail.com>
References: <20221102180810.267252-1-jernej.skrabec@gmail.com>
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

