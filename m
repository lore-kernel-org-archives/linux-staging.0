Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C5433CE9D
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605808; cv=none; b=p0zf0SjTzkwQaicsObHxHgKlyZhF1ZOpImiNqG8sLNECF5RqD/Al2AkjwMQGh4bwRDB1s9SH1qidImlDpt5iND63MC1ddnQaWKy9kxyv3n9O0Ox7mTTg5nbzURpNj7HgeBq1MgVlCuPnMFeZgH8YbUgXc5Ibz5rr2Rpdz9U1tCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605808; c=relaxed/simple;
	bh=J29OlXcWnov4zepEBMUdze8UQOIYB4NtqVr5tKZ7MHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIUF8aoCq54uf4n/ux47WjD8XCaI2eDIPh8bgZkRomWBB6US5TzAjxrCZfYPINh0+Iz1cnv8w88nGhJYs0xzWY/AvnHXER37v47Aa7essW3k9W1IJREDxJrteTgdrA1jTDkuiQlPmteStce1OkHBxuK7L+F8CExwYsNDrP81bZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mByhYzgf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mByhYzgf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb78ead12so736325766b.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605805; x=1756210605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wPpJDpKwCk8DlHPLkdpXMZ7CU88+N5YZ57h5JDdv0c=;
        b=mByhYzgfYRFbrYTBy1akZctPrazSHsqnci0hCk821uMpTwotXlr83pqP1jeosXZcv+
         lFb1VUPc7Kn/0SW4XSjVXw99SAr0GBQ1T/cmgUOilTFCUmkDKS1gpJ/2AMmTGgrmqdXx
         RhG4RrbrI4QpIFzIUNrvl51TqjdkkF16VB0JPIhh3zL/0oFsLJ9fEQHAM/8otQ00yqd5
         y61wamTTYeEy9Z0+enXrllwf8Y/yYGODzBO13qNxryp6aC6njLzn0cd9ehqFiLXiha63
         po5WPr4EhJkphuKu0RfQZiMddBT0iT4bC9JBr5FhGs0TY7x9pjmYpymICpsoznOb0uoN
         Zk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605805; x=1756210605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wPpJDpKwCk8DlHPLkdpXMZ7CU88+N5YZ57h5JDdv0c=;
        b=FIRQWM1r1FTchko9BuP9tPqQtavTX13/2UN+++3xSTHuFqP3qcyG+dtVqpITK5mFwX
         YyLx/uFSDwErQtwiKOitp3xcrgv6qmhT7FLPXXiNJ5VAN348762maesJbM/+baTXUfx1
         NzbcK6wJDbEADqOIgpS3eLB9KfLRTB6BYbO6OU8cLbKEc5LQ7+ZTJC5N900MUMXpvaDO
         USNumyyClNs1FgSZwFUWDap8EBRZ3UGmGN2s3IMMLcpcpDo1lUUNqIkK7hK4Bc64eHrd
         3G6cGOQgagLreCupP3G1Q5rE7guACBokZGkdpVTm0WHGl+Oe6L42UtQJ4QojqdjUohof
         Q9mw==
X-Forwarded-Encrypted: i=1; AJvYcCWJezUqSZJKPWPkWr8HULWKpMgl/GW+RkddSiipf57clcWN/kyFonmtEd25PZIIGM5R2T1QhuUvqsseRo+O@lists.linux.dev
X-Gm-Message-State: AOJu0YxaP/7mOv1hUToyxrvVzgFQ7UbhBvNN0OJfOFeWE0eilNqNumzY
	bheThDmKX6lIFa3s+YGUz3RVRjOTtu0VIVmTqVjV4Elul4A08AUCrFm1
X-Gm-Gg: ASbGnctBjuoAxszss1zfK/Z5Z3DfRr4fHWzkNz6h5hm4HEuvt+EZTrpm9cCkY78ZQvT
	UQI+PtSfH1cV0w1qJOMhwYUpzkxptsE1/oynmwsVK2DXJuPl0fQ3/ji4638duriwcxug1Y5RRvn
	NI16GXh2UVyfUUsDAPYsEnOwlS7om5sTqTaBw4mfgY0uP4IKSnqLyJYr5qMwm9l9/PUN2JtFXLe
	yEixytAbjLqZc+z1hBokGPFth6dI+pHussru6+GBVpraUi26Dt02NfqK5MtOTOQTjunmbpJsa7t
	xugkRmRz7JaEcsfGVFzSM4iqV8FG8UYxBZa7wBco2FMJXWMB/igEtMuDHuA3Xv6XT+yeqSsisyC
	UHMPVdT2ix6namg==
X-Google-Smtp-Source: AGHT+IFmaPaAq/FduUBB1m9MQ2NkpWZueEPAYDNEeu+6/eKSUzGZ0f4FXW8JsCOBd9mrL2w0lEtK2g==
X-Received: by 2002:a17:907:2d25:b0:afd:d994:cb2 with SMTP id a640c23a62f3a-afddd24961emr211057366b.64.1755605805046;
        Tue, 19 Aug 2025 05:16:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:44 -0700 (PDT)
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
Subject: [PATCH v1 02/19] dt-bindings: clock: tegra20: Add IDs for CSI PAD clocks
Date: Tue, 19 Aug 2025 15:16:14 +0300
Message-ID: <20250819121631.84280-3-clamor95@gmail.com>
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

Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 include/dt-bindings/clock/tegra30-car.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..14b83e90a0fc 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,8 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
+#define TEGRA30_CLK_CLK_MAX 311
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1

