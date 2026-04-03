Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DCF38C427
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211306; cv=none; b=gBJQFYTSCqJp1Z6ee4FSfiwhv0ut3VMzTTXd9ufa6IPMcy5S1IdZ6wJt0xSDxvntOLZwvnBGhzM4rqkYIAU+72EpNN8eYPoZ0ao15At9jtaelp67EtnvdZFBuHVlIsYDgHoyD983xlesHmvpUn2nsvzCFG6890JYaTqV513QWPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211306; c=relaxed/simple;
	bh=SyUUY0OUraYJ9NeW9bdZzmQJTzmWvU8SgeyoY92B5GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZs/bE8Wo1ORzuxEX7BBX/Ly1lncrOpi7+MU7SkUUOca4aOaSP97JucuzwppR4jr69bkAjTJbjw50spt6DM3mH9T8QDt+MJbHt8wPYcxiuIH8NpXKheqz35I2LrcBgDoxxcwEEP65Ztz18w2sPj23O55VAG9tGAttlLdpbxNOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lp4kDUf/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lp4kDUf/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so2776355e9.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211301; x=1775816101; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBSiSl3NLn+cVJFrXtGD+heTI7pWpTMEmoM71Fd2JxM=;
        b=lp4kDUf/6jpBm25a1Q74bZhiNpzFxRMQ4DweRJ2Iush7/b0pmyniTY0v2B+cvunKIb
         m/0Sdq8o2XX9uyhk19GA/uM2HQXbyeiSiCGw0R6T3Rt6SrtfFph8v6NOvMI06EHXoi1r
         i083g6eT1T8qVffiBciYOwyr6FfQnGsvB6CHho3ZvWyUax/klAcfFKsXy+TENI+RJqMe
         X1wckPr2ci10TbMF+7Vh7h4jZic3Vf3wA0Hv9l5tV1h5UDtVCe4TNamxKkYS0yaCtHzO
         bgy4ct+YCcNhjSTD8K/bMpaEmWK3MZ9EObfrQuIYYz3fe8d7c5nikeX2o3lVanqzT4Ga
         iH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211301; x=1775816101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBSiSl3NLn+cVJFrXtGD+heTI7pWpTMEmoM71Fd2JxM=;
        b=p2Fp9At5+TsqQQ4E4U+ZWjgxjBANkOJYsDEh3GVMV1CrfFr4Afbzf4PMSzO3c7GLeI
         ihbY2R97rCQk/ZQPsopfBBhSAPs7YXbsszi8PaS0zVHgqghG6KFDZVUZcR0N6uF6Su0i
         OT9eN90AoLtgx2t6ti4cM3h9l7/ZaGG1soBv7jr+WFflHWbb834HpB6avL5OSx+/oafg
         Vzin672NwgbBhD+PYgQztxh4j+E6OTA/9gqm0Y9fheF4VYnr5dIMutZmwpkDeuh+CQFK
         Zji8JIR/Vjyix7P7afxcrzH/kIHa5Y7neTq3ylHbN7Hogj3cNxcIG7EucElL0ux9/UsJ
         tCSw==
X-Gm-Message-State: AOJu0YzaqG5eJaTtFl8+sTpmdVFV/UZBLxkD3e0rb7nIZp+hgUmiZn2A
	1GJXsxt1C9dQ4JG2XCXQaGDf6C3BmnWMMVnbUBtVNgMTTedSTHR/xkAu
X-Gm-Gg: ATEYQzwtIX0Ag7lUHTzX0KZ8F+TyHoVJQZecLj7/tw8fMmqwef/jZjdlW5FDHyNQBz/
	tjbaqf/J2A8mcn2tCZwutuU49eSEAsuDwZD53tqm9QXShTEV7LWMPX9xZ074pNpg5pZ7pphgHwg
	1qw4eI+5n1HPbioCatNQXIvHe25wYxfzqHxzQn1gKQuFfTkFhME80/TlotBag696pQVIx/FjAg0
	pV+TzmVhNncH79MHfTKFCkle7PisakDTZhDHtaLPwcS9Tmcr4MvKtilKJHLy0P+MCe74Q0vZ4ke
	vOa5RNZDgd7du9MUkihNO26VLliaGAWv8picS5aKd5/vZVGwmptnnII2GJk9/XmguXtVvDazZaI
	/XgZTkkM89o4HIzRBxlA5Qe14gQoOFi16SE2886AKjJKRX66qIcqQpRFEIHcL4tenb1Mneqf2oj
	zf07bfdp4NZEg4TlyjxqWqRmJXjaEf
X-Received: by 2002:a05:600c:3484:b0:488:7e6a:e70 with SMTP id 5b1f17b1804b1-4889973b05fmr41489825e9.9.1775211301303;
        Fri, 03 Apr 2026 03:15:01 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899ed9cb3sm16078455e9.36.2026.04.03.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:15:00 -0700 (PDT)
Date: Fri, 3 Apr 2026 12:14:58 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <ac-Rc8Lv7xmSVREX@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
 <20260402183402.444630-3-azpijr@gmail.com>
 <2026040336-humvee-throwback-72cf@gregkh>
 <ac9864qwMrHuU8Sy@gmail.com>
 <2026040327-evacuee-bonfire-a922@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040327-evacuee-bonfire-a922@gregkh>

On Fri, Apr 03, 2026 at 11:53:59AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 03, 2026 at 11:02:17AM +0200, Jose A. Perez de Azpillaga wrote:
> > On Fri, Apr 03, 2026 at 08:42:11AM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Apr 02, 2026 at 08:33:45PM +0200, Jose A. Perez de Azpillaga wrote:
> > > > The function configure_isp_from_args() contained a duplicate call to
> > > > ia_css_output0_configure() using the same output frame index. Remove the
> > > > redundant call to simplify the configuration path.
> > >
> > > Are you sure the hardware doesn't actually need this called twice?  Lots
> > > of devices need to be told multiple times what to do in order for it to
> > > "stick", hardware is "fun" that way :(
> > >
> >
> > The concern is valid in general, but ia_css_output0_configure() does not
> > write to a hardware register.
> >
> > ia_css_configure_output0() writes into binary->mem_params.params[], a
> > software-side DMEM parameter buffer in kernel memory. the ISP firmware
> > receives these parameters later as a batch, not at the time of the call.
> > calling a pure memory write twice with the same pointer and same value
> > simply overwrites the same location with identical data, there is no
> > hardware interaction that could require repetition.
>
> Ok, great, perhaps put that in the changelog text?
>

ok, I'll amend it to the commit message and send a v4.

> > > Have you tested this?
> > >
> >
> > as noted in the cover letter, I don't have the hardware to test this.
>
> That's going to make doing code logic changes a bit hard for this
> driver, you might want to rethink this :)

mhm... okay, I'll keep that in mind. thanks :)

--
regards,
jose a. p-a
