Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5272
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 12:07:35 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i24so18651130edy.8
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E/qBmN3w5ra6vzERr1tAnJ+lRCifYP6wOJclMHfbmgA=;
        b=lga51PiHQT8AXJaHF9E+Rcm2L7rBLdrZM+LDIobxpUfFnTW7kT866PFjvaeamdIvSy
         oBD2mFz5kUbvDDg4P1Cg8yPYTBWvdZXO8RsJJc4oXIOxDg45gU7vEzM++OrTbHtzNBQe
         rC2SSb7iC4kcW17d3a11uA/rozz2QvFI0F4cEh0FnZAyP5OZleb0yDhj4BCF+ftMk3Z2
         byiuS7kh6koeNRV86e+Fxnw26SAom3jTRnzAe7a1jiU//Uxf7d/j2wCkKENOuPXiF9NE
         sQo2naXTvrxYe3K2YjKBJZmVXEjw0DZOLtjyFBFtm43mMQaypu7hcZmaQQTtedC9OPKp
         4onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E/qBmN3w5ra6vzERr1tAnJ+lRCifYP6wOJclMHfbmgA=;
        b=VAnCaOVbkTvYGv2SLGUADehvTfdDpQU/kb22yZk3EqrI83PcfqoIQG8mVhWrKZvDp6
         0/r++/LVHr2Kn2hon9Ej4dWDYOEkPROyyQ41xd7N7SzWgg9oPja0vsHo8hsLdd6hDdlc
         tfjaOiEBZOz1bZD1PGUKk12Mqjpm4MTxxVa3aAkjITWI5g6Bv0wNF0Y2QLBG0tZ4yJ1z
         Ksmlbqtr3EGIeNjTu+rM8gAH0jWSnenUnzg/QbDCmPOu1rLV4aujkD8jCtcuDwraW6dy
         BjHGJA6l+bRqox70FxBGII4vVqtcqjdeDZiBgGumGMHvjY7Uv1OetlNWhG29/e95f7rB
         OhNA==
X-Gm-Message-State: AOAM532gpHvMTnPGVz1hzkNybleE3MccdGCxAp4gLFRIiOCqyQObk2Ne
	e9jjyC0yyGpePdFjVYVbMPo=
X-Google-Smtp-Source: ABdhPJw4JTYkFThXioPmy2z8+WuiLOKSdz69LpPJsZTBZxAQhtylaDEIj8mQzdkT/FBSuMgnjrWcJA==
X-Received: by 2002:a05:6402:78b:: with SMTP id d11mr10066481edy.257.1619698053629;
        Thu, 29 Apr 2021 05:07:33 -0700 (PDT)
Received: from agape.jhs ([5.171.72.170])
        by smtp.gmail.com with ESMTPSA id c25sm2184909edt.43.2021.04.29.05.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 05:07:33 -0700 (PDT)
Date: Thu, 29 Apr 2021 14:07:30 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: rtl8723bs: hal: Remove
 set but unused variables
Message-ID: <20210429120729.GA1393@agape.jhs>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com>
 <YIqECQk/1Zb4JRjb@kroah.com>
 <20210429102201.GF1409@agape.jhs>
 <1870536.WTzYeaBcXf@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1870536.WTzYeaBcXf@linux.local>
User-Agent: Mutt/1.10.1 (2018-07-13)

> > > Yes, but many types of hardware _REQUIRE_ reads to do something.  So
> > > "read that does nothing" is a requirement for some operations.
> > > 
> > > As an example, a write is only guaranteed to have been finished if you
> > > do a read of the same location back from it on some hardware busses.
> > > The bus can reorder things, but a write/read of the same location can
> > > not be reordered.
> > > 
> > > Sometimes you have to do reads multiple times to get things to "stick".
> > > 
> > > Other times reading from a location changes a state in the hardware
> > > (horrid but HW designers aren't the brightest at times...)
> > > 
> > > So you can NOT just remove reads without knowing that the hardware does
> > > not require this.  This is an issue where GCC "warnings" mean nothing as
> > > gcc does not actually know what hardware does, or does not, do for many
> > > things.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > thank you for explanation, my hardware knowledge is poor:(
> > Sorry for noise.
> > 
> > fabio
> >
> I suspected that removing those variables could have been a source of troubles 
> (but I was thinking of possible side effects on internal kernel's data, not of 
> hardware related idiosyncrasies), however I think that you did well to point 
> it out because:
> 
> 1) We learned something new from Greg;

yes that's been very good for me

> 2) I learned that, for the purpose of finding definitions, vim's ctrl-] is not 
> the right way to work out the problem.

3) I learned that with ctrl-] in vim one could (in some misterious conditions)
   see a function definition :-D

It seems that you know more than me about vim, I make intensive use of grep
for finding function defs and usages in code.

> 
> If you have time, I'd appreciate some comments on the topic of line (2).
> 
> Thanks,
> 
> Fabio
> 
> 
> 

thank you,

fabio
