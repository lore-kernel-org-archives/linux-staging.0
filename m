Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CE52EDD75
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807965; cv=none; b=me+ljbYKIKateTHakfCPiGtC5TuS0+ZHotJ4LERBGRr408GTwWbDJWMfAgml+V5dHHtnQ6TAeL3re3aQ93D1qPqsFTZNsdhnhLxpPdg20NFIso7SRC61HktfZT27cgIW0lNOOxIhIF6ne8POZcCoOk5Qsjkq1n68OkyUcL5s+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807965; c=relaxed/simple;
	bh=SjEO5Mf8trw66bSMBZcBAX0fSI45BCBQMiqBnD5W/yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/Cm9o3SxPBQWK8MwtaKudbZhf8hQtqDyN4OUVy90QRNkiCqTWefdGmZgydWCdbSizMJ/s9q20et06bK/P/J/GUhT6E7D/WW1VK4KSMRQ5YvTi0w1iMHQk+DgI4DyB9HZ2pwNqhM3ZzJI/cMA/ngIRE2vPAMIkbYwhAUO0OnzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VVHs03tL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVHs03tL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso34887025e9.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807962; x=1757412762; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnYStx1tmY335G9wa9Z21vYW/Hu/c3l+9Jg6zw7X6p4=;
        b=VVHs03tLaGlTQ9cFHl6XsPUqprQMxw4Ad2pkn8lfFVDuzwqaYoj87b3yzYyw24tKWc
         a11CO6H+tb4tI+CRwCJ4GXGUZb8bh0r8353o1aasbx1lRxYyOqMmHZxIp0GELaX1U4xr
         4VsTzW3HrfqMt+PEYyCVq65FAaETxf+nucR+fBp5Gis8GZUTuc6KksU9RSaSQN7QSFj4
         PkkLu2Ge4I8mVgz64K2Fzxgzuhm18lmsENWZeN4F0jBn7pUMCGsDWjqNf+iSCGzea5sL
         nrB1NIGI15gUtLLyTSD6uuCCs2rKz6Sl3OuHiTkZVV93Xwi0MoZZpdNKSI1n0xIfHX87
         YRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807962; x=1757412762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnYStx1tmY335G9wa9Z21vYW/Hu/c3l+9Jg6zw7X6p4=;
        b=EJEl9ENfbRhjbsoy8Hf+xgwmeuyp7SgBtVw8IZg7xO3OuSx2vXm3gOgpYgnvvkQGtX
         nwe9ssgFP0p12jZ1/V6Z6F9366zdprxqmgP6PxC3HxA9vBZrc23CCuhXnLVZT9njBLnC
         v7DQ9f+LVO8yWoShaq8XYlQ1sHSnooq//62f0TgoRSwhdfHxaT9hYoaevZb8yg7Ug6VB
         rE1wG4ATowiNfLbbW1i5kSF8RBBXQjMf7+EmHD30bxKZ5XNbL6ti/fWOXARpb3H9JzKO
         P/ivevRidesIST20r0QScxIUx2sDynZ2za09GShNYH0J0w67gdBz9LpaPRhvwXrTNjJG
         vHaA==
X-Forwarded-Encrypted: i=1; AJvYcCVzJxP+8SynnBbSq44EHCAACx/8LjDPPWkT8AYiXdGGOYOYAfLp4dEoMF1foTBFbTAvrCFI8m7JiW9yRChs@lists.linux.dev
X-Gm-Message-State: AOJu0YyOTREFU7dKvkdGZ488pql7u8bnfDms45Ug2lPgXsLVBRsTyP4x
	6upTd0UP+aissqeqI0h/FJo+W6uYplNS614mHMihcxvzS4yMkAOEHNj/VciPCerbdn4=
X-Gm-Gg: ASbGnctCdn22laSyugPqFUTTiGNn+vfEJS/4YwPfBOvLv4oLYFUfB0WNjsoNB5Q6kZu
	Mbp9kdDTfzcg3IOtHipLJNxyog3jbkjQlzwTqV3WVzMAeeSFuEH+3oIoGQ0EG/iGJoJxUsU9zw5
	q0ryeyxVEbNQ61pE6zXrpKRaH7lpGtt3xI23KRihf5r42GUUSvrhMACUZfPemR2bLi25GmMPD/A
	s7cXC8nGn5rRnswzucwWSW5NzjX7cj5/29qvZuqaYIKq4rEwvt4pjTdp/BUHVFFr/Y1PWHAldio
	4xEF1kb+wuFaCnSonA1SUhSJeoNZPXoEYFBXctC4XDkIcSb4PXLP8JqNgUKsuy9raMi3bGRnuFj
	VkQ1tXQCs+CEEGu0PU2Q5BYPpl4Y+kVhm51I9cw==
X-Google-Smtp-Source: AGHT+IHG6eBfdtTOEZxcXAbASopPkY4+xwB16XZCz9dFBdFmkVcioRx8F/ATKlllEq5D5xx6npvGpg==
X-Received: by 2002:a05:600c:1f96:b0:45b:7510:4042 with SMTP id 5b1f17b1804b1-45b84c65642mr105053935e9.17.1756807961803;
        Tue, 02 Sep 2025 03:12:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b73c52735sm254121465e9.22.2025.09.02.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:12:41 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:12:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
Message-ID: <aLbDFcaqzJtZUdCB@stanley.mountain>
References: <20250902073841.2338568-1-abarnas@google.com>
 <aLaypTjukJJloGuL@stanley.mountain>
 <aLa-1GPJDxpX-soG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLa-1GPJDxpX-soG@smile.fi.intel.com>

On Tue, Sep 02, 2025 at 12:54:28PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 02, 2025 at 12:02:29PM +0300, Dan Carpenter wrote:
> > On Tue, Sep 02, 2025 at 07:38:40AM +0000, Adrian Barnaś wrote:
> 
> ...
> 
> > >  static inline hive_uedge
> > >  inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> > >  {
> > > -	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> > > +	return w & (~__GENMASK_ULL(end-1, start));
> > >  }
> > 
> > nit: white space.  Add spaces.  Remove parentheses.
> > 
> > These are supposed to be opposites, right?  Subword and inverse Subword.
> > You could dress them up to make them look more opposite.
> > 
> > 	return (w & __GENMASK_ULL(end - 1, start)) >> start;
> > 	return w & ~__GENMASK_ULL(end - 1, start);
> 
> The problem is (and actually with the (end-1, start) above that it might
> generate a really bad code on some CPUs, so I really, really prefer the way
> when _at least_ one of the parameters is constant.

Ah.  Okay.  That makes sense.  Thanks.

regards,
dan carpenter
