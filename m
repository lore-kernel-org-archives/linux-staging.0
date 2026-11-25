Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606000;
	b=UP+JqRB8YqaaSJ5uH48IUq4u6cwdK6fVofUl7XtIP2OCG9Qiw4/itgoZLnEGUTVHobmT
	 H6oIF0K/IvGolDSE2rHcr1LAaEKOy969+901MhDFrcko+w8KXLxJOfi/bb+C1ENulEsQd
	 7O/zcMDN0HkPbLXBsUvaYgt20xbwVrwuES9qFD5QDAOUqCBPJ4BZzoLBW9qa3/ubDCGKw
	 NypDpE9mIJpfRJvtDuMbJrFyDmniNCAmfmHsURPdTHw7LI6fuwkUI+AGkZhgByjTBv0jR
	 7t0pb40sGqolUnP7a46YCXJG0AVp+N/2KP6R6Nq8cZBu64HfOWjyVA+zx//05rb+AZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=fMGUSv/8dXaizNcf9Y2JpGUrCk4Huyd6uPZyG+XfyO/hgg1HoWRCof5DKxHWxYunOHg+
	 tv2zwZptiOBrzvUFQKF8HC7vx8qJz+9tOdUAK8zbC4kVVbnBU+F1N0XMfPSRpOCHxLcJZ
	 gf4kpgPvrzjlIKVGjhmouCUxP7DckZMvgwr3obJ79pnnXtH/QHXfFbX1mzJnpf5x/esNW
	 IOt7PI67g7uiqUA8wolOptXl61IazIoKXp7OlKXhHr5rwNkv53oIP+ECNvxeUVzGSQj/n
	 xmsSQLx7i55OoBAZl5+Np5Ntlpu7ZH4E5xV+yLC1kuDZncjIoGWvnBYAGcNaF8Ls5kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/XZLjQs";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC260A3829
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FC260A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/XZLjQs
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso7703206a12.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605997; x=1796210797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=y/XZLjQs4hWMJaowNkeF4cQshKVd7tcmWHPAP3FJ1+n3dtouasoGRsTkgfeIxahwVU
         lADYrJjKnq3o8jmetLUfg/oTyT6kRVV5+xYHSYJGS9K0t0bXG0yejEiOQv/tmzPerwDL
         UerV/22hVer16Fay+sxKDd23OD1rVkqyeVyqifXuN437LywtpJmdw0POYGuGgdafHyLK
         Tt6ILyKDDsM+EI44lf0zjVNM6BjjG9WJwy7nTkKQTJ2SGDuErsw0+CBIrSWEwHXNMXjk
         LU7u+shNyEQ7VxctrlmVMDjTINXtI0ZFQualqcEeGvbdQ0CFQ9mG76oMkELPfr7kKPb4
         uVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605997; x=1796210797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=MfW8s0z8V8eVhtSbPHaaZBxSFeZyTpBZtwyHW+LsXmUALWNZjp8KNfYgU5GvsfM0sx
         BAVMR9V4tHKcIKH7u/KdDuQ5dVVvrhXGt1BdTiwww5HY2SBcvSUDBKWH0uO7GNW5/zmc
         5wenGwEDDcZeg+01DECA2qRLPGrWB/rEjckYJuENlmcUkd1v1g1plEObfO7d98eWCYCh
         giS+FiGOTUNZhJbYsmY3d5MWeXyeXy2L+xzRhITK6/V6NZcNzeC0JNZFonssRB65lQUa
         9xBbasarIK4fLCGxRJIdklNpxH7xaQ+tmtCRdyZA/5azrQC+NYcwAmleQn7uEIYMkLxk
         kJzw==
X-Forwarded-Encrypted: i=1; AL+hErHCo6AuvT0EylaRkZ7JWmawia/ku73B6JKhyuR6deOY5lqfvYyHitS7CqDA+AK/jZmOCmGSlyweYK3BCug+@lists.linux.dev
X-Gm-Message-State: APuU4Z/kn4Qod8/JlcV2ytGilO2WUNDNFC4fatytuKEdurgkoo/xNJEp
	z/A3BmViR7KQtX2esXMmr33SZJeBOgy1LFfBfheJp7zPTPyR562U1jXk
X-Gm-Gg: AZFdTZer7+rzjmENdwz9FXOrJJfhKNb6cV+8hAlbgc+ZEHQ2rQIQfslnPqe40fdpRCu
	qgzgI9t2SXThcTtwVR1eb4X5u7JV5CFv2+9s9RkhEk90GbL250+tqXpStWinoOMb+BCoJc9+OjJ
	pvamXk6PiqmyFU1S+DrvCFk/UjOiDoUX72SjFkb2CGS5oO7Dzo717wIq5rjjHCmK1P8/PTHkFGR
	V1qoDHhXEd5nGM+So+fWSoY21ogJeEV7iH+mdirXvhbTUvdQ7pwPcj56SEdPzDX3imvV5b4PWNE
	KiAFn6sRl5hfRRlhf8PWwV0kEDGVCOOp01aYvQlvFzqW61nOSTLWJ/UtamN52yaoKcNz5W2mEqC
	Gr+eSO+zr15sHpbb8wAuhbc8g/PLgK8kDSr0YZLkIaUR10r43WdTHAKpKiu/lHLcUtVzy6AUsMr
	y+mpfpkST53o8nFwiZasGMcex3sy1SKt+g5UwtX3ZPhlYzpBWq4msZ9B5L54bVVXQmkAtb84z8i
	T0PBbRovFmyTKADDR5SYW3tB9WP/N6MoE8P3gt7ibPDxAbBHcJ/KG8Gt7YCppJWuD+xBf7DmULE
	5A6oGXoVjO3eiJLiA1hCEUan1FA8uAvroyN4chRBe4inRZJkGpdRbMzebx2mTrZMDIac9YsSJJe
	46H3Or2alx1VmvQUxLXEH5okFl46P8RU=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:dda4:f72c with SMTP id 4fb4d7f45d1cf-6ba729046bamr8500699a12.44.1795605997391;
        Wed, 25 Nov 2026 03:26:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 6/7] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Wed, 25 Nov 2026 13:26:12 +0200
Message-ID: <20261125112613.237333-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

