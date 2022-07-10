Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF6210F8
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 13:00:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id be14-20020a05600c1e8e00b003a04a458c54so1620333wmb.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=URkBqTaJYZiBKaHkMPyuusVxdAfWQV7wmB1QtdU3dqc=;
        b=H28NNWSz9kCHmESG/8FbsQ+m+Jzxy0qUH0fyz1nTVT1VnfBfH5jiuEPkD53FXHjSzn
         B/1dX86SUM+LrKgLI+OYmFPx82FdsB7V7yt8sf5XzwbtSzPbPhDXFQePbTiQi3lyyDyP
         gMD3/4c+Za4D22NF6y4FK7z/NMbKVISAdm+vnmThUgp797/YBqaFhAmGGecJT+SZcrvc
         nZn0bWReEM8Dfarg2Hm6x7djFxVUPsFttf22okgYsWEwwHRp6hldOhLKJUHUfEK3zrDn
         HiqibjwQLKcAMiflSho4wiD/UVJX6XpYIzFXuACDbKgxRHdZNZO8RPbciEo4gE2fs92g
         WkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=URkBqTaJYZiBKaHkMPyuusVxdAfWQV7wmB1QtdU3dqc=;
        b=q/5xSzxrdpeD5XxEODh3PiCnDPAmDp7vWvKn00Ha/gX8dHxyxuCd2/mrMiZDyi5AKM
         aGnNlFOPt5YGVccPZhO+t31phzyrj+jS5kB1kt04E5ry/tUqDzoI9eur09WhfVudmvZE
         0kGPYtO+ujQ+GONPgT9rgu2G8Fq7XEUrK0xBNc1D3Bs+jNDH6D6bWU/46C9XL46F1Q2M
         rDHpAm3mpQmqOS9Dj7L++DeiuWNp1raoy0x/7jzhW846NItT7cj6gbouA98ZvtH3Xjto
         djk7WIeT6ttLXGp1n62JItQldRyCF/UMA6AR+UBkJt1EmVuRXBNVqC3Ud29SriJruccA
         nnrQ==
X-Gm-Message-State: AJIora9Ir6/FHfbajRrugVBgWm0574DFk+5uoE/4lrB9xaWTnjinpxkn
	YV95ZLCklfM5DRJCZFlv/Lw=
X-Google-Smtp-Source: AGRyM1vsTGSbf96VTwX0XNh02DsOlmP27A9LgNPMyEn1EV6Jd3PuivbWE971HAL4v79NdOzdGIsDng==
X-Received: by 2002:a05:600c:4f4d:b0:3a1:98de:abde with SMTP id m13-20020a05600c4f4d00b003a198deabdemr10439595wmq.36.1657458022784;
        Sun, 10 Jul 2022 06:00:22 -0700 (PDT)
Received: from mandalorian.koija ([2a02:587:4ba0:ca00:f1ee:516:279c:45e9])
        by smtp.gmail.com with ESMTPSA id j2-20020a05600c2b8200b0039c8a22554bsm3876989wmc.27.2022.07.10.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 06:00:22 -0700 (PDT)
Date: Sun, 10 Jul 2022 16:00:19 +0300
From: Christos Kollintzas <c.kollintzas.92@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: replace udelay with usleep_range
Message-ID: <YsrNY+uU8tUXJiPV@mandalorian.koija>
References: <YslTQLhM7GSaGXki@mandalorian.koija>
 <YslY25NnW6O5Tn+p@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YslY25NnW6O5Tn+p@kroah.com>

On Sat, Jul 09, 2022 at 12:30:51PM +0200, Greg KH wrote:
> On Sat, Jul 09, 2022 at 01:06:56PM +0300, Christos Kollintzas wrote:
> > Adhere to Linux kernel coding style.
> > 
> > Reported by checkpatch:
> > 
> > CHECK: usleep_range is preferred over udelay
> > 
> > Signed-off-by: Christos Kollintzas <c.kollintzas.92@gmail.com>
> > ---
> >  drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
> > index c680160d6380..eeafbab4ace1 100644
> > --- a/drivers/staging/fbtft/fb_upd161704.c
> > +++ b/drivers/staging/fbtft/fb_upd161704.c
> > @@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
> >  
> >  	/* oscillator start */
> >  	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
> > -	udelay(100);
> > +	usleep_range(100, 110);
> 
> When doing these types of changes, you really need access to the
> hardware involved in order to be able to properly test it.
> 
> Especially for this type of function which is trying to do timing
> changes which the hardware requires.
> 
> Did you test this on the real hardware and did it work properly?
> 
> thanks,
> 
> greg k-h

I did not.

I will try to find the hardware and send a patch that is
properly tested.

thanks,

Christos Kollintzas
