Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255F4F881
	for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768610024; cv=none; b=SN371ykKkIKq7QjvIeJhcRt0OTlBnQBYPZkDICRphzhGJ6c9fPtc9xjxYVJ0A2p8FoqUgC4JuoRZ22qfOisReVndmj8lw59tfeoYtilV7Os3SuZPo7eg9n+/F6EOkBmUab6eLQd9ZarSbRr0Z9NPs7XKsYO20ov8GVZUFIjhBCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768610024; c=relaxed/simple;
	bh=S0dSLB9PPtlW4v3x12PKUIXk9LGmp+kBGNVfXeGVVVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ERYZdqgy2EKAc35EWoC9W7nEq5Q6mhhUd8av0CWIKFLXQfuMjPpUaQYrPkFEA4ItpTahrdAuK/uJHlIkPo9Edq7GG7LJpeec4ZC0BMUH11i/jz6NExE/rLrl4Cm8D4G6tb3E3CJH0JxIHNfR7vWqh3rAnCRDlf+HANChRFp5bb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDami0bF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDami0bF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso4974895e9.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768610022; x=1769214822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
        b=kDami0bFNJ3icZjRP1Nh0oUsjg3hoYdN2K8n7HbHUuQxDWZKMl0y9iSqe7nI1DJ+st
         R5ZS7LiEsIEbnDGPZPcGI3VffbyGjRFwSu1eHdhSjvGS95ea+6KblTL0/nIaA+eh9NGw
         fjNoi7jeG6MnNsTy18CbYUD91NYyXbFyoKZu/jnUjBwJ8sogd2Id/T6AA7rYaFTG0xHQ
         4Ou5Sn8OdNjKqLM5oZnc0EAoTZ8dM8igwubRAVMF1SjK5J7+g4IW0lmEanDe5Dl5Mo21
         rqDvOKc5X0THLzpGUCbEvsCWDEUvBj7KH/Z6lEygZ1MTA/UPDVSoXvG/r2b15/woGKMf
         OLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610022; x=1769214822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
        b=ArY3RR41HSw7VfBnVx1XZc5+8G/iP6uFmZ+UdDxXbgl97wdyqxv0xCrVjR/sxec8z9
         VRyUgTEik9sMtOU0bpBpLWIYjeRq61nWfErT87O+CWE6rLbYQNCB/aTjXk470MtpnHr5
         kRVCpnlaUf42heV/VHTgY8Fz2cByoaUAz7Gm03gL5v2b25vG9N5BtrGttjvlv9O6mIgG
         C3RJ5sZPcVzbtIqh22LofZi5hwGVJCYAizt8XCejlcMSASk+3Fa5T4QRgXONaoirp6rE
         I/YpZoHClUkB8vyj/pwS2mIYSjZ/oKPae9/FI3+5xFFfUD1VAPn023UuRC8p53mdGrY3
         VSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWicJ3LBU6vaFwx9MWboh89y7b2YzjGrqcqQkBAdeO4wf8f9UccZsD3Wzb3nMabW12jbEVue/ztpmasFjVS@lists.linux.dev
X-Gm-Message-State: AOJu0YwSLgNv5Ifo+2Y1CjsSmn9Jjm8odNIWwP6Roa32JLuVkC4G4npr
	DJYP0L2PmedMiBem+IMNucpw2P5un7GxJFQJHWdpiVljx3Cplkh1PPdo
X-Gm-Gg: AY/fxX6svsyI456pfzlrEXZMKJr70m56sq77kQ4Vz2CHe59JQQDDU3X6IxbK4nayNvc
	OwfZQlRP07dyTYXdvcSNxFnN7D1YNNnAykuyqp0G+dueGpxsHU4z9RgZdPc0+Yz3gMz1dD/E8/V
	2j+w4g0YEh29ylC954wfgR4Hn51xPnKfYoGCCVK1DuanQZf6vmxQYkr8iRqzVWrfVSBfxRZvagx
	LUJkaLB7ZErG6fKVfaUEpiV35RakqYjnw3SBpQkU9MDCI69+dMj2UnXuyZp7wqq9JcIJLzMNEZd
	zYrFkG58bpFUH1pGOSUKAj30MzCMRSAMozKfLwPuPpYH8RCJ4U6yLjOSm7kuxTd8DYCcJU+UUcg
	1NiCXYerTWdzguNKd/HVtC3AuBBB6oe70DXO6t+EbhaXdOXRpydvUo5I+Sa2Wf1JxwvWm1cWY+u
	XSw0jwN+mbZuBE8iWDZSCnQ86yT5cWKPeucMjim2TuWyioEDIks5b0SXzucqOWGk1yhZvXAER3u
	Gp27VE=
X-Received: by 2002:a05:600c:c0d1:10b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-4801e4a38d6mr42472145e9.4.1768610021605;
        Fri, 16 Jan 2026 16:33:41 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe74987sm27997325e9.8.2026.01.16.16.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:33:40 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:33:37 +0100
Message-ID: <176861001038.1704662.1663515837927668217.b4-ty@nvidia.com>
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

[03/23] clk: tegra30: add CSI pad clock gates
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
