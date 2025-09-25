Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA463009EF
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813446; cv=none; b=kNZkC2Enn4p4sSZ8YeyGxLMHpLwqTMiBTf+jev9zgv1HnHCvGT7fo8VDAiXbd6qyuNvIvwjgRvYBXkHMgbbybBsS4ka8VuVSLTFvYlYkooZduKAub1JyxYiYxVszYKAfq2/1CokB4iQmSFBmBkptEu2aFkfon9moGcD3dvDcT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813446; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsWWc5whIuqe7COrnSNQZSRFBIg+aex2lhawNa9XoXady1ZZUwMpGimtGgPX92qVzzrcu7w75TW2N27rl5fJTK2rA0JQP2CTmF7J6uQt+JovkDiFhQsWB2wqeS4vi+Shd24+xhcK1BUvMc/O4YRc0GAWYDU8ROWNX81DmgBRcpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcNp1Woo; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcNp1Woo"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57992ba129eso1244644e87.3
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813442; x=1759418242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=TcNp1WooleaAzdl/ev1ZGFp2wP/AP+vWQLM5eC+TE/sFTlIoOnYD6u0Kp7lz66JTjO
         UkUHlUQtHidXxZybxdPAPHgzfs6WVLA4rf7i7SK3LvXqCs1GHsBTc4euNsM33QBHGgQy
         z+OTG1P4bx1d47eLKnJEab6iVDxJK9mpK0EogxCsfs7C6yMCnSB9tdz6f4kzmfqp5ATu
         0mgGSGaFvmCak/Vgib/4uxgsHY7mCG3TEnj4sKcZ3tA6eI1dqu8kugnj+EJ8QLgAWT7n
         Wo2OXsXGWtSS16UH3MZfOpM0QGY164E/6kVSoAcPbkgrBJSLdQL6gesCNXeCclg3SMqg
         lFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813442; x=1759418242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=C3ghqH4NF2xEFPhYGgkOdKcZICdBj5+yPyaqDCaHeraQvRqO4I6QULpkybir4yKmt6
         u6k2uNnJeR6A3Lm7KHTu8mlV6SYbh7JCnAaDnsmOJSIpnaQGxx1RTJ0NwEF+duwQ/xGm
         fpjF6YTRdvDRsa1Eg8s9yKAbavQcqGoqqKCtCc4gF5Fz/80tbD3KyNntg2Ow6Z2EU9Oh
         II9yYIki57BRZyBdfIT8JI1fYFOOOCpujSl4Vg6TlALnapuiWyzJnHe7YDXcV5JP1sjQ
         7Nk6gJ8ZhY4ShVxqGVdAlzLYV/PzdBnUjU4ZPXYCjIHK/U5d9Pk8mjrwqFDWOPJ9DZeb
         Oihw==
X-Forwarded-Encrypted: i=1; AJvYcCW5e0DJE2dzyjNZC/4BlzX9rPGOeIz1/uRJj3Z/j36cMtmrZgL/nK1cnGsZl1QzX40+dlaHD6WI2dadIg79@lists.linux.dev
X-Gm-Message-State: AOJu0YxmgZ3SRyIfaBTVR5615MJ/ujR1y5GaMoeEaJgPwi6TGiGu6fsb
	m6S6bGmrdwyKRKbC9k+9mzu4oMZxflJ6kMZDbbcCrXPaeaJCrpXICwRu
X-Gm-Gg: ASbGnctcQIKDdIUOGgu+hZeFkuKXBO6RS2lbNLJmtLdig4mn7Vx9KKZdW3Bu/2rHcwB
	OUQl+EH29CVkIAcpXp3hAY2JazQrybWZvVgA26nAxlWepSGUYjpA+KtijGLiWzWqRZp575KRrV1
	XvHEF9Y7F3RJUh5+MP3OURtuXqMhRryEITl7OL7OFsrlnMqLsNREQnqeSZMedgfXPSwBiVjnGo+
	U796uwavGQ/TnCSuTrpjuhYIJkreFQv6kWxZv93w6KJuQuktMT8UM35IqLwEPfSRtj4HmU9flKl
	AdkticPSp0KgLHyNsbDxTMt0fNYP20ykPvVbnp0wocm1BS5NTo1CXt/+qGQcpyd/Pc0CrfPcEvW
	dJObRzYzkJWbW2A==
X-Google-Smtp-Source: AGHT+IGR2iv+Kh9ab2Gm8gGsLzPj15GIU7TA9oRp1epPRzVsSpV56VOyWvYjJkH+/G6EVhjFNycXFg==
X-Received: by 2002:a05:6512:6d1:b0:57e:ef77:699c with SMTP id 2adb3069b0e04-582d09297aemr1358949e87.3.1758813441925;
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 06/22] staging: media: tegra-video: vi: adjust get_selection op check
Date: Thu, 25 Sep 2025 18:16:32 +0300
Message-ID: <20250925151648.79510-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

