Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77513361952
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262297; cv=none; b=lHtGMvFH0SPXiFHlu0dUZJvjRZ8Hy2oLJ2QFJ5ASaJy0W/tCvu6ZFOu8MxNPFv4LmXB0ChWb6XZDT+d0Mlw28tOKsBYQC0Xf8AZFhSjT+Z1SuCQhSQ9gG2i4E13UyYfGOa3poXSMd54BAy6nx6wwtBFaYqA1NZZwHegxTE8yYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262297; c=relaxed/simple;
	bh=dpUUXhGrTwOOr6MTfDNkGq3Gdc6J6xFB1ifGJI77iUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnpotAjSJrwH2k9OVEKMhsVlyTjuO6hcVqj4kmTil5hUkxEpTWywaPd+JtsRikL4UC/16CNTPlHd7Ckv2l3rbittNCuGWyq8+gutx5NYvi1iPxG/UHWV77rBJyYdmrIMg1cETSLyYSYGmbV08viM5wTJAgETHcNGzwDCdMK8dM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6Ap+ZzC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6Ap+ZzC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce98cb8165so10164335ad.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788262296; x=1788867096; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKwDzY/mc5JLXQgUwalukrAvwZdlGt9fYkaqxqR1Bbs=;
        b=U6Ap+ZzCWNK1/IuyDscUvYYUXQO/OdNU4olHmvmlmNZ0cp9jT6ZuHNI/tyYBXkJkFg
         P5lsYklcgeKrCCu+LgUhGTTSRU9ey3+vue+MgZkUjX4FIeB9LUFT6aav6gQrfgLVGLcS
         EBcmdiyBNsJ8TFEulamNLcvRs7+/FguAD1J772ajgkLNK/ChqC7zwGTS9AKyozcHo1j7
         d5lqlCp43CeZA3SMBcNNZKkZj1GzicIqmVqtvhbUYZl+31PSKxNNbJNbdxO5vuayJI5S
         tFMgjMI0qPnaKZobZd/Qd9SrFf8UDJgfTRN1DLYsJzxaMGTtrU9pEM6CPSIDfAVc/z4T
         bMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262296; x=1788867096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKwDzY/mc5JLXQgUwalukrAvwZdlGt9fYkaqxqR1Bbs=;
        b=MvdUTQ2cy59JeKh0tUhQRKHyVq8WbjOiieeCL+1MOvPCx10UkjOVFGTJbhzqurRQS9
         UvMMI+YA+nX8xbj8R4axPtVz8X+b/A2nBNWsV81UR9KpH7KZmwRXUufTp/r+2Zu7az9+
         pWNFOcM+Tk27Wgz8tQDqYi8KotQsjkYcZ0SE+Rcpv+N9Y2rLjW/nceJi+Z8Er5hSFYnb
         EkD0QorRw1W/i7wmLSMKRybBsQ/sSIdYQ2lusi2oEOFIjT2NS6Lvn1n8UbcTBUTvqTmF
         WeL1Ok3KuLFLbeXLkHbcqPEv9J1zWEavBqa12wY0Y0Xi3IgeRbc9r42JbynNoKrL6gjv
         n93w==
X-Forwarded-Encrypted: i=1; AKwUvBw2uafGYDhbJWzLxv/EB3rUTBH/ETikM5bvyQKqIb7agBtc3akyHhGo2N7suKZJmQU3gpX8V5p/71w8WA9K@lists.linux.dev
X-Gm-Message-State: AFuF++kR4bTEyrNJ6zMKQXUuQ7xYFGw39Dv1bo72zSUfIhSSlPURUCwX
	EIgQv6rfA9o0/j5C4hcArDeLnOE6xTX74S1DTHeOTm4wMABxgtGxRx5N
