Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D77EEF8
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376399; cv=none; b=o+CAMwQrWVBGG6IGGrErqOBZIep+4gazQNFB/50vvhtN4++wWhd9Oqn8M0sPJudj0C9uWvmDEFWPyDxePuNijKYFepfx2y8gewHtUfh7k3Ma55ajINnF8NmgIbN5j1ucbFoCbXIpJIqqM8UO7YIiyR46qKNvE8T33/XRf3oGyps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376399; c=relaxed/simple;
	bh=SydhYBUNZqt6seDV8GSPes7otcagbCoXjH+x0l9PSis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSzJxR9ca/nx9bImFnVkt9xZ+RsTIURqVuP9f207HtDhim2b4jr5SQ/9FbPxfjw5vs3SMdPyWkKcV116i7svTPsoFA6jVYaDHEFbiOFwiCTKYT42XO4dRdLvO1ICqr7Ry52B58l7knWSOUSyk1Jmf9ZERrZblIav+c9bClTMduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xy8aeqHN; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xy8aeqHN"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-430b7b22b17so30812701cf.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376396; x=1711981196; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=Xy8aeqHNwRuQHJo3CYNIKwh0f9NRJ3Ga0h1Q0eMU1T37X3sUj+psjM76TzfvbtOvJ5
         ep9z5/sBUIGEvNFa03k802bG6E/M6afH2N5PHCZkg4R7aDBUvBspMb9KlIeRXclYVy/h
         MWwbr+WgH4D1uM+JYPa7KGLsBsZ/o1yIX0T9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376396; x=1711981196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=qBgt2CY3g7dLfzYeIWO/L0GqiaT1Iy+qOqgmuxiwlJOIs4YOkHCaSWsroM3MzJVX+P
         zUrXSYjOrWWME6oKMWsLkZYrsX7zs4SRuf5MTUwd7n1aUWXDMpB+VIPXj6m0O8EmSRLV
         mo2o1EWjr5a2vkTC26lSSp7o8JgTxxITnlJQrBoSlCwpsS9Jy+qHHYBsPyD8USyZCj70
         AbPjBx+mV8CoYSTf2DPYw4Xj0dlvlvdhwID7eKVWMUnWofLNNcZ1G+E3FpfkT9KNwpps
         P+uC7NOqoqv+zajiYAAlNLVApVHHBsod8b5ShiY84nJUOqPRYvlvpzYso+0frf+monNR
         9MkA==
X-Forwarded-Encrypted: i=1; AJvYcCX5983zWSQn6VD3tjp9dygvzbkJugPqNDSL9tsF8rdyOPApeO0UC7owckURK8Pp1cqoHEWJ42eM1ZefO+DHBEWSRUhqvYkwPWKk+MRQDA==
X-Gm-Message-State: AOJu0YztLAEzW9wneUfZ831VV2uU/yB0KMT6YmIB+QnCtKREz3SR4xfB
	eITvquWuvqLYf7Ld0qI3l11eXWBgPuMnRINKkVw553GQmQ6EGpqN2EsY9KKqyC7QqKgb5J2+hnZ
	0FA==
X-Google-Smtp-Source: AGHT+IFEBffHombxu9VAZkjJQI0jb6jvl5jRk9TPO0Fy0y3nb6ZId/qWKdNbjlbDsQjikKxzHMWPyw==
X-Received: by 2002:ac8:5a09:0:b0:431:5c20:f0d2 with SMTP id n9-20020ac85a09000000b004315c20f0d2mr2279132qta.22.1711376396512;
        Mon, 25 Mar 2024 07:19:56 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:19:53 +0000
Subject: [PATCH v2 1/3] staging: media: tegra-video: Fix
 -Wmaybe-unitialized warn in gcc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v2-1-47523cf5c8ca@chromium.org>
References: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
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

