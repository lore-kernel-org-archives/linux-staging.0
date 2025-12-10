Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5B42EC08D
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355518; cv=none; b=pvu5eOFrTdGoWbaT9XlShUrQJeCQ1a5ZjmxoA5StnzjPOXsP2losM3TaRmji9Z9PPuKD9inx90S/dG5xP0fww3a+ZL8PPBzZXjRTzUVt6qC0jV7HUMs5NNtniGMyXy6nHTkyKtJeSOv3lL+Qez4cCCw+FhDocB/BDdYJdCnX2qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355518; c=relaxed/simple;
	bh=WFOYx3gHrxNUtjZ9bkur+Qccb3Ac+ntLs6kixYG0l+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JKRtPSLSAPfKghtFwCQXxj8Jy1Twzfu5Delu5y/8HZ2xoN+Z09jot/jFfDk8Lr/ddvMRjXc2ZT3zwdTezUIkL5elQkyxwHfhpjVnC2wwEuGIgbhIDFqMfO0jgWe9Yq5ws/+elFwDJhwLlX+2GxqpcNI0u1nsalzrBxddXOcmkPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0ztyoPIj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0ztyoPIj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7370698a8eso894094666b.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 00:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355510; x=1765960310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
        b=0ztyoPIjmZKecXBQQD88JAzR3sVtYqpQxm/ht2ikdXYK+PbOCKWvr2zAdT/f2MVHzS
         6xSVLnQo72IWoWGdLMbfhyS2veEi26WO22LHy3Uv0f9vLDpewlTk65bcr6RawgCWI3TH
         ZDIc4Q0kj081BxHzg68Un7wu6xmrvAETJK13JN1dM76p8VBRpFCZY86J6fnh/D0IYskZ
         nYGzOKrcj9EsEoJrRav1INoGqAywlvPEN8i7XnoEyVPopKspiVx77fxIJg0NeeWr39i3
         g+xMqXsylxeJhJbGCYY96Nl12Mh2413i+OlPWFaxJIIJD2F86fsjhbUM1J5IBryS15a9
         Sk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355510; x=1765960310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
        b=Oi6dF6+x/7KekKQpd9IxHvVk0EfORwJLnvqusKPeoFFse+6mK0I+n2UIYznHcNnYzV
         u6a05S3w4KQn5xWmwZpjcVAwe6BYflMH7ugho5lQ4kEjWonWyy/RzRzt9MrQHYiU7+Vi
         ic4jFODdfzRiTgrOl42RuFqvW6EHxovuTElEi35uiJXXVJWSGwTeKjHuvACHF6RZRR6G
         HImDuOf23EFPj1BLj/U8TMLAVzrJxCoKEqdoi5hs2GOFgJooRvlG+4CqsBciKQ6pOiIU
         YyO6l0t0Y45nk/iJIOggSsQZ+L8b+l/laMoQxaT0QN2HqgD47UNx5SNVILacz9z6dFBC
         iR6A==
X-Forwarded-Encrypted: i=1; AJvYcCXr+Rhk+nHqdMLJnbEpKpTo4gXrsCGhfJSs3/rM4l6cTPCCTgxKPLf9atgjfpD3LOtBS3iGFFUSH4O7JK90@lists.linux.dev
X-Gm-Message-State: AOJu0YwNh2RGeqdBbY1PDSbnbJlh7XIUpi2tAsB6EvZJFqjaEzjADdu7
	f6Co7Oc79+fClP4qkSYp1kbIBQNYv4eSwAh/SpXBnOzFOSN5tc2T5PCN2Cka7fLTHMg=
X-Gm-Gg: ASbGncvymLY4xpPrw+nXerLaeDL156ded8GyTyVsefKMVB6NMDpvX+z6BD7GSgTOYSe
	qndh6l7uIljL/DwM4Xz5bt+XB++A11ndA5MhWRBawEA5PgeQt6FRjcjIsrfJsuRN1nBrKIvDywu
	6SbD2586jPHWdCiOS/FEvOO84uEz7nHncaEOfB8faOO5osntFU6ySxtdUel9AlEyXbIQvMZrcwA
	6Ki4R3xacrf7cSLYVm/gw8eJ9uSONqBWuuldqQWrqT8Ad7H4bD5Xq61W3VwJ9IMvECnvbhm0Bu7
	4jSlv9WKYl8f0rbLo9nMOC1Qlyp/7IZxpA+XtFKk+RhdiTV2Nxzl2fcrkfG7PT5tTPw3j+BOL2o
	SWvyJ9hfuYBiGFQcBJ3dmDM52OQgunNc2b1L2/ku2sNV+AvShrd7Hwk+AyR5laL2aWC3mysgiJB
	RdRgkXt/He/X8oFvri
X-Google-Smtp-Source: AGHT+IFhEWLNvMehRpc1wUqvy7EgAfKj7fWQCi0AaayfiHw5TZ8PfJNykHUWSH+Jpsiw27YnP7qNSw==
X-Received: by 2002:a17:907:940e:b0:b71:29f7:47dd with SMTP id a640c23a62f3a-b7ce8476094mr174700566b.46.1765355509951;
        Wed, 10 Dec 2025 00:31:49 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f497674asm1598816366b.38.2025.12.10.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:31:49 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/2] host1x: Convert to bus methods
Date: Wed, 10 Dec 2025 09:31:36 +0100
Message-ID: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WFOYx3gHrxNUtjZ9bkur+Qccb3Ac+ntLs6kixYG0l+o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOS/pKRGMR+zmAK1B+hWBzeQycrZi9CsF/M95z WMChvvAaY2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkv6QAKCRCPgPtYfRL+ TkEhB/9UH9ZkwIxvzlifG7NyhzIUvjXvPe+zdF4tvTXVerfpLth6KJe95KUS7zl/ZtyebZz0D0I 6HC16qxNL0UPB59lEPqR9BMbMqC6DswMZrjSUU7EXrIaA1k0NQbKuO98s8Wpw3mEuNwUWcuAfd0 ZjhzB6I6y00O/o6eWe0swn89yn88PDpEwpmVGRmKt4KMFVPQs/TyHFzT77Vs/GWe1sYP0H83yHB 76QKduqnaltVkBvI2q3gugY4Rss5eOWhfULtoLbjwP6xrQuIL+zwucgvF3SIcpliagwQAP3UN4c OitUBA5tMJCTbIptvpfqe6QD7NEBWUdLLJCHf/+z81sRtnj1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

with the eventual goal to get rid of the callbacks .probe(), .remove()
and .shutdown() in struct device_driver, migrate host1x to use bus
callbacks instead.

Best regards
Uwe

Uwe Kleine-König (2):
  host1x: Make remove callback return void
  host1x: Convert to bus methods

 drivers/crypto/tegra/tegra-se-main.c      |  4 +-
 drivers/gpu/drm/tegra/drm.c               |  4 +-
 drivers/gpu/host1x/bus.c                  | 67 +++++++++++------------
 drivers/staging/media/tegra-video/video.c |  4 +-
 include/linux/host1x.h                    |  2 +-
 5 files changed, 37 insertions(+), 44 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

