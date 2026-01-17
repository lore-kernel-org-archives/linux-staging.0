Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99037DA66
	for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609974; cv=none; b=QgIKgucx/MoojESgmnr1UFcMRvl4QDJN7eKIN0cRhVlfzAXSNK9O8EMvs3X6KINzostoLXkqiDnOg9sJOSEDfAO06gCk6jBBOg24+j+FlIM6Q3tUlzgvTs7FWodzqKsxcGZ9bGSxq7zQnCpOSGH825gDSCIm4IZ6YIue1NkUMeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609974; c=relaxed/simple;
	bh=kIeB6j/N5+LCrPUbz541JOTO0YZVR1wj0iYYqzqWfrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gG6h6sarHFXPyMigIEJkidmM+eykTNPxk8Fgh1BftNPgzU0REueFV3xc35zKhbwNwOqW/xJ56/MKLEVwHQKbKkHOJWMURA9/SMflq5v5lWfJ9FqEtf23qZZsErx89h5v/LWcMR17SnjgIP1+YfGOJDTe+MPof3FANhz3pz0X2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoPYVLd2; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoPYVLd2"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-121a0bcd376so1801074c88.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609972; x=1769214772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
        b=RoPYVLd28ul1gC/Nb5JdWXN/kAzlMrLvt37ZplWp9vTKMklYt6QMvUo1ig25WezOgO
         wz5DusuM8adYpz3QLUyt/WCorMBFGx2xfc4MnjR2rbgmMUOWeqZXzpmAB77f3DQsTBG9
         5ryqzR9QftmXuictpZJqz6ODsujXy/8YrlaWNWkRyJj1hO2dszS6TO+wvMixGANm1oMv
         zPo+RDfULcTE1q12cslCXJEqg21Edmdkt9LeTZz2BwOzDf3hM9PdaiDg3cy39BRnBWVi
         4LOb3jzYydc4s861ZEh7+igTjkgvDbZi537T9KbmLxWPfW3JDDm8Ndij9gJOSkFxpmXq
         kwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609972; x=1769214772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
        b=EppC+s8juEgDbu5rAuSvJM8kINTA4uH8QbjxwY/qAn20ENmYnAGIjR7nbLz42Gn43P
         1u8+9AyQA7n41uL8YaOOfGxPQxvoAKSQ8A0KDgodj6LU2d5b6o20ObZDVdaUmHMNsal2
         K2gRgsGIDHcMGdgeUf5LzUy9G/lA4aMP0LwQwSGBcWhwrXXapThEKaqi25BChhyTnoD0
         NZsddn4VbfBnhO+YCGXBmbc1yVEKM9gfz7rlGBRcE85xdjuL6tW6C2qzBVpKIALrAM2A
         dG8frVcrwUF6PMaUFY8u+kvjUWgTNHKtb0EWQtw+9SclwxnpslDM5xGaLXqkHH7K+xyw
         Ol+g==
X-Forwarded-Encrypted: i=1; AJvYcCU1Z0KYVGRo2CCvJOkaRs9uVBSpUZ/wbgRRqUIPI0BUnG9qmT+px3jjrpPD/of2P4IHQ859CFvWfyPMCcc3@lists.linux.dev
X-Gm-Message-State: AOJu0Yw34PWlEx7h5M+SF/dLyd1ApGFOp8Z0BfrqBQcIzM3S39rZw0Z6
	QQeLHLJNTLvQ2CTWSboTUuScEJBvdGnmqFeXrEy/cD7YBC118dvB0+zl
X-Gm-Gg: AY/fxX5+A9A0dWjB4hAH1GvuqsDRL9+f0CJO7ivIOg4k1TaGpIcvXPDzXdF0lflpXM9
	6IcjVTmKjLC+kWHWkYqFeXNxz30CGTMqFghLJkV1wC/hTUVEH/xpkPmUK9rmRLVkYxL7pklu89q
	EIDUylsitF1Zoao1Ih0jqQixrPiIoQm4UDZj1mKEiyv1DM35KyDHxofyezfl6mIZ7yOudxcFBv1
	jUSvH+9OyfcEL7n2tD3i39VN4MMYC76UYxLKVziMz9Nt7rSS8Xju2xjUddbSFOCD+tg2RxwCxs8
	1sEfEbFwTtYmDG2J3FO2gTsOhTy5hAWGD9FNcM6bH1Fx4Ft/KNmZ6mqT7k1dYtrkd+rS706AnQi
	yqqeqUAkSDMEvd3e93ExvgQJfu2M68VGotPJadRyKl+yBxPQgtgIcKOktKVXjPDtH3kZYhUlfpA
	RvN76g/OvZgDUtvPAITVw356SvpEWMGN5Rxp2E4qk9lSgxGRBOZ0+hab3ZaLFrFpNcGZZ3PQIaz
	pl8Pvg=
X-Received: by 2002:a05:7022:619d:b0:119:e56b:c752 with SMTP id a92af1059eb24-1244a73c91cmr4320247c88.23.1768609971804;
        Fri, 16 Jan 2026 16:32:51 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4822622c88.16.2026.01.16.16.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:32:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:32:46 +0100
Message-ID: <176860995606.1697785.9777722896876428268.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[01/23] clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
