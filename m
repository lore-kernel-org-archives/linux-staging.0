Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992301836E5
	for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000094; cv=none; b=fpnY2F//bacsEveDQ3XTw0EjIFVX+h+dv+8h1Hj6bjt0XVfgx8WArbPoL+TDQnUIY3XnirJZDAPbhk+zHyB67eBgHNZbi7Wmh30KYqmH6mnOgZ2aMBNg0qaxYSraX0PcasoFe82RMwMA3GFQ++4kQuRlRsgzwbqTKZsB6Hn1KgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000094; c=relaxed/simple;
	bh=vNJiDOu1HJQcTh2QoH0ZF6EeoU/vMa/maD5ym7acze8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzKclmw0YFr4Dr2OUChnZUhnJR9zEOzrCCQlUx0KkSTnGBrpvfAEmR8MrnnfyrYfZJ+1eo3a3RA8lpvNteD/T9kEbNzvCOvNBtLEABqRDm8suwdFnw8CaDu62wlX2A7ilfSXvKXEwPcyJTknK+3eNQ9JCg9lBe94thAw5Ojh5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmOXfUMA; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmOXfUMA"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e9819a630fso6568261fa.1
        for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717000090; x=1717604890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NEJH+7+vj6ruF1GbLbgob2BE38yHKh8JHlHGL8KdovU=;
        b=BmOXfUMAOItihs5LptxjmQEvVMc8hG0DDCI9V1UF07EulgK0IXM3YxOeJWBS1YyVjH
         mbPl/pvoNrPVa/d3Mh6WRu5LVxaPxlMj0WJZqEBiOaSV7teU+nVGtO8mVNFbU7QU6diI
         LxK6ahBGcFzeF2AWcKFdHVhOW238nYPLE8kVvnbNxQDR5iUQ5mNy3Y0x8jeifHHELQIZ
         hkPedI1gaTIqSMM05oM2DWXIEIUlcbHe9qxe8nXGnHiJTy4pSpBQ3CxXokZParXxFe6M
         FjnzBP0VQ+UmR7RCzOtT/IT8R2WxbFOgh88aSUh4paRxHOxTWsq5FEC7qRyCXaK1LDvz
         /xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000090; x=1717604890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEJH+7+vj6ruF1GbLbgob2BE38yHKh8JHlHGL8KdovU=;
        b=XwG9cfrC4/1r3hvKDEB/V/Lh0ULYTLGBOo/s5prLmzqjfkQ4jAViRmbRTe5S/uueH4
         mGgusVZ7yADvaPx9w+iccMX1NhZFRTZItufTHrzmw5enSOp2BTIJaeyybInNgTeMcnBT
         DvRC51lE4BASkx+N43mTSwj21N3IdMQrJF21SrGlFI6HK4Q7byEuciysy4oU9o0HMeSo
         LjHAou05J4NVmMPUR3PaSrglPdSTh/lYhjdp/A7iJkAC1XXvZ3PsrifNkiBov4dcO2PM
         ZJRqtCkr3tG+PmQ2ygNQicWLK1oTHuf1AneKV09v1u708VKeXOjkpZaoqqfng8ADHjJF
         /Nmw==
X-Forwarded-Encrypted: i=1; AJvYcCWW9pWuMig5a+caN9edzcBioLGAoGmpLNfEDmCf5y/6A4Fc0/gYJ1rDM3166P4hxL0NdtQh71f4dueCoR7EEmFPJlkJP8EOm2BJn7yG/A==
X-Gm-Message-State: AOJu0YzgRwG47yz3vvePvtAPyPcAjzDH+Vr9K1MZYrbAk0h0zeJRYWw1
	JwhazgBZu7EZfoR85NjtFXVh9C4QJUEWwtdwoiDdfw2QofcEBpHupQwDBzoT3ra7563abb6i/cw
	Z
X-Google-Smtp-Source: AGHT+IFmYVGVDhXJ/UgzgklvENZdHrtaQJwa288W1cA8geS62OGiVwASpA0S4D47EdPq0VKN1MsXJw==
X-Received: by 2002:a2e:9d91:0:b0:2e9:821a:82fb with SMTP id 38308e7fff4ca-2e9821a837cmr55797371fa.6.1717000087636;
        Wed, 29 May 2024 09:28:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93a828sm735495666b.83.2024.05.29.09.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:28:07 -0700 (PDT)
Date: Wed, 29 May 2024 19:28:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adt7316: remove unused struct
 'adt7316_limit_regs'
Message-ID: <c0bcb7b5-3155-445f-94ff-4020fe05109d@moroto.mountain>
References: <20240528233008.191403-1-linux@treblig.org>
 <d9a3c974-8a13-43f8-a0d1-0e55f6e1f3ef@moroto.mountain>
 <ZldRVBPi4utAfRd8@gallifrey>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZldRVBPi4utAfRd8@gallifrey>

On Wed, May 29, 2024 at 04:01:24PM +0000, Dr. David Alan Gilbert wrote:
> * Dan Carpenter (dan.carpenter@linaro.org) wrote:
> > On Wed, May 29, 2024 at 12:30:08AM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > 'adt7316_limit_regs' has never been used since the original
> > > commit 35f6b6b86ede ("staging: iio: new ADT7316/7/8 and ADT7516/7/9
> > > driver").
> > > 
> > > The comment above it is a copy-and-paste from a different struct.
> > > 
> > > Remove both the struct and the comment.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  drivers/staging/iio/addac/adt7316.c | 8 --------
> > >  1 file changed, 8 deletions(-)
> > > 
> > > diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> > > index 79467f056a05..23d036d2802c 100644
> > > --- a/drivers/staging/iio/addac/adt7316.c
> > > +++ b/drivers/staging/iio/addac/adt7316.c
> > > @@ -209,14 +209,6 @@ struct adt7316_chip_info {
> > >  #define ADT7316_TEMP_AIN_INT_MASK	\
> > >  	(ADT7316_TEMP_INT_MASK)
> > >  
> > > -/*
> > > - * struct adt7316_chip_info - chip specific information
> > > - */
> > > -
> > > -struct adt7316_limit_regs {
> > > -	u16	data_high;
> > > -	u16	data_low;
> > > -};
> > >  
> > 
> > Could you delete the blank line as well?  Otherwise we have two blank
> > lines in a row and checkpatch will complain.
> 
> Sure, v2 sent.
> (checkpatch didn't moan at me with or without).

Thanks.  You'd need to apply the patch and re-run checkpatch.pl with the
-f option.  It's not something that's obvious.

regards,
dan carpenter

