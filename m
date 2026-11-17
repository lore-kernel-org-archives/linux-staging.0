Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937279;
	b=gejxF4J+2paUgt2+jP2Q1YyqXkve5JSzdceQ7P3ue7pA/NDrcN3xjVayE9NBJqwg+HuF
	 pYFwUKaYm2IJC+ww7kmBvVyC1Gt1rqvt4CxEKhYSf/Mn/TpkjSorlIytjMGaNN7SBtnCZ
	 ukh4rh40iQ2KRF4c8ImqszQILWYjbqTQ5+bz/2kv3MbHdxrXOceK6RvV2ep6XHDGhlThm
	 emaiSh/fnKntL8rCPEsuRySPN1yZ6JmReSdGUvmxXrqjoUb2F8zURuyHx7W/908j7rX7+
	 IZGjlE38SP8fmpdKvnUAQuMq2cJafS8HXOwlLzNzuWvgLeS8vbCpl67tznNdiEO7G/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
	b=OoDAgB3tMJ+fdgbpuPZNzj3tV9LdbBWfwL+PeEDVEjJLBTxyGB52aD4/O90QCfnx8ZxN
	 eGaua03Jp74BtdWWNkXvVJp3ZATFYfremW0PQdz5lwuEnEgNOnrZvVhTNV10Jfdj39SXV
	 Vo8ISrtjH8en4WMIuo3YxGRm3+o0IHjD4PO7UbVwHeJQ6ZL3BM4TvTVx9pWjBcE1ZD6CV
	 m/e/igvCOrnyzRjU87hEFTFLK2xqBPaki8LLN+8T+wSEW5U0GpnY2NqLWxBumOvzjx1Le
	 CZSKpegdJEuKJaz+ZIv4/qJSlsUMnpo8rTp+i6CZKB8Y6/e6jrw/uv9AC+wNqoZA25A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsF5W674;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E3D606A336
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E3D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsF5W674
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67583c777abso1639672d50.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937278; cv=none;
        d=google.com; s=arc-20260327;
        b=MeHwKgMpVS1kNHeSrDnHBo6x2DBdfdkiJQPNgwnAaLQo0LuQK+YEONHqUZM784Lv6n
         MbZYfqqTFca+1lO3VlR+tY1YiEh9K6IxUpGf0Fh5AxMdsipvaaqAjlCQe3z8Tt7xAWX2
         kZM6fzs20RPzh1ii2z9Of4elvOULYgteuYCRLSQB6qDBU2rNYEq9IUVoWCm+wsiBziug
         VMSBWTC7lM73epB9a1hLaQgzer7+q8pjXWU+FVhwQVAajXtmcS10/hkNeIGiCxs4cpGP
         lO3p8zYRTb+1u25xc5q/2RQuLFnmEJjWa1cRRNu36exwOLT8XCiZfSKBhgy5MmyNfz+q
         2B2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        fh=utnjWWtOYJ154G4TSnObB6RrK28VBIvbwh16wSRuXEw=;
        b=bybsUubIlGE5IGsSjo/V7DuQgf4oQNN43dgw3V2pOlpFu9JNerkdYOF1WHGhNdxeUl
         7CLsHgmWxPCdddM6DmWLOZ1fHu6iyVt3DJGWz4wbklYtSpkQXc/XTK3W7TievKl2IXme
         uVaIipN5rcRCyd8rBdj7dVhVlU6wVmuW5/nN6YAEGiaB0M0rnu8wcJ03Mj0s9cFrk+sH
         oiWikxU38pzxQvI6GoAbuO7+NQqjny26Q5afPvxc93iGwxYoNkmv0ZYtwgyIgVuDwgil
         uKfHRtCux1B1L72nKEntax7exiakoj+k7iHzCH/CcU2bN0dMfjupqHqUwXjOVco4dwb4
         tv7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937278; x=1795542078; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        b=OsF5W674FTceFSAkC57bXd9Z3OXTlP1WYqnYFX4m5Aaspx8qwqQH2a5WSqZywwizNi
         DhQIBzZ6/AVF6ZPyFxr6wjn8IxLsPckNv+1biWi01aQuJ4Hv2249KZ4DqAMOiI6svokA
         bax1qb0GCri3R2NIKI4VJQzkpR+D06E6hgOblsLe233AeqMy/M9UbuVw2hbF9OwkFeOF
         KfuxGslEhu43BkkXgj05qSaACtLxl1BsmZaRGbFyrVszzupAOStrFN3xmBkv2h+4J3x6
         a9bAA9EjxWBIgIMrj7UHYEp5v62baUrNKfqT9FKJT3HLioKTyhxbn7IS0WFuExaeCi3S
         JNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937278; x=1795542078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        b=z0gGDdDHcMXIqR3b90Rl9D5xtWC/FqOnoTbcs50YKi2zDdnDIAjhaPpojlxqwKnqUM
         J1OQs8mTZw8ZYbVZ9yNumDXDcxTr2TvPga17WiJGaShsvcMA3DbvnH3UujbUmIR9UeLg
         DB1lO+DljwIH8N2xeNPQupX4Kxl/p6Nixhuo/GSzXebKb3GJycVRv3n/q3AHUrQfPTd8
         YFVtJ+4W2YyDz7VpI/NsB4pFYQS7AreL0hY7Eoltf/hhwFLCXjK4spfM0UFjWsBJJu9/
         2AdRoAuCNXRkB0XCWpyGptJjs+EFTLRTBAV0e4GqZd4sUya38ZecQpZ8mmRVLMRIcUWo
         LjdA==
