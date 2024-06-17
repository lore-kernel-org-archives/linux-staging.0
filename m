Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2901195FE2
	for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617665; cv=none; b=U7mRcMUoYHpwzYDkEhEozGyEBQv0INAv3RjgibAIzSkuQw7GC9hRXhPoKowjR5I4ZUERGxqIe6qkvJjKTpSQwJcEB7Bji2vmcZxMKqLwKCgJrRKdpw07yl2hKL1OdA7T/NiUgGFzVq3SY36lvyZ3nHzBAl6J4d1NRmlhN4XTuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617665; c=relaxed/simple;
	bh=8RBdNog9v6i7Y12AFGORLNl5FaRMz/KfSoh+ctsLO0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTQ188wSLnlbiH/MBAmjRwBXyRUo0FwL+VsCs/i5BDcgQv+CDsuwDRPHB22duts6zbYRwE1WOTEWIWOz4UorSvvW78XeiAJCusV6J/iyUTSBoIfm+UZh1Ibe9V4uEmxxCUQ7QKFeLCCS3Pr7VprDN8Za59JDL9GQl86wSJEvWt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPVxCRxc; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPVxCRxc"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-704313fa830so3156430b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617663; x=1719222463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usGpbKfnBPC6WUjY1RuxzYU4ZgAbIRTvzZTlT0vlyVY=;
        b=gPVxCRxcFYMnoRqdWBLDCsL3K79CSgIB4GKSdM0/zBm/6mtjaiD23foevHs8fwTv5C
         MO7ViehEs46+K409VC3FAzdMdS9oBSMsDEGCUWmeFhZkgAsAceFEVCl3KJpekDczzXuA
         KQssaaxDFrnWm4by6cM7eZ/gJw2opLaiiEFMfSJ4nmk+wYox4Mp3IHiXRwxZk7yD+eAA
         OPkBKdzSjK1IpzZ+n00709oklx2k4WsmwJIGvcPna5qA41Ytcn/59ygFv9O8kZ+pqpR4
         25BHMhN4JBNq1arqz4N3HB4qZtMStGsrdtimnuyQNUxBAdT7cKnyESYetl2WMHyoZeMa
         EM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617663; x=1719222463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usGpbKfnBPC6WUjY1RuxzYU4ZgAbIRTvzZTlT0vlyVY=;
        b=na35thylC9qChfeMm178K5QeYMqdgRpi+t7TfyrnUmeotpNzp7vg+Jf7qjC9TaEIBj
         /YqDkCAP5j1bMopY3bfxfqr8Acw2pH7qE3Tgo3C8EXw57fkwEd5hl/aH9A6dQUCYNXLM
         TAbs+55PP1QG4Y6eUCxhbA0t6zfEGSm8YI42A5JauCk/9pimp501C8m0KSECW4fPvK9+
         YQAQKcvF9Ih7gFa8XiGZXZMliDlulWoQo2IYb3NyTXMWMSFXt15343EQtJMd0pnayJU5
         YPjscSiLYP7h8KdJeyp1QakLfP2jQdj3B40Z8rZW4IUkWtS8tzVIwbRf3ZoBEmzhPzVK
         FKtA==
X-Forwarded-Encrypted: i=1; AJvYcCVdHd5hrJzbg+pqvWJ+dEUhUQog0QwlHSG4zWmTYX5DUVlaUg9AqNyZcAc0tPeOshuHSzHorFXv6kZ4dDhrrXPAX3mRSGNDqkKdjDgQnw==
X-Gm-Message-State: AOJu0YwwYtPzpEfKS67XQraXPtKVUvUdiJQ+EaNGxB21D2vo5YjWt2Pa
	xFMTzmr8cQyM62zemJONKyZssS8Env/iEqd/xcb3IoIzOV+fPqz0
X-Google-Smtp-Source: AGHT+IFyxj6DeLjbzNAUMQS9A9wQr543YPl1rLY7vjP9jo76xxnmD/MsXV8euv4MDQM0ooApWPY5Kw==
X-Received: by 2002:a05:6a20:da92:b0:1b5:b214:efcc with SMTP id adf61e73a8af0-1bae82fd317mr10638457637.53.1718617662752;
        Mon, 17 Jun 2024 02:47:42 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c46701absm8576488a91.40.2024.06.17.02.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:47:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: alchark@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
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
	mchehab@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 17:47:34 +0800
Message-Id: <20240617094735.27928-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240615015734.1612108-2-detlev.casanova@collabora.com>
References: <20240615015734.1612108-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Detlev,

Thanks a lot for your work! I try to use rkvdec2 with chromium but it
can't play h264 video. Here is the log of chromium:

[5799:5873:0617/171224.850061:VERBOSE2:video_decoder_pipeline.cc(473)] Initialize(): config: codec: h264, profile: h264 high, level: not available, alpha_mode: is_opaque, coded size: [1920,1080], visible rect: [0,0,1920,1080], natural size: [1920,1080], has extra data: true, encryption scheme: Unencrypted, rotation: 0°, flipped: 0, color space: {primaries:BT709, transfer:BT709, matrix:BT709, range:LIMITED}
[5799:5886:0617/171224.850915:VERBOSE2:v4l2_video_decoder.cc(182)] V4L2VideoDecoder():
[5799:5886:0617/171224.851218:VERBOSE1:v4l2_device.cc(128)] Open(): No devices supporting H264 for type: 0
[5799:5886:0617/171224.851346:VERBOSE4:v4l2_queue.cc(1069)] This queue does  support requests.: No such file or directory (2)
[5799:5886:0617/171224.851426:VERBOSE1:v4l2_video_decoder.cc(476)] InitializeBackend(): Using a stateless API for profile: h264 high and fourcc: S264
[5799:5886:0617/171224.851687:VERBOSE1:v4l2_video_decoder.cc(598)] SetupInputFormat(): Input (OUTPUT queue) Fourcc: S264
[5799:5886:0617/171224.851797:VERBOSE1:v4l2_video_decoder.cc(636)] AllocateInputBuffers(): Requesting: 17 OUTPUT buffers of type V4L2_MEMORY_MMAP
[5799:5886:0617/171224.867687:VERBOSE1:v4l2_queue.cc(1511)] Streamon(): (OUTPUT_MPLANE) VIDIOC_STREAMON failed: Invalid argument (22)
[5799:5886:0617/171224.867902:VERBOSE1:v4l2_video_decoder.cc(937)] StartStreamV4L2Queue(): Failed to streamon V4L2 queue.
[5799:5886:0617/171224.868009:VERBOSE1:v4l2_video_decoder.cc(1377)] SetState(): Error occurred, stopping queues.
[5799:5886:0617/171224.868105:ERROR:v4l2_video_decoder.cc(120)] StartStreamV4L2Queue failed at Decode@media/gpu/v4l2/v4l2_video_decoder.cc:915
[5799:5886:0617/171224.871898:WARNING:v4l2_video_decoder_backend_stateless.cc(126)] There is/are 0 pending CAPTURE queue buffers pending dequeuing. This might be fine or a problem depending on the destruction semantics (of theclient code.

Here is the chromium code failed when calling VIDIOC_STREAMON:
https://github.com/chromium/chromium/blob/125.0.6422.60/media/gpu/v4l2/v4l2_queue.cc#L1508

I'm running chromium v125.0.6422.60 and I can decode 1080p h264 with
hantro g1 decoder on rk3588.

Best regards,
Jianfeng
