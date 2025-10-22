Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C234F253
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142923; cv=none; b=Sqcr2i3rCPx6eKQEG//ajWhgABIihPl/SZX20hveMOzCJbffyAk72y+MIGvXWi+j78ydjNF3iSIL3CqskmFbhJmCd65EC8aa8IFQeOwuYVAWxyCZVRwwmka32j7/39mHlOlwA51CeG1R8Fgauw3zUhhViB41DUykzS4OQI8gH6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142923; c=relaxed/simple;
	bh=LMNj3RJtvSAolKc/cNyymmQWeXKMjtcs4eYn8DUf4jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvkE0JAbthGopqrnfofZDGqoHTf8CcJgkfJYohZGDrtOiSYOSmkR4NSUXqIm57g2VYZPpSYu5CSKsWuyBDgxWhDQxI94MA5D5t1249ftcb4EtnPessdcAfU5Qf7j/+3Ix7Kkc9LE6dT8tvWyevCzGn4YkJsN99p3FLJezrPwnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Coo91kPN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Coo91kPN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee12807d97so6410865f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142915; x=1761747715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=Coo91kPNOfuZOE8FYi/BsgHI7kdmBcU0yKyNpUvR/JZd0o7OLRhGXo/Zaqkniu1Y0j
         OVwuyr4RoVDw5ilkJSJClHmybNE6iOytyUz8MAtAaJik2kPSzh+Hv6r4VyktaF+iNoEi
         lM9l8btcbcdnYm/lIe98G4uhwaTlK/UhKKNeF1cNM5n6ZItR0sJizHE0u3iwJ9jfuFS1
         SS/dW3OjCT1k12uvS/VT35oOS8/v7Gl+fsat4Jo5lf+g9HNzIVAz5zxnakJMxRD031Hv
         secdK/y5YguSIAUfnYsXTPDeai02KJxMG7SUnC7ubDdtY+XzphkycZDyfjv6AFWztmP7
         109A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142915; x=1761747715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=Bii/hsUiaTdZxlIk9xYg2ZQnDBWqsHjviTzbvhoQqftJN1FfN8yDEAGZG/LTRUdPcZ
         YxVGnosol16BH67fAtdrEnrMQ1fpoZDekOfnO1751RPq2lGhMKxQ42d/FvVORh+Gx87Q
         HI1zT4IjLylShnSfZ2aLyp5r5L05/nffoNcOVamWAQp2xEAo8nWcV0smOCZwhFqLDcPc
         XrJm2dt81Ny7pShFLqxxIPujPPxhOvkysCSHf2vALyZQOuUVz0vuPu9BgSPiurS0TnG5
         M64lwzWpyTiQHw1VFeoHpSC99Mj/zx8aK4lB9yKj2+Ge4vTBTHbo6lOvhl1JlTzKq9wq
         wiqg==
X-Forwarded-Encrypted: i=1; AJvYcCX4EmouKdi3UYHvzuduVONv4mR3XUz7JUaai7MKXxx5laKN8OAUL2tZmh8eaQJWSNYaBi+7C8Gm0vogP+gx@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2qeW0PTfQsnSs5XNauBKXcd1J965O5iW9GmhUCRU6oz8NAGBU
	2yNDGHpbB274Cd0Gn4JQAZXCgtsVc+NyLFs4hHmvBX9klfcfMs9wS9G6
X-Gm-Gg: ASbGncslxlGzTrn1SjF8ZqTYJ5AXoMc2JY1CGxaqHEJRd6kMPXounUD4/gdUvdKwOHR
	wAIbwvSjx3BATea0OUx2LZOb5eCsNhd8XEetYvYp5xfpr79qo3KS8BFyY15foZd0L0JfkuB/mIE
	zhF73fG18UH1rC7PVwMzYhQj0IflhlTYqaHV2Ll1vlRJ/nuWGx4Nf3RP69xwY020rR06sVD59rJ
	HfI1y5wiJyJbkJyP13n9doNn7efBg7nfD1Ztecj6yW9+YJX2j2AZYrP3HR1vNnuyIWnX+Ncs01r
	OquDBcJ9Omr4DQ/ESQAWWMLeWMFFt5GmWqBrcpoWIyaDegCCkhwjZUN/D7KsPiYcQVgMmLYcKMv
	S6Vord1QJZxyAnMHBf4LdiRxO88JgRazyW4mJ9SrnVP7bJbReMW0uiwcEbsLbAaNmQ+4=
X-Google-Smtp-Source: AGHT+IFX0XnrlT4GW6rKQFEmK1orh25Up0PxK9L9DQEcm8KVBweiXSL9uA4QjEkF/hiMIpTbvZ0SpQ==
X-Received: by 2002:a5d:64c4:0:b0:426:d51c:4d71 with SMTP id ffacd0b85a97d-42704d44253mr11937579f8f.8.1761142915306;
        Wed, 22 Oct 2025 07:21:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:54 -0700 (PDT)
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
Subject: [PATCH v5 18/23] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Wed, 22 Oct 2025 17:20:46 +0300
Message-ID: <20251022142051.70400-19-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
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
2.48.1

