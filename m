Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE8C3502A6
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142921; cv=none; b=c1ZCWxwoPoUYcigD4cQdpdjcaxISylpo8sLuYawfcFvo5lEFJPKowiMGlzd0Mv4HUMRA5uSxW+qad3JSOY7yQLZbUu99tG0cQcNmNeK0XdNi+8R0b7pcmfn1WHoid/ugp3M3SvSy2lVkaCbNsdt7aCP+vGYF9FnEEOvSwopXI+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142921; c=relaxed/simple;
	bh=vH0xJgN2W2szoe//wNhYvtT1BAPozP86dafTWttSucw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKdKHuphOUOyu3HdrasLmmSyKhASMSgKesXFWk8Zg8+2Vsfoub3KlqMM364KMFMA2qYkm66lumWI2Xsu+Fiq4f/9DZEXgdZ/auCN5F37pHl6gb8Iyn4DCf5VROBoSvI63cIckxclJVclpXsy1VqSa4YGfi/e23zKTEN8Szh6sYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXJsbwYx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXJsbwYx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-427091cd4fdso3418652f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142914; x=1761747714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=MXJsbwYxtwbTUOkHKnG1qACUVlp07RyI0iqbOLKGog4XTG+ilrYimb3d15Ts+4JYXd
         6jwcFHlord4qHjYmW6gfpFiN7BoCh+S7VaEHQEwfO5BTHfsh4bL9r8QyXTv64QudoRjQ
         l8GYDx2h3UmMyiRBp5QcJNzpjgY4K9aww7YLPPrvP+y1oNIAT1e40reshs48opU0dZHr
         aX6lnJ0wLKXaljZYKZBb9lcCtqSAL5lW199sNveTx3Vi7QxyLszP4JMpEkfw0M2P/rlc
         1D2EPwBkH0pyni0BVsPzPdRhZhW0f2H3XG5ArShEEuPJDFx3QQXpzK4PiFvKDu/LEq9s
         ROzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142914; x=1761747714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=I7JQUa5ilpwy9dEz0X6y+X2+dg10JW0Nh5hNjZhrptKJ3cKR4UGq20vZzGbgmkP3Ew
         7pW+annxB7v04yLN7LI1jySk6X6jiVsxtGT30IvBGE0k60lp9H88crF0+uZs2UQhvH1J
         LlmQ1Sor30IF8+Txm7/bxOl04zO9kd5XnjJcUvxAhCXBA5JHen+C0Aa/x5isn2lrheEa
         C/j3aQqN+CAiV/3ClCMReM626bJIuVjNceeEL14v7+hxmlln1PVitwPAQrE9Z3ZNaQjm
         zJvHyu14J2zZovBLFgwkx0idMzTuI3DiUjrTZxTZQWOMaR41aEzsF/9JcOfoxE3Sj+g4
         mXpw==
X-Forwarded-Encrypted: i=1; AJvYcCWtc851facoqD8G3tY/3BGMylB6KUlDV7HUMBtL5C2JMtNpwL43lvDFRhVpWo3fh5IDJyuVGT2rpwuUqbWv@lists.linux.dev
X-Gm-Message-State: AOJu0YxLye1XXNWVP50mS6sKaaODGQVKq1K9WDA7/0X54vEkBrAG9dlB
	CsyyAe+FJO1W+bWFaT9m2B+6nF+zg8wQFpQqrfz0CvxsgiWPvXHVboy4
X-Gm-Gg: ASbGncsxkrgZYVHtR3ITO8is96QSWCRZciB6HQFAuFK2TQ5sMRH3aO+cUePopfPoq4/
	/6bxQLFvg2pdxQn3Sape96EEsMHWhT3gWIrnyGjUWq9OoVhN5WOOVMezxKdLwpeA1uGuE+/Uuyn
	010bf2MJxWX6csbZUpkZZWcB7/fJx9qlILGtDnU4YhymcvGwp+xl5Ksa/AP9HrU+a3OcWbGFmQH
	47Bf0dUaNKxrpcdPrSVxBcwLWQshnafr2pajuo8JYNsC54Qald1mweesBISrprbcrAkPslbNxFK
	R+HAWlslWp/1QWerc71TpVN3UBFQZxIAvAA85MXXQAtppEU5S9ErDHmTFjc5ejhA848pkWeChYW
	6OvfkeXgRLR/8n5OXbB7aaCwbVFtZVK/YeYBbJGHCiGPOE/mieroZ7CTRuGipb+efiNI7DjnJ+L
	VI9g==
X-Google-Smtp-Source: AGHT+IGVyh/0Lq21fHxZjLwl88/dShL76QWY1ZVpGVbU3hFOea3guFlvCdv+uCzmXqru7Kjn7g1lZA==
X-Received: by 2002:a05:6000:612:b0:426:dbee:3d06 with SMTP id ffacd0b85a97d-42704d55398mr14180974f8f.22.1761142913609;
        Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
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
Subject: [PATCH v5 17/23] staging: media: tegra-video: tegra20: set VI HW revision
Date: Wed, 22 Oct 2025 17:20:45 +0300
Message-ID: <20251022142051.70400-18-clamor95@gmail.com>
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

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index ffaaa2bb8269..93105ed57ca7 100644
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
2.48.1

