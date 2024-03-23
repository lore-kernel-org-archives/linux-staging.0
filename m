Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EF610A09
	for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190512; cv=none; b=L4GI3wQ6jTMoqva+mC1sCYO8lsGH3sGADIlCWwlb/iuFIggD920E8EzE/9O+xijSuLFHiLPXZdyXjuKDnZhfCzHrK/cU8aEJv3dz4M/4RBM6zqnyYMZyYgAy6yQ7gRpmMJ1qorRRZqKyhy5VpEeke5LozAT1t5+vX0/ouRUjxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190512; c=relaxed/simple;
	bh=SydhYBUNZqt6seDV8GSPes7otcagbCoXjH+x0l9PSis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ur5UE0DOpj7Dio1hrNOFaOF+mj8i3SWJPZBM7+aSN60Zhl8IDihThNq6WqgFhngfr1PiIs6n/dXdl4DS3UdwkNrcmliTzzN8AikRe647gwDEVfk444bCn7MF9hAat/aJLi9y0Rgzr0TEXtyS4NgDKagU7adH5VapDZF8eZezqu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZWT5cyeW; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZWT5cyeW"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6962a97752eso22962186d6.2
        for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190509; x=1711795309; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=ZWT5cyeWRu2+ltR7rdJTsAqWjIhFJE3+IRGXXsJ7FHNppW76rpy2D59QshBpdYYkzg
         kaZ6RZvbLWYMnzl+oCdH1NMrISYrGzgeEkhaMRed1AX4RZxpMAymdPbr1H7wCRziAUjW
         eErVLfrks9cNzNDyrN0XnHTUL9F6TifDbrlEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190509; x=1711795309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=lDg/5t7lK0U/Zz4V27ezE9zs21x+73aYD8hUnuDRdsJ3RKJp1OAkfDqjWpsW2vPr6a
         91SBz02znpgGs0joohA1TyjLBhWmc7tvTOJ8Ewvzt26+0hJpX/fnitVSipEN0mxchNPq
         p8a2FMePenViSbbkeejtHh2vXkd5jmSKVCL5d+v2ZCCchBVXDGivocSBRQJMHTE7qkgk
         FttPndLq06cBuejcEz2TJGw4tGctwAzAtrWTbsqNsF0XCnYOEsCkbptNvxfOV/ErsrC+
         NI444hTYAG055nSrI/fQfMN6J3isnzh1q2ssowe09CqRmxj57GPy5Pfema8FKuaTD7F6
         GtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQhhNqGfhWbZFQmD2JulmGACc/h156r17wAE0wvAJaOpVH6zpQvda4Pqb1SJ+7iduQm+GQkhWjpjqy+EnrtTX4EbWPy6C7uTkuQjS5Nw==
X-Gm-Message-State: AOJu0Yzd1be3x3GQ3OlW36Rmv50o8/89ZOvDPkSgn1fkkzSAkXfpTZTR
	q6lFBS7vf2w1d0mPHFHEYTZ2oX58gX2ZmnYzZcriQdaJRDZUuhS2qhLOxNzsaw==
X-Google-Smtp-Source: AGHT+IFJ0AxLDSRvjFb1ZMGrWouHQmyY7qI2KBszA3xQ8hMp/4DEq6hXhIgWD+DLoGqs1PoIzfFgPg==
X-Received: by 2002:a05:6214:4112:b0:696:116c:f00 with SMTP id kc18-20020a056214411200b00696116c0f00mr2359404qvb.59.1711190509586;
        Sat, 23 Mar 2024 03:41:49 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id 6-20020a0562140d4600b0068f75622543sm1998523qvr.1.2024.03.23.03.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:41:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 23 Mar 2024 10:41:45 +0000
Subject: [PATCH 1/3] staging: media: tegra-video: Fix -Wmaybe-unitialized
 warn in gcc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240323-gcc-arm-warnings-v1-1-0b45cc52f39e@chromium.org>
References: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
In-Reply-To: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Make sure that tegra20_vi_get_input_formats always assign a value for
yuv_input_format.

Fix:
drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c25286772603c..c39b52d0e4447 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -176,6 +176,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YUYV;
 		break;
 	case MEDIA_BUS_FMT_YVYU8_2X8:
+	default:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
 	}

-- 
2.44.0.396.g6e790dbe36-goog

