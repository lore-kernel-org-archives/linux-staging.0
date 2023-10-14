Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3381C27
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOKmcmqV"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so3561739e87.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697269107; x=1697873907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5IW8rze1/YjaqUMjBuePhE7bES5VSq0kZGVhjWXwOWg=;
        b=BOKmcmqVZ32J++AiU1w35P83OujMojBXiH8x8tQLRw5tqYRFlyGlNa8QFIOHrqmghm
         PPBoxhFeeYgFj5K/rN2FzJuYiW5Tbe8mU9YojTsFfRz7pPoY/cAcgZDFVDd+sMQpO6DN
         QuWb2xMQOP4sqEqpzLKqnwHyjOJV075K/SDtYrHfVNA57wVT1xmXpkb9lfI2Cs60qCp/
         SE9CBIPeYaI9PoD+Stvx/jO4dJVLazDgNkcCYmw6+pbT5Vb8PRHV2Sd5kQGH8R2eJ2fM
         8Nz1kbKJ7vMPITpVML/vmnVGxBzUwNi0TZLv0/Xo4FcrUit5/U2dYz2WKTwqyOmvJlxO
         sR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697269107; x=1697873907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IW8rze1/YjaqUMjBuePhE7bES5VSq0kZGVhjWXwOWg=;
        b=K1jWvIOUKzq2h468kjK6UkrKNk3lct9FyQEpKJQmsUJLIA/401K6VMwylYSPfPUEH2
         w4gqC71oE080FEh5W3tGkSuW5WNo28FU8xVSI2kIVrIyQtBD9ocnhdjnhhUFpKWf2hle
         iSY5P/dG1QA4rQ3Shndu4xz4wBqwy4cjfcTKycTaB6ASs3zYzWXFodYeBWKcbH6xQTyM
         KB8AVlmtqSSexkg7HUK7SrS9BgpM5gvmX9uxFjppxBXgdRY033dMXrvrTVtE7CXUCMm/
         iZSgtgUU235yXetYlDbL7O/NI2WLrRsIzVvMFMD1a+gT/r8OBX5H4BHtv16ZZ06Crdc9
         LQRA==
X-Gm-Message-State: AOJu0YyRBBx000WNZ+80pmTfnBzTXl5Dy4ZQ/h4DlXn+t6QNmwKUkKPH
	OudTm+doVXBU8Ygfb/4/MjXz2Q==
X-Google-Smtp-Source: AGHT+IEwy0mTowcwVn+E09x52F7nrltv7XkrXRZJXoKbC5VJ4QM5KNmK+GyTJYRivZMLkI2F/Mx9EA==
X-Received: by 2002:a05:6512:3ba0:b0:507:9d70:b297 with SMTP id g32-20020a0565123ba000b005079d70b297mr3455700lfv.60.1697269107071;
        Sat, 14 Oct 2023 00:38:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v7-20020adfedc7000000b003197efd1e7bsm22225990wro.114.2023.10.14.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 00:38:26 -0700 (PDT)
Date: Sat, 14 Oct 2023 10:38:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tty: gdm724x: Match alignment with open parenthesis
Message-ID: <52732a88-7f40-4ce4-b75b-dded9827c1f0@kadam.mountain>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <ff627fcbc9e450c2e8f4aa5810b94e56151efa2a.1697184167.git.soumya.negi97@gmail.com>
 <a0a7274f-eba6-4f72-9569-ec4c4fff3a1a@kadam.mountain>
 <20231013211326.GB25352@Negi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013211326.GB25352@Negi>

On Fri, Oct 13, 2023 at 02:13:26PM -0700, Soumya Negi wrote:
> On Fri, Oct 13, 2023 at 11:57:40AM +0300, Dan Carpenter wrote:
> > On Fri, Oct 13, 2023 at 01:26:34AM -0700, Soumya Negi wrote:
> > > Fix CHECK: Alignment should match open parenthesis
> > > Issue found by checkpatch.pl
> > > 
> > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > ---
> > >  drivers/staging/gdm724x/gdm_tty.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> > > index 32b2e817ff04..4e5cac76db58 100644
> > > --- a/drivers/staging/gdm724x/gdm_tty.c
> > > +++ b/drivers/staging/gdm724x/gdm_tty.c
> > > @@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
> > >  	int ret;
> > >  
> > >  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> > > -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> > > -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> > > +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> > > +					      TTY_DRIVER_DYNAMIC_DEV);
> > 
> > I prefered the original code.  It was more readable.
> > 
> > regards,
> > dan carpenter
> Hi Dan,
> 
> Noted. I'm curious what happens when some of the patches in a patchset
> are acceptable and some are not. Is everything disregarded by
> maintainers or are the good patches cherry-picked from the set?

Most of the time, you should just resend the series.  Sometimes a
maintainer will take the first few patches and then when they hit one
that can't be merged they'll stop.  So you should try to organize your
patchsets from fixes first, then cleanups and then least controversial
to most controversial.  Except people might be annoyed if it looks like
you're hiding a really controversial one at the end of a long series.

regards,
dan carpenter

