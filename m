Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605992;
	b=wt2EFKLfAWXHh2RGR+6CG7QDFk70E6cbUC0xkkasVxb2o2c1yfNMQ9zwJkw0O+ZN5Xoj
	 PqSvRfsbpwY+j3rO/01Q4ho95JaKZoApYx5hXjQ/t40TbZEOHt3EAjCbM2dgKKjLhWrEZ
	 a3bAG+86qnvt8hJRlWmGOorzsiIPOV0QLd7B0IqJPCpO3JS5FK7rV7uOqM7yiu0A7umW4
	 i1HV9J8LnaDc+vDlAVutkphmdlVvUA8PnciDBY2mJmnHd2tTyLywI8/lPEHvblWyYUK0m
	 9skTK0Vzd3xJ0T/+66CmAAxlVFghhtNBYudxPKw1zUIdj9iBQG6mRvubnRF9GZX4V+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
	b=OvHPECQeTcVz8eOv1kv0go6dQvsptDKN7kho/Sq9fG+4uoWZRlyl1C6Iovw3uUzy4ELU
	 7/U3cI1dLmiTCJlU0lZqi7rY6QrSSMsIAaQiEyxbyGTyGGFoh22mq7Rjx16LQuFqixuBS
	 IJvBDLB9mOgot9a2RPL34uiar9troamhGAJ9ScJoLzGLbBPse8bA/pdm4pdCtn4Pxui/F
	 +uX30xVc6Dh54FRNbm0bT7Xl26Q2Op9deMn3qFES6FxpkSokVxfCDrOkGnzqYZHJAmwux
	 Zo04cbV7HT6tHEom29omdy8oViNRYYLgQ7309lJnLuXVNcW5yXNRN0qmhy7OB1vCPwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0LEGlb0;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B4E606A69B
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B4E606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0LEGlb0
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so5878569a12.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605990; x=1796210790; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=Z0LEGlb0q3N+RJ5ZPMr2ylAQclxoV4QLEpA4FZLKE9NcHbBF7iqIATbbib7cVOU0ui
         v3sRiT1Id9+CbNjwleXIpTDGZViYW1KjfN5jm+wSg67vbs/MoSVyA9alUtRlsOQZ8Wgz
         lOlNpp2xXj2+qLbbyh5zoDdpGIMESWe29D79vgCBnXByHaToluIInpZ8kl9aKjA0o982
         nRkS2f42eEcWuvVtTwYSohAq5okloP0zuHyud9YiOzpB7jlsPn61ojX90cwOiy89Athc
         stlchf2OzdDLabPpzWyvZwtXbFFMNzO4Gd6JirMLdObFzUfYJXz95uAZR/XraqmqNCi0
         qZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605990; x=1796210790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=CgR9NAllJRWo+7mqdwrOCOexzChQUMfCHmYGrGtT6A0Gv2CkWM2eyBZQS74a2d4C1o
         WFiLYm5W+r1mnrY52scTar2vG6oLzETK7sm2W2xKVJxiQ8ataPoYWMGMAeyc7/Gys9kk
         lutmJAy8oqyzxPWa7ppL9OS3XDMMKV8+YbUxwGHr/ryNXgtwqX6Vle6DaSUcSmbMOIDV
         oLSLS9uJLhvFTBUTP0nWzm3s3Zn+Pt2e4fNgHg1xBNtd/GQOcTprGaHsP2/4rKZ5JYU7
         vmDqzRoQMPKZpQRd0ATQuWzSi2f3lnXPyR5E+LRPiAI82t0DCAelWEPU30PyGTQsp0QO
         5WNw==
X-Forwarded-Encrypted: i=1; AL+hErHiObVa1wEgrXJqXdmq7mqT4dbRSpNL+DA7wNHis8gLDoLXuXUvOIiycUWHf4EBbL7Wcz/xQ7V/tzAMIhoz@lists.linux.dev
X-Gm-Message-State: APuU4Z+Q39ME8wyVaNX05r71nZVHWhk2geHCqPYNEZyzoJT+ziKtaDR7
	IstjoxFOZp9Ui28XujAgib97uM/y74Mkv6GqzaHt/qrxj6qzP+gR5XTw
X-Gm-Gg: AZFdTZdNmXG8QMnA0t7DjTg1cKii2nf5djq6jCw5IqA97ZDSosmYyiCO4UvYD5uwkZI
	G11U+3YYoyF6X2CxMgWYK6DLhye3LTC0KdeBzYK/NE6789dNm1mWPWLB6UaOcvXGqOoTKs8VK0W
	i+T+plnhzemC5I2KEBrEYt4mEAN4RsJsqahpfNZPjVO5DWDWXgpjyW6E2/9DotmPjqQzuyU3jgs
	E167n7rp02eqd48HplDPQ5+kmQDKgbbaVlMHgNksutZtzyWZCxVvEuFBlHdwaYGsa/9N0BgQmzs
	Z/ClJFQPzqUfkYxDySlHy2/aZuSjwYDl6qPHi5GJETPkCjqX5dNoFtL1EMlP3hZHFmRlQqX9hTt
	BNHFSy5pdc9VLznfSkhrhLm72KUYdHKVrSDzYVuvURReQ1JSgqaKZJOaC56LqYk0hq0A9SL0PRO
	vUYhjUQVauNk9II85ZWLOoEXdBxb3U6xFeNMMh4gA6OnxOCaBdaznoG21nAMDLIUBCBXJR0DgRm
	Kx/bJCqA8GutjZGZeJrmiwFzN4CKc9bLbJqCYgcanD+kJ8XmtQ8LcooEn0kn67UOknzM22B2o+P
	ENuvge0gr3L8+18YelMIYbsG4/6NTQWvM97lj7Q1W/M4mjbjDU8QjVDy4SR3yxwjvmH9xZyz6pd
	LqAFB8eDQ1A==
X-Received: by 2002:a05:6402:4028:b0:6bb:2a86:1a58 with SMTP id 4fb4d7f45d1cf-6bb2a86201emr1407592a12.43.1795605990172;
        Wed, 25 Nov 2026 03:26:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:28 -0800 (PST)
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
Subject: [PATCH v2 1/7] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Wed, 25 Nov 2026 13:26:07 +0200
Message-ID: <20261125112613.237333-2-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After further investigation, I have found that Tegra30 requires a slightly
different programming model than Tegra20—principally, the maximum VI clock
differs by nearly a factor of two. Additionally, Tegra30 does not require
the APB_MISC workaround.

Therefore, remove the fallback compatible and add a dedicated compatible
for Tegra30 VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index bb138277d5e8c..2d5538a1804f9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -18,16 +18,13 @@ properties:
     oneOf:
       - enum:
           - nvidia,tegra20-vi
+          - nvidia,tegra30-vi
           - nvidia,tegra114-vi
           - nvidia,tegra124-vi
           - nvidia,tegra210-vi
           - nvidia,tegra186-vi
           - nvidia,tegra194-vi
 
-      - items:
-          - const: nvidia,tegra30-vi
-          - const: nvidia,tegra20-vi
-
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-- 
2.53.0

