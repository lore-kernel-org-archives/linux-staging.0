Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07C3570AC
	for <linux-staging@lists.linux.dev>; Thu, 11 Sep 2025 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606622; cv=none; b=J0Qr/2rqnW9Th7xq2PsVCrfSjpTDg4sZ2XSpvKi+tLltKvxxxKwTZCfaPWbFBG1Nv0YB6UPDFRddq+LI3lmD5IxHbTlvbrxKcxbKPBBoL64uf/sajWcsF52sI8cSZeJHB1l4LUnr6AzCEzCShvwI/lmk/ZbQZ8wYXTbMOta1LMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606622; c=relaxed/simple;
	bh=ad1+GlOebaA4Dc7BMXCco+gstM8+RUWWlpqN5ZlppNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGQgIzuY7elsRQUI6ibptJ47BfarPkq020awTto3W9nBM87ejn5ScQR90Ii94f0t8TVwLMOWPmqFuKit0JDSMVi3SFxhD+eopzhAl3zSgVS0i2IMfYT77gbXNDILJU2fHkloWLYaM5wUn3rQvgaXa8Mt67soBogESFxP1HKmiWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBTPiTW1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBTPiTW1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so8037475e9.0
        for <linux-staging@lists.linux.dev>; Thu, 11 Sep 2025 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606619; x=1758211419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV+vM5AtMDqiziiosp5lKYMmFySjFk/a9glOkvxYm9c=;
        b=XBTPiTW1VRVhr9o+j4kICxZUtJZh3fDDDlBmcQVOctk0zMVWo1HK5U1+SSRNRsJajW
         fAwR0459iboUQAmIA4N6kl5aaKvoUbQPJBfaWCwMq98iUGegcV96cTGZFZ/9C5HQbO/g
         zEHMRpY/VyVwIiEXq5CfvE3P17QiJ35w2liawvwfjJ00V2lWgOodTjkZhSlWAvdu/hF+
         thF+ZpRiTA4g5YiSjcvaXPCV/7Zu+gKyWAH8lg8Lh5hNgifMf2lrSNQHxz2IP0VyXFnL
         fA118jaLW8ry2/Xej+1sfNMAqT4ylrYr+c9FAo/gqI1U/acFMYvv8wwfxQlSvMUUcb/I
         rqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606619; x=1758211419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV+vM5AtMDqiziiosp5lKYMmFySjFk/a9glOkvxYm9c=;
        b=kS3VkFPeQMH6qksJLF7mH7vR3AmoD25bWenoSPziSJ8Wr6Lde1NBxOzxDjoCDd75bw
         b1Pzpd0o1OpGzsCvfuj0tWZXHezd24Xpcz9D4UeffQS0wWpEs/A1wwFKnNS+t/F7LI9X
         fEDqm4unLU43NdTtEF9sGA504nxEBxr3/sDQYr6HLfMjyke46jFaWPdvpI+zvWeNOU29
         dPMXSix6syRHiDPdai+XD2QIxBsSzxMaSFX6zYckbdOK8mYD73Qbk9y77JLGSXHBXq5N
         1F5bl2KOYB5Z7jdm5/KEEcGM0WryVyzQDpV+4oM3glYH6qW2MfMg8wv1niuxPwsuumcu
         UHgw==
X-Forwarded-Encrypted: i=1; AJvYcCWdCzVWK5wwveB7HT+OfltSI3i4OciSXslWU6QMfsuZVyFbxEYiW1uLM28b+qLyG5K9C4hdA6qdXZIXPdBw@lists.linux.dev
X-Gm-Message-State: AOJu0YykvrX7i9MhXu7apLpPiTQRfHjpmAss6pLVVA7RA11+nBD34LcE
	TLWXwAAw02cGxrO137/O4v/VJmgs92N0A8sWaunzHFrjnH+P8Vx5kIJb
X-Gm-Gg: ASbGncuw/Sd9YtD4yXnB3h0cxc8SZO9HJ3KMQyQQUQj1WU6go0CPf98GZs9mwDlXBgD
	WvAFb2+Hosm+/WWisplljNVCmO0GCrIWHxN4iG8nbOfJuf+An0gmvkUrJGPTJObSlqG1WcZQrrJ
	7GdS2j0zboFrAq3GSuxAi99S//l/UVOnZuPbtiktk980S6KnPgRAgK/8my8VD9SUJw5cwxEytjH
	Vo8i1w2KZjKPru8njwUrlcP2hmSq1pwXSJi0girlOH9Ku0AKOCAJioKEoZ1jpkcw041NngegoIV
	xZXKoSoZgCFYXW50rozyYHltcOse+t9bcWRq2XykR8JjHlf5hglLmie3gdIzsvPCSQqaOzFbNTF
	YS//ZP5Zn2+eYiMP0XINOSMbkanVoummw0xuFMclTD4btq59/eCPDlk/yaagvxzWmcSrlMxy6VU
	EzE9P8c+PN4VEPHg==
X-Google-Smtp-Source: AGHT+IFkmvpn+ZMkR/ME/h210TOWfj/zRgJxKTOHh3DWlG10Yj3oOfPv3c1/HhofEdM287nETYtnIw==
X-Received: by 2002:a05:600c:5d1:b0:45d:d86b:b386 with SMTP id 5b1f17b1804b1-45dfd5eec3bmr25128185e9.14.1757606618353;
        Thu, 11 Sep 2025 09:03:38 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e017c0643sm30454515e9.23.2025.09.11.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:03:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v2 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Thu, 11 Sep 2025 18:03:30 +0200
Message-ID: <175760648464.2794963.6510932759569440897.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sat, 06 Sep 2025 16:53:21 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[12/23] dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
