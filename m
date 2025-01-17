Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4D1991C1
	for <linux-staging@lists.linux.dev>; Fri, 17 Jan 2025 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136507; cv=none; b=Enn5qTUBEVKHpvs7TM1JKDP0yuJ6ovUGi/OmesY4OsBnC27d9uKOQi5B3O2c30XmDA2+saC2U29YJZQQyuv5ShvExLL68xzgvFeg9XqQOOLNZbM3Wu4A7/4crAy2BQTeyVa87LgbGKFD42hr9KAG4tOoXwZWAgfrwHDQ14CeGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136507; c=relaxed/simple;
	bh=K67tpMQT0+BbeazJE3N5OyFBMhLIclKIIm3lqJP0g3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcgOMp+cv+KjD05I0rPZfQz6gVVKP8v8fUPQmpYAL/ktOZlvfat+rb+wbCDTeONmjLrXEJ4EkOhMz63nkA46X64NRwlXivSA3/I1SyBe7ZxilNowE1flHxKdUAzOK4BgQhNkTPiMmxNliGNIeQFX6Dw7/xUvrpWhuHxP3ea76xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbxutEoE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbxutEoE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43622267b2eso23137315e9.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jan 2025 09:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737136504; x=1737741304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OuIZAMpkTZRgTeZlnciow8WXhqjoSsm/hec0PgoHCmg=;
        b=kbxutEoEtcPt1kW7T7AD9jcu+/KLhR+iR0WD67cLrqhjoKM9JCE9bnc4ZZurcgz1C4
         vooOqxtR2ZEGukkWwBF2uO0+rLhMaievSWEPnrn7zuTP2uJ0qYJLajQueDq+PmfRCK9Q
         9Q1d1+wTZeblSHaWQycA5cSZIqBZ4hujFPCIV2OAB6QPgYbuwe7HrATGAQhJ7r3Dp/c3
         KxPREwNIL5Jjt/IuIhDZnkYe0BE0e2z/p8VdnJJJEvCl7HHGkSNBP6HRb3IFQq3T9aXz
         uL3JouMxfmHkfojwkxyjf1t+NCodozgpkR8rFVueQi0aLyDtaC4BEIRh1IKtcIFNZkut
         RmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737136504; x=1737741304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuIZAMpkTZRgTeZlnciow8WXhqjoSsm/hec0PgoHCmg=;
        b=XIrFGNKAEQx7yCx/OrMs6oI/1ENK72JKDHDhrCsdUFRikvh0Ox7co2gJi47HYeaS32
         XqXNbmUHvQUnKkV6zvv1TbWg/JBYRAwXyaWwgEvQVEtAcuxEa0htKLgltE7+nRE+QbQS
         84MaA0zKtucyvtpVE3BmuDF4itlmJ28KTFs2d1YSkzlwnZi4HOXpj/TN7O+q1oyKdy7J
         +ajYLIG6nKSsUoc+7pcWmDjhSElI1b5Gj4RgGEd7G2edFU+jNZJPRtocoC/JJPMIx7lB
         Sm8xhaF9pLfT6nwJMmvuzgtnQ1plotvf/iRMz2YpSoQFecO+P1RALpwMDSBCrSLvdyvn
         Ytqg==
X-Forwarded-Encrypted: i=1; AJvYcCXCNL3rIAf4nQ6RMmZRzRrmurPotgMAmc1vVl/M0YW4ptHP0GVBeNXvzIzSUsVh64Ez0TCaVhDfMPhAgwNm@lists.linux.dev
X-Gm-Message-State: AOJu0YyBBqA9rrk3U2KTjE8I/+Rhjt20KCkI12qw9ticutQtQrMel6YH
	d/HFZtctIp38U/1u7xjOe69YmuZyTt3jPfdF239tLYEQ97esabHKE4y3jQ==
X-Gm-Gg: ASbGnctXzq0mwMZDLL8hq5mesyegMTNsswjhkxOj8eoX3q+VHLFvXOn0smLkw+8L9eX
	iVKVUORR1lqqR1Ia3jFuxqSw88q5pbX1f8ofYoxGEy7v0318W1KJ6ek0AqVdFC45dSvQbTTt3L9
	oMXdTGPlL+jmWR6FpwrhcdpqgKJ1udB3vY6meSkgyxqegg0PBYPyJdESGe92Av4XTzK43thGYX6
	hVtzYnTsBVFcp6CJkEWma0/iceAeaZAt3wV1yhv4B4m3gZdo/Nw6fPgU3sng7mDuiUyFUOv
X-Google-Smtp-Source: AGHT+IGe1bqv6j5FJx3lKej8/cZNS1j6GR+UPSYL3lYTkxf1tczKFeAF+CDKv6+JzeKENnBSFC6MDg==
X-Received: by 2002:a05:600c:4511:b0:435:9ed3:5698 with SMTP id 5b1f17b1804b1-4389143753bmr34726165e9.24.1737136503529;
        Fri, 17 Jan 2025 09:55:03 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904087cbsm41520955e9.3.2025.01.17.09.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:55:02 -0800 (PST)
Date: Fri, 17 Jan 2025 18:55:00 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Fix inadvertent negative shift
Message-ID: <Z4qZdN3xr_Xs6_99@egonzo>
References: <20250116110014.15577-1-dpenkler@gmail.com>
 <20250116224003.28675481@pumpkin>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116224003.28675481@pumpkin>

On Thu, Jan 16, 2025 at 10:40:03PM +0000, David Laight wrote:
> On Thu, 16 Jan 2025 12:00:14 +0100
> Dave Penkler <dpenkler@gmail.com> wrote:
> 
> > During the initial checkpatch cleanup, when removing blanks
> > after open parentheses, a minus sign in the argument of a shift
> > operation was deleted by mistake. This transformed a pre-decrement
> > operation into a negation.
> > 
> > The result of a negative shift is undefined and a warning was
> > signalled by sparse.
> > 
> > Restore the pre-decrement operation.
> > 
> > Fixes: 6c52d5e3cde2 ("staging: gpib: Add common include files for GPIB drivers")
> > Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> > ---
> >  drivers/staging/gpib/include/amcc5920.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/gpib/include/amcc5920.h b/drivers/staging/gpib/include/amcc5920.h
> > index 766b3799223f..7a88bd282feb 100644
> > --- a/drivers/staging/gpib/include/amcc5920.h
> > +++ b/drivers/staging/gpib/include/amcc5920.h
> > @@ -22,7 +22,7 @@ static const int bits_per_region = 8;
> >  
> >  static inline uint32_t amcc_wait_state_bits(unsigned int region, unsigned int num_wait_states)
> >  {
> > -	return (num_wait_states & 0x7) << (-region * bits_per_region);
> > +	return (num_wait_states & 0x7) << (--region * bits_per_region);
> 
> It would be much better to use (region - 1).
Hi,
You are right. I will send a separate patch to change this instance and
all the others in the file.
cheers,
-dave
