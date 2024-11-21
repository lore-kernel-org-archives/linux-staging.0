Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FDB18A6B2
	for <linux-staging@lists.linux.dev>; Thu, 21 Nov 2024 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732174659; cv=none; b=Gus+p9ApHC239rLoJuH4TCLgYKsiBRdYi8pOcg0xQ3rdsOkZaCQuAdtdiECWAl2SpR2YQ0e3mB4SmcWPPs9FLKn0up1s4CCE+MPVi1xWRIe3HaMGtpa+fC0xHTetnMtBdUAFzgmpdEbiSjhHPBQJYAqJwsT8m0Rjd4EhHjItZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732174659; c=relaxed/simple;
	bh=GmWAuONAf+OhcB/eHqhC7jcnrOcmRZ2aXXH3NhfGLmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toEuT8CT1fU8T50JY3UmohiljcNAkI0XH+DHnbtWkdoABx0VkoUaxsF5u1K6GLA9U+cp4Z3xFFgvuYDETfOQwqQGDXDxLcTpaU2GtDY2TDb2tQu0bfHrj7ymYRSxrEVgr4DZ80SDL7nlxgcKEItSnB5jjuA6zD6y4p7h0FfczB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qVnC/FZ7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qVnC/FZ7"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9ed7d8d4e0so88780666b.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Nov 2024 23:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732174656; x=1732779456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlJy7E5x9BwJc7/RzGitj/YCv0YzL90TKvD6XFRZdvE=;
        b=qVnC/FZ7HDQiKHIwsPIEy2GW3bbVknowONA7l4AdhPMW1Q6WB19/iUSvoSkGJqKLp5
         d/UM+s+gIScuejPRaaSBzc4GOZnXADoFKAcZoYbatgGf4tqQ2nhfVS63T6O37ObQYq8G
         8RoR351XaoZZsorrFK3Fzvdfd9gcgUIwgTbuy27b9hoUkLj+mN/msh5bA7zahLSKFmm3
         s++ZOhvqzRbjiTLUkXPLA9xMbEq5ractTHWY3GZMub8vBaYLZ/FaypM9iTsaz4XWleg0
         +jbvAWh9vyTqkq5+a9YGlMyY4t23rCrSKTufJA1Hw9MPu+K6E2+8Fa/gIhzwn0B+mRPf
         H5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732174656; x=1732779456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlJy7E5x9BwJc7/RzGitj/YCv0YzL90TKvD6XFRZdvE=;
        b=PG7g0rlZgfJFfSYoqAMhJZnQYM4Owu7tjhmmdDPsgP8+YrLRMTV0UNGH/kHQIXkDKv
         sfoOw5YF9jIGcpgt/7RIddF413qHsVqUE2gVavXNuN37hUlzEmTI4HqPTOeEYhUkvQww
         6qFcvzafwiZvIN/qSGNzt3tssYazfMXyItkqsRKlm6o1TSyIyrYLQBuesJbhBaLpxxq9
         N6QUMfVIPptsaRSemkHhIZsGR8yMSddfu2EZU0UilJ/DQHD4VELOG0cLEwhW4T9pVZGT
         oJXz2q2/DDtKtf9Yrypk22ZxA3O4AFdTaNz5j9FaIIhxKlMCtVpVjfaen3R/tmskSz4Y
         HYKA==
X-Forwarded-Encrypted: i=1; AJvYcCWhdUYkSj0ciJE6CQ/Oni+RN8dWWuLHM3a+ek9KS72ScwtpeGAg4/lguL7chO9/ZmZW2Y3eyT17qs7zUD5E@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Zh8wW0cNPhJ0B6r07DicriIa0RZOAvqe7chz9AytT6oCeiF0
	rTb0jOn9PNu+L2yqh0MQwlkq2lGFvGElMEXdGfWyps2WKr8ih7Uz4Edkr9AWgHI=
X-Gm-Gg: ASbGncubkrDZq6AePxdWnn4jHQqlJamoJYRbW/4Z+URS0thgVYZfOfOrWbaPkmD52qf
	ysQqs4jkUcOESxrk1dV6xt6NgBd0jJ+iuzGJmjMorsp4nF/ZbRETXaIEKOE/+H1dV/wsCl+8in4
	jjgMxeOLo65MRPWSJgrpqM0qvN5OLus1jVCLxl+psxfuQDwGSiJ5eX/e9F0cnl/sKaiu4P3MEQ3
	KlI7Sg3yNAGHWfe03ZLYtHmYfxAL4CRvh4cyr8LdiEET/otEhYtMoQ=
X-Google-Smtp-Source: AGHT+IFemxj512DaqvY1PLlr8Y43SJzh3VhaY0mOd3w4HEIgfr5qkWQWDkVUgWXrxavdTPZjLErIvw==
X-Received: by 2002:a17:907:6ea8:b0:aa2:ea74:917d with SMTP id a640c23a62f3a-aa4dd6b0c6bmr537097666b.30.1732174655017;
        Wed, 20 Nov 2024 23:37:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f4319b75sm47346266b.148.2024.11.20.23.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 23:37:34 -0800 (PST)
Date: Thu, 21 Nov 2024 10:37:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Paolo Perego <pperego@suse.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] staging:gpib: Fix a dereference before null check issue
Message-ID: <b843f8a9-1562-458c-8f6a-c59b1037b756@stanley.mountain>
References: <20241120144653.377795-1-pperego@suse.de>
 <a0807e04-b2c9-4261-9b3f-7660fe258f56@stanley.mountain>
 <6ca90e87-965a-4895-ba72-8144540f6e4c@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ca90e87-965a-4895-ba72-8144540f6e4c@ijzerbout.nl>

On Wed, Nov 20, 2024 at 08:54:16PM +0100, Kees Bakker wrote:
> Op 20-11-2024 om 18:04 schreef Dan Carpenter:
> > On Wed, Nov 20, 2024 at 03:46:53PM +0100, Paolo Perego wrote:
> > > This commit fixes a dereference before null check issue discovered by
> > > Coverity (CID 1601566).
> > > 
> > > The check ad line 1450 suggests that a_priv can be NULL, however it has
> > > been derefenced before, in the interface_to_usbdev() call.
> > > 
> > > Signed-off-by: Paolo Perego <pperego@suse.de>
> > > ---
> > You need a Fixes tag.  But I'm pretty sure the correct fix is to remove the NULL
> > check.
> In the whole agilent_82357a.c module there is no consistency whether
> board->private_data needs to be checked for a NULL or not.
> 
> If Dan is correct then it is better to drop the NULL check, not only here
> but in a few more places as well. There are at least 10 functions were
> there is no NULL check for private_data.
> 
> Run this command and you'll see what I mean
> git grep -3 -e '->private_data' -- drivers/staging/gpib/agilent_82357a
> 

I had looked at similar issue in a different driver:
https://lore.kernel.org/all/2d99b7a6-f427-4d54-bde7-fb3df5e19e53@stanley.mountain/

Here the NULL check we are discussing is the same thing.  The private data is
allocated in attach() and freed in detach().  The detach has no need to check
for NULL because we can't detach something which isn't attached.

The other NULL checks are in agilent_82357a_driver_disconnect(),
agilent_82357a_driver_suspend() and agilent_82357a_driver_resume().  And there
the NULL checks are required because it could happen when the driver isn't
attached.

I also did a quick glance through to see if any of the functions which didn't
check for NULL should get a NULL check but they all seemed okay because either
the board was attached or the caller had a NULL check.

So I think we can just remove this one NULL check and everything else makes
sense.

regards,
dan carpenter
