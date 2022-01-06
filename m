Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA932C80
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 21:01:40 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id r5so3643174pgi.6
        for <linux-staging@lists.linux.dev>; Thu, 06 Jan 2022 13:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ft4KTDnmfGNxrsGxX/0Cc8w5WOpSQF6ljEU4UL8RaD8=;
        b=oQv+P66yLtYEjzRdtw6E+azvb1+cssHtxap+eylA/E6oDuldn/j9leLANeLuYuXGu+
         196ocDCi50FISgMjWsuWaMgbWeJ9p2GINm85nplZL1qYWzUawKSrIhB9lybagNk4HTC/
         pJJqrBWGcpOlGa7ieS+EawyTLVVXFx/x0017f1S7LiquuXr7fJJW22Qzm6La7qWcyj0l
         3XCNP7DEQ24c7MBLo/yMFqYzFL/9GGsCXAIbXUv5OxHvVM6nmF5pp9hoDI2HUrj/G9ZH
         vFJH6UODT8yMbQb5OLhVh6KCP4t9YiGgusl+iCFeIFb6eekicCxm9it/iKOuL08QVT+i
         ZlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ft4KTDnmfGNxrsGxX/0Cc8w5WOpSQF6ljEU4UL8RaD8=;
        b=VjpqI1fM2fGGPHJwXgjupXwCIlCFB5oAal+rPZOC6C60Abs76wic1+UUbnheXRonn9
         IC7K8iPl9ZNk5aSVk6MmvsmJA94qMqRCvWmgGx2k2mhIhg4NYuTrJVVgI3lPw1M+I4eI
         xp9nC0piIg2gRCuP7Ik1iQ8RoHApaTgRDdxOsE1LqHHtialLJ1/6ojhGROd3HDP4CgjT
         xZceiy8O3NmpiU2YQKj50SeKqSQcaNSPHe6D9DuWhFK4eaN7ECISniSv18Xi0f8DMMu0
         GSpQAJ3Smmw1qiEpE/h02kArkdGS4yMMHDubfLXQ5t20AWx8k1zh5Ncak6rEl33cEw+p
         KDBA==
X-Gm-Message-State: AOAM533UGNT/dLvuzuN2XNg9ZOhcJiCbw7EXOZjSlZyqnbXZ5GCN58Af
	nNShxw+RBETFpzTUNscY7AE=
X-Google-Smtp-Source: ABdhPJyUAM2wF97lFOwI55hw8C21xSxvLscFnuutC/Yawdg8EhM6MeUMQobVIDOJ/tdMtHo/FghKXw==
X-Received: by 2002:a63:b20d:: with SMTP id x13mr8730426pge.310.1641502900186;
        Thu, 06 Jan 2022 13:01:40 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id t126sm2739702pgc.61.2022.01.06.13.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:01:39 -0800 (PST)
Date: Fri, 7 Jan 2022 10:01:34 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: move get version func to where all other
 functions are
Message-ID: <20220106210134.GB3416@mail.google.com>
References: <20220106093110.GA20011@mail.google.com>
 <Ydb22Tuvm0MwfpOK@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydb22Tuvm0MwfpOK@kroah.com>

On Thu, Jan 06, 2022 at 03:04:09PM +0100, Greg KH wrote:
> > --- a/drivers/staging/pi433/pi433_if.c
> > +++ b/drivers/staging/pi433/pi433_if.c
> > @@ -1116,9 +1116,7 @@ static int pi433_probe(struct spi_device *spi)
> >  		spi->mode, spi->bits_per_word, spi->max_speed_hz);
> >  
> >  	/* Ping the chip by reading the version register */
> > -	retval = spi_w8r8(spi, 0x10);
> > -	if (retval < 0)
> > -		return retval;
> > +	retval = rf69_get_chip_version(spi);
> 
> This can not fail anymore, like it used to be able to.  So I think you
> just broke the functionality for why this call was being made in the
> first place (i.e. ping the chip to see if it was alive, and fail if it
> is not.)
>

I thought that this if statement was somewhat redudant because right
after obtaining the chip version, there is a switch statement that
checks if the value is what we expect or return an error otherwise.

Unfortunately, in the patch file generated the whole switch statement 
isn't visible so I admit that it looks funny at first. I will paste the
routine here:

/* Ping the chip by reading the version register */
retval = rf69_get_chip_version(spi);

switch (retval) {
case 0x24:
	dev_dbg(&spi->dev, "found pi433 (ver. 0x%x)", retval);
	break;
default:
	dev_dbg(&spi->dev, "unknown chip version: 0x%x", retval);
	return -ENODEV;
}

Let me know if you agree with the approach I've taken, otherwise I am
more than happy to add the original if statement if you think I'm
missing any edge case here.

Once again, thanks for taking the time to review my patch :)

thanks,

Paulo A.

