Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2B340D91
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605812; cv=none; b=jMTbt6ZAKQBybI3fNBHdOpUp5uSKg0Acv9lvRZDjgquj407x4i2zhyCug+W0yiTJWGmq6RcSAL/daXnaaH5XmP6YfOLRmXPVMteWYVmNn5CV3k+DzQkIcNmCmdVx83m+Fa+AHsHEY1ClYUEkdMm1P0Y+xUF/LkTkdnXn+2J7FPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605812; c=relaxed/simple;
	bh=QB04jq4IYYg00bcogqXX0zWmismqWYxIpmmcyXPbdhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjljW7iC5TOo6l7lfetVNjROVqJIe/mlzySKuKhnY5CTVpqUdeZoxmZfX9nG0PaaZWUFJLLkBsR5SsSy7aLJXt0pcyizvOyka3RMTppMp2iC8C3D0x13V4R97h5ElkDNsLlxhkDo3ITiBxniCmIlRUlqks9KhZX48T86mPU5rgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUBtCHGp; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUBtCHGp"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7322da8so873883666b.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605809; x=1756210609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sjH8RUp6s40CO/RK36IN6IhxncowpuFZjH0TBpbicI=;
        b=aUBtCHGp5w4QPHlx+zKeqqYFomKF4XEpldLBHg26k/3Q+tDVRhc/UoIgrwN8K1b2IS
         m87bv7wO/LHShzFwwKAX+43JiUv6R4aLqWNtXOhEkqXg60DfsCLGl/V84wxx4dES4GyC
         uKxvRiipHiwWeybdsku53NdxGOUzAV+W/rPiPkcIN11138cmmxgq/ZRsl3PMXTjd8iGC
         6j6kSaTPhWF5g2EzkhLCKSoa7RZRxbk506cbC7SmPA2wRqlpUyyA0QfSrB27itR6yRw1
         9zMn2qFfvbwPCCAsE4qLeU7FJiOnnuXEJltL/Zxmc3JThdqoJLZgVRrPXkwZiSh3BB71
         a9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605809; x=1756210609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sjH8RUp6s40CO/RK36IN6IhxncowpuFZjH0TBpbicI=;
        b=CaCznJD1L1kLERMQy5cc+YDuY72AMdXoCEZyjTJ/GUxJri81SG3zrDTUOImMFxNUMU
         ld2trL5qdHEk+aLTMh4wTFuoBm0WF5sss/CtWWQ3Yo7TwTONir11Lg/NeVnA5ljOJysc
         CMdyQajgLaAKCxyGsApdGg4bHR0uhzyBBmNjwr1MReOi73L7lslYSAmxEbToRxjRtYxn
         jbU51wHxq5CptqD6CQZXyOYEsKmCzUcp4YF3Qjp7eHqt7vXn1LfRECZw5b3imkgJtrMm
         owG6jVYj+q8O1LxAZM+XTeJBEQBibA3sqxBpaMGCGs+jkApL3lFX1QuYBTb3vKuQ6iAq
         XtSA==
X-Forwarded-Encrypted: i=1; AJvYcCWzfWbwI92j0hLgSs6HfRT7f3rWjywzzXLTzT0Z0Kg3bvdzyhb0pdu553IUIEqMuny6WeNkGlmNUIe/XS/k@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+2cY3dFth/zpGkTqbuRwxkQnJ2BnSFP212psOK2acLi972IEl
	CEtFCYDN9p0bPIKdu1MmyPaN1N5QPefB1/4wv9nD6V/cso+/W1P2FqNg
X-Gm-Gg: ASbGncuO0XChpyrV7GTGwHgc4SSeCCttFKBbwNWXppK7f9YrmDT8ivLCImpt6sTAkb4
	UqE60b04JTbpX4pVfLp38+7tAzvm2/MZ0r0kI6+2hbkYib3FnNANnPBJf/I+6nVGpU6OmC3a6j0
	XZeJQcpe+fa3eEhPsLRYck+WRY95rpr6GkqwcRyMvazaHvnwZSgACUmW7nc0lbjZ1+NfHWArZwN
	bK8+Ew6fsnJzaEVPZMvCb19je0JrWZzLBRIueehRiKy33/LAtwXWf9v0KHNOIruu8PVodg8ajKj
	FMTSwal5lRt5rYp5edx6DF2+CLkwob3xa5/lYD2M1e2Vd8cAqUI9x4Sp5QgN2BfX/XBiS5e7S/e
	evrM/ItHVj7UkNMSF3Azz7s3t
X-Google-Smtp-Source: AGHT+IE9FHFJp4/Ab+MrMhT2z2lpcQguRQVSFzb1lmInT7SSEmay/CM6C6jPXgOsbIUafQrfyxsCMg==
X-Received: by 2002:a17:907:d9f:b0:af9:c1f7:802 with SMTP id a640c23a62f3a-afddd0b539fmr236610566b.31.1755605808550;
        Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
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
Subject: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
Date: Tue, 19 Aug 2025 15:16:16 +0300
Message-ID: <20250819121631.84280-5-clamor95@gmail.com>
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

Parallel VI interface found in Tegra30 is exactly the same as Tegra20 has.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..39e9b3297dbd 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - nvidia,tegra20-vip
+      - nvidia,tegra30-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1

