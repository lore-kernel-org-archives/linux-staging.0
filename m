Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7831038E130
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527392; cv=none; b=OAbgK4Av/HFZM/kECTkmKdA8E8WhxmpSNX81KVprUnZeqPhvan2deRrEP7sJaOrbSGHExn1p7uQXHqs8oDNtY3yKEh2kZSO5GAbqqVScDYydpJKKJZV0PT/QUixUUzKt5r/8caHha6ckCabI4KiIoX5dcXLnGhjAkudh8saaHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527392; c=relaxed/simple;
	bh=nYt6duhsrmz+e69NidfUvJL9FCPmAn4B/IKgU/QMe0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSWwWe2uzGK0kCGdBNAmqS+fcpAhamlWIfsIrza2aS5gyGUva9Ur3GMSfwMwAmS3Iu7EyCxppQcN2wM/doq0/uD49msNHd/K0265fJlSccx6HbQfssWrNCURLgFY7X+5MMk6/8JUzBa9XlOzydpWxeOxltGxTM8fRLIkogHcTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOFpYO+N; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOFpYO+N"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38706f96202so65339381fa.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=UOFpYO+NeWiqSoDf6OzkDr14X9H30rYZueaxXLTOyQh+J8r0IIagbus1LWAn1iijhT
         fNGi4DQE+2S17F++ruAFrKXAi9WsW3AoSQRhcfewBS0/+BeuRpPJVVrzRxgeX6r/WEMX
         NR86OqTcf72Xq346IecOc3TvDoWdiv5aTS6EghokSEH1jH1Dou2afgWV8jXfmSbSCtlK
         kypaRyhNFKei0yjDcIsOO+ruX3c5VTwyRzYRbgHp1Z+gYd6D+cph1NBanh9PZSjxxVhm
         UZt2olr+2Wngrt9i1J/Tkg816RRZwcsHrgIm0NZ2H1GzJMICVCoK9oJJ81w47YPaqH1Y
         8K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527389; x=1773132189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=RLLDGUyv4HHE+v1ibwWG6xYIJPSDplAv0yl8YvmlWOCSLsNQoljFOaJvkk3yRrSA4P
         Lyw56yFZEvMP1+pQ59pkrwEIpk5FxFpXOmIEuriT0nKxdwzNWyv0MrsuPst6t6cgC+Lq
         DhpYF7oCWzoCHZ5t79JiudYMu/7FHi7itRX+CHkkqRRfpmFX7mqeGhWcNhMnqjbLWC0b
         2OIaQmWCE0UIieT+GlSJC48Obu3a5KYr8MflOQZOw1gx9Le2T9eQyO3NMuxAIXYgJl1G
         q8g9DMU9x8JnPIKSaaHt/z+b5BC1UYQYywABFW/GbXP2CSoyzikLN0iqN5naVErIgkv7
         Q8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU4uDAaCuQepT+4fIOxY4lCzyqsDumcNTe2OrongW14YzlO5Zl/CyRkveYUSrTorwkOTjWSFPAQ6hiXF4+v@lists.linux.dev
X-Gm-Message-State: AOJu0YyTH3nlCbV71bDuV1x2UejK3B5+rjtqBrunudn46uB1OvYamgg6
	+qWujZTuXo/rOMzeBoJRvNiH565F9MLl96cRJFwf6NDivPBJUQGToBSd
X-Gm-Gg: ATEYQzw6k1tNHlXIat8DXIdejw9TVXJJlKbGj6qWQ2JNzXtxmzw5L+b50pAl7ljmiTF
	P835JPGV0OaYpHDz7++VP1Wpemkqw6XJug/xMg0OMicFCmcDeM7Mu97UD1Sx93d3tIIgHD/dW9V
	ESMparSsKM8uww6iuBdiN8MGXi1QnIQqyQiC+kP0DlHCBH8i41dye5KyBPX/ExZiE00rnqxwUpy
	ko5OrZRo3BJ3KX/dzCCTC7gOx9glW/HC+TaernBfDJhrvq82BcxkintY8e/OPtaWUq2xMPRwizi
	s3IhBKfnThqx9Jlg3FrTIkDtXZWwlHlj9fS5KUq+c1Jfb4MWjBUbuOP1JDoOPYlrUMLb6F5iA+l
	V3A3xrAx9+xxnj6PFZB5fHyXqTHCv50Bu+wkuJq9Fo/ZznGmwQpS6HNExQPr02KZHJZy4Vmlzlp
	+BvC+raomJ9iURGuJS5KCpyzM=
X-Received: by 2002:a05:651c:b21:b0:37b:8b7e:efd with SMTP id 38308e7fff4ca-389ff365c0dmr93909351fa.39.1772527386558;
        Tue, 03 Mar 2026 00:43:06 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:06 -0800 (PST)
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
Subject: [PATCH v7 12/15] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Tue,  3 Mar 2026 10:42:35 +0200
Message-ID: <20260303084239.15007-13-clamor95@gmail.com>
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

