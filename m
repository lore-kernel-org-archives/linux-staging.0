Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193492264AA
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135459; cv=none; b=VliyF7Gk4KtF6e+CxO8BLyHDo0lMIKAshLFAWXmfCDiGpcZeBqVPy8pET4ZJqsDTiJXgG/OEkiLO4/keo3yTDlBojrdLl3RiD5OJ+gUB+9bJvS0BnhodizZaJMU622cGkov2qz2Jb9MhC1Ai0xoUl1j6TXjIOElNZwEzmpoGHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135459; c=relaxed/simple;
	bh=fCzC6vLc1i4K/LRcoy7/bgdJHCoLH4W7prlzP3nbeUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9Ll6T/vdSLh/Loaz2Sqlk8EkCq2xFiK9vMluqVlea4I/cTy2ur7O0kRrTSnd/ERvFneaJd+j7PrBk9fN+hqs7ZwtZtFS38SDTmZoRc3UNey7WcV84+I77rM+FTlZ0poBPgS4OGgM4miiV+FF/c42RsqlG3SMMNYjFFjsV1k89A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfUoQ25i; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfUoQ25i"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73a9592fb8so2033341266b.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 14:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767135456; x=1767740256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCzC6vLc1i4K/LRcoy7/bgdJHCoLH4W7prlzP3nbeUw=;
        b=dfUoQ25iFJaFuKCq3gXhlEqCAjRd1NTHsqgJ0GbCAYUpQl66ZSUQZtKCrBL1MjzMjQ
         sm+wVBk4NXYDqEmem719C+DWChOh7SurJrsC35g0Qisrzn4W9fOo0zV6daIh1Ge52Jhw
         hDi5HAg4D8RNzQ3si9yMLBp3Yqv2X6V4+JqfxRwgfT2tZxxgQicG3EChMRCiV0rx8qYk
         C5EffsfWIUqhK1s22YNP8bkVZt1+U5g1VRHJvrPkX8QvCPZWyFxUqcjG89FGQ6ZmFlxE
         5X4IbOQVReuie/IzsKDOwnpgzEffHVRcI2Tc0oOU1wdjBPdlD/bXP9s/uZ8I5ZCbojH6
         2YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135456; x=1767740256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fCzC6vLc1i4K/LRcoy7/bgdJHCoLH4W7prlzP3nbeUw=;
        b=O7H0RlF0i5aSwCi1DNhV1/pWi27jgqMEj9z50WnftYROT+PBzKiuKTfRLb+Hg9bWgX
         +5M8QoPU+ZhCfQPMMTGkAs8NDZWIHX4ueb5B7phDJepf68qQrKwmnzeYIaYp/9y02wuV
         Q6xeIL8iqhPlwf3lus6A2jopWsaJFBaFOeEfWEFKAolOx2ucZ621SErpT5Mgwi8jhNPQ
         jH2EcgNZsfZEuHiLstAaeiUWFqBuXZbLsedq6+VlUH277AYO9968Ad+BuHhp98kTImg2
         cPpGETuEP6N6XXxVNUq3xOyyRHDWCzLIL7tHsMk2gG/PKIHBI3MVtwQ/kjdMlACpcIlx
         Timw==
X-Forwarded-Encrypted: i=1; AJvYcCW7cKwf0SraEGa9YtaVgYRhwVkI0lRxk/S6YDO5geYSkclFfdOR7KXjaEuiXVPiwnvvfKIrXMfC8+avgVLr@lists.linux.dev
X-Gm-Message-State: AOJu0YyY+5rMIZV0qlENYjNGwao+hLq5GX5w3tQ9YZ92yWt+2SGG7DTy
	YECg2RoJgGcWwxfFNs92pqsB2ieYA2/ULCfMV/Yy6AThO4PIll1VD08vyWoftANbXVzT1GaCPUL
	fMQm/RDUNZ3bJzMIEat0ULsUvTlHm5rY=
X-Gm-Gg: AY/fxX55NhaVqJmA8zoL+DTmFJUcBHhB0G/OA6oA2eENB3JcynBUr9D5QPHUrD7AsrU
	h1vG0eZ2sB17FpmHpuKVLD+IDtcvlcLp6YtPu3TYx19T8fwwAH6G023WB/Qwp5Q7liPbluo6pFd
	ww/kVnhrzcztbSd+kt+YpHdEtaWW61cPBNcQ5Mki6WEiH0m5cSCCsuMkYKNfHclZK75UqLlUPMH
	V7mB3io/DPXRWO+bM3C+OIMkw/QLlWYOuTzjajzPPsz3vyTx0jim4EuFIOUFiZN4nLrQnlyGnlb
	lN8hISzE2FSJH+SlQmsUpheelx1gcE1nzAuYnO1W0ERkR5D8k2QekRyLC5Kf8CPZj3lhm8IzpTz
	CFyC37OI=
X-Google-Smtp-Source: AGHT+IF4Fdu6Q0XK+SszfFyWCaCJAkiq+H7nTHS/3UO7+t+nYKqybllRelyl2BL93gmscmbksnqzhzXQSKGnqmNIj9g=
X-Received: by 2002:a17:907:8688:b0:b80:456d:bd99 with SMTP id
 a640c23a62f3a-b80456dc544mr3804458966b.19.1767135456312; Tue, 30 Dec 2025
 14:57:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230203459.28935-1-tomasborquez13@gmail.com> <20251230203459.28935-7-tomasborquez13@gmail.com>
In-Reply-To: <20251230203459.28935-7-tomasborquez13@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:57:00 +0200
X-Gm-Features: AQt7F2oq77hqLNdnBzl2NuGj_pgFua0ObGKygvJMi5N45990joVQYyw1HYDblLA
Message-ID: <CAHp75VfYsJu4Z9QjM1uCEN6WYZJ=juF+5bw3zoE-A0uMpYR5Pg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] staging: iio: ad9832: add sysfs documentation
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 10:35=E2=80=AFPM Tomas Borquez <tomasborquez13@gmai=
l.com> wrote:
>
> Add sysfs ABI documentation for the AD9832/AD9835 Direct Digital
> Synthesizer chips, documenting frequency, phase, output control,
> and pin control attributes.

...

> +KernelVersion: 6.19

6.20. The 6.19 boar already sailed.


--=20
With Best Regards,
Andy Shevchenko
