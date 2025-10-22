Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F834C82D
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142907; cv=none; b=ndez7OUaeHya0p46WthjFuW/9sFGg9+/ogTF8Sme7CczB4S+VL1oJMeVycH/KT+GQunVBrWUBYNIjRHdPJvFAw9ojyJx2nyCPim/FzDlz/soMx5GNL6uWUJE4qDVmV+XJ0wHmWJ2MazTLYVjP1rJq0qA/qt/OK4yCodNf1+NCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142907; c=relaxed/simple;
	bh=NPYq2prUDw6E4LwASXaQMdEqr6v2oIwItNqZJN/XQxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swY5M0GBbvseOiJ74sPIBpB3avmsWQRQFQbef9/8+MNnOwti4ISFRlOySnQDonbnEtOH7Dru8I8x1PoBGKd8UP5cSQNDANwBSAEqikt16XcclvmUJY9RmeevoVeK447zX6KfYDVlVV0LtFn9DfZ8mB7W1NUajz8SPh6b6ipGlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEeienBC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEeienBC"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-426ff4f3ad4so3742488f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142901; x=1761747701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=TEeienBCV82DDMrXBi6x0kTwEMsTSniBs5bDcR6zCt7X7GlkFaay0qPNVCnJZq49+p
         T2C3VX0JaUOtT0exugfv86csuoJL3L3Bg8/uhMYeZb7Mwh6n+EAYCpASr8/NJoJZOngL
         1dHD9Zl3s06xbPW1O7jaTYdQo2eAaLkfYZFX88SIuP3RWZo1F8H8LY3gdWVoQnte4hJu
         e00rVIrgGvcKuGDRkxuSYW20ihpmKrJJpT//L5hE6mhT1p8Gu8U5QGZgK9h4dCKVdIYz
         8YJBM1nX1dn75TycvtjkLXU4LYZxLbylat0Qs6Sh0Op8lDv76HzWkW7Nrzm+mtMLGINt
         Vf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142901; x=1761747701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=gfbv6jmVarw8AMPwes8YhZc+9qb/SEP7dB/7ikjkNevD6Aik8inanCbHOBZxTsTq+B
         8du6iJ+Eufy/5+3DUCe5ncAfP2k61K0qHIK5/SSJI3O0/DTmQfRNC9woFM6uD3IlXLER
         k6FG/iz/mFMLGr6DD5icMk9Cx8nF0mexeRTGIJN8I6gGh+mT2y3GiCAq6DRLD3GRpwZ+
         ro5RZFisyHR1D4PGtdkYgXU5k0+Nlzsop6QscLcCtOiuY6I7EuCuyl3kAhlf+b8saZYo
         9Jb94uY3KyLO1bqUzl/04T+ASvY2Yo9iItb8adXAGpx3QI7kjXb4Ik8m0wT9CmGBVqxf
         lklA==
X-Forwarded-Encrypted: i=1; AJvYcCXXouagA4GB7zX0Vl3Mp40s29g53mOftim+Hducv8V2+kokEYyjEv3qh6QGeNzDzNInq72gv7ykOz5+EnVX@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbdo2NuZ9omAHdIlyU6u3FpPxwzlqXAxzBJYs9H8YncZw2yWg5
	Zo3K7YrqdEArb6ZXXkfW2BoLa9OOQnK8wvgNRCBJbrzJwQrX/VJaTXiY
X-Gm-Gg: ASbGnctx8pU7KCPpDtc0GzVvxtBMGrLYT34zzeWuEmeP3Yz8zKuxKx8+3okgA35p5d0
	fCUiMzq4YNAnVw07WUTEcl09aYo4uqb8FbpHqCG/3vGSv2mUvoeT9QwbudNfGRwVCk/I1iDDJtE
	SGQ7nefFK7mpTE9r2MO/maO0jHLbQSpFpMCBKYq3o419mkqrkw4n4GVVwrsD+uLpl4SLvoVoHlr
	iC8eXZXHfgj5Z2IyhXdsZHtuKm7yVihKYDbUOkxWNMfxuhJ+jjiM0hyYNtesWvdYh9fOZaIk9la
	0C3/2wiqIRXPjyjwnDx6lNbAORIPzw7l+2iEl802ZRC8yu70v1CrkL372gsmO/D6o8BdpcAq1IV
	a0zpKwfvD4r4XWqvOeTx3wO4lvLoGsDB3jlmpucd4WPDgVnM+MiL7sAb2tfgi3rImGz8kWlS+Ak
	UBeQ==
X-Google-Smtp-Source: AGHT+IHM03V7eJFt3Eu6ja1MYetjG461AcLXE4YT5HRjXzs799spnfwnfQrFSdx7t2nEB8DurbecfQ==
X-Received: by 2002:a05:6000:24c6:b0:427:928:787f with SMTP id ffacd0b85a97d-427092879c8mr10794030f8f.21.1761142901362;
        Wed, 22 Oct 2025 07:21:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
Date: Wed, 22 Oct 2025 17:20:38 +0300
Message-ID: <20251022142051.70400-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MIPI calibration device found in Tegra132. This compatible
already exists in the Linux kernel, I have just documented it to satisfy
warnings.

Each Tegra SoC generation has unique set of registers which should be
configured. They all differ, hence fallback is not suitable here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1

