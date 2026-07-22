Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74331361954
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736225; cv=none; b=lOU6ttK6ewD9o8caHPulom1KZKfzAQnMxDiQPnMmw+d07dv0a5Ymuo4KvUuK9Pob9yotr3foWfhY4uIVFzUru8GPAgLns4/delh3q68ju1jlBnmpoHAC/T8+7K1CmOwUckvqYw3Besa+XJSqvBJ5Chtu1i0qLMFj41+/tiZMpxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736225; c=relaxed/simple;
	bh=1otvit2ICqX01VZfuWeoTPRah7RXDLpRfiXbAwprmwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPuK7TNTWkQhsiZZGzQKBmynKO2sEz8vXAMBLszUKVBvlKFG3ssgdmkPqRFRt2NpRckM91frfEVuE8PiangKgTetH7IrQFCdAbc0NfLaeSvTVv6ZVFj+fml5LsbjNQJ/2dBQwnhyFOEhM5kqXxsU1pfu36fdKk3mNUJGkLXpHww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5KFlmQ3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5KFlmQ3"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so8367433a91.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 09:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736224; x=1785341024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nkpUqQJix6KKXMhqyzdYJniOtozme3lGhsWfFwbkPQ=;
        b=G5KFlmQ3IOw196nhReU+momCCoLmUmeNusNqSzEspspXgpWUDwWxDjHabPK7yzxhbK
         P3zoE88knv90ufvNIIBVBw1DWOBjIOQwTSMpCzWqSIfyb1sPgnxS3ggpsDeZYay3C7Xy
         ktYCzbGwqEt7liWrNNIRWzeWeQEV0Qkqh1BYtoojW3GxEHQgRLLHvBFjBjCzJw2mAH5D
         n7QjH/J85sjC4LqX3Yk6Afkk1MWI/rD7nbxr+jv8Kt3rHfGdJIAdrPX4I4Ptd+tQfU05
         CZC2iLVwGWQR4TB+WTlkWXRBGs0IbIUmexldvJlK2/VViC0GBoiS9os2ucokD/K9s9i7
         yDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736224; x=1785341024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nkpUqQJix6KKXMhqyzdYJniOtozme3lGhsWfFwbkPQ=;
        b=dupBPubSAetORPgutSJKgox+gMoPfywPVKU76GioIQXMs8yc+7+lIqakKFMp15YANR
         MhEBPCNpyh7UVXn70HaE8nlzLdYplUf4KyBWwM0FI1c7piAbrv7TcG8XmQrLt+VHUAqU
         gkI0rUGmptrQMfm9hPyfnl71OxVuudk67P5d8Ic116TrZItGzAs4RKcduBpgB8gXG05l
         Sa7zTzH6/rGZ4giCofAO9YMSsRC25lPo7ocY2T0a49q8jIXkCxoScckxQGSuy9xfe2wv
         2rg54Lxv8gGZAjtbyMzwvCOPtIXx8Aj2/tTQ31QbxImBdOOmpdJ+33jOSggFFWQQUtUB
         ERAg==
X-Forwarded-Encrypted: i=1; AHgh+RpPH3fZTgPWDVMVomZLXPqdVVYrt5ZvRyD3CCQqOclPl7Pk37ehgTH/EMzXSq1qSSPdxOZWR5n5ZPcPQW4B@lists.linux.dev
X-Gm-Message-State: AOJu0YzTJRuIF++0uAWkCfgX6epXCuLChGFSIdxjoSNArUc1h4ewu+Vr
	H3CniycaGSpU3bOuusavtYi8Mf1Di1TQa1O/L/jry1FiLgvXOtzaYgn3
