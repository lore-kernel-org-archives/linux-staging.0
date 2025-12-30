Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45872AD03
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 22:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767134828; cv=none; b=JW5y3mZPX2ORXt6AsXgxZGFvlqAwIP8gy9Fze/yQ9hLU6VAZzdzHr8EdaUvr+tRcx0OOzrVQxgzMVVDuMkXXzdKtVi1HmTUVjHnt1fHfkR+Rg2ymEAF0wlavt0cn0Oz9lswbKixfaHX66s8mcjWxf6YvsTR39+inPUQp/FbIzDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767134828; c=relaxed/simple;
	bh=+S2WsQyFEwSta0SU0nHPCCKXgkUA8WyQf76MiqP6YHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdSiq+wGHwpg6wgn6guWiKD169bYlQo1h3eJSZypi+XFmwfN69R1K0NGeUCbh+j4sdLjYAAZZk3ekd7CYInBRvzDtmtx/M2uNMEeQLk16slqMBa/dkiZpY3XH459mhcCn/2gB5zVlkXqYRVixzimqfRv3rgpw5htPNog8qN8FzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4y9zpCu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4y9zpCu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8018eba13cso1605427966b.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 14:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767134825; x=1767739625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S2WsQyFEwSta0SU0nHPCCKXgkUA8WyQf76MiqP6YHQ=;
        b=B4y9zpCuGIz8ClaQnkFx0PDsysaNX4n/4T368wklX3Cz5oAV1UBY7dP9TJQjeK0z8p
         ghZhnH2i2Fg4IX4QzM6UN0G4uJt4DLOwkyesE5unhEQtULKuN+OlzCBt2hcNekXWDCAb
         6iFXIGxSINSkwphoGijjjJ2ZuQUzL+kiwbH2n9eRbjvFNAMDPsWDQkKelBZwtf45e3jm
         VSLYi6FbePLcVluNz0fOC58c2EyG6JJp6Fhi6c/EhBoqdeFflCeXIYoxLBPDhw8ggG2s
         /QANVe8zIjZTC+kD/yx082eR4+zWeVfrfxNAilxoT9R6txhyj53dx2cbd/93ggEW1wu1
         fX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767134825; x=1767739625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+S2WsQyFEwSta0SU0nHPCCKXgkUA8WyQf76MiqP6YHQ=;
        b=KSuLtXhjBE2Y2Uh5B7lUXobJjfcMYCEC2odGLJZAat2iuC+AJDfzg3M+7jO2jhV71z
         M5adre9ksfKUDaB0+EdPv4sw/AnaWvAvn+88LjZB4et5QwQBcILIbEfU2PKdHmKuA1Nr
         eeluowIAOC9VQ4T6yNnckppL8B8CXtJ7ZGogN6X8G005lIXMMQfB5Pmpl2y+MlgjXg68
         NhQhF9vPOt7yKzHErZUP8U813G90Iu2nP/1lhCYbe0vCDLm8NZi715ajFi/En7nVqKyw
         Gpe55AtgPWkzk4iJNPucfWbrsExHqPpeYZev5smDMjFmlBCmxaTw6eBVH9YEKUf7Z6hf
         Ggrw==
X-Forwarded-Encrypted: i=1; AJvYcCVdZF0KwUZ7YZX/4ZIAsQ7Q8POn7Yic113eOYnCMreQh6fcgbjSkiUbYHzwxpeD0WOBv6prVoDiuUmlB/GN@lists.linux.dev
X-Gm-Message-State: AOJu0YxGuazif1YY/V+HQZkf+SeX0ypBuzJ3AiMmjVt098wsiXu/Zd3U
	eN6DNPY8ZkQXS866o+kGu7WXnrAthRbbeMDAd3XATdGMsVykzzjDjTfN1ti1PbJLA1ceflumFMC
	xPpsW6zjoygdn+8TmF4EZqBxzhaJrUe4=
X-Gm-Gg: AY/fxX6vMHdO9MdufrylWDZgGM/sJzDNjiLbRysgCfIYeOgVMTHF+5dkvlZCLiKewMq
	R3Kw+IqKY06xOUKhp6AYX5Xe2yybpsLPE0gPrfwxnEQyxRlCDdpPHkqpu7unfQjDOmpHiRSJyFv
	Ukh6cgZxwwrIL3F7ry/LSdNFGGXXqYDcF15IhMFw+aPmV8PeyGetBX6lDgW1VwlZYXDWz1fWEdN
	Zi2a35VODccanLBELMQuTPcHo2Y72LvGs86mZ6MSYa3FRQAMmmNI55RFGlFfTAOOxFu9zNgF4dR
	JS/u2t84XnVRtZKfzY+opygNJEW8fryvjJNVC8mkL5tSDPxp9n2N6R/4FZqsSp1QvCEQy0ONare
	yiDFxCDG2tfpIPK2jag==
X-Google-Smtp-Source: AGHT+IE1e4J/o37+JKC45saUR92B4dNPZ1vnNQpDL40LVWWrFDK6HUihl+U/229geIzCT32bj62dptXES+w4hdW2VeI=
X-Received: by 2002:a17:907:6d21:b0:b79:fc29:ebd2 with SMTP id
 a640c23a62f3a-b8036f0a457mr3500867866b.3.1767134824862; Tue, 30 Dec 2025
 14:47:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230203459.28935-1-tomasborquez13@gmail.com> <20251230203459.28935-5-tomasborquez13@gmail.com>
In-Reply-To: <20251230203459.28935-5-tomasborquez13@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:46:28 +0200
X-Gm-Features: AQt7F2pzsCl8-U-XDrXFy2ku2Zwx4KOyf_8OKScRPWuH0RcD5A73u4vP-Xh0PiA
Message-ID: <CAHp75VefAPs8C9gJdz-zTkS3cpExg5pwOTMreiUs-ikSgpygOw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] staging: iio: ad9832: remove dds.h dependency
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
> Remove dependency on dds.h by converting custom macros to standard IIO
> attribute declarations.


> +static IIO_DEVICE_ATTR(out_altvoltage0_frequency0, 0200, NULL, ad9832_wr=
ite, AD9832_FREQ0HM);
> +static IIO_DEVICE_ATTR(out_altvoltage0_frequency1, 0200, NULL, ad9832_wr=
ite, AD9832_FREQ1HM);

Any particular point in not using _WO() / _RO() variants of the
IIO_DEVICE_ATTR_*() macros?

--=20
With Best Regards,
Andy Shevchenko
