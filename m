Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD141B29D0
	for <linux-staging@lists.linux.dev>; Thu, 20 Jun 2024 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718905122; cv=none; b=KO1eQ6eg4jctO9JEEuwC1esYtGk2Cjzp2h7Nls6g+MQq0Xj7MOSFZxuen8egbsOxmcmFpOq/75DoRWlVqgK4eilEs6u/cpRXYlq2hPCXF3Clq0aHZwuABSzrSyY2lvZvvrHFRy0Z1iac1l2XJhFmPFk6DhafPBAL8hlyHnEgIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718905122; c=relaxed/simple;
	bh=WNDUfhBM9/HSXNcFmiKwEnh7+iaCd5SdM7ZCgWc+f/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h4bV1iqdrLikiaY3/dKVj8LSi7rq1JlN1AMmDpg8GDA/faHxpoRZFNS1Z791vgQtwqb6v0Du2hlbBMHoJd88HNrKg/47qbsnLKXOveQ9gCOF4Itwf/c+4GdmpLtHmJcBqvmSxELxd5FUzSPEJkevLDSrbE6GKH5bkP5UwdxMqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+ZP/AfH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+ZP/AfH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f480624d10so9612065ad.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Jun 2024 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718905120; x=1719509920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sG4Va9OdsdsAbudvNBTbNSzmionWI4fbzxfvxF/ZFU=;
        b=i+ZP/AfHuvYT58fHG1RpQkWTUvgd/h+tomZrMpyYyBJ1ZTiAGpFKskRC2iek4hiCna
         cSNBD/7nAfl5WHK5cigqyQWzBt38lm3b2fphIinLOy++tjPybl+ijVV0rRZ6T263UMeZ
         CJR0k8WoUd4TaiykCE4lQpObvg1oRX4JYtsBYclnNhPjnwnUFcDf2VkD2lcV+tKHD8oq
         C8wJU6Nde7QC/qCYvvN+oxr3MNASJwg7Mx9kbFz75MzCJFeOVslqlVbPX89zt6TyCvbF
         zqiuJkMyAlrbfcP9ey3mJvvMzEqc2Kqg9H89Z1hvCnBbdfwzAzjUepGVSWDlyc1SlKmJ
         yBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718905120; x=1719509920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sG4Va9OdsdsAbudvNBTbNSzmionWI4fbzxfvxF/ZFU=;
        b=K08Ir1bu3ZRRMroZhIG7W0LZ2N7JNKI3L8zFTrTtUfNiU7rty+RErmEENCxLYpQh90
         XSxASUPlm41r8IFXT2mwQusFpsIRhKnyy5REN6DpTw+uGkf+A6Q2/pwxglx/WLr0vir/
         48qy9d7EBDShgN/0QToHOHan0hPZVUtst7z2f2PopMnY8D/0c3oRxZo+g6grrqtcxsqv
         MrLthTlRInM/9Dxo/fBIIt5C3SlWBEEIhmyiMCGokVN9qbvn0MdHo8sCZgxGWzDm9JBx
         Xfa5AWLSGInmJ9LKZCO1c8v4ezrvuGgFPMottjJ/yTqQgesXhQCdT6jn4O4CYiUrZMaE
         rBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYGYAoP91TPqRuwuOFryWavIzVgjaX7nFdy4Yr3nIRjRl1sf4wV/4izg1YhxOox7IaXTsuYzHk0GbHan54hKXAbt2bx9a2nwPkpuSdsg==
X-Gm-Message-State: AOJu0YzEANJijLxRZiBpMnBq0k6A4kRCBbiLK6qsG+N9/KdlMfKZnyG/
	4w5Pof6V+gZVOPA100qujBJo7ecGzKlOaaloC9iK1ZOJbv8soweq
