Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667313635C
	for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609903; cv=none; b=Zo4VgrUHu1vbKzHLJCgp5e9ZefyDK87s8VsKGhsRjcdcjdTMaaAzC4FfgwX/NEAhPbG5Txy0kYPDfBI4qwBCqSqoohqnJG7+nGwvkq/+1dFP07UggtoSFyncYXzn6HSM/wMH0/yLpE0DZ4UPSFpQ/4XrzavsKSmYrze8MyC2rgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609903; c=relaxed/simple;
	bh=oYQI2hBpIRcvGtuZTojZuoMSi1NBy8aQgzTCzObvMzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XEdRmMyiq1pjBxw6qxFEJnkpl6Mnpfj+vP8lA6+UPrj03bJPqqL3Erli14Di82gJB59Lhpo9wjH07ptXT7bLkLT/2akBVPfwCO72QNF2l+FCpyBGlqj5thpYXEk6o257mPOYIQbHXnbVIjKZgwyHB2t+2PxizTCorxaiIeZD/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ib0IiLEz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ib0IiLEz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso4973385e9.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609900; x=1769214700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=Ib0IiLEzZNVmqZVVMsalduwstUhprVIhWSpiHBx+6mfFFqhfF8BZWAoy8YTTuxgth2
         RYytcLmYOgQ8lDUnPv3mw0MXDgk4TVSMPPmbLPorJ0/Mey+h9e6RIsfCTMp8CKwWEJyb
         2TnN5DLo1Addb41YxpCoIrdPVDk0nYOExyu04UQSmgRDe81JQVw/ftBBuMTT3SGJhCIm
         U7G6RgOvykQP/hAXrGI07cvBohf6kotFnj36BfuZ/LLgbab45Og1xWXPMP9iIbkix0Ps
         40b3JhdcELSPe4IJi96+nk4YFXUE0pMU7y1IDh+CGoTJpXOKpHDKbo4nNbt3EYJ0YlDG
         t5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609900; x=1769214700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=xIWZxO1/ytdpiAKkxg1UkGAa+zX/3lYH5tHYi6J9T85nYCDaKbP+SmTrjFGt+rGetJ
         Z7s9CX/ItaBygOuFX2ydZJ6+O72IIpdn9n0i93rOAyUGEn613JMNOFiLwQLigZI63PAX
         SFMrPru1FGTUxh6ypx1qNN9qy/ZQkn4EB6Hu9w0ScNCnScsHa/8wcFfmJfbQcJS6TNHz
         gFxay/H+xOf03CqpNjaoRJ9eIgUQ8+Ke80rhagHijTgP/Z+9cAnW415F0ahbd7M6E+rZ
         R/uXHwg6KLlqQ+4sTkj9TDZXnyYhTssvXRVZpheKg/aRIZFIjaJt5eBHc2k041LSdbDS
         6DLA==
X-Forwarded-Encrypted: i=1; AJvYcCUM7vPnaUhs7aUX0BQHGSX92ubfNi01NgWUwOFCntMg+yKBwZeb6A94QzaMKHI6rH01SVCsz6rmgIWnXCOf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0dq3Qrqie5vrpAkNZmrm/I4ITPAcMRZ+umDaRUr4u3BaOtsPN
	9G82qqoYzbRYGMmyPrAYHe7cGzQtG5TlVRDlFV1mmaWkoWxd9nFDjKq2
X-Gm-Gg: AY/fxX5dwfsj5oUEv3SaUAOgcXFQfTS+jPoZiRNOVyhlr84+rs7Dmvpsr/G5GMhSGtA
	HbDexNXnRd/4liMA5PfT/6WvqwtV7dCr8bb3sh1nirbWFpc+OrjL91FXXXwQHr0Q71dyY2rezfi
	L8RDZx32OE/K7/y+N8nC4XDgCeNKLkoDbpK90M7cWsIv7xNFymPmIaYxBDuuBFt+ScraDBG5ii3
	PuUE87C5rIvT84oRuU6KMRD1/y0FoCuyhSY7pRWcqd11UfwCljtAlVEBVsC2r2gikQ9mS+8R4MI
	BqLKnrHeB8NCMG1imoTrARxd1rTSNus0AGK+T7tFfgE5Uk+G1xk/jqIT/LCozfSRPIBA5P3bApE
	1EiB7bjBBYuoJaAaCmF8ybQvCT2wXSlkjZ5Atz6VmR0tfOkdugb+Z8VZ+mJrNhH8hoYZdrqA9hI
	cjrrul2uP/pX+HkNoZXu0yfKJKoRGjxb9MfHluIJ3PfcTW2tI38Im7RhowKemObXY85Wtjn6DaH
	1Yq7PQ=
X-Received: by 2002:a05:600c:3b9e:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-4801e2a5861mr63784045e9.0.1768609900200;
        Fri, 16 Jan 2026 16:31:40 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9fb193sm27730315e9.6.2026.01.16.16.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:31:38 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:31:35 +0100
Message-ID: <176860988748.1688420.11717122647073678.b4-ty@nvidia.com>
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

[04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
        commit: d262d030baef287da33344a932639aab5f913c3a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