X-Forwarded-Encrypted: i=1; AL+hErHloFtUZdzmVIHTei5v+3OMU2m21vNSZ9FapfcZH28E6JoaZ0cI6rxOsU62dz1lK4nm/7aIqH5wOr6bPzZM@lists.linux.dev
X-Gm-Message-State: APuU4Z90aowREuULk1eqF9feiyyGJMOlGE9tGKfe2qTqdIwU/KPJ5jsp
	iBkeAhhE7uk1dLdauMN9FUhWgKq1fcoYsYC1CUXYiJdQ6uVHvcO5J34Wp2XWHD4It7l7yuymHar
	E32N32C1IqHryAvO6H0SRO/Gt04vTBJ8=
X-Gm-Gg: AZFdTZcct65WG/+KcSh3YFHI3Nmg8ykFbAwUAje15fGak65qh4UsuSrm729COCYv48u
	gkTpn06w6fLj9YIrub0xt6ZHhaeXjnOCXg+i/0W9Wqp1sJdRUhc0c9otfeaieTBw2mQn6L45sq3
	EpC0zvO39y2tvKahqomy5sjvHu7tqhWEI7TbJeXwooeEFHRV56WE2sNzThFketq+sB0hmlTk/F0
	d9mAAonM2kw8kp7jPrwW3C/pYNNqZuXP8dPyKwxV/nCLgjdhyMB4sfFq+gXGupCbc0HKtJ9Yv2V
	tOXO0sekY4CuVe2KzHY7YHeXm6ZDXL4JZgAxZKOCKGg+ohh2z46pHzJ/kqxlTvmySTFMpoyuPdG
	ti2mcUw+jgzqMS5rQw3b7Tu+U2l/Y7IrUuBQCV51OAr6luUXSS0vKQe9cZMsPLio3mpufAAtzBg
	VSQqr8uIcbU/53rIkK
X-Received: by 2002:a05:690e:814:20b0:67c:7317:de9a with SMTP id
 956f58d0204a3-67dd3fcbefamr95689d50.43.1794937278391; Tue, 17 Nov 2026
 09:41:18 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116173307.14169-1-volodymyrchapman@gmail.com> <avwmPmzohY3BCwrI@ashevche-desk.local>
In-Reply-To: <avwmPmzohY3BCwrI@ashevche-desk.local>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Tue, 17 Nov 2026 17:41:07 +0000
X-Gm-Features: Aa3M54p8jFkXOh9LYokUtAIAcha5-QcguW5hVoJ7lYeF7_rN5Mza3f_HdmKjLCY
Message-ID: <CAN1s30ri4XsBjt6sos9pcrhPb2wch-m7fQhYaMJKTWYZxFJedQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Don't cycle the PMC clock if
 its rate is correct
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> Besides below paragraphs (that I removed) needs to be in the comment bloc=
k and
> not in the commit message, please coordinate with other folk(s) who are d=
oing
> the same
>
> https://lore.kernel.org/b4-sent/20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef=
392ccf@gmail.com/

Thank you for the pointer, I had missed Manuel's patch. It is the same
change, which I found independently on a Bay Trail ThinkPad 10 with an
IMX175. Since his came first, I will drop mine and test his patch on the
ThinkPad 10 instead, replying on his thread with the results.

Thanks,
Volodymyr

On Tue, Nov 17, 2026 at 10:02=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Nov 16, 2026 at 05:33:06PM +0000, Volodymyr Chapman wrote:
> > atomisp_csi2_set_pmc_clk_freq() enables and disables the sensor's PMC
> > platform clock to be able to change its rate to 19.2 MHz. ACPI however
> > also controls this clock, through the CLKx power resource in the sensor=
's
> > _PR0, and caches the state of that power resource. When ACPI has alread=
y
> > turned the clock on, the clk_disable_unprepare() turns it off underneat=
h
> > ACPI. ACPI keeps considering the clock to be on, so a following power-o=
n
> > of the sensor does not run the clock's _ON method and the sensor does
> > not respond on I2C.
> >
> > On a Lenovo ThinkPad 10 (20C3) with an IMX175 rear sensor this makes th=
e
> > sensor's probe fail intermittently, depending on probe ordering:
> >
> >   atomisp-isp2 0000:00:03.0: Found supported sensor INTCF1A:00
> >   imx175 i2c-INTCF1A:00: Error reading reg 0x0000: -121
> >   imx175 i2c-INTCF1A:00: probe with driver imx175 failed with error -12=
1
> >
> > The effect of the clock cycle was also reproduced directly: with the
> > sensor powered through ACPI, a single clk_prepare_enable() +
> > clk_disable_unprepare() of pmc_plt_clk_0 makes it stop responding.
> >
> > Only cycle the clock to change its rate when it does not already run at
> > 19.2 MHz. The DSDT's CLKx._ON methods on this machine already select th=
e
> > 19.2 MHz PLL.
> >
> > As a side effect, a clock which the firmware left enabled at 19.2 MHz i=
s
> > no longer turned off by atomisp_csi2_set_pmc_clk_freq(). It is turned o=
ff
> > when ACPI powers down the sensor, e.g. when the sensor driver
> > runtime-suspends it.
>
> Besides below paragraphs (that I removed) needs to be in the comment bloc=
k and
> not in the commit message, please coordinate with other folk(s) who are d=
oing
> the same
>
> https://lore.kernel.org/b4-sent/20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef=
392ccf@gmail.com/
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
