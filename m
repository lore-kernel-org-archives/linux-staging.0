Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9029ACF0
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 17:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200522; cv=none; b=WdSMAWg/WFJx4mrUMSOZuRkAVOJ64LmKN/FwDMqR2jTDmbMurUGwY1mInhgRQnwFCjKFofbhP9LNYN1V5jH0uPF+QmlRMDPFWQIlIzOmcoB8WhHagK7pXBMYUfCCN0XWzi9UKtz1TTiEVex/z4AVJfMUS+igF7D+x6t8k7zC6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200522; c=relaxed/simple;
	bh=mMLXhdcXOwdpuZU87w5b677CUsxr6DRjENU/LavuC54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfuuDSXeh6npvRfGinIDyT2ax9481mg6hpq+okI0AKs8E+Jk3UGPnFkt47Iv+zSOSzlf49x0ig4q23+UOniXbqMq07aRNpPL3HFKUl/huhE7keRwSuvcS+dpJs3g64Xp1gdxh2DcJjACEJPw0OtC+IjysIOoSYamnoyiFxHplxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ni5vCoMs; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ni5vCoMs"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c03eb31db80so8262498a12.2
        for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 09:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767200518; x=1767805318; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oMn3cw3aEJ0zmXtOyEFlwSR70FDkFEfYpJtDF+IchA0=;
        b=ni5vCoMsvpRkSy+Ynb7UuMkfKMUucKe8zATpvfxrF03FYimjBJSfxBfr3HGa8iT+8I
         0PtyBRYlT3koVSBMBVwTWz8Xsk1eE9jJc9C13pcMahZexuT2b5z3jmuiFivrdAWgWatD
         Wc/PX1MEuUZCYNIo23jND7fz9WVt572FgWXJym6ynBLwZVHloMpVJph3rtXPOGkjTrCU
         68GklBygrlTrAkw7o1q3TJaYpuWunrDV2g7bdjsQhCwIcYw6UNbQY3XTUVKb6zssYdvR
         1xazrF9bFgjrJ06yBCmBVzKmMWf7MdRkPecjpkr+MIxhoQaWLQ/x9OjJX8wxu9PCXEc+
         66dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767200518; x=1767805318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMn3cw3aEJ0zmXtOyEFlwSR70FDkFEfYpJtDF+IchA0=;
        b=IMc1+TkYNBcFfXEbZ3dBfFzs0i7JLMQPuB27tl77GbNm5bZsM8U+sln77NH/jQZwtW
         KkN1KWVSHha9QZ7geSHG+DEUkJf6X+0TPF2jpPfsM8BOcYY7iVVBeShlcdUTxijmYqbT
         Avz8Q+5cY1HxwncisXo5iIqqy7bOikIU2xTXF7IL4Vwr0VQOf6JeLqQIZQyrcf+rJuQU
         I6GYBqWxlK+yx1bZsTbcV5LkkmjBUqm3JhJEdnA/nUcpmwjG/LawDaD26TaimCnTttyR
         y0en493ySC3fbpR2tcZDpiQjI36eT2A09nPaIrGgB3YSyVK3JLcaQWhSnO7SFDD7dQAe
         Qq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeE7W4HearrcaS/ukiCE9cfXxHSWzLBZ/S8iCrZPkZ7Rd+oUDrryzS6e5jthjLMuQ9xde+o1Niiyml2K6Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwAPMcWxK33rhCfiulcPx0yjH9xnOkwWcBrD3anKGZN5Z8UVgAc
	gh3KRZUxod0ChfR6gllvuxntgzoJ+xDS0emrSfA/Kzguw1K6LHa5OFY4
X-Gm-Gg: AY/fxX4HwMZLRsPO7A/xnNYqGKaznkRk2Mc+exxJgdfgDdP7gxklDsJcQRdkYiCr4II
	l052lIaE/Hzm8SVIaZWuGeNgQ/Wh5LzCgSIz203/kE/JW/R6a1aHg+DecrSESB120akWv7/yQbm
	ZHHVj+oHAHmKx6csqWE1C7xD+vae6lOJc9IrFVmnmt17hpp3I0nT/igfnq3p3vNb3cr9MGAuZGD
	21cYBeuNuqBNRSYNE3pJaebSvkw0hnAlhx8mSlU8nA5S5/zXU5tpYJhKSbI+PSL9HDbOGXc9EMq
	jvbqvJXbcOYD6c3CsecVw98jM/HRKNp7s/xPdzCNwQOeYgTo7aCUGH3AGV/W7ZeIy9+aXq4FHf6
	LdQ0Z802Ca8T27JKNrt1VMKT5akYXE3w5aIbKCOCpQbf+bnGn2CoIdVqxA4EVIqLUnGHksjLNsK
	eYGyhq0DrAGC5TlzKUjrCGWRukRjcPxU8zB0Ooxl3ieA/zyPrt7cmDZkWXEtcgI2KaWNlUPBEzp
	mwBa1arftcK1hNXWMM2hCvaUEqbMCsWNSOF2DEU3gGqxIt9ggOhg2vgPg==
X-Google-Smtp-Source: AGHT+IF5mMpUD3pGQhLGo8FdZ19mzbX7DDGvuk4xC4I4c0/qd0kwTCUg2LNoLn0QjKrxDnW1BcRvoQ==
X-Received: by 2002:a05:7301:3d17:b0:2ac:816:f31e with SMTP id 5a478bee46e88-2b05ec551cemr33300066eec.29.1767200517932;
        Wed, 31 Dec 2025 09:01:57 -0800 (PST)
Received: from localhost ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm83064745eec.4.2025.12.31.09.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 09:01:55 -0800 (PST)
Date: Wed, 31 Dec 2025 14:01:52 -0300
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/6] staging: iio: ad9832: convert to guard(mutex)
Message-ID: <km4v4ql7l7fra46c6ptekgfli5lfw557edim6w4klu7tn23jvq@grgvfyeyq2i4>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
 <20251230203459.28935-3-tomasborquez13@gmail.com>
 <CAHp75Vcr76Z=npXr0pu57oCrgmSWsLO4uB9qKLmmxSKap4R9MQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vcr76Z=npXr0pu57oCrgmSWsLO4uB9qKLmmxSKap4R9MQ@mail.gmail.com>

On Wed, Dec 31, 2025 at 12:50:54AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 30, 2025 at 10:35 PM Tomas Borquez <tomasborquez13@gmail.com> wrote:
> >
> > Use guard(mutex) for cleaner lock handling and simpler error paths.
> 
> ...
> 
> Don't remember if it was in the previous rounds of review or somewhere
> else, but Jonathan (? IIRC) suggestd to use
> 
>   ret = foo(...);
>   if (ret)
>    return ret;
>   break;
>   ...
>   return len;

You are right, I should have sticked to that one since anyways I ended
up using that pattern on patch 5.

> However, this one just duplicates what is already in use. Have you
> checked the bloat-o-meter before and after and see if there is any
> difference in the compiled object file?

Jonathan's is better by 7 delta, so I'll stick with his

> -- 
> With Best Regards,
> Andy Shevchenko
