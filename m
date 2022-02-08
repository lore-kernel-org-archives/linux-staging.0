Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438962F2E
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 03:54:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id v74so16642687pfc.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 19:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CrI21+GeUa9mDY1to6AwbsA2jAr/D2vzHzn49pGgXGE=;
        b=K0rHE1yiOyGdFpo+TJrdid8OekFSu5VsJNQTBjNwo03OUwRRDY2ylwfZeW/HzWHGxU
         EUIh8KOJGBjjFgffI4DFBSOLjoAtVWJVmZ67wg10Pf7pvDZBUyvlhTDLBIQCJ3GDEP+9
         NmSA4or1ItZFOjgtaUvoRsxkhd2Z3/z72oNKRNVkdTuBVKZlo3YfQj+jCdJE2pbJYgfu
         PxduBnFGbkT7zRpXyftW1Fgo1CuIyolVhUKIa4jEZ0QgRhWd49Ba+Miw4ka9xhGS2Dpk
         vbXpkOnFxd9BNCtyTlfwGugPaeTJg0AwAE+Y6d4hozWeg8XVD/JLV075/h2XtXVFzVSn
         GNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CrI21+GeUa9mDY1to6AwbsA2jAr/D2vzHzn49pGgXGE=;
        b=LweYJAbzNyOovbVWD5B7ylrUCS7qSV+rvMpBj58UYoaeXOZILj3aueXQzpFq0j0clr
         GGsX19L6Bbyucifo4cuTJ5Rkb5JZhPmt0OVZ8xHKDn1p6ghJ6Iz0B1seyRdCrpngZk86
         EsaG7Q16fNkbZGy96uUAhKf05TFHokVYgV+9LIp44nRAdVT4NaRolg5aXoClLgSe4FWJ
         cGKze1RxLyxhEfyJV6qJwg6a6XB0qgqcdQ958RT5UoiANyC5d3AFwAFjRUQmUu4F1K56
         UjkxUvqhI+Ud5tTIvEIKlInHv1XsrDARPuhh9Toh5jJb/pXaiqesViNa/CiJjfvRwCLY
         YKSw==
X-Gm-Message-State: AOAM532uzJFGSi3V4SFLWgiDpxSCvD0CLau6uDx9x8V8Du+XJquZiWSX
	DF6WXxupTHNzlC2C6oYcm5w=
X-Google-Smtp-Source: ABdhPJwQ0TBuhP0lUeWtWFlGeE2pQ5qCQ5dYfw5E4EauEyPfAmTzQXqzFDy6qw0t6Gd5dLPUbBLpDA==
X-Received: by 2002:aa7:94a9:: with SMTP id a9mr2532139pfl.78.1644292449691;
        Mon, 07 Feb 2022 19:54:09 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id p64sm9210078pga.13.2022.02.07.19.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 19:54:09 -0800 (PST)
Date: Tue, 8 Feb 2022 16:54:02 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, gregkh@linuxfoundation.org,
	realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: remove need to recompile code to debug
 fifo content
Message-ID: <YgHpWpivQHcS+Eh1@mail.google.com>
References: <YgCj2P59AbFFmnbA@mail.google.com>
 <20220207100601.GF1951@kadam>
 <a630d8381cee0f543e0d77614052e1d04ab162a5.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a630d8381cee0f543e0d77614052e1d04ab162a5.camel@perches.com>

On Mon, Feb 07, 2022 at 02:15:47AM -0800, Joe Perches wrote:
> > > -#ifdef DEBUG_FIFO_ACCESS
> > > +	/* print content read from fifo for debugging purposes */
> > >  	for (i = 0; i < size; i++)
> > >  		dev_dbg(&spi->dev, "%d - 0x%x\n", i, local_buffer[i + 1]);
> > > -#endif
> 
> If you use
> 
> 	print_hex_dump_debug
> 
> perhaps the DEBUG_FIFO_ACCESS could be removed.
> 

Hi Joe, thanks for taking the time to review my patch.

print_hex_dump_debug is pretty convenient and straight to the point
which I do like. The only thing that I "didn't like" is the fact that 
when configuring dynamic debugging, print_hex_dump_debug only cares 
about 'p' flag and ignores all of the other flags that can be helpful
for tracking things down. 

So essentially I lose track of which function and device instance 
the message belongs to (users can have more than 1 at the same time).

But, because of your suggestion, I came across hex_dump_to_buffer()
which bridged the gap. thanks a lot :)

Would you be comfortable with the following implementation? (Dan, feel
free to chip in)

	char linebuf[FIFO_SIZE * 3] = {0};
	hex_dump_to_buffer(local_buffer + 1, size, 16, 1, linebuf,
			   ARRAY_SIZE(linebuf), false);
	dev_dbg(&spi->dev, "%s\n", linebuf);

thanks,

Paulo Almeida

