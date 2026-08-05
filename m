Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1FE44C654
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932358; cv=none; b=aAJcBJQyhioc1Dw0m4JDTPZ5TZxm+XJe+UchPxDNmRo0PBVBafWzeULoFYDUM0F0ErkhEZaD6wQ1PCLlEoZPyQkq7eSLrJxBeYBH/iriFnBzAKUGgCZGzGdMdWf6/qOcjRrjOsAMRYtvak7N4pmvCKyGNh1V/75OZihVqWhtKHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932358; c=relaxed/simple;
	bh=+mR8RQJ4khZzQAKi/NAf3IbPQFYZCRuV4MwLQKFC7uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Boc9nqm5wOjFuAV7DBDIUjlq1F4pcctXsWQHOVoT0gNk/2+mXuQ/EZ1R1lBkj6ofYYFJtgHMjpPM6NdRnqOc2N/Sa+XrLUPhBib5eWqwmjVP8ZB2UwTlXDtI5fc/1Ww5lZYkO2QeqmmypwNRQpaT9h+lWUzsNNq0+Ef/JiPijbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vc+dWcZq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc+dWcZq"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso688881a12.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 05:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932357; x=1786537157; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mfhMEqEvOxX7u8U9xf8Hzi+OelQlp6hO8dV7EGvtGA=;
        b=Vc+dWcZqemTCifTDnmwpuYgmYL2/3BJHjnfR6Kw+7dKYdeRDsLzSgmU86+MhLvybzC
         IhvJB2uh7ykG8y7ANFOuPixIpMLlmtdaSktqUxCNf3Ji84wroh0eAChqOMurG/r6hInu
         eeTDyKmV2om+T8yTZbete4HhTpeslgxPjGaAvaETaLTfWadCfxs6XhbXIvFMIH3ACjDQ
         uRtSiUat5lQR2N3XVY9DkLcQddv0JooUcBTJ+xqS44aJ5Rqs4Jm8wiSTnKhaHkqBCRGh
         SLvy+W3fjXrxM1ZJEISBJhPmmbrfvGb6MEfRmfzO+qlfK2jnDjmwmId4oKrdTzIsV+/7
         Cx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932357; x=1786537157;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mfhMEqEvOxX7u8U9xf8Hzi+OelQlp6hO8dV7EGvtGA=;
        b=fy31U5bEVOk0q+Maabk1UIoeBWdkMTvsz+6vF1CD9Hk3peHGMkshjTHb+vAzQHxHEx
         FmyRjxcO7Isy8rFaFBcZVtIsp7lUZqq/MfphYuSRutkNCj9mWaUmOab3KGjsLHYN8vOX
         dMjc0wKSH/kL7QKWTVYm24EPiLvRzqqC/yHpZLGF0fcaLWbvBVibARjYxH4EeZC0bHLG
         ZjLSiJZup322iclUQLyGlNpCRNhoI8EyEHeEiXxuccTfl1INjkPVV9gnUygjI1g0mQy1
         F91/22xMWc0ayRTRSQFrhEVGjiqg18wmmMu0kNgoAg9lBhrpX34WTP1UsRfVj2Qq8KoK
         7x2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq/ct8ZUmF5zhfSolMhr6WZ5LKt5mfkAKASd3cDN946pwnzZ20MGZFUR5MimcrLduQGCA6IR09r0C1iBRzz@lists.linux.dev
X-Gm-Message-State: AOJu0YxDLDH33yqqZ57mXetwR3+nqsd5VpMsWwUkQ96nW42Vh8XvTP9+
	4AL4pvj74ri/9oCFoFilBRZmvsCIuGu/Jb42XlvAxUZOZKBsoYimPmkC