X-Google-Smtp-Source: AGHT+IGuxDdFAgdWqgiP/kZrg0iwxBJMVyTH3b8zZKvOQHHripPZ4bEWsXUOLcu/oJJn63EYCqpTKg==
X-Received: by 2002:a17:903:2443:b0:1f9:cbe1:ae9 with SMTP id d9443c01a7336-1f9cbe10dc6mr23294315ad.44.1718905119620;
        Thu, 20 Jun 2024 10:38:39 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55ca1sm140132045ad.49.2024.06.20.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:38:39 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas.dufresne@collabora.com
Cc: andy.yan@rock-chips.com,
	benjamin.gaignard@collabora.com,
	boris.brezillon@collabora.com,
	conor+dt@kernel.org,
	daniel.almeida@collabora.com,
	detlev.casanova@collabora.com,
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
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	paul.kocialkowski@bootlin.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
Date: Fri, 21 Jun 2024 01:38:30 +0800
Message-Id: <20240620173830.277022-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2349746d488f4edf9c7c40df5e15ff70d3ec67b7.camel@collabora.com>
References: <2349746d488f4edf9c7c40df5e15ff70d3ec67b7.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Thu, 20 Jun 2024 10:07:41 -0400, Detlev Casanova wrote:

>This feels like hacking the driver to please a specific userspace application, 
>so I'd like to understand better what chromium is doing.

Yes that hack is ugly. I have added log print in chromium to see if they
have set frame_mbs_only_flag to zero and found nothing. This sps->flags is
initialized 0 by kernel's v4l2 code. I printed all sps values in function
rkvdec2_h264_validate_sps and they are all initial values when chromiumn
call VIDIOC_STREAMON at the first time.

Hi Nicolas,

On Thu, 20 Jun 2024 11:03:54 -0400, Nicolas Dufresne wrote:

>This falls short of a specification to support the uninitialized usage by
>Chromium. That being said, we do make an effort to try and have a valid default
>SPS control and OUTPUT format combination. So my suggestion would be to set
>V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY in the default compound control init. This
>way, 0x0 get translate to 16x16 instead of 16x32, thus will work with more
>drivers.

Yeah that's the root cause. Vaule of sps->flags is initialized to 0 along
with pic_width_in_mbs_minus1 and pic_height_in_map_units_minus1, so this
check would fall with minimal decoder size 16x16.

>Chromium these days is not being tested on anything else then MTK, which has a
>64x64 minimum size, this is why they never get into this issue. This driver
>validation is entirely correct. Removing in some cases is unsafe, it would need
>to be replaced with STREAMON only validation of the CAPTURE sizes (which
>currently is validate by implied propagation of valid SPS/OUTPUT).
>
>**not even compiled tested, just to illustrate**
>
>diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-
>core/v4l2-ctrls-core.c
>index c4d995f32191..a55e165ea9c3 100644
>--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>@@ -111,6 +111,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl,
>u32 idx,
>        struct v4l2_ctrl_vp9_frame *p_vp9_frame;
>        struct v4l2_ctrl_fwht_params *p_fwht_params;
>        struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
>+       struct v4l2_ctrl_h264_sps *p_h264_sps;
>        struct v4l2_ctrl_av1_sequence *p_av1_sequence;
>        void *p = ptr.p + idx * ctrl->elem_size;
> 
>@@ -179,6 +180,18 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl,
>u32 idx,
>                 */
>                memset(p_h264_scaling_matrix, 16,
>sizeof(*p_h264_scaling_matrix));
>                break;
>+       case V4L2_CTRL_TYPE_H264_SPS:
>+               p_h264_sps = p;
>+               /*
>+                * Without V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY,
>+                * frame_mbs_only_flag set to 0 will translate to a miniumum
>+                * height of 32 (see H.264 specification 7-8). Some driver may
>+                * have a minimum size lower then 32, which would fail
>+                * validation with the SPS value. Set this flag, so that there
>+                * is now doubling in the height, allowing a valid default.
>+                */
>+               p_h264_sps->flags = V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY;
>+               break;
>        }
> }
>
>Nicolas

This patch makes sense and I just confirmed that it works with chromium.
Thank you very much!

Best regards,
Jianfeng
