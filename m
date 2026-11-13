Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557690;
	b=IOgo8kpJrrw+fNhAkypVlbmLsFBKD38mr2BTY0UswHeJqlVua/NtOw1sbHvi45xeftxQ
	 d5H7LaoeXnw3mldTSVg1Tj3HmUFGj+bp8fKha2dNBQ0Y7d2nXvmQPxozGn+xxfDBNYntJ
	 aRSjeJRH2iXJ7x2EjjSwsPJYlsFI1E6NOd81Pfca9rdDLv1pKURYNEEmKP34/vSlkTWR7
	 k+YWUwNr3Ya9/SYP3amjMXHczFoI1ahU8r3ORSOf4XS/MNRXPWldzBpn+8AFAqfPjP8rU
	 NRTw8M3yfb5/6FbBIkkZciUaprLmvxmnIkE5fkU1ZFn2C538W9pjGVvbtS7fJf1awCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
	b=ut/r/EmvJvt9pXhbZSMBP8zb4WtOfGJ8Jvrk8maA7YJaoi4sXYBxhUnLJDOhKDC7c4cH
	 yP2x0Njr3PoPtNKqeKQB2K62iyvvOntSVSHIWkPP9t9WsOiTkmtOHeMxx+TVgb9GXriJj
	 qigclh9W55IbzlU/yiaV+bqYvmUVdqGEMspNmhnrnJg/TeprqVtUPYXLGCh9RGOPtdkcX
	 ryMSPnl/Lfvqan0xujEm/0XLSmVT5hdFd860MfudN7zzygW3yNqdsN5W7FfBDsg5BPQx3
	 ouJxbghAfgB4VcoTTpuY1KuL7Eu3T4Rc7P6EnCpvIbNqEIq+ZAuV4aDCKU0GG3v2TIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJlallDl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D1606A32D
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJlallDl
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b335eeb340so6579127b3.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 00:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557689; cv=none;
        d=google.com; s=arc-20260327;
        b=KLlMs030XMBSsbvjMBfFzFAytIjbJS8HEf4sDGfsfUv8a1rXaXAA6NJ9p7umiNBbWY
         ScV0AqOwR62ghXI5GmDzVH6t44T7V4ezYLgT1V5TVBmh6pB1/56xuL/9RexfKIYFxzz7
         y2X6aYCqM9macS/OQPlTR32D5iYpwRSryNMocidsU1qbeedKYAY871TL55pMoV/bIUQh
         oFz1xlzZniRGhqQ2AtDjIk5c4U+STuin57TL6AqiGNzXUsAQk+B7Oh4Hq+0KdizbfH0D
         T+MBFB+c/9RufYuRyLWObA2KreK7rOW0kL48lLfw9zxeTE2z1IgwJ4pr2ffurQJR8ErA
         QIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        fh=tcONLgUr9QP78KrpcFc47Fa8yWyWADqD4snoCMWGkxg=;
        b=I2/bQ95lsM8JDkOrihv7dJYr0+F+Ouz79AVTs89Ya8E0h/Mg0Q0CZhr5dOCNbfZfO6
         7MzKbH3SzmJ26ly800svbxw0V4A4jQLZ8qryUvtpTz6Ta+ZwlmMpvEwnf01qKAZZTrT6
         HMEuI0qjdcX2vPhkyb7YzWfYZ9oKN1BFtkbt7LNY+XssbL2oDAd/RrsHZHN8gjKb3RQf
         97xWPxarFCteDj2yeNIE9PHvP1KAE2WvrRFgZ5DnX5M6HxDt7BVJDZ18XNwlV3Xt5YWT
         BMLvjUD0h7jQXcrX/mpgzvXQhwnIiA6QxyCJHaIL7toBtcX1B37cSBp5so5sRVYTvZ5I
         ReDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557689; x=1795162489; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        b=xJlallDlvIfzL4QMYVcIP4DVJz9xwW8SaaqrWbs7S9K4RIcbRwhtIdTlKMmJ6dRHkd
         mPQ8S/j+2WoOCO6odIBDVhYCVx5Iq0FTQoCIeZze/cJgZQXm0d8MnRm11FpkxeBfJ5io
         62KvkTtS1dN0H5Pj9Ku94u11yQQq8zun/19qxV2tTLGzAo0oOird0ChePHMO6EfT8AnW
         53aRHDyQEEcpUYNRMyWGB6Mnn5kc6SHwtLW96BwicjHuNWeD9p0XTzK8Z1WojwtYZA+j
         cMGwM6Jp00fCuRLF8+r17PJC2u4WbOO/I2gH1ESBz/JOij1HiCsZZco9C9fJd+iwIgUf
         o+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557689; x=1795162489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        b=h1w7nV7Ue7UUy25MFBdzgwCJmXEJv7sXQwjwimPzTu55EDDigeRip/TTePr0HyLd3L
         iRRXSH7St2AC+4tKLet2f8xgMdut06NDW3OdTGwiyO3ZFzfYujqauLnUYyf2HE7/tFX6
         EMbzcxofANgIRpFwmjxyLArCBQySdEdBMLOvp5o1PoZdN+rGUjRQ1fhMw7+cO4rw6fZE
         1lv3d6/Ap7+vIe07Ut/BSh1maHtpq1S7ukD4arzQYxSeQ8QKXHcS+dieDcQEh/0A5VIh
         Bpa4qS6cSOoWPwLWcNM5aGETP0ZkHqXPSTwn9W+41FWdUTbOJa0+zXutkxRrEePFtTLB
         23aQ==
