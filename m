Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6E38C40D
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527388; cv=none; b=UYdJgkRnpM73UoY7LhhSf0vgwnGktoqoLDp/rfaYIOGJWHF30gyHZp9i+FKkDmR99mA0gsH3+hl3/PlNXE74ZjrUAZvRb2d2p5bxs41AVolnuoVJZLzSOhuc6RInYoTkyyGYuAbySLl63MU8H303UQiU0CQdzvj8lPYrh9cW1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527388; c=relaxed/simple;
	bh=EuXSZFPJCK7U29pmE8NcCmHCEEPhWM8lTnBth/7gT4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HflIsFq1q+AEgwgXLU8Fy+bGvzXFXBSER0l1vyzcHn5HJf7QFgwoxLbiJf6FxhhP/Vo22eByXWGs6Z4waJDYVx/wCNSS4+5tnCho7Y9OOKMJK0ksdrzlf4mgHD6IUMa6+4HMorpF+ZswbnjsbTds2vaEyMQiDb+5brAmCjkKWbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIaAwmsV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIaAwmsV"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-389f173b91fso92448641fa.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527385; x=1773132185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=eIaAwmsVRTheecV/StxjAfDdSwgf7gdG6EQqXMWMhVCP0ma03r4/8z7vimzAmS5ikI
         kzHRd3GDIdrIKxc+eCtdNOu/T28l5PK7M8RH22m4m7CLGi/MYh/mgKTFI3frGQssf6pk
         UORmLg1rKHVu/2yz/x9+FbSRQxkQWVMtYwL8mysGRQJUgCuA6haQTZZm3AmpJ3PO6Xok
         NYNSYuhzmYqe1RzlD9+qP5oh4qwsEpGpEv+HtI8KoteBztrkdphxDlb2IT5fb9CO2DiZ
         XSQ1T5DD4ZhpSb/D35Fqp9KhfsuIBiSs0/qoOoqjhu7hWT9oPXtyWKZlIE4i0wYRoVVG
         h9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527385; x=1773132185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=Y3icJi/Ltk/HB1VbKJKu3QKlR2BqvHzf/xER2tx43b4/CPbtgvaoJYEEJ1FaeF21/S
         NMAklkZV+WKOBcT8yhkaDh77ThwPOMBGRkSng5HyKL7T8tzqrNkthj/1Mw44dyiG45U8
         3K0yTRTLOyQnkHcfnsBzRNWmeYkwBRHbWGd8hLk0yDjWbi0XMjTB1FVWSBjv89TWwTLc
         xMQHpQHYmwBn4IVRdOzXuGsVI5kwQS4TPyzMnrQcer9Z6k9VE2KbGKqnF33kb5z4K9l2
         4H0McKcNOlEoTWv0fCqWkAO/NJyub0QfqA1ismP1p9mQeoSFtq/WPExXtKNvr3+1pXXD
         sUsg==
X-Forwarded-Encrypted: i=1; AJvYcCXZxwaHWRs/68of26RA56XcM/FmXiagPt8wXm1Qb/VbIZWk1766VlJTUq2WiLrcaSOJIZEt1GJq88foiWbS@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ/Qayx4BO0vF3w3lpGEIhITqeCOljU65HsqqEFXZtPLidvJao
	rpJn4tzyJA3IsvAz+3K/D+1haDRWhzp37yD/ZdZN2SqO/pI2rk/iVCC3
X-Gm-Gg: ATEYQzxsycl/mXX0LhhyDCe9CjQ0aO/7pxDWQdOKQCmpHtsYjrz6fACAzJPR1+kdMEm
	VLAPm2oGLiOGA8Gdhsicl6kFcT+2FtQd6rPQsJTsmO3IzkPaZLNH4zly81gJQukMnkaTRo4p1WJ
	AKv413JVovS8x6qaUvylX0mQORDA8WujfFgW34EaZrqhNBqmfxzrGM2ww/EACD/gE+XX1UX5d2e
	0x9V0aXadLWj8IgX4wIB0nm7ybrz3jVvYspw2vpbhpgIbB7tjWpVrZIyKFGFQXMV403CGpx7nXc
	YETxNa23QGMfC8SriXXm1oXDF9oEBDvVN3NKBrhkIHyCxdOpZFaJDUi0mSEQapZOEfvcpXhXE4s
	eV6J/qKt5hHxTHQOPuR0ON1o0sD59vyHjy4gZAfNd7ashAZZd5FOUJQl92IrYYMN4Z+z8ma26PM
	QthhMjkblirG03
X-Received: by 2002:a05:651c:515:b0:37b:9e27:89f with SMTP id 38308e7fff4ca-389ff363a7cmr102300131fa.37.1772527385431;
        Tue, 03 Mar 2026 00:43:05 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 11/15] staging: media: tegra-video: tegra20: set VI HW revision
Date: Tue,  3 Mar 2026 10:42:34 +0200
Message-ID: <20260303084239.15007-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b218b9fbc26..7ceefd920cd6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.51.0

