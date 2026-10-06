Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E132AAD6
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269535; cv=none; b=nV3cuIlX+BOUoJd8+cwYgDA2sti4MbsLch2RNgI3+e2fW/AQ+xATZ7U15PSsfvKRktbmdjQSBxN7FQZOwcZHB9ziSGjy3kjruvS+kulVbgVWMbkFzDyS7ybwolaNqAz5putfoPhEALgx/b3wF02cKPEeqLb9ww1ZY0oMf1oYEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269535; c=relaxed/simple;
	bh=sXEuhuPbydIc2hl07e1Bu/OzsVyrxTFy5iWRYniIZCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEjqJMGZi7QKQZZ8WhnE5CdWC9vnLSmYPVwHT1EUdwRfSISc0IRcCB+VkpN1d/pOJZ9evux5JYMoTRqVdqjnmLaX9ZjauW+gQD8FDQUJ5jTjxWmvhIoR971a1mwPGqtRIviJhrjm5x6H663DJYeL2DfKq7GiS9xTA3YZoPc1hrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLdrmjJL; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLdrmjJL"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so7841799eec.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Oct 2026 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269533; x=1791874333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=LLdrmjJLgE/MPj8uIpIRzalKKm88TnZQokPYC63h/OgIJ7a8TrRcC3j3aF9LzOmEIA
         6VR2EoiSsfwrMQrlIV3OXVPHWvEkDdQ/hxqjGrcormrlkqSDhzgjJrllfTI001a8dxmp
         dLD2NC3Gn76F740jHjfXpNof0QldG1t6292dqycF6QMD4Bs5WAxg3PjELRKz1TjvZGZr
         lWO+3q40p16Q0+Q1j24zR3feYb5mZvCkjF5sqREKKc/cLq+FFV7Hpl7UEo8BWoVJfg1T
         vO1psurvNXLxhwjH6nWorMjTunbVi9KYiDMwW7nq21F2lR+Tn4c695nAIlGsHO/TIsbW
         3uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269533; x=1791874333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=i2hYMorDTwjqMqXJ1/5TqjimSGDg6/ODBjdIw7BZnoP84rYr3Y7wTHog3qNmqg3ygx
         e8nYzoiXkMs+dS0mx1qOaKY6uR+UgK9aJdNwdt70s7T9bmrML8ka808UIUzKrvsdOk0T
         kbmablwa+FhXVF3W7hFGLb0OyeHkCuUtGXVHBSpK4CTU0Qb4EHQAkVCGTrM/jaJjRGEC
         /A6Fp8xDx0Shbn4S8h4NkqqdV/W4p7B0upksGAY3KVuTEyLonno6Ar/tPJrO2kHU1Z1q
         BMDSCvUH//pnRcikge+/3hoaMnwvKOFOqqia6HHbNOV3IWC4Aa+Y8KhNd+8hxXk/DOWm
         M+0g==
X-Forwarded-Encrypted: i=1; AKwUvByIZca1e4aVQJ2VwMxDxLxErs+ZBg4ZnIc5LHN279o9tD0HxWehZZRk8GeaMocyFlSxVHqaDZ3eLuA1iZ4T@lists.linux.dev
X-Gm-Message-State: AFuF++nm54w8nB+jnsM1Nbl15HkSvMR28YqepM4SVvwWMpnA+y2/WJxv
	8iJQnzUagmuwPLI1s+FoDsoV8yTqZPWjAH05IrYj0IhJkJbHAB0QoFfe
X-Gm-Gg: AYBFou23sh1qnZScXABXhRxpQbNmjCPZHOPpasiNEEIqESr7bJDGLnL7b0ytSJGcOFB
	Q+Li2y2hs9fL3pCLyKXKU+IVFzClupbNe7UXFpUtGEC7avBH1XWP5JLvCjBAQiNJfV/zlyN3qJs
	C1RYIWoJjp7IcM/7XtoygvGHx04P+LFiYqy3C5Y9AnMaF2uOCGukaFNpqHojwiFUz5oClHQAXiK
	T51MBP3gdUywWuqJBeEvdAbp192+fp1/5loySkwjBErzOIL5sOrBQMqT90sJA6a2X51WAdL5BPs
	B95KHDtEIT8yvHhHZsWHDm9BpA24WeHrCsohWseerzcFEUd7OhYfDHzQNkg0YUtwv1H4S5APU/i
	roGOTPXoNdYyOFEk9mF1Z7HHnF+YmG534wCL1WPNJhxsyoxOwYwNhvOfgj+AkxocDHpolsFAwWY
	aSEcaWV7Jk6AoUSj7qG+g8foO/lmMR5u3uAsc7jYZ2NctWserqLYLpWV7wjH9Dog==
X-Received: by 2002:a05:693c:20c8:10b0:351:4bff:6d6b with SMTP id 5a478bee46e88-3514bff6e22mr859281eec.16.1791269533292;
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351468b2cfasm6306463eec.2.2026.10.05.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
From: pdsj2807@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: Frank.Li@nxp.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: media: imx: fix function call formatting
Date: Tue,  6 Oct 2026 12:22:00 +0530
Message-ID: <20261006065203.3645059-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

Move the first argument of IMX_BUS_FMTS() to the same line as the
opening parenthesis to address the checkpatch warning.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..978770cf3907 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,8 +16,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
 			MEDIA_BUS_FMT_UYVY8_1X16
 		),
 		.cs     = IPUV3_COLORSPACE_YUV,
-- 
2.43.0