X-Gm-Gg: AR+sD11rnjXSqLhiBKKKubreU8AjVHr4mAVGVsZrjTpQhPe8ZkoU5JEcIHToww1JWfP
	Re1xsW5bwkBDgaXqGjU7Pr27M9DH6Fpkt2KlZT4kUv8+OZZjgeFOwt+QCmmT1VobHES7kV0ElpR
	EDkh1durYWz7ul98T5CavvOwszGZ+MAeL4bMwQr8fb69xYsOlDpSEQC9ZRe5IQlXcPWtU/38Uzx
	0xPqh8T/3nISg/jP5zu8tO5eUGb8vausfYYNQ1wfbxtgh/XCragQrjXjgBKjBKRKQx5iG3hLt2T
	WI4BJ72oizeLNnOXY5Z6F/3VQCkivKCgZ4hA2Hy4hjSXA2CLNa3orQ+PxFWRZ0wmtXoFc2Si6E5
	Qg5xHMZTLtvu/eRCH1f7Jp71rRyeubdpDPAj9VdVvo8GmkjQXfEDB+XnaSOFrUAuByEYo3XhchH
	4ygaxHWkWp53PgWBmeQv/R7hMZ+RSI7zY8uFJP2va0VIL0AkbHeVbbZ7aEIkzIiy0S2hnA
X-Received: by 2002:a05:6a21:998c:b0:3c8:e397:cf77 with SMTP id adf61e73a8af0-3cb85df18ffmr7535967637.2.1785932356653;
        Wed, 05 Aug 2026 05:19:16 -0700 (PDT)
Received: from dio ([103.161.231.150])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b76cfsm15415603eec.4.2026.08.05.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:19:15 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:49:09 +0530
From: Supreet Singh <singh.supreet14@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: spilib: Handle SPI device types with a
 switch statement
Message-ID: <anMqPSOOg_EG2Lnf@dio>
References: <20260805111958.114209-1-singh.supreet14@gmail.com>
 <2026080508-stifle-qualm-3dd7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026080508-stifle-qualm-3dd7@gregkh>

On Wed, Aug 05, 2026 at 01:28:47PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 05, 2026 at 04:49:57PM +0530, singh.supreet14@gmail.com wrote:
> > From: Supreet <singh.supreet14@gmail.com>
> 
> We need a full name please.
> 
> 
> > 
> > Replaced the if/else chain with switch statement. makes it easier to
> > extend support for additional device types.
> > 
> > Remove the temporary spidev variable since it is only used to test the
> > return value of spi_new_device(). Call spi_new_device() directly in
> > the conditional instead.
> > 
> > checkpatch was run, had no warnings and errors.
> > 
> > Signed-off-by: Supreet <singh.supreet14@gmail.com>
> > ---
> >  drivers/staging/greybus/spilib.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> > index e4d1ae8308aa..53fc0c124754 100644
> > --- a/drivers/staging/greybus/spilib.c
> > +++ b/drivers/staging/greybus/spilib.c
> > @@ -444,7 +444,6 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
> >  	struct gb_spi_device_config_request request;
> >  	struct gb_spi_device_config_response response;
> >  	struct spi_board_info spi_board = { {0} };
> > -	struct spi_device *spidev;
> >  	int ret;
> >  	u8 dev_type;
> >  
> > @@ -458,25 +457,29 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
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
> > -		       sizeof(spi_board.modalias));
> > -	else
> > +		sizeof(spi_board.modalias));
> > +		break;
> > +	default:
> >  		return -EINVAL;
> > +	}
> >  
> >  	spi_board.mode		= le16_to_cpu(response.mode);
> >  	spi_board.bus_num	= ctlr->bus_num;
> >  	spi_board.chip_select	= cs;
> >  	spi_board.max_speed_hz	= le32_to_cpu(response.max_speed_hz);
> >  
> > -	spidev = spi_new_device(ctlr, &spi_board);
> > -	if (!spidev)
> > +	if (!spi_new_device(ctlr, &spi_board))
> 
> Why was this change made?  It's a different one than the switch
> statement, right?
> 
> thanks,
> 
> greg k-h

Hi Greg

Yes, you are right, the `spidev` change is independent of the switch
statement. My intention was to remove the temporary variable as it was
only used to check the return value of the `spi_new_device()`.

I will drop that change, and send a v2 focused only on the switch
statement. If appropriate I can send that cleanup as a separate patch.

Apologies for the last email, first time using mutt.

Thanks
Supreet Singh