X-Gm-Gg: AR+sD12p6ooP1Xc0vqYbuBvXu9wAG/cw3Y/Gk+NWBFgBcOhd8RyDOPAUBEWlo3nRAz9
	3srb8J/mz3jqnEBgHXXkm6ChJx3qUJIMvj17RVZc5lMh9Rm4P7gULuTWy9t9UzChQwD6W5GBx0O
	xczJpEy+CdBPUVnO2L/ooBy4z5jvUARAzxMS2Hsnkm0Sa4P/FAjHyTVvd8DrIg73Us5ezjBtkMQ
	cQsFPHSTc6ELS0Jd/dnU7bQNqiMri63ZHFuvpId2ekL9+UCk3s/EL+w3Nn9VEXdeAq+WFX+UXlO
	XH9H309yWZaHnD4lzzwB+XYXYjaL3MGoSI4764wCR4ESb1dI+shzWkSAH8nKITQ62FfKOFrh+ca
	oz3OSGQSb1fl6ZnGS2OqJ66J1fjs7fPUBr4mFU2MdObiEuLT6aXkHxSgRmeYSIH5zqhuY7I2rhT
	8qem5CCjuyPrD1e8GUXDGL4A==
X-Received: by 2002:a17:90b:568e:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38e4b56a0c2mr21959475a91.36.1784736223565;
        Wed, 22 Jul 2026 09:03:43 -0700 (PDT)
Received: from kernel ([103.219.206.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130ce035sm7548395c88.13.2026.07.22.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:03:42 -0700 (PDT)
Date: Wed, 22 Jul 2026 21:33:33 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
	nuno.sa@analog.com, gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	jkoolstra@xs4all.nl, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] staging: iio: frequency: ad9832/ad9834: add comment
 explaining do_div usage
Message-ID: <amDp1VPSMF0P6r8T@kernel>
References: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
 <20260722082227.18768-1-raizudeen.kerneldev@gmail.com>
 <20260722104617.000050fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722104617.000050fa@gmail.com>

On Wed, Jul 22, 2026 at 10:46:17AM +0200, Joshua Crofts wrote:
> On Wed, 22 Jul 2026 13:52:27 +0530
> Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:
> > Previous attempts to change do_div() to div64_ul() were rejected because
> > mclk will always fit within 32 bits for this hardware, making do_div()
> > safe to use.
> > 
> > However, Coccinelle continues to flag this as a false positive. To
> > prevent future developers from submitting unnecessary fixes, add a
> > comment explaining why do_div() is intentionally kept.
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> 
> Please don't send a new version as a reply to the previous version,
> as it can break tooling such as b4 for patch review.
> 
> As for the comment, I think it's good, however I'm not sure whether
> this should be split into two patches, given that this is a small
> change. Andy, what do you think?
> 
> > diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> > index 60c33e10c46f..6d046e9121e2 100644
> > --- a/drivers/staging/iio/frequency/ad9832.c
> > +++ b/drivers/staging/iio/frequency/ad9832.c
> > @@ -118,6 +118,13 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
> >  {
> >  	u64 freqreg = (u64)fout << AD9832_FREQ_BITS;
> >  
> > +       /*
> > +	* mclk is an unsigned long, which triggers a Coccinelle false positive
> > +	* warning about using do_div() for 64-by-32 division. However, mclk
> > +	* for this hardware will always fit within 32 bits, so do_div() is
> > +	* safe to use here.
> > +	*/
> > +
> 
> Unnecessary blank line here, you want to couple the comment with the
> line that it's describing.
> 
> >  	do_div(freqreg, mclk);
> >  	return freqreg;
> >  }
> > diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
> > index 33dfd723923c..8722f3a01cde 100644
> > --- a/drivers/staging/iio/frequency/ad9834.c
> > +++ b/drivers/staging/iio/frequency/ad9834.c
> > @@ -103,6 +103,13 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
> >  {
> >  	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
> >  
> > +       /*
> > +	* mclk is an unsigned long, which triggers a Coccinelle false positive
> > +	* warning about using do_div() for 64-by-32 division. However, mclk
> > +	* for this hardware will always fit within 32 bits, so do_div() is
> > +	* safe to use here.
> > +	*/
> > +
> 
> Ditto.
> 
> >  	do_div(freqreg, mclk);
> >  	return freqreg;
> >  }
> 
> 
> 
> -- 
> Kind regards,
> Joshua Crofts

Hi Joshua,
Thanks you for reviewing the patch and for the clarifications.

I understood and will make sure v3 is sent as a new and separate email
thread without in-reply-to header so i doesn't break b4.

Sure, I will remove the unnecessary blank line.

I will hold off sending v3 until I hear from Andy regarding whether this should be split
into two patches or kept as one.

Thanks & regards,
Mohamad Raizudeen
