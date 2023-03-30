Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1776FB1;
	Thu, 30 Mar 2023 15:05:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l12so19401632wrm.10;
        Thu, 30 Mar 2023 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680188730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHqk1nTzV7ycjwFvCpLIMeUZdQ/ws/pWquuHos3UlIA=;
        b=H3KCxqCfCflzl6WHwZA0TMDFrBJHXqEMMqT0wYP7XswonsCIKoyB5NhweiLlSjr0/8
         7MHImaSCADouon+KDq2VQ6cR0OoDubQ2P4GyBUtXDkieXZMCpsRzIvWpPVkPr1jXKCSn
         6NkjtQCtRkkYmPvGG1oVBc/DBmZ+jjIIsPZZ7YI+G6BngLtwzKftHsYTIjQ2HSay0HEx
         RjSiRArTl4TQ5LY+nkAiqWhvlrDRd9VKRkQiql525/O3GJLXcrKY4bmwkjmb+/4bqV3c
         8QGw4L04ctbEdh9ji4zYUSPBkOdvhxuGOOQPi2S4c9gtmUmymh0h7Pe7JePN38YjIw1I
         4uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680188730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHqk1nTzV7ycjwFvCpLIMeUZdQ/ws/pWquuHos3UlIA=;
        b=gqbQa1X/42SmvcOqmonyamAbWq/vgO0COjifJzj3kRDOLHFfW2X25icGUg19aej5tk
         pPmR10SIiwd1YV61J+l/21ZVWjSTwTSPS0QxgMI7c+8d5kjYMjgANHV6zxilyX/prrN/
         5BGMhJd/ZHSPZLGip/eofUv8QTcHK4jO7PrkaiLhcHOYW+gPgZVQmtWyAfxA7B0hVhiG
         OZNTuhfDPdY6V88BIjkYbOoNCdBUHgt4Og7v14BITvZndEQ3jXH5bpZn6nDciu6BNthj
         JIRztVUIEecNS+jvxQesA9g8Ue3y/3RJ5iDDYFivCDvC14oh5HKmBbQwR+Ab8wkHj7h2
         P85w==
X-Gm-Message-State: AAQBX9d8hBw02LjMGJwZqbdIjyiOAfvFqgt7yd4eChbytL+rIXTkK+yz
	VGDpf9jBwC5DMkfPnTCoB8E=
X-Google-Smtp-Source: AKy350Y8+wmYVIjBkMYJaXy9cmGuAKT6zNtAMxk8kgmxBbAZAy2HIfR+trzIeOaI1D60yObiOTQxTA==
X-Received: by 2002:a5d:4fd0:0:b0:2cc:459b:8bc8 with SMTP id h16-20020a5d4fd0000000b002cc459b8bc8mr18152437wrw.6.1680188730219;
        Thu, 30 Mar 2023 08:05:30 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d6d50000000b002cff0e213ddsm33005646wri.14.2023.03.30.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:05:29 -0700 (PDT)
Date: Thu, 30 Mar 2023 20:05:27 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: refactor arche_platform_wd_irq()
 function
Message-ID: <ZCWlNxAObqge3AB6@khadija-virtual-machine>
References: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
 <a64ad550-9991-4f54-8e09-735133422291@kili.mountain>
 <ZCNygZ8aPsElfTK6@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCNygZ8aPsElfTK6@aschofie-mobl2>

On Tue, Mar 28, 2023 at 04:04:33PM -0700, Alison Schofield wrote:
> On Tue, Mar 28, 2023 at 10:33:23AM +0300, Dan Carpenter wrote:
> > On Tue, Mar 28, 2023 at 01:18:53AM +0500, Khadija Kamran wrote:
> > > Refactor function by adding goto statement. This reduces the
> > > indentation and fixes the issue reported by checkpatch.pl script.
> > > 
> > > "CHECK: line length of 101 exceeds 100 columns"
> > > 
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > >  drivers/staging/greybus/arche-platform.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > index fcbd5f71eff2..c7d3b6f7368f 100644
> > > --- a/drivers/staging/greybus/arche-platform.c
> > > +++ b/drivers/staging/greybus/arche-platform.c
> > > @@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > >  				 */
> > >  				if (arche_pdata->wake_detect_state !=
> > >  						WD_STATE_COLDBOOT_START) {
> > > -					arche_platform_set_wake_detect_state(arche_pdata,
> > > -									     WD_STATE_COLDBOOT_TRIG);
> > > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > > -							       flags);
> > > -					return IRQ_WAKE_THREAD;
> > > +					goto out;
> > 
> > I don't like this goto.
> > 
> > It suggests that calling arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> > is a part of a shared exit path when that is not true so it is sort of
> > lying to the reader and making things harder to understand.
> > 
> > Unlocking is shared.  goto unlock is fine.  But that doesn't help with
> > the very long lines.  (I am not saying that goto unlock is a worthwhile
> > patch to send but I would definitely have found it tolerable).
> > 
> > regards,
> > dan carpenter
> 
> 
> Khadija,
> While you are reworking this, just wanted to note that, once 'out:'
> becomes the single exit path for the function, it won't be a lie
> any more. So you will have addressed Dan's concern.
> Alison
>

Hey Alison,

Yes, I understand. Thank you. :)

Regards,
Khadija

> 
> > 
> > >  				}
> > >  			}
> > >  		}
> > > @@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > >  
> > >  	return IRQ_HANDLED;
> > > +
> > > +out:
> > > +	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> > > +	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > > +	return IRQ_WAKE_THREAD;
> > >  }
> > >  
> > >  /*
> > > -- 
> > > 2.34.1
> > > 
> > 
