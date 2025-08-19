Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D733A03E
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605819; cv=none; b=EuE97wHDcaDbu3Qk1XY7aPOPLq/J8Jh0gqX3Y14sbvE9HWqrsFpGJe+2HEOrOg+qdBboV5zpmUNnlta0wnLGk0sUJJEuKDMbO4XPky/1mdeqNYqsNxWQhoKV2I1g4Z++wXnWwBfh7utO/7+LYVIIsjvtTZAlbkIy5Nk6+3fnCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605819; c=relaxed/simple;
	bh=87Z/cmYg9Ze7/UgPpKn9GNeEOuNlOtwsIr0hlMdHq0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugTss0pbyuMP8EES0IhZv7pR8QUo67oaBWLgrYpEmy5Ts/13gJvgDPdPFjHJQ48mvGpM26B/1t1PFcEpphw70nJZdtFvBjgqyqbOS4OM/6fz2tOQbJ0l6ZEMIq8RSVZahQoTHRgZN/mliKzW1/Mxo9IFqHSTIaTmqZmWkHDqWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBq7AteN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBq7AteN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb73621fcso608244066b.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605816; x=1756210616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fkU/a+xa7cLVNmfOA736vjbmCxRfQxiZ58RMOVvwos=;
        b=SBq7AteNLlUYrutShf0rySjJZVY/Xmr3+e59i+eFCwAQS5B+blDM7pksTq8FnZUPQO
         MnJ7hHdwWjG0P4+fn7dZSqLxQieBVE+dUSHyCkyFDU9lx0P2zJlQ80zLkR4NBpF61mCQ
         MSxmpTsiwEU52cnGX0Dc4sLECyMez+e2KqKvcrdOInGvMYLasE/iTfQhY8kbI5vuhbTr
         jXtO1n17obaEn7wDJs6Mh+8k3UyisBkWBFLx/IWneOh33Lf2vsdIQ0S4KMgB5gY4i0K8
         HnAihGcrPWr3ULffu9zAWcTcHKEhwK1wQEsQoHSoerRsrXaUdoV74YvPHCfSluJF9SXh
         Gwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605816; x=1756210616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fkU/a+xa7cLVNmfOA736vjbmCxRfQxiZ58RMOVvwos=;
        b=K4LLNrYZOaE/gEghEV5WOSHftZbxqvB/VyEdw/AZZj2G8dSG9N7+1ylyYblnio5QuC
         4CS7KWq7wXnXh82vAbY8vVtjh032QLXc5fuUn8McxvwlJAU0kBOZ/nqJHF0hJUHhM2hp
         oFKF6uY8T94Azk9HT65kEvILPSU10xB4zkQwxXcXteIcMq2Sc/RTVjHV/q9K+idWfqCv
         Bt3rm0e4knh2utPXBdQ4ZWnGaRbnXHbjPyLjsXoK5T7XrAnsKxBT5f0OklO1+1/kSMbD
         7Y7ABFzD1h7Sajd7VK/ruGN/1UsxDhqCWeOkcTWPm8kVkKSuQ7W4p0R1RJ44WqzBuOZ9
         ba5A==
X-Forwarded-Encrypted: i=1; AJvYcCX2JXuqZ5cu6Ta4XOLwF2GFSA/0E+x3unfTsnDgmxb1id/v6YxZfpB8HwbJscSS+/NheCmckwvmXUETcGIc@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6SJ1gSN38oryGqLHlImCsfzUmqtrEYKrqEzs+MUJ59RZd0S41
	YMeHBKpZj7DLp0r45KJ/dH5vwZkn7n1t663TlQmPYGF8XBwB6++s2oP6
X-Gm-Gg: ASbGnct2aGyUqeDQawETUHRWujlMOicUQ05w7bcqdvAEsSay+HeSkzl/lFgU11xlY4v
	QZZayuMxpRjsKIs3y2ArXTTSZIlQnaFO/CvLKD5naW+vOt0HkpHg3mzHG6Yw+S/+b7KbZib/44S
	33llc+DdcIYBGM0TgajD/neAXVnCBV+XQfogRDIz5mnU4Y3OvpmG1C3JS4horbyVBgKlmjnCAQz
	WxNwT3OBJsibFRg/0khHGMrtHOmCuf1NOjJx7Tg8lNc28tS4NWhWMudXq8caf2Uq9RMm9JlECNh
	tRMXAjFFVErfEQAhf3CXS0Cygmp1oB4KgAloYmkNY5mpW5wPufmUX7pbOmfeaeCEQPY4l7tQRfM
	gecLAiyuHcUI1uw==
X-Google-Smtp-Source: AGHT+IHJ4yXxyFDH52h3CZln8jXl9xdbMpK8BdgfQdr6A++kmO6oEQ+K4jjTD9jwnpkwnFwOUoSZIQ==
X-Received: by 2002:a17:907:d78a:b0:af9:36b3:d695 with SMTP id a640c23a62f3a-afddd1fb2c8mr241450666b.43.1755605816012;
        Tue, 19 Aug 2025 05:16:56 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 08/19] staging: media: tegra-video: vi: adjust get_selection op check
Date: Tue, 19 Aug 2025 15:16:20 +0300
Message-ID: <20250819121631.84280-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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
index 71be205cacb5..4f67adc395ac 100644
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

