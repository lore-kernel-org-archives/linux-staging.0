Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740417A300
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 06:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772518215; cv=none; b=GAJ4qgkWEHBCsU3YaZJxV6J6Oj07dz8PnoH+vMtXOiT/t8tfewIrkLzeVpQPXVLDXm2X7OP/fB7Yxt1NtAfkZUlT24nY5QCRfl1uO62szd38d3/JpRYu2ny8BTL96KAzrHt9mvo1fxHmvzD8ZgEghqL0qq+/PF59AgdTi539jyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772518215; c=relaxed/simple;
	bh=SBUlTQM/k/oaoq9AFG5lgGcmckMWOpkInZrP64wFkWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMTCUoZdwwcT24Gvu1YPc46i/PcWoOFz6brMTHsz5yTKTS8T2wxE+/6kCvRM9jStEHUiIMvro7G5EWFMDbOZ0t3WQs63UV7QP1QRR0NiUMRqbFX9E2kaVx/t/RjVvt74+LRLFooJN6w1v5SdT4bbXdVkY6b/s2GnKg1dk9BvFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mv9oDPTu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mv9oDPTu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48371119eacso65045115e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 22:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772518212; x=1773123012; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=agdeMP/mPPxcor187RCcOiWV/lnGJfdYFzdOQY3zhOM=;
        b=mv9oDPTuKaiqKKPFJkw51kBQBJLm7Lw1WuK/jyqij3lF0eP4J+3kpZldduwYunyKa3
         +H9BKmp9sMiLlSOOtC1dNkUknleuvhL6783VzHcBBKoeCQR/EHAdPOocIUEA1BPFcuDZ
         Va+p/7pNlQUwZp8oPPxLw395fOwxfVw8aDmtwatejgjZLg35fcRsbAo79UBGoMYmACAw
         ZhH6vze+vXuNRNfhQjbfDzTdJnom1hNroGCIloncwPDnah0ryhTfPhXRWGsbCyb1U53n
         zsTV/tqPDE14QlOLZwfjxgPqS4ZPm0QqpfKIocF2oRyhcRXOPGvq8pJHqnii0i441sGp
         bhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772518212; x=1773123012;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agdeMP/mPPxcor187RCcOiWV/lnGJfdYFzdOQY3zhOM=;
        b=mcUwTMvDs8DgV0+tHnLDHvg4yf81r/w49xRDv2eXGQ/PPOx/QET7tJMrQMlrgMzurP
         av5/Ub5ykzueZQ4PqgbfrpC8+SwoPLR3zS90c7RCA2lqRrHRNm9ckWdFsfI+GBH5LDpO
         6ti9HVhvn1PETT2g+C04TWAv++C/9UYbY6VJwF/b2czQtJ6KXqBG01PQFJwtCNaakOPI
         NA6Rwdq15/kO8fMoWZQpP+Iwi6Qec/P5MDlnkhdP0OBSOhY3QSROISQ9OqoJa2rpScZD
         cI7JffV6evzNV6w/diL9s3lfTUoqG8Ga40+oN4MZvlayP0kR8Wpp7/ludWsfYRU583td
         ByiA==
X-Forwarded-Encrypted: i=1; AJvYcCWi57JgcXqkyusBN99PaUnvMqoXNc4QlF4Jz+V/Ua4ZmRk+Pj67dHvM+svHvp6KaAgBKVLIIw1sVCFFkHUz@lists.linux.dev
X-Gm-Message-State: AOJu0YwdLNR9WnKGPCFzXMPhNyeEkspS5EFKOmIz+NPc833ua4mlR8yf
	Mvw96qYd/JuiXdaAk6fjOzfspZDFiWYayUJ5CH+hQEf7B07KxOma4apK5YpevbxJzHs=
X-Gm-Gg: ATEYQzxoM8pmWMNGyOg47Bi878zI4v4/Fnup/gToW8vQzv0V/TISQAEOxB7X5hMyyrY
	qG28D6CGX+rEq7WYxsD7T4jOSsB66uqx2dhSEQfJUVuHCcajlm8nXrWRALHugavIwG5D/RZzzQt
	zXSNlR8DX4OjY6GYX/RpJ3wCBhtz0a1p1ySUEd12mbUd/fQ4VvbbJvN433o9/wEkG+UkjQo3YrR
	IPc1MYhvKOvEGXWwGt18ZMl2+JFA8tYsTZ8IaPvAvqlPdkigrOsIjxbYqcONpIDjX/8jV2lQCpx
	WdBi5FEZZ7r6egbXDCDBZXltv7fIO4pIF4OUA6eypCOAypoU8n3Rb4BoF5Y708jwQ9+oYxuA0ga
	bxA5zGob1QTk8/U6vaLoXYycA0EEQF2TwK4ymsiunbI4YLnd9b7DFN4SzNCPanYYNDAqERZLUDU
	ALQF6ciVdszHmsGkSI7rA7UOWhhJFv
X-Received: by 2002:a05:600c:a4a:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-483c9bb7c31mr260224545e9.5.1772518212456;
        Mon, 02 Mar 2026 22:10:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm330050875e9.12.2026.03.02.22.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 22:10:12 -0800 (PST)
Date: Tue, 3 Mar 2026 09:10:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Message-ID: <aaZ7QfW7cFAJ4m0R@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org>
 <20260301214815.2628942-5-objecting@objecting.org>
 <aaVEsCIacXl-kuxa@stanley.mountain>
 <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com>

On Mon, Mar 02, 2026 at 03:55:36PM +0000, Josh Law wrote:
> 2 Mar 2026 08:14:53 Dan Carpenter <dan.carpenter@linaro.org>:
> 
> > On Sun, Mar 01, 2026 at 09:48:10PM +0000, Josh Law wrote:
> >> From: Josh Law <objecting@objecting.org>
> >>
> >> Return IRQ_NONE when no interrupts were triggered to avoid spurious
> >> interrupt storms, and only clear the active interrupts instead of
> >> blindly clearing all interrupts by writing 'intr' to the ISR instead of
> >> XLLF_INT_CLEAR_ALL.
> >>
> >
> > Is this something you actually experienced in real life?  The commit
> > message needs to be clearer about that.
> >
> > regards,
> > dan carpenter
> 
> Hello Dan, It's just code optimizations, making it cleaner, etc, I
> also ran all of these latest V2 commits through check patch, to make
> sure they are compliant, I own this device so I hope I can be the
> maintainer of it one day, I'm learning this Linux system day by day,
> so I am sorry I have to annoy a professional linaro dev like you haha
> 

I don't mind reviewing patches.  The cleanups are easy to review.  In
this case it's a behavior change and so I would want a clearer picture
the motivation and of how well these have been tested for that.

regards,
dan carpenter