X-Forwarded-Encrypted: i=1; AL+hErEupkHAOCp0iczAV2qTUjXn+29DaLN5IHON+wswlFjTO5tX095Rt3BGnplGlXUeuDOY0qv9zfXSB6J597HQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8koAASLwJojsda279qmVOnUCEMDBtfPVkwk1MSKp4c7c6lJzc9
	m1hATumDyOBCHWhz/xuFcCadS0m6QoByAt2hOo+HtNsdvBxQiwWzOu5OhUzeiQSJtSN241Vwu07
	JqeutqDJLITrSWvvUSxmJA1LhaIxa48A=
X-Gm-Gg: AYBFou2GIqdDm2yJEnZR/meb1SOrMVsGs67wrvnyUfWpLzNuBwFotWZQsmvLjefv5hL
	uV+lc31pOcjfe+nGA9F5y0q8qpYC5FIVkwU6NNVuKKt5vAOU+P/36GZiYk29HuEMDf7jUEESO8t
	KZWratElaecDxq4f9R3tvvRB8MOBtSv1SyNnRR39NylXthMzjlB7K6y5vD9i30qXfFbojJcBtOl
	C6DSBOqMdtt03MyDiXgJs5eovPa0PWoAqlhMC3I8Do/xE5FCRoV5tVYuHPznbiL018+ODA9kk+a
	Hfi+XADVUGduFnooYqXXg2x9Mv6p2kp/7M9EYecpQ8Bk73up0e6jK99rd2P+VprNG8CpE+puAV8
	VMPaB+AmyX1cxYSQQNtad6Alyzap7B8AT1OmZN2Z8zFNURLt3fX2gqGS3EKUnfLs8apzBZvBQM3
	89CxWwyq3bhM8umWLsy0LjcMbw4kGqGsZ6FIllUQpAySXbC/sKCRUhbFQ2V/IPzCM1n8r14wyBo
	XCtdDJ/BAmiz5R5FdnMA4wiwlfSjIlZZg1tLHyK6KsvxhASeESLsu2tfcCZEw==
X-Received: by 2002:a05:690c:3181:b0:8b3:4b5d:b27e with SMTP id
 00721157ae682-8b4aa305e99mr10167187b3.97.1794557688698; Fri, 13 Nov 2026
 00:14:48 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
