Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8FE3B8D4A
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293507; cv=pass; b=eqBOkwsDGYSbAckoH0FPLCtSyBRZYDA4mPYXrd4gcxeqS+QJXnUHYVev6Wq4A7LbLDgK+l+f6U/3x7rDs5NrrANp1QFI8l1mJBvj1SmfHSOTorI+0SRhjWeTrjE1NQQNqnJNmFP7j/l7pdj4PvLH5+riNY26s4Dm/5VrasjwRWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293507; c=relaxed/simple;
	bh=zamNpFeA1MZ17r8CMsJit4TwZ+RjEPZDXwmFPClldsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sF4rtG5bYUKURD58hpc4AR4QbOirnO25Wlom+2ohFXd+KwKZ/m1/qSqWq4gsDFg/EMLOrbmp/UuVMCVLUkQ71uIHxr9sM3dodWqPqEXJmAiaa4t5DfHNE0yEXHKE+ETgbE8dXC506ZF0OSqA+638lZFfT3J3YV+WTnDx0BCQBaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzsUFIpt; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzsUFIpt"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65427236e94so6769354d50.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 05:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777293506; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXG8MRgwg25jQEF+BhnLLU3KsshwuEKpIlJnfQ3gGs804vYzhkSztHLzo0FLr85qfr
         uF+qIoeQUx3msCo13tNUZ8vOUqUZUucezewwwkWh172CMxMTTsUO4os7WzDixzK8XdDp
         Xz2npTrLttW/iSTbgCm1YzFWWwCae/NrTj16BhWlvZHFpKzXgfg//e6q1iN1HBhFp4dP
         bZbbjdBh17642BHBmIncTSW/JW27yVOyyFLGPduNjis0Jpi8QoR0tsd0cjbu5QSJOSBD
         99G1hT6GErc8dxkSxlS5KE8os/OzDSDe7Yp/j+gvScdgDTwfkYoRQYryYmzQluF40a1S
         0KFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zamNpFeA1MZ17r8CMsJit4TwZ+RjEPZDXwmFPClldsg=;
        fh=zoL5iAz1DDBa9I4ZFnBJTJDuvn+bsgHkmTgrx89hhCc=;
        b=M1SMWPSObMkVdRfFl+pvD7nYgcpfNFhFUgopxPPbgtwsmxW8Bb43JEXrkG9lv06C3Y
         DaIhjB9fbEQjaoDTXhmViTi7oDQNtvtD9akffxLfFGlbai8I8cjr2rwYE4n9yVfy2mAq
         wFQFYyQRgpp6S8NniHK8n3FV0MrBynRQeu6b1PLsjmHqcDM+ry4JvGs7ezGdXZa54iqA
         HPejO8Zi7xWtbQhxfi16ByYBtE8K6OmX2fkl3Pb9+bo0d87LwB2ySvW+3KxAF0JGwuDV
         wdJYCwLBCh87gxucIpOALMKhlW4dcOk+NPUIbOcV7U3gYN6CSLMV+ddMTA77YKdt1EU8
         je1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777293506; x=1777898306; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zamNpFeA1MZ17r8CMsJit4TwZ+RjEPZDXwmFPClldsg=;
        b=FzsUFIptOvbcf4mOw2j4Z0OEEMh3vUFpaMrb3jsqa7GmwLMQjCn2Ukx/eYh5KapuIk
         XPHJh4WOg3q8r+xqx00SzMh7MtnUAKuFF7Nylu0JupppLCOXpAXIy22Yrj8wAh/nAo1h
         8q3JCop/YV6FZjbN1tdfULghVRRTCSNdwToVf7BFlU/MEfN4xOwsdUJokiEt6GLcM63T
         jlW20LHvskuAfiTZhvIJM0REwAHkYXhbsuAR/2802E3Fi5oDCZAzmi8POoffrc9EYdvq
         sJH6OocU2GdgqNIombOlX6g+OzRtzTFXDl1m1NjS+T/aQ0L/kqMPZfGjfPfdKvZzLQOQ
         YcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293506; x=1777898306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zamNpFeA1MZ17r8CMsJit4TwZ+RjEPZDXwmFPClldsg=;
        b=TLxCGJzIbBIqiEHl39HFA7JBynndXdXSBJNOxgROGYmtwHkpFREV9Xt+cSp5hyrXqG
         VnlYaSDnkfza5nB2PGL0scUZJMcOI2IaIJnnf3wLI4Vm4VVySFqR9irA6mn9GPSgGPWk
         XG9GpBkSl4baVeeyTOLLVruUH+9rXWBpB17cEOZlNeeG5etatUEHEnHaxfo5ndNSkUUH
         OWHw5/edchZR8tTqJYy1qc1nnc5Q7TcPX9OQILXWEhRyKB7Ls3cyQanXpyvRge+8aIor
         SQHlEa1pAkyM4W6Qmb7YdRsOvhfpvpaebI5sRIS/1XM+DfUlm4Rdq2hknUxaI3Q6DDzH
         fXrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RnMoobkuybySIGKhWZcj60mCQdbyBijl8Qtm5oGwa4WXpulO9C2yqLq5MYeW4YkUKznIx3tqY0/Dgxmit@lists.linux.dev
