Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE2133F5A4
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775904776; cv=none; b=cYShDvOXqo4MPPL1lkekQyOLR5KoQ6Q3t4V+Kh65INit45kDV0xFk5IYJSXa+sguXe+LE8xDVDCUBDVVaUmlf6r65Z4Tn6ZbM0HrHYl9kn2thrF3tjGGIdWsZSD9TDe391URrprTxX+alAUOXxEN7tLihq+WOUf9FIwQjHPi3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775904776; c=relaxed/simple;
	bh=A47CdT8W/ldJU9+4ePsSUJA97lg43ee4+6ibcowyido=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfVQYP0LLcsiQd01IXwmCKpgs0Aiaj4T46Z74jbZDlaWsTdUO5Y+Tl6Ytrbreef9KrF/gm0maiNqe6a/LM2DYJXOCQvhsRxbvfz3y18sgwRXlDWVqMFKX7Dq5OF2HkzYMWe5a4RxPv5vxHlV79MfHXkCkHFmKnDoYRL5McdE6ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvePy2t/; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvePy2t/"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d7bdb5ffffso177260eec.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 03:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775904775; x=1776509575; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/greMxALxVYb9nwCKqf7fyFdZbMiPxwcLxeI6dJ8WwM=;
        b=QvePy2t/c3NSRV23wKBEwKBfyyHoZujXHF6b3AoOnJAbP7IBLbcMnzkPuS2jKQjxLo
         bfRUZsjraIxcFYo009AKwD6JXLbkW97nnmw8RyIWhCyh+GEaYEbXsouG2Q6PHd1kJqVD
         0Rgoz6Ov2Q9xbhr6UOGxDO3VfXNI8tDvvQAE38BHJ2atwKOs0PKYMiiBHAScsmiBJbqP
         odprBiw+8kwj1l6q4HAfRbOEBmocDxYIqvBDTwSeFCP4dINT8Q/NywpLn+KGi6TkBkZC
         hdPPKzQnxjYeSmOVhWWi6LwjGeL0Sxzq68eja+YttZ4fb7tNa71TaxQXt7zUiwpPXVJr
         uX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775904775; x=1776509575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/greMxALxVYb9nwCKqf7fyFdZbMiPxwcLxeI6dJ8WwM=;
        b=EsEJM0hR5TmxWdI6kv6E/SD8ZNf0R6TAdf2/yCiiHeDB3vk6APDQAVwudpCTLWyOf7
         jndskjaPJoopgesY2yBJrlVbjBdDZfy8qWf4EFq3JA6hRZZ74fCtz9ldvUikU5uiiUfE
         lkJtVZ+koCOfLxezpGjNWP/XnOOBdB0uG6DTF6OIDBzOUpr80cpy5iX9CkFoihaSnEa4
         GrV0se4Nq+jiQKiYQm3YjRuh3R7iXZVxhl3ScLvpwNEtqQenrnj+rOCZ3lJp1blK8z3n
         HjLZng8K601qlP39lQmKc8e5tjVcwiBhLrJTFW24/cPkZ7MbARkB+Qs8O4yiF7rE9bfL
         mXqg==
X-Forwarded-Encrypted: i=1; AJvYcCU6QOr34edQGowVR3kJskNLJaAS/zpXZw6nASZ2exLzsoAIjrU1mrY7hFJOsbhL8W6dNZSByZS8Lov4VDDV@lists.linux.dev
X-Gm-Message-State: AOJu0YxQzylI/sSW2dh4GGX/SJBrNiMeSBMWLHKbuPGkdzHj+vcl83WQ
	Eejk8IXAtlujyFArfUbHxSqSmZzVercTh0NVTK/6dWpxvMKP0F0pKb7r
X-Gm-Gg: AeBDievd2+VkLi3ALfk410ytlv9lkD8smC+U8TphWSUCs/71P89lCvlQ1KJSBwwMwU6
	sMitS46G821+BdiEPC482C2phiLVy9i8ZuHnwfWGhPGymjPBaUZOjtf32ds+MaD2Z1AxnSOeKH+
	d+icYKtRNB6g8XWLjTqMYiZ6VBlQ2d0HqTXxTbxeMzdQ1+ckIVsdKjimkj/0XR4v95NtBWn7QNB
	AiCiqKCrkEQAiJA0F1PwRrhg9C7j4/pbPgHpyJ1nIqYK+A3XurctHMLsiuML/SCy2vFhgjGkeBP
	dTm40drxcPIf3rlnu+oLJXc9PReUA3ZXz6S5qCSAjq5Plbokt8dRUdKiIuk1Z+wtFDCs7+CC1M1
	C2sMbMQWGLI+xYH0ND+qPDpPimbhJruHJQdyhwLj+3KwFEP22Qw/wXtHaymH50cubrdaWhmAyFk
	7kgBh21c6dJWzj5Ns=
X-Received: by 2002:a05:7301:608a:b0:2d1:d434:d001 with SMTP id 5a478bee46e88-2d58965f555mr3946040eec.17.1775904774543;
        Sat, 11 Apr 2026 03:52:54 -0700 (PDT)
Received: from localhost ([45.86.211.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5627c44fcsm8496011eec.23.2026.04.11.03.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 03:52:53 -0700 (PDT)
Date: Sat, 11 Apr 2026 13:52:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/2] iio: frequency: ad9832: simplify bitwise
 math
Message-ID: <adooAFmov6gF416x@stanley.mountain>
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
 <20260411085848.75381-3-joshua.crofts1@gmail.com>
 <adokoNfP-Ueg4yQ7@stanley.mountain>
 <CALoEA-z0hkOw35D9suEKi61x12fNSSzYem5pecCFj0w_EwLHvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-z0hkOw35D9suEKi61x12fNSSzYem5pecCFj0w_EwLHvA@mail.gmail.com>

On Sat, Apr 11, 2026 at 12:47:42PM +0200, Joshua Crofts wrote:
> On Sat, 11 Apr 2026 at 12:38, Dan Carpenter <error27@gmail.com> wrote:
> > >  static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
> > >  {
> > > -     unsigned long long freqreg = (u64)fout *
> > > -                                  (u64)((u64)1L << AD9832_FREQ_BITS);
> > > +     u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
> >                                                            ^
> > This extra i char is something I really dread as a vim user.  :P
> 
> Damn, that's embarrassing... Should I wait 24 hours before submitting a fix
> even if it's this trivial? Thanks.

We're not the boss of you.  Do whatever you want to.  :P

regards,
dan carpenter
