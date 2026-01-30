Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33D3815E6
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777412; cv=none; b=Nqc/Cx3bKN6ElW+8ogH7thuN+llrf0Ix5wYP3OzZ7JsLuEusdJxuF4/VWTsyisbeBdnsvbQDd6A5TwHBeDgrL5vjj4LOkwN/fX/cjwT5Ej3MbsgXR/+wJQZPNktUPZT//eMJcT5S8jA0vfKNAKC6CCmdQmfGrxSRdVfm70jdO/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777412; c=relaxed/simple;
	bh=nYt6duhsrmz+e69NidfUvJL9FCPmAn4B/IKgU/QMe0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNJRwmeVGMaJZgUMuY4qBDS+KZTbHQjLCrQFJelkYhv17wY5fbyfB18dw20Uh7wd1W6xX0vTxZakCidcNR0NSGbP++cgSeWCaV+J2JcJ5lGC4Xif4HweMY3CspYfxleptIUGLO6K4exLAgtmdD4cbapQLmHcgLWS4f06WAwhbwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8/hAl7/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8/hAl7/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so22692575e9.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777408; x=1770382208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=K8/hAl7/rb1ZVOl+Ao0FmKPloH1dok3UF0+gOJUOjgbJA7zsl0yzkxrE8v5Z/Y89iy
         FA4/W6JL5VdNU4tYQcgnFa72SzmBTHzqCrQZu3mxsEMt22YOhVFpqJPi2xjxnK2j1bAg
         26t7+04zlbvRPoeDCPPVQcyAGCwDxPDuoXcRcCnY5nyhVAC439m8xf0LMyTczkanC4hG
         1PB89Z9GHtVr1yh+IBWXKDvklztfJADDDozmy2P1aLzU2b7Ud9CtEXRMq6m8fPgepgJo
         lgzGgQJJLswR23/uObX34NgcQ/LXFe+Kl0acGIomCxjnvYIkmPQMfljJR1uL0naQ8Qp+
         PiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777408; x=1770382208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=RzB2q873cdZiv6SPYTdPedxFjk/4V1meunVh9N7VPCIdcSwQrrvlH7f7qp3NSGun0Z
         GCpuqQYjjQi+4Wd4KVvkpI3aW4PwQpBF0JAxknFq0yOhTTdxexCJNPFJ1FrKDVRaAZnd
         uuyr0NMAAv9ZB1d4iVOJ0Lgb5TgVqJv5sQjoKbgNySEAUBNkBB2wPzkOjKakmT8uCgar
         Cftb5i9ZENWOIg7F+g21ehy+U7EnvblcGe3PC4M856i/9Y05qArgbq9hVtBBOMKIVFol
         gWAiCre9mkDpkOJ1UIjbXmKhcNFIY7FULFU2AEyI1zHzHWVqUU6f+0WPQLOmHE1lnl2P
         RU0A==
X-Forwarded-Encrypted: i=1; AJvYcCVK1jw1trttg8j9ujYJzzWUKGRVL1DdNxgRBa7T4HV1vTlLXK5SdpdM0EJhGjPiPgz4+wy6vaO8zAHvVWdu@lists.linux.dev
X-Gm-Message-State: AOJu0YyjMG5+VPj6NV2TUCbwubSbrvQyBkjlmjBMd10Fh/YXxSOnd6td
	Fe4K0nmXuvD2+U9BvyNKFcpJvD95i5ocIdTeOCHBDdw0p4DOhRJqLDu+
X-Gm-Gg: AZuq6aJVGWzUGyXjJz42PJaAtBrqu7xU+u1FP6s0ORtKgpekQfY+iUOScik3lSA6bnR
	4Dkqb5JRIBMpHWLBL3eBVRfCAo/29dukNlZYu6uSiG95nbP5s16O3veygS1ka9yRrWge1NSnQId
	IgcR5Z+187CoCX8F4hTInsVNijoUSNFKvnjStYIwSHYQdMDl+HQpVVDXBobY9TyRbo+253Z0S4x
	4I7lN5+U17VSeQZaTKLzNzWhlQUB9/vPJ6cO7GSZxeChxGXHa2BOilBRYyTXO31RXzeciXZsarl
	lLh35TXcMs0hVe1ry8UC5+9dpNtdizVAQJKdsxnVJY/tuAR70Szp6S09XfcTI+2e5CUJKGp3REe
	KMC8aucnmcxVmiOTh9ddVFRG6YdMQFG99KRlpBNKcXPtBwifOJEJmz5QfEgdnWUlIu9Os4QVqQx
	9D
X-Received: by 2002:a05:6000:178b:b0:432:dcb1:68bc with SMTP id ffacd0b85a97d-435ea2102d0mr8586769f8f.23.1769777407709;
        Fri, 30 Jan 2026 04:50:07 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v6 12/15] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Fri, 30 Jan 2026 14:49:29 +0200
Message-ID: <20260130124932.351328-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7ceefd920cd6..bf8755698610 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.51.0