X-Gm-Message-State: AOJu0YyF2lvZINWFVQ7QGZIWB4wlQfQUIl/mrpIrOZMBhrAfMuGeAI8m
	iJ9EcmXP+jVIxnBhZHjFtEzXNzmHCg/PlapcldWORAha47r2dfrsymniB23vXNcotp1hrVWVgNe
	+RIxbwGpIe5g7v1HzhFymbQEh1kcmmz4=
X-Gm-Gg: AeBDieuUTOsxLT1BETxqhwc+jn9r2rpZOIdZ6dMfgtfKnh3JiC2XyprfX9zCSZ6Li68
	wNChivZNyAsVWPGEbmb1ruEf7pqmxPP2f2jN7yvLy4y4+yLu6woT9Qiq4UNFwGV0ZvTMy+AznpK
	krqLZ4oe8PQPHlSQ7f+3drJlwDjvhPlyyFduT+pggT99d15+n652nqHcSOwHsrIc2lTDWhtz2Wb
	KBU5sfoAW3xTWrHXuM09CSD+cyKuYXVVbU3RscNWvT2QNeMxCLqj58GdNcou6eECgRh3YD2289A
	qyf8B/VTqC/xVCI=
X-Received: by 2002:a05:690e:124a:b0:651:b13e:f9ef with SMTP id
 956f58d0204a3-65310803d3fmr38518177d50.14.1777293505766; Mon, 27 Apr 2026
 05:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426205039.125818-1-m32285159@gmail.com> <ae8b6wdyNR-G-i1m@stanley.mountain>
 <20260427110215.1d3eb495@jic23-huawei>
In-Reply-To: <20260427110215.1d3eb495@jic23-huawei>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 27 Apr 2026 07:38:14 -0500
X-Gm-Features: AVHnY4JH8ViBvHUm4gauKJie9Jw5lHzogx117wNnCK5_l03aEMkAwKbZrOFS4eU
Message-ID: <CAKqfh0Hk3fAysVR_g43F6it9xaeTBwk7VoG9BDVH_h5HNAJ85Q@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: adt7316: Add error handling to adt7316_spi_probe()
To: Jonathan Cameron <jic23@kernel.org>
Cc: Dan Carpenter <error27@gmail.com>, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

On Mon, Apr 27, 2026 at 5:02=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> We do normally check spi and i2c writes.

Knew that, I was looking for unchecked probing and writing in this
area and came across this.

> Anyhow as far as I'm concerned adding checks to normal calls is
> fine, but not to things around reset, mode switches or power
> management unless you can test them.

Sorry, I didn't realize this area was *very* special. Obviously I do
now, but anyways, I'm going to drop this patch and focus on some other
things.

best regards,
maxwell
