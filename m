Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E619E97F
	for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 00:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609543; cv=none; b=N0wiWF84ee42QasZDJyXM5aubm8mDwY2cu/RDDb21Iputo8ZKbLw4DoVdEVU3BtmCpQUdS8zFLOT3n+r/9Q7BDJnCHbqafZ8nGaeCK3JwocGPSh2kBqJ4VOO2nhDSxdfTGCRFAzqA7VJQZ3L6AOKutX9YPCTBlKk7l+AHqa+6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609543; c=relaxed/simple;
	bh=zMWrCZMndADSkg4s8xix2EZGPZMfvSP6VQAt0nAFJNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJx+C63Q+r7ex8tTG4hSMyI72Wk4ilbe74bidxLOAqnIMc2y4ShidMngLDQD7Dq15fL8DOvHH53f5bYPPp5IKmFhgNXadJ56JMdqd8e8egvq6xrLAawz6tEIhfHvSuZXhqLGN0Kg/jjT9E4nB/M2xbjfgMI08TopP6WS9eQ7M34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR2B9hlh; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR2B9hlh"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12332910300so1451029c88.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609541; x=1769214341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=CR2B9hlh7EA7A775/10aiKzbDQwHRrB7FDr2ljyLUIgExYoLvWpItCYi0PBfA4xbTo
         NYgMp7oD5gXRrCOQ4N+dVMtPIQBZWW1YqFXBNA0PpXYPp++4z6T7I01yaNHYtZv0Q+aF
         GueOPiTTFbbwTN1EQBtVWs99lUzIKJN5pDPdTXINgJpZbBjpyrYLuchcBlMiB0JzkWN/
         zo5ctAkv+pfUxKNNCTipCr4OOEJ3et4SajEO7iD1tcsM7HmmBB1z4UyULEy3+cL0LgLs
         aviZysWmDHfp6zqie/sLtXco4fVxZMuQhriur7lV20Y4qedc0Ykgw9D+WOb6Bfh9ly71
         AMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609541; x=1769214341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=R7EUjssvJoauxbyFHNrUFLkQ13GO+HfByygTbm/MTI/zJIOJx6tmrMXWGuMSDfbU1F
         qsFlfj7tfeoCz6IQsCTZOPOSR2c/wHlFXRCaUJlwJbUTxcjjKqv8JA+sOZPnRUwbtnZJ
         dTEbzzvQZ6A2/3sB6Y6g3+B4K/ey1nQX4jz0XgmtOe5RZEKIcnEDCbhxm4oIWQmttigm
         QmDNy89EyrybIly1ME4Nd99fWxaXbBrJU46fEsPQdQJ+40ZTPU9de5NHhZwm5Yb6JMMm
         AGPWgyR6LAQFQ6HL/WR6Esgv8nvz3tDpxROVm9dkdb+JWuYePMg5wNhpaHUuBwsLIuUj
         LXmg==
X-Forwarded-Encrypted: i=1; AJvYcCUuHIttDOYWI7/xzw8n8d4NZG3kAbb0/Kg/09Bxl7edOF4oe2dh8P1YKr18GV79r5mYOHuC545ciNDwt8Pw@lists.linux.dev
X-Gm-Message-State: AOJu0YxfqWoOZETWZtmK5fHofu3uPVyojG7nLUDV/cFxmyUgLUpS5Elm
	FGueh6Id9Xm0Bu29/G2mfNXd8hw4n/2vKYsKzCHuZNXPPc8UJYanhpbP
X-Gm-Gg: AY/fxX5JF8jsdAGS90N2rJoyD5nHrOCXn/yt33r1sAM7+/i+5xlL4hSepfcJf+VluPV
	FYdrYBVrKVnIVZ6D2S1wTZAitBC0Uxhzar1ZD4pqQeV6w2CyUYuk3JmdavAFi/ePKrsDu3sew31
	qQUAmTkMwl1pRtE+UR1qul7cf15uDmUG4H63iOoJpocYOtEqMP9YCLxPx4kgjf1acfWwniso7b8
	h2t7l5dlbQTSOsdK2y6b8tIGyhA6MSzO/JjoF5Dy47kV6U/RBt3S4qwlhenSDxyF/daWybr73/8
	EdsH6r/eZKxbbIh+l7sRfikJCN8afpe4NPbGuwzvYwM4+FLG3EQJkkWxHAdB7Qfzg/83RxBE0Gx
	Xlc8IBa5tGZKDJJwPuvs5IbkKf7/UwZCf0rJfpE40TUP+VF6DM7HVIZiOmMliepD6CZTBDj4u+m
	J51T7SdoCDi0CdJBBg88NwEAAQ+G4zzh3ZRxSNQQiqLB0bpf7DAT0d1CmeLPKos5srzoCDPPjIZ
	Tju7jo=
X-Received: by 2002:a05:7022:225:b0:11b:9386:a3cf with SMTP id a92af1059eb24-1244a782252mr4273827c88.48.1768609541196;
        Fri, 16 Jan 2026 16:25:41 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm4287875c88.2.2026.01.16.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:40 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:25:32 +0100
Message-ID: <176860947674.1613073.11085159197676774675.b4-ty@nvidia.com>
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

[10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
        commit: d6e8b796d0d67699c74ee3cbc46601cf9ec925bb

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
