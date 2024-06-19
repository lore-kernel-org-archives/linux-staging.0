Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD6F41746
	for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718819195; cv=none; b=Gol8uKwKFX9EayrOJKYlGGVMVRgtn8ESOiPp6Vk5652VBWf1RMx5wVui+Q9dSZoojAJeyqvS1CY0lAs518zKxGOFifp4M6DZGksftIkK81o0MqQSApSKUu2R85P+bsHOR2WYq/hjxjak3aK1wiKgqtfVw8VO+VQxbM3Lz7pzbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718819195; c=relaxed/simple;
	bh=KfuZUDtRbQnetyeAbuRd3zXq8hTkCKuI/Ak5W9iGk3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtegoWIxlmqYVYCH/+BURidNIhHF+PbCI6R5BXzN8WzNJ6TuzXdAjHpDqEm3KCI+wnfi7DnE3zMLh300iytd4dymDMa7OC+5zbsuUJR8rhEkP0xlQVObwn4B+P6UtYu2U98aYgfdtaf8kmts12d6vapUWqLIWPuWrQoMCPK9rI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI08LsF+; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI08LsF+"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6c53a315c6eso35677a12.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718819192; x=1719423992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UHgTKJnVvGzz0RhWWxAYapaJvaOUe+M0dNscdnn3ck=;
        b=UI08LsF+ewZwa261wvyj3WvqWGCiDF+daHszzOqyCdSGWJQJCucwcfi//cb6vcxJXF
         ninPuoN3FZQ9HOzw709/vBfHropwNNZIuXW+yvOF5s1/v8Rvqzwhqj2j1pj2uvm2pwZ/
         iu1FA7PlHjmeJ+8oJ/5i1Av/1I8k7lbwdnOoGBBiUpC02Gtelger/8CXYc94aPLAUDyv
         0mfpgyKbkPqM4lJSIMY/qt1HsLxbY3onaigt+Uva6AJa5s/oIaVwxCLah20Qa7kwMIBI
         jvk74wtvZW18MQ1IWWTyCvniEIWUlJh9r+PeZ2i401cuTp1gK4g8Ed0XqyyrNPYFQGUu
         1DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718819192; x=1719423992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UHgTKJnVvGzz0RhWWxAYapaJvaOUe+M0dNscdnn3ck=;
        b=GE4mX7OYUU6EMKL+LAHR0ONAEnW3i+MTLDzQMUBmLFGkTLqum9lfbyN+l9BAeQAISq
         G5PivpTCKDJi/m5jwy2EfHC52530AdW4jbnwV4rLVrIjTZBcdYjVvvNDEKJSVaBB0voY
         DPaieZISVVlxMWqG52mqTL6o+kHPFVIKrm7/4LiNvuFcS3GLoriYi1kIm2sLE+sYx0AY
         mpoy7XtX+rEMb+8x4chDzCPhWUZFkkBl85x/j0+OhjIht+F7S89rSXWychwUftSUXm8B
         b1hnHa2e6rAsBtCz5uvR6fGa3nGH/tsEagUUBVdu1/CKKL/mZxiW4zQY2Gfc993c2wMv
         Jf2g==
X-Forwarded-Encrypted: i=1; AJvYcCVHEf9Zk20+d5ag5WFHNacQtJj/JnIn5EePEpDM1X04sbdn68/awN69ct8Es4bz3QgdJByOKWPROpGRx3SfWq3rWoL5IPRpck14Okc7Hg==
X-Gm-Message-State: AOJu0YyGYeaLi7Q+glZlCJUhZF6cusv0o46D8rp3JQMKq5t90SVIxbhW
	N2tKG19B3mHUtn3Lalj1VMMZWngu7+CabTuhZrLjOHw4SfdIx2MW
X-Google-Smtp-Source: AGHT+IH0tqeqkE1rjW4+gz7APWuek16GJuuOw7jkeXENxmGKwm/HYrhSwM4hQ5g0CoPb1P5AUDj4bw==
X-Received: by 2002:a17:90a:7087:b0:2c2:da02:a2c7 with SMTP id 98e67ed59e1d1-2c7b5dca970mr2971807a91.44.1718819191973;
        Wed, 19 Jun 2024 10:46:31 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c45ac5f3sm13364906a91.12.2024.06.19.10.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 10:46:31 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: andy.yan@rock-chips.com,
	benjamin.gaignard@collabora.com,
	boris.brezillon@collabora.com,
	conor+dt@kernel.org,
	daniel.almeida@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	ezequiel@vanguardiasur.com.ar,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	jonas@kwiboo.se,
	knaerzche@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	paul.kocialkowski@bootlin.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
Date: Thu, 20 Jun 2024 01:46:23 +0800
Message-Id: <20240619174623.270706-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619150029.59730-3-detlev.casanova@collabora.com>
References: <20240619150029.59730-3-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Wed, 19 Jun 2024 10:57:19 -0400, Detlev Casanova wrote:
>+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
>+		height *= 2;
>+
>+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
>+	    height > ctx->coded_fmt.fmt.pix_mp.height)
>+		return -EINVAL;

I did further invesatigation on chromium. I find that before real video
is decoded, chromium will call VIDIOC_STREAMON twice with value of
sps->flags 0:

At the first time width and height are 16; ctx->coded_fmt.fmt.pix_mp.width
and coded_fmt.fmt.pix_mp.height are 16, which are the min size of decoder;
At the second time width and height are still 16; while
coded_fmt.fmt.pix_mp.width is 1920 and coded_fmt.fmt.pix_mp.height is
1088, which are the real size of video.

So VIDIOC_STREAMON will fall at the first time call because sps->flags is
0 so V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set, and then height is
doubled to 32 which is larger than 16.

What do you think if we skip doubling height if sps->flags is 0 and at the
same time V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set? The following hack
did fix my chromium:

--- a/drivers/staging/media/rkvdec2/rkvdec2-h264.c
+++ b/drivers/staging/media/rkvdec2/rkvdec2-h264.c
@@ -767,7 +767,7 @@ static int rkvdec2_h264_validate_sps(struct rkvdec2_ctx *ctx,
         * which is half the final height (see (7-18) in the
         * specification)
         */
-       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) && sps->flags)
                height *= 2;
 
        if (width > ctx->coded_fmt.fmt.pix_mp.width ||

Best regards
Jianfeng