X-Gm-Gg: AYBFou1/VzQkFIcgjhT9c1UjoBcZPPaFvl5lH6a5aCSd1htgITDcFQ6Aa6QFhLaV1Ay
	gUcOsNpOjRvP5qY8QROw4/MvCuhkhLmCWwQ33iG5dzzEZYmG65nAWs/z/6DfPjtJcDQyexinwS6
	cNdWAQP0vBwW13iv8O10wOIwI57ZhRYQ4aPh1bU9eGd5ew/Ngk/JvzFq+G/46ly+EcKCkGL7AIh
	dbWzQQ5T2Q9ALfJ+0zwGeLhJht2CGeQb4ypT+yINecgpU0Ui8OxFmDYm4u8dA1M8ckEBKGaWtru
	XJtmTCqbb4rFPDJ1d2TY6GwXESORZalC2y37oBfDZ3KeCUeBEHqAPf7vfsmcdkY5cmPZvvtOoGW
	tvsXYuT03AR9eVmm9VmwsoDHs63s2cHUSE7wGk/hoF/9uicQ8k/3DpbK9kpeb964s2We68Cm8/s
	Z8LnND3KP4Qz+D9uIHMg50r7C5RoQvNJ28ePp+Tl1NrZL5A5ZhYhV3Q5ASe+xY0AMRO3JW
X-Received: by 2002:a17:902:f689:b0:2cf:7ea3:7cf1 with SMTP id d9443c01a7336-2d95268ac2amr48470875ad.5.1788262295659;
        Tue, 01 Sep 2026 04:31:35 -0700 (PDT)
Received: from dio ([103.161.231.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869cfdsm49632265ad.51.2026.09.01.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:31:35 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:01:28 +0530
From: Supreet Singh <singh.supreet14@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: spilib: Handle SPI device types
 with a switch statement
Message-ID: <apa3N5Z7VCWMSZju@dio>
References: <20260806101118.146685-1-singh.supreet14@gmail.com>
 <20260807071542.200192-1-singh.supreet14@gmail.com>
 <2026090143-skincare-slacks-540b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026090143-skincare-slacks-540b@gregkh>

Understandable. Thanks for your time and review.

Thanks
Supreet

On Tue, Sep 01, 2026 at 11:44:26AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Aug 07, 2026 at 12:45:42PM +0530, singh.supreet14@gmail.com wrote:
> > From: Supreet Singh <singh.supreet14@gmail.com>
> > 
> > Replace the if/else chain that selects the SPI device type with a switch
> > statement. This makes the code easier to extend when additional device
> > types are introduced and improves readability.
> 
> But let's deal with that when it happens, you are adding more code here
> than removing:
> 
> > 
> > Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
> > ---
> > Changes in v3:
> > - Fixed the memcpy indentation issue
> > - Removed the extra blank line in the commit message
> > 
> >  drivers/staging/greybus/spilib.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> So it's not really a benefit overall, right?
> 
> > 
> > diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> > index e4d1ae8308aa..39d5bf234c61 100644
> > --- a/drivers/staging/greybus/spilib.c
> > +++ b/drivers/staging/greybus/spilib.c
> > @@ -458,17 +458,22 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
> >  
> >  	dev_type = response.device_type;
> >  
> > -	if (dev_type == GB_SPI_SPI_DEV)
> > +	switch (dev_type) {
> > +	case GB_SPI_SPI_DEV:
> >  		strscpy(spi_board.modalias, "spidev",
> >  			sizeof(spi_board.modalias));
> > -	else if (dev_type == GB_SPI_SPI_NOR)
> > +		break;
> > +	case GB_SPI_SPI_NOR:
> >  		strscpy(spi_board.modalias, "spi-nor",
> >  			sizeof(spi_board.modalias));
> > -	else if (dev_type == GB_SPI_SPI_MODALIAS)
> > +		break;
> > +	case GB_SPI_SPI_MODALIAS:
> >  		memcpy(spi_board.modalias, response.name,
> >  		       sizeof(spi_board.modalias));
> > -	else
> > +		break;
> > +	default:
> >  		return -EINVAL;
> > +	}
> 
> thanks,
> 
> greg k-h