In-Reply-To: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:14:12 +0200
X-Gm-Features: AclHuK9qbW-wyynTctV_3zFfoGINtBxA66oHn6uimxFXxSc9GV_qnhsXF2XNvyk
Message-ID: <CAHp75VfHn8op1UqAwn7Rs6SxnkseK0i3GxipFpdAnjL1mJGAdQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Only change the PMC clock
 rate when needed
To: mlevif@gmail.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:39=E2=80=AFPM Manuel Levi via B4 Relay
<devnull+mlevif.gmail.com@kernel.org> wrote:

> atomisp_csi2_set_pmc_clk_freq() enables and then disables the sensor's
> PMC platform clock before setting its rate to 19.2 MHz, which leaves the
> clock forced off in hardware.
>
> The sensor's clock is also controlled by ACPI: the CLKn power resource

Would be nice to add a Link tag below to the ACPI tables

  Link: $ACPI_TABLES [1]

 and refer to it like "...by ACPI [1]: ..." in the above text.

> in the sensor's _PR0 writes the same PMC clock control field that
> clk-pmc-atom writes (1 =3D force on, 2 =3D force off), and the two do not
> coordinate. If the sensor is in D0 while the bridge runs, the clock is
> switched off under it and the sensor stops responding on I2C.
>
> This happens when the sensor driver probes at the same time as the
> bridge: the i2c core powers the sensor to D0 for every probe attempt,
> including those that end in -EPROBE_DEFER while waiting for the bridge's
> fwnode graph. On a Lenovo Miix 320-10ICR (Cherry Trail) the ov2680 probe
> then fails to read the chip ID in about 1 out of 10 boots:
>
>   ov2680 i2c-OVTI2680:00: Error reading reg 0x300a: -121
>   ov2680 i2c-OVTI2680:00: failed to read chip id
>
> The sensor never binds, so atomisp registers no camera at all.
>
> This can be reproduced on demand: with the ov2680 runtime-resumed
> (CLK2 on, chip ID reads fine), running the same clk_prepare_enable(),
> clk_disable_unprepare(), clk_set_rate() sequence on pmc_plt_clk_2 from
> a test module makes the sensor NAK (-EREMOTEIO) until its power
> resources are cycled.
>
> The enable/disable sequence is only needed to change the rate, which can
> default to 25 MHz on Bay Trail. On Cherry Trail the clocks already run at
> 19.2 MHz. Skip the sequence when the clock already has the right rate,
> so that the bridge leaves the clock state to ACPI.
>
> Tested on a Lenovo Miix 320-10ICR with the atomisp driver from Debian's
> 6.12.116 kernel (this function is unchanged in mainline): with this
> patch pmc_plt_clk_2 and pmc_plt_clk_4 are no longer switched off during
> bridge init (checked with clk trace events), and both sensors were
> registered on all 10 test boots.

> Fixes: 0af9078315c1 ("media: atomisp: csi2-bridge: Set PMC clk-rate for s=
ensors to 19.2 MHz")
> Signed-off-by: Manuel Levi <mlevif@gmail.com>

We might need to have Cc: stable@ as well.

...

> +       /*
> +        * Only touch the clock when its rate needs changing (on BYT it m=
ay
> +        * default to 25 MHz). The enable + disable below leaves the cloc=
k
> +        * forced off, while ACPI controls the same clock through the CLK=
n
> +        * power resource in the sensor's _PR0. If the sensor is powered =
up at
> +        * this point, e.g. by a concurrent probe of its driver, it would=
 lose
> +        * its clock and stop responding.
> +        */
> +       if (clk_get_rate(clk) =3D=3D PMC_CLK_RATE_19_2MHZ) {
> +               clk_put(clk);
> +               return 0;
> +       }

Hmm... Wouldn't it be possible to actually avoid any clock rate
settings if we have respective _PRx() methods in ACPI for the sensor?
Hans, can you check your DSDT collection for this? I mean the presence
of _PRx() methods and if they switch any clocks on or off.

--=20
With Best Regards,
Andy Shevchenko
