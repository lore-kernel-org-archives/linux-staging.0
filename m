Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49CB36EA8A
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997894; cv=none; b=pZSfmlDiw50NUcp4YgMAZjaAVfeIcMBYbmasRw0PLUpCBH3aArod5zl+bXbGaWjIRbiTNk6SlbKxbY6wQoajEEa/3/58wcpXcSu53i95J567mmDg6z9sYnH/CHU2QQlLuPzu7X4TS/2jVGVKaNhpK7hawYYHW7dGIUgEVtQByW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997894; c=relaxed/simple;
	bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBtz5iSokh5OeLuKjIO2vPf11L/BLj6lEXMLR7/wf/Ivs4UIZnWugOcC3qTJ1wqcRHq5Fby354B/f3ZHxEs4AVPaX5xUBpYBqwX/kC/B7aJGkTteg7J05KUZCEPDVNlWoQo7NBIHAIlgXWMIPP1CTDQcFbkPmN+Ahl1rkDg8C38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ04sFVw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ04sFVw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44a786a9a35so2898456f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997891; x=1778602691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=jZ04sFVwplLS2FTjpipjcSIu31Se6U4FiIAP7dQQ1uFoy43r+3/cQVGNjkIkifsj7J
         W7tY4vFEc629qqRTl6FxHXjZGgIBEia/N8KVOLutIuL5sg4WeM/CrjrNQP3nnJx0bku9
         T+TWlVAKMrJWdEduNZ/JN50tXFXatX1UA2o3EMLnFvZ3gcZrnayPr7goveD28l4JsjN5
         Q5pPnkWQ+7p6sAzFQ1aMiOenTFSMXFcT3phqqpZQwpSfvJeJYEYmcDhSsaEpi0Be61Dc
         jAkiPzmEnT7O/8/u9L4EOjQpI9QqqWfVCVi4JPMLGuHX7v9xiD1inREaF9IxN1VuoKxG
         tJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997891; x=1778602691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=K/hURowd8Ay50AmK2xGX2OIwQ2fqEaLedrTcJXwVVPelmiefLSctFsIFyDXvwycoL3
         8sCQ8WYgdB25aBFnmnHgBqWGi+o7mrTQiy2uDtTHDsJ0dsOxAuAAAhyZrlA9nZcesst8
         hIMNqlaD8ZG/Ao0u3/t69GUCzlIWzhyvG4HmsnRSKllEp8NGqJJ8rz2ZXLe44sZwCz7J
         OCHwcmvOWSEJzQO2PAa5iysK3HiwukONOJpdHOZhPxI9wn9kPGQHp41jzcGVojat9S3r
         MDripBbWcFHjn+sim/5PZ60xOiVsNe9c8MCTvYc/mB3dln82xyBPgyqpTxKljqzCtwDt
         5toA==
X-Forwarded-Encrypted: i=1; AFNElJ8iKrnmVVM4PSsYEiwOjt2UKn9ZmhmSK50Gt5t5cZ6oNSO1nnbH3z9+eZuJZH3Dy5whtiYxbs2p3QoN3uK0@lists.linux.dev
X-Gm-Message-State: AOJu0YwnZ65jkWX0dgupwS7ckwRnm50xE/peghPEL41MqkeawdZrgWYN
	ZRq5bPaLe3xpWvteyyWmHmOHG0XJ2W8zJgso2P2vbaE5zydfLRlR+8fx
X-Gm-Gg: AeBDietm/tPBuly+YQkZG3oXCHJPJ+eLoUwTbkvmrFOzQjHupv4ield4+uX2OrWhFIb
	a+XCsIQydj/zeyqa65wonv9cnXCGwG0ZqFkz6WEkxtKYm9jnsE+i77GPFVWUODAe/tGkZjJUUYL
	6mq74/2S4w5oR6pWFzK+BTnqcvogL6CL3zIUoaMOW5qqbt8MNL0KCiruUBOj115a6o/JDl/+CGa
	3TkCjNmWcwRRtdZHUkU36Ubth8Rgq4N0CA5XM2tHNZ9CsbPHsJ1phEPSRJUOUwc5ChHIHDkx5US
	kp/WtOqeGpqAXX4H7CVhWa+nFfb5WSaDW++No/KjvQjFJHNOSiyVtAiM3Xrntp4cU/+74qMUPWa
	LxwVbWfN649b8iGt0gtkigMPLO41DeSqRTlBjUm6u+UoBBRYi2TGFibn8J6Z/DsRXoPyEGaN8hd
	XHDntwy2SGQ15p10JVNXpaHfSh+i/FYyp19N8lE50drDJjdbvJ6AOWTwuU5jsRZa8feiK4FTlh0
	uqjonDT/hasf9FLWomJkwj/kbAd
X-Received: by 2002:a05:6000:2dc8:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-44bb2f282f4mr25038895f8f.9.1777997890976;
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505558e213sm5821604f8f.25.2026.05.05.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Tue, 05 May 2026 18:18:08 +0200
Message-ID: <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
In-Reply-To: <20260505134812.408316-5-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The Allwinner H616 SoC has a video engine hardware block like the one
> found on previous generations such as the H6. In addition to the
> currently supported features of the H6, it is also supposed to include

Remove "supposed".

> a VP9 decoder. However software support for this is currently missing
> and still needs to be reverse engineered from the vendor BSP.
>=20
> Add the compatible for the H616 variant, using the H6 variant data.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


