Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0127E
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 19:39:34 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id 10so5497701plj.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 11:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1PfxLBu5RTg6+W/ZdiydbjFdhG3Vz/jZwXQgz4MJUVk=;
        b=gTTQq1Lpjo4qFq2wmfuP+1ay9ScwIR14QX5SufQFA2pmQmCYOR2ta+n1yZCA/k1eGd
         jBWDOFfrcauj6jNvgk11++n3b9gGaYbKGOJPPAQLK/Wn9H7uuDULc1jLED5/W1oYiPwU
         VIv9Gp85XFQloIzZHpPptfV+uYh/3ufNJMFOiK5NmA9NHari4jIL6YZFwlVsIy9u7bM5
         IZb9a7HqGtginSss40ljGAJQgZxzZ74S0AajBqR/Lo7wZ+e77K4LCLGBdwaKKxX6yxBx
         uWxUpPL8V+v5Wm7bt5mdRzmLcjzEgFAu8FGt1ednky/2Z2Rko99gk2GTTh+2MTH77Jud
         uTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1PfxLBu5RTg6+W/ZdiydbjFdhG3Vz/jZwXQgz4MJUVk=;
        b=4yz5nY6qRfTkm7bX/C0z5XjSfPaWdQuSDP5/nX2nLON0DhWJBxH4U/14Klr/f9pImB
         qGjg66AMlDg5iP2421TIMtqn8Qk4/gleCwRVpbbU4MJcNHp0FOW5gWX/VYZgnqsICwhx
         fgmh9R4s1AVGAMtdBLPE/xM54DNXyRxpQeRtahWAx7nFR+X9BICL8ckO3K/aJLW16JyK
         GCwfnTf9wkw1rwhvefXtnfYxR3rY10PidPFLMaxMmydsoQdeY3UZqgXzugltnWVI1UTu
         1V2F43MWPA5rya+Z/doX8HjZDC81Hud5S3P4IGIfh5e/Z/UMREg6bjky9x6rlV5zKEEW
         MIkQ==
X-Gm-Message-State: AOAM5303kzH7RENZy8CQ0FMSx3GUSFnss0HOLRxzdTP/bo9rqwT37TGe
	kFM4AbvxyprZZD38unf6P7k=
X-Google-Smtp-Source: ABdhPJxvf10EAyJIO+qJIcDhcmGkyzxt4c/n32xl61eB7mzX4PIryCYdnd+wz16O98ulEsl/9SIdiQ==
X-Received: by 2002:a17:902:ed82:: with SMTP id e2mr2960091plj.55.1644608373945;
        Fri, 11 Feb 2022 11:39:33 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id h25sm25748175pfn.208.2022.02.11.11.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 11:39:33 -0800 (PST)
Date: Sat, 12 Feb 2022 08:39:28 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: add rf69_dbg_hex function
Message-ID: <Yga7cDO00Hmk9+BL@mail.google.com>
References: <YgYZRArwwF7Z1B4f@mail.google.com>
 <YgYa8Pt77v6AAyjb@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgYa8Pt77v6AAyjb@kroah.com>

On Fri, Feb 11, 2022 at 09:14:40AM +0100, Greg KH wrote:
> 
> This is a lot of additional complexity for almost no real benefit.
> 

you're right. I will no longer pursue this approach. 

> > -	/* print content read from fifo for debugging purposes */
> > -	for (i = 0; i < size; i++)
> > -		dev_dbg(&spi->dev, "%d - 0x%x\n", i, local_buffer[i + 1]);
> 
> What is wrong with this simple line?
> 

to be honest, I think that 1 register per line isn't the easiest way to
read them. Given that print_hex_dump_debug existed and had this
horizontal-style priting format, I thought that it would be a better
way of visualizing the fifo data.

the only problems with print_hex_dump_debug was the absense of device
name and string format... so I saw a couple of drivers implementing
alternative hex_dump-like functions and thought that pi433 would benefit
from similar approach.

> > -	/* print content written from fifo for debugging purposes */
> > -	for (i = 0; i < size; i++)
> > -		dev_dbg(&spi->dev, "0x%x\n", buffer[i]);

if we are keeping this format, I may need to add the register idx to
dev_dbg: 
		dev_dbg(&spi->dev, "%d - 0x%x\n", i, buffer[i]);

> Again, the original is fine here, why make this so complex?

[thinking out loud/brainstorm]

I do agree that, for just a single driver, having a method like that
seemed unnecessary but do you think it would be a good idea having
something like dev_dbg_hex_dump or similar?

print_hex_dump_debug has the following limitation: 

1) lacks string format
2) doesn't honor dynamic debug flags (other then 'p')
3) doesn't print device driver name and device name

> > +	rf69_dbg_hex(spi, local_buffer + 1, size, "%s - ", __func__);
>
> Also, you are using local_buffer here, not buffer, why?
> 

That was a mistake, good catch.

> I think the original is just fine, no need to polish something as tiny
> as a hex dump for debugging only.
> 
> thanks,
> 
> greg k-h

thanks for taking the time to review the patch, I won't pursue this
approach anymore.

thanks,

Paulo Almeida
