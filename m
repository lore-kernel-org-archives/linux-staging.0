Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BDA49B;
	Wed,  9 Nov 2022 18:23:21 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 21so28414763edv.3;
        Wed, 09 Nov 2022 10:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGKEIjcsk8tQqvaYzdxfC4NUvHgSs8XvInHL1lPX/Fg=;
        b=fOIB8n0DyYopEIyTl3q6r+83uDfz8owp8jXUjGnDDgHGeffe3qIw/1+1lrfpDBmipS
         YOg5kencveme07bhifX8Wtyf+cP1RqmiqUsjOC1AhDzVF3jpLVhsUxG2Q/9jthY2JBKM
         4xQzbg/jI0HjZWjp0G5m+s2dxhqjXzaFHvw9VYHjQhgwPD4b6DHHtcWYYFctyOneGprH
         kCh2lwDI6IQ4/Ge1GiIelYcKaghF1XgcGFkam0zMnjFp36rvQ42qssleBm+h6n71Q0Im
         Rws0wA9OMucCDPLy1mNHR07azSzxrAmmtrKvHJa6aq8fLad5k4ZnskB+EwbNNea3meQy
         14fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGKEIjcsk8tQqvaYzdxfC4NUvHgSs8XvInHL1lPX/Fg=;
        b=f1i5z+nX+3tJCEYHSSmzh4HLCYXZggRJvbOY9wYHR8PsY/se5wXLSiDdmw8tjOs9kT
         aT5uIzuE4K3/kNsHgEwMEhecxb3R/hZdBB5UFw4tSj29HF1ghrd3jHSMZYVJA62xIlty
         wXhMUEL2uxSkUG+Raj1ACrTF2xlHv4RWYx5icz+hJH0RelIEXpvL/50T4o5vm1KWNx1y
         crWcSu0rvxfhrGuNM+sBpJNPFOHUGKDD6sjgRKiVuEhoBZln1GZSXip3eRABRijFeNWh
         R+xXAhzHEuKvAxa3MpNrD543AapwuLv5RKV/YXm8Rfm+0j1y9wczyrxTKZGDjIB7bzIE
         qGPw==
X-Gm-Message-State: ACrzQf2JWXtygPVxvKiZulDXMjh6A+XbuUh2H6ej17vMuYkNYczBt4R5
	IzgbKjJjq44vds5r5UUOSRU=
X-Google-Smtp-Source: AMsMyM58bIAMFWAMNs5ea/fTEDF6QRHnXMfGASSR5K/9FtoRq3O6TeaRAknIfB7En59UDDC1SSxkxA==
X-Received: by 2002:a05:6402:524e:b0:461:fa05:aff8 with SMTP id t14-20020a056402524e00b00461fa05aff8mr60969734edd.283.1668018199846;
        Wed, 09 Nov 2022 10:23:19 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gj26-20020a170906e11a00b007a0b28c324dsm6029400ejb.126.2022.11.09.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 10:23:19 -0800 (PST)
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
Subject: [PATCH v3 1/3] media: cedrus: Adjust buffer size based on codec
Date: Wed,  9 Nov 2022 19:23:07 +0100
Message-Id: <20221109182309.2475221-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109182309.2475221-1-jernej.skrabec@gmail.com>
References: <20221109182309.2475221-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases decoding engine needs extra space in capture buffers. This
is the case for decoding 10-bit HEVC frames into 8-bit capture format.
This commit only adds infrastructure for such cases.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h       | 2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 5904294f3108..774fe8048ce3 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -162,6 +162,8 @@ struct cedrus_dec_ops {
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
 	void (*trigger)(struct cedrus_ctx *ctx);
+	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
+				       struct v4l2_pix_format *pix_fmt);
 };
 
 struct cedrus_variant {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index dec5d3ae4871..dc67940f1ade 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -250,6 +250,10 @@ static int cedrus_try_fmt_vid_cap_p(struct cedrus_ctx *ctx,
 	pix_fmt->height = ctx->src_fmt.height;
 	cedrus_prepare_format(pix_fmt);
 
+	if (ctx->current_codec->extra_cap_size)
+		pix_fmt->sizeimage +=
+			ctx->current_codec->extra_cap_size(ctx, pix_fmt);
+
 	return 0;
 }
 
-- 
2.38.1

