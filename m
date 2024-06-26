Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E7C1684A4
	for <linux-staging@lists.linux.dev>; Wed, 26 Jun 2024 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394207; cv=none; b=uE0wJkcIHcBATtSDmV0u/S07KDVpl58Mv7OijXGjDKE4S11LXIAnBgIMk8TTgFaET2pdIFjD/RcHoG1yMf5KaDeS/r/nw5A3xGSpOgmdI89xdx+QPq7yDliup6YNZXt6MRpdxZF1twhiUuG8fl4gQbO5ylO7/zifJR1mR0Iy0nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394207; c=relaxed/simple;
	bh=cZWxBSiO/iJGBZwpSi/BIu0JIjVhS5+evAWr+FNRzAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VEAPo6jwSv8UDZibUgvTKTThJ3Ct2xJh+De5SHeRr2hedi3tErA8PcGE6PLus0zWCJnILsyNk1sejmmOrG+TQRGP5Jum8MYnboOBkmH8yq7BigMIQzy3OQ3ykvkYG5R0qTEt8X1YAuEaEiWXL6n31NH0jrPVI6UcOsv4reFwEKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bR9U7RPG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bR9U7RPG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7041053c0fdso3760072b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Jun 2024 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719394205; x=1719999005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZWxBSiO/iJGBZwpSi/BIu0JIjVhS5+evAWr+FNRzAc=;
        b=bR9U7RPGN9VziZNFFJKmQ2x230FNoWsHKJ1qIlA5WHwNoQZGbeV4KWSftWptcqZILb
         1cLAmba3o3DEkr5CF1vDc45GLdYHGoS0xL850kqhT9GtAJpzO52lX7dVRJPI4oeaK2TD
         BVV1WV6dBAtLy6L3JTdwTbKGx7d7aXEsJpu6btbc8z/bwNmpyO58zGDngtfNt09C1yoC
         Te9zdyWYkkHp3fvXqnTaLXPhsGYE910cZaqmVtCrQz/lGSt5EBhUaJMlnNRBgHPsbY8F
         t2vhk/H+pg5qgEVaQMcigLqhcUUuY2Q3WlAfjvUoYjt0mCXKPhnKYx8y2yUHlunwAkS1
         OH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719394205; x=1719999005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZWxBSiO/iJGBZwpSi/BIu0JIjVhS5+evAWr+FNRzAc=;
        b=ckKPWmWZ2R0DSU2rPOkhiWsSThzmNFc2kyTkK73RmxpIpj5SGPEYo8oZCdqB4chtHw
         PFXZjEgkteNBlbn8yfMXYsyr2WNjpHvwth/WSvxrOWMHyx/7kkRRLJ0Ao7FfyHfby+rD
         NAPxCN5pUgtZa7rbwnfej9gaZ8vBcHkphnKQBhNRF7zKuZwCziNYkJ26YDMr19MSot/f
         5l7KhRW9SYLjyihVVh4CegFH7ChYcUCRAuQQ30uScp5bYXYhG9r6jWKs1J3dDrZ74u76
         GNh4gw0YovMy8UywWqRsleM35OijVqQBhJAF5/9di4A2K4ZDvT8ioP2wA4mk+LaajeuL
         W0ug==
X-Forwarded-Encrypted: i=1; AJvYcCUbngxWIYX94QxjGR3HYKFUJRBrMmf6+ml6WxGXn3pxcJ1sbPP/LsOPysErNXDRqwu7DOXH1SHjoJ57WfH1u+IOPj6YJD/MEwHuEvcLZA==
X-Gm-Message-State: AOJu0Yz75/gnNPHR5aEpT0OV122W9fsZWHwyjVuknHVsp3QKY4i9ydnI
	mSEc7jqxvSf6CxFxNp/d5680kFei/EFkYr8Wjv89mQ90SEbKCObd
X-Google-Smtp-Source: AGHT+IHZLTWWWiK7JVATb724zAbQNSxCuFklY5BX1h7VZKH4cXhxSYQMi7uVau7fHMxpC0LqHr2cAg==
X-Received: by 2002:a05:6a00:2d5:b0:706:5aee:b987 with SMTP id d2e1a72fcca58-706746b601bmr7122207b3a.22.1719394205361;
        Wed, 26 Jun 2024 02:30:05 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068998497esm4994220b3a.15.2024.06.26.02.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 02:30:04 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: andy.yan@rock-chips.com,
	benjamin.gaignard@collabora.com,
	boris.brezillon@collabora.com,
	conor+dt@kernel.org,
	daniel.almeida@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	ezequiel@vanguardiasur.com.ar,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	jonas@kwiboo.se,
	knaerzche@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	paul.kocialkowski@bootlin.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)
Date: Wed, 26 Jun 2024 17:29:55 +0800
Message-Id: <20240626092955.530229-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620142532.406564-5-detlev.casanova@collabora.com>
References: <20240620142532.406564-5-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I just confirmed that this driver also works for rk356x. I tested it on
orangepi3b with kernel 6.9, and chromium can decode 4K H264 video with
hardware acceleration.

Here is the devicetree patch for rk356x:
https://github.com/amazingfate/build/blob/4c3564bc82b8963246450d3ebe1ad93965e7c22f/patch/kernel/archive/rockchip64-6.9/rk356x-add-rkvdec2-support.patch

Please ignore the change of vpu's compatiable string change. I did that to
disable its 1080p h264 hantro g1 decoder.

Best regards,
Jianfeng
