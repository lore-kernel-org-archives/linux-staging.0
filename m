Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB9762D0
	for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718782920; cv=none; b=siEcussFJCiNOJnsscFC70+snGsFbF5xqH7LqpgF71ci+OAeRw6VQqC0+vWc0/hHaBAr+Nt+jaYwCTibyCF5vXmJOxbOiig2NT/ScmZR69ZSGq+3KneD6hDAMleFapqUOhNcHqbds3nLCs/yLvfq+6l/aYEmeatad8VbszQC5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718782920; c=relaxed/simple;
	bh=YTRa4gq5UCd3xSgYihZnce0eIH+/AuZILZa29HHqF/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TExON7r0eH2hsZG3RIx1VafBdowLnuMhaWguIC4sIE7qjHO8vv0HBHotmvsQEOYl7d1s7NjTB8G7ahEMo70SKRXrli6DVp8ycExWIlYjh+rTzGH0aFlJoBO0Dm5AWGVlFivpTYCmEczNAnT1vGhrIoGMeeLy2cWLZzYTTZqRxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3zhpOZE; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3zhpOZE"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6e57506bb2dso4624162a12.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 00:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718782918; x=1719387718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYf14K0o/GtP+Ak9bfKmmPfeyfY6du+2C660F2DlOvU=;
        b=E3zhpOZElRnxRFLsprq70BdOK9J4Tzvn5Fk3c1gdeD5928M02XjclHZX6N1jhRs94h
         Qub/k6b+TonAvo0XzHKq7RiSqnOyeBy8g/Y/wOtlUgcp2U14+41KaI5v4pfF3/tElPXo
         csdrPOUh3iNf1eeLkhWRZxzN697KrFIpqiXsEmX6xVxyuEqPJM3ar+02w9+JxyWNQ7gr
         UQPSwy9lGrlguiWq3ycP6HdYfj8XdIfH1tw/S5f7xco+YXbneAfQwyTS0xrlsPppHo8L
         dwaPVqEzyE9zjt6lGfe6Cgo0Ip3eQLy2xygauKTsByHqnx4LGPYWDjiTojw+BqaKKYMV
         v8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718782918; x=1719387718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYf14K0o/GtP+Ak9bfKmmPfeyfY6du+2C660F2DlOvU=;
        b=dBVTBpLIxLZQ7AoMqEfrqj5U8WyqoEsnehEkU7DJ7/vMNrPIoGR6fgdSZN1dxDqXdb
         /noLEB5ZP9wtUyAFmCOYzDELZYefQ1vMWbnOGTGSFEAEIqJzLfpYCg98HMKhaliWlk4c
         0qtNztGr7sRS6cU6sXiuSGWLZr2TtPAtw6jpe3RS+gxmQcQjjLA9qSjODp6G0aZKd1IC
         WsuQyZq9anwophvihXAkUI6G4D3bMzymoZrCkcLGcNVRQt10lDvlQ1oGsfcQBC1zxHrt
         Q2pbGV9LpuYgiYjcO1POX5MfyKoghbQrjaqFNMbdr1EzuWS3PUh1NGZfs1AJvNPQjWvI
         JOFg==
X-Forwarded-Encrypted: i=1; AJvYcCU082KplM/OikmERDSiMPmlR9Os1ywj16m49yuK5uu4mkPSed3wTZ74asJEHYBl6yRfRhzFEUji4FofGvOh2Dfa0UtqFwYFuzwZP+mIWw==
X-Gm-Message-State: AOJu0YyEMaKuIP/vp/dhdgZi6l8U30OXB6ps5YCDz7O17eHS1mLhIets
	uBCV9ZXaY3Egq5oa5oyGpMXF4pAM+jRtY8JxbXBRiMFvhlwpL5U1
X-Google-Smtp-Source: AGHT+IH+9mFlVOWUGxjHQVXw4qG3V8AeXjQgSMD+qpxAz0/Fx43VORUI8LtUbjV7U3DwdOEy2ZllCQ==
X-Received: by 2002:a05:6a21:610:b0:1b0:58e:1b93 with SMTP id adf61e73a8af0-1bcbb3826camr1797590637.1.1718782917869;
        Wed, 19 Jun 2024 00:41:57 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855effc9fsm109835865ad.189.2024.06.19.00.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 00:41:57 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas@ndufresne.ca
Cc: alchark@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Wed, 19 Jun 2024 15:41:50 +0800
Message-Id: <20240619074150.103770-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0e8561108c4fc99291ad7cdc0c6af2dbb8e58f02.camel@ndufresne.ca>
References: <0e8561108c4fc99291ad7cdc0c6af2dbb8e58f02.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Tue, 18 Jun 2024 08:39:07 -0400, Detlev Casanova wrote:
>> I think the min/max width/height are incorrect. From rockchip's TRM V1.0
>> Part1 page 374, supported image size is 64x64 to 65472x65472.
>
>Page 374 shows the sizes for h265. h264 is the next table, where 16x16 and 
>65520x65520 is documented.
>
>> And my
>> chromium can't use rkvdec2 because min width/height are set to 16, which
>> 
>> will cause error at here in rkvdec2_h264_validate_sps:
>> >+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
>> >+	    height > ctx->coded_fmt.fmt.pix_mp.height)
>> >+		return -EINVAL;
>> 
>> width is 16, height is 32 while ctx->coded_fmt.fmt.pix_mp.width and
>> ctx->coded_fmt.fmt.pix_mp.height are both 16.
>
>Maybe
>
>if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
>	height *= 2;
>
>is causing issues in this case, I can check.

You are right. H264 decoder should support 16x16 to 65520x65520. After 
removeing the "height *= 2" code chromium can also decode video now.
Checking with V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is copied from rkvdec and
rkvdec has min width/height 48x48 so there is no issue with chromium.
Chromium will call VIDIOC_STREAMON with size 16x16 and without sps flag
V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY at the beginning of the video play.
Gstreamer doesn't has this issue because it will call VIDIOC_STREAMON
with the actual video size like 1920x1080.

On Tue, 18 Jun 2024 12:34:07 -0400, Nicolas Dufresne worte:
>Just a theory, but 64x64 looks like Mali GPU requirement to me. Can you give
>more details how it fails exactly ?

Chromium failed when calling v4l2 uapi VIDIOC_STREAMON with size 16x16 and
V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY disabled. It has not come to render step
which will use gpu. Other decoders I have tested with chromium like
hantro g1 and rkvdec both don't have this 16x16 min width/height.

I also tried gstreamer with a 16x16 video and it works fine. So there
should be something wrong in chromium's code. But I have not find where
chromium set sps flags in its v4l2 decoder.

Best regards,
Jianfeng
