Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC79241EB;
	Fri, 13 Oct 2023 21:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpoL7lxk"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b6f4c118b7so494938b3a.0;
        Fri, 13 Oct 2023 14:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697231608; x=1697836408; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDEgyyosUqx6vs14HxrP/8FKw5FzUfuw525zCcTrL5Y=;
        b=MpoL7lxkIr8+wGoJ3FgcQqcv9cTUYn8iPEW+Kh1OBzVG3yHARVsgeGtBGJETeinLEt
         AV9mizRhYKnJQPx6PPDit8tqdGn0s+6ZeKU83M0Af1qq/YUCYBGYsryqLegNIj7pxZPN
         ys7cZnLBzKSJ1r7DFoYFD57VNDKOomf3ThWk8b0FwPZSytesZSYMx5Su7LE9dHkuXHz/
         f++DxRKzlewGKumECL96eeLGg/m7YiLrM0TfswJ6m9aV1TiMnkA9PKIx5aY7AXP9xbqo
         avrUgquVMOpXHtkPt3GQI1ko9nA9bZoWqPJLJkl/SyHpKUWzeI7h8zbtaT5DNA1J3RDH
         VKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231608; x=1697836408;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDEgyyosUqx6vs14HxrP/8FKw5FzUfuw525zCcTrL5Y=;
        b=Xt9dv4IuLSl7dS96E/Q46HUtn36/KAUCxJk2rnn3ELVeZXVaBNCWJIkEcszLCnJS2H
         6vvmi2p2fhfChX4z+SQDPJhL5jVVykwFZw9zZ8BxWEZ4s5PWRj+dzelKWSVKHrWyZNPY
         n056IiwqgjPxI1crUzqvFwotUmFZHf7jvMP3dnFVTke/cUiMJZzNWtDJjtgnnkpYlnSW
         kXEZ5raX+2URXHPxYfZnZut6qX4AkXpdeZl/oec53Kh0ZSFF+KMbkOUkGdVlA8J12W1V
         65LTwUFJEBDV72pW414ry65h0tBCSMsHJNAdF4k1aXrymtA5N5+/a4uusG6yewWn1uRY
         xaJQ==
X-Gm-Message-State: AOJu0YyTrkh7KXA7nc6QemP3vVvYy59zNCwSkPCgPX+GxAKUveJEGeyu
	1Tba13eE+uyCmytPG1EJQiQ9mvsYsNqt6A==
X-Google-Smtp-Source: AGHT+IFhA3DtOVEKxx2Dik09MQrxURa0EuN5QE/3vbqXzk/tVtFx+lp2Qk/0lJ0G8IkwjwMLtDvLRg==
X-Received: by 2002:a05:6a00:2406:b0:693:3963:847a with SMTP id z6-20020a056a00240600b006933963847amr26806679pfh.30.1697231607705;
        Fri, 13 Oct 2023 14:13:27 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id y4-20020aa78544000000b006878cc942f1sm13928771pfn.54.2023.10.13.14.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:13:27 -0700 (PDT)
Date: Fri, 13 Oct 2023 14:13:26 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tty: gdm724x: Match alignment with open parenthesis
Message-ID: <20231013211326.GB25352@Negi>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <ff627fcbc9e450c2e8f4aa5810b94e56151efa2a.1697184167.git.soumya.negi97@gmail.com>
 <a0a7274f-eba6-4f72-9569-ec4c4fff3a1a@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0a7274f-eba6-4f72-9569-ec4c4fff3a1a@kadam.mountain>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 13, 2023 at 11:57:40AM +0300, Dan Carpenter wrote:
> On Fri, Oct 13, 2023 at 01:26:34AM -0700, Soumya Negi wrote:
> > Fix CHECK: Alignment should match open parenthesis
> > Issue found by checkpatch.pl
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >  drivers/staging/gdm724x/gdm_tty.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> > index 32b2e817ff04..4e5cac76db58 100644
> > --- a/drivers/staging/gdm724x/gdm_tty.c
> > +++ b/drivers/staging/gdm724x/gdm_tty.c
> > @@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
> >  	int ret;
> >  
> >  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> > -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> > -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> > +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> > +					      TTY_DRIVER_DYNAMIC_DEV);
> 
> I prefered the original code.  It was more readable.
> 
> regards,
> dan carpenter
Hi Dan,

Noted. I'm curious what happens when some of the patches in a patchset
are acceptable and some are not. Is everything disregarded by
maintainers or are the good patches cherry-picked from the set?

Thanks,
Soumya

