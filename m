Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5543FC4
	for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 11:50:10 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id i21so38049662ejd.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 04:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G3EAEGce9DDVcaeWugp6PobFOe4iFXkc5xvRhZSkkGw=;
        b=Lx/1A6DmeuQnhij6Da/uxEIPb5BzL0zii2ZMDwEmwWrwBQlFXT5fa7AvJHvNjfRKc8
         zFAiJWXEAji1k2DPGLezQZgyLaEdKNsk715u1/F1fY8mgprK4lw9hV80bV+r14ejvwJR
         W2XX7In0UNfhjDweu6YiWImhaQWrXBji2j2wd94Rpn9b9+bwamPieXl4qfabnYm/33S+
         YK2fxSy45j26/VJhWPSG6L/kHq5ALeKyWWvJWjKoi1gEO67ocd2Cyp7vg8zV0R3sViGX
         n6A2AasECZmsfz9xPvjktBhvy9MXH1nATuDu0FZJrlna0CODYBPZwyk7M9SE5Qn0qwkF
         /Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3EAEGce9DDVcaeWugp6PobFOe4iFXkc5xvRhZSkkGw=;
        b=LRJOzG1N96hK1JQLswwcq6M2CPi2W1uKxJlEepHrhBaEmbuNdWF6L8WdGMA5DGPYTR
         9er0gA4lZ+3+pJAzhM5ZmnhYbpRNXqEbezovEsRPGWjg9/ugYyuV5KioDOOXO9bfep0U
         gx8Fmh44SwL6I33EuJ2dVkmqFwX3JX5UgsVz/VxEWvmH9mkRozAPRUmwoREPZd3XoY6m
         SjbaW0UiuyNf6e3ZlsrLHtKDMZH9LAAnIXhE5a3C/rdroeFQgr7Y7sOQzKyQDrRXL6r4
         4t90h+5Rt18OSH/dFMPdQuMhZB926jYO3hGNd9aE9Vx6pOe205yGkOGAHTwXdE7G+mz+
         B3Gw==
X-Gm-Message-State: AOAM531bSAY11jjjgMka6fhdhtz8w37nP4aa0xI8ncsYV4sZVbRjs5St
	iTlHGQ8MA9/68Zz+mkYqxbE=
X-Google-Smtp-Source: ABdhPJzYUeBhPzvh8YJvV3+MS2hWTuO/H0Yc5wWmS5Dyi+xlR7LcBqk6GL61VKzNkx/PZed228yzIA==
X-Received: by 2002:a17:906:32d9:: with SMTP id k25mr29842763ejk.290.1630410609117;
        Tue, 31 Aug 2021 04:50:09 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id e11sm9273276edq.30.2021.08.31.04.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 04:50:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH v4] staging: greybus: Convert uart.c from IDR to XArray
Date: Tue, 31 Aug 2021 13:50:05 +0200
Message-ID: <6155058.TBsaUTXu4T@localhost.localdomain>
In-Reply-To: <YS3jSsGSs0yAw/Ba@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com> <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org> <YS3jSsGSs0yAw/Ba@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, August 31, 2021 10:07:38 AM CEST Johan Hovold wrote:
> On Mon, Aug 30, 2021 at 08:20:25AM -0500, Alex Elder wrote:
> 
> > I have been offering review feedback on this patch for three reasons:
> > 
> > - First, because I think the intended change does no real harm to the
> >   Greybus code, and in a small way actually simplifies it.
> 
> You leave out that we've already seen three versions of the patch that
> broke things in various ways and that there was still work to be done
> with respect to the commit message and verifying the locking. That's all
> real costs that someone needs to bear.
> 
> > - Because I wanted to encourage Fabio's efforts to be part of the
> >   Linux contributor community.

I really appreciated it, thank you so much Alex.

> Helping new contributers that for example have run into a bug or need
> some assistance adding a new feature that they themselves have use for
> is one thing.
> 
> I'm not so sure we're helping either newcomers or Linux long term by
> inventing work for an already strained community however.
> 
> [ This is more of a general comment and of course in no way a critique
>   against Fabio or a claim that the XArray conversions are pointless. ]
> 
> > - Because I suspected that Matthew's long-term intention was to
> >   replace IDR/IDA use with XArray, so this would represent an early
> >   conversion.

I am pretty sure that Mathew desires that people convert as much as possible 
code from IDR to XArray. You had his confirmation in this thread along with 
the link to the old message I have provided. However you and Alex are the 
maintainers, not Matthew. I must respect your POV.

> That could be a valid motivation for the change indeed (since the
> efficiency arguments are irrelevant in this case), but I could not find
> any indications that there has been an agreement to deprecate the
> current interfaces.
> 
> Last time around I think there was even push-back to convert IDR/IDA to
> use XArray internally instead (but I may misremember).
> 
> > The Greybus code is generally good, but that doesn't mean it can't
> > evolve.  It gets very little patch traffic, so I don't consider small
> > changes like this "useless churn."  The Greybus code is held up as an
> > example of Linux kernel code that can be safely modified, and I think
> > it's actively promoted as a possible source of new developer tasks
> > (e.g. for Outreachy).
> 
> Since most people can't really test their changes to Greybus perhaps it
> isn't the best example of code that can be safely modified. But yeah,
> parts of it are still in staging and, yes, staging has been promoted as
> place were some churn is accepted.
>  
> Johan

I cannot test my changes to Greybus, but I think that trivial changes are 
just required to build. To stay on the safe side I had left those 
mutex_lock() around xa_load(). I wasn't sure about it, but since the original 
code had the Mutexes I thought it wouldn't hurt to leave them there.

As it was conceived it was a "trivial" patch that didn't" need any tests, 
IMO. Greg has said, more than once, that "trivial" patches are "more than
welcome" in drivers/staging, so I took his words applicable to staging/
greybus too. 

Until the locks were there, my patch was indeed a "trivial" patch. I know the 
XArray API enough to do this task because I've already worked on unisys/
visorhba and you may bet I had not the hardware to test that patch. 
Furthermore, it was much more complex work than what I've done in staging/
greybus. After some time, due to the lack of responses from Unisys 
maintainers he took the responsibility to apply my patch. He knew that it was 
not tested, so he wrote "let's see what it breaks :)". 

I'm very sorry to bother you. I don't really know in the deep how Greybus 
works and I don't know how to write drivers because at the moment I prefer  
to spend my (very limited) time to learn core subsystems (process management 
and the schedulers above all). But while learning, I also want to give back 
something to the kernel and its Community. I think that little works on 
staging are the best way to accomplish this goal.

I was wrong in assuming that trivial patches to Greybus are welcome as they 
are for other drivers.

Best regards,

Fabio



