Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF3A70
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 17:55:19 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id 129so2167238qkg.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R8fFyVJFPI61iNbHmEV9keSoQ1269AezSOwGUUdvo3Q=;
        b=fY0xVj6n82OvnZWItF0Gcd86xvC9gb91Flfw+0iZ5uNr922yFATmtJvfRqtDgIgEis
         bJMzj/+6kjsxnXAcMWRuBb893uLENrm/gw3LS4t4l0zweM0ibVyoo8KUH9Vrg/KQ6H7F
         y3/ns9wnfiWW3/4x+O0FPC3Ni/81CyhBr22rCk3oubyDjtYMKeyzSuYVeNqPLMdiGpYI
         U0AWwjLqaFd0zOQedrG3MLIVte+bwHsEK4pmIhrqAo8e0+99G0MvR+WxsCWJ+jK933ju
         RMbZl+dKRVYoxv6keycgE1pPgGi9nV9tsyZ1WSEXTMirLV4DpxRIDXunbdF60C4WVzBX
         QmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R8fFyVJFPI61iNbHmEV9keSoQ1269AezSOwGUUdvo3Q=;
        b=elabr+ElPBnye49qOXQ9yA7iFjemWOhKLHWli1YIQaXtGdHvp9F8gJvcy4l58Hjgiy
         IYk4JQ5xeYFoViYomTKAKBZUKoIxNvj3jYAmJV1oxE1b7dG4lhDkrkk3GHnGjnnQ0Vs0
         5rrynP6cL4allFRIwni24cNNSVyroC37rVshwAii31V26inkWg5ulClMfs37+sB7DpIg
         T6r3SYRLkZAf11y7GQYDUzbvn2GpDOdlo3oLq66V5IGQfZ+JdgnsHw/3GmorsgqCEQdG
         n15fivZQQKY/7RqrjViDpnFi3F2cL4Z9vm3FQGh4QagMXETcW5Cwyw5ZNo6K9NEMq/di
         bwWQ==
X-Gm-Message-State: AOAM531Q2qoeWFZM8h123AYWHsfoBRJLO5biGkSkeNPY5x0lOUMPxpC/
	cxC+jHhlbJ7Zp6WNIQKyoaEW5g==
X-Google-Smtp-Source: ABdhPJyfq9gVTpuB/X9Jhd7AGhJ6lnuPYCPbaaBbHfnavTfYvP6VrMHMZzYApUv3m8bzOqsdTtIEOw==
X-Received: by 2002:a37:b947:: with SMTP id j68mr5750906qkf.486.1627062918948;
        Fri, 23 Jul 2021 10:55:18 -0700 (PDT)
Received: from TUX ([12.18.222.241])
        by smtp.gmail.com with ESMTPSA id v25sm9346244qkf.108.2021.07.23.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 10:55:18 -0700 (PDT)
Date: Fri, 23 Jul 2021 13:55:15 -0400
From: Lucas Henneman <lucas.henneman@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: greg@kroah.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, trivial@kernel.org
Subject: Re: [PATCH 01/15] staging: vt6655: remove filename from baseband.h
Message-ID: <20210723175515.GA17351@TUX>
References: <20210723144340.15787-1-lucas.henneman@linaro.org>
 <YPrcnylo47dFU8Cl@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YPrcnylo47dFU8Cl@google.com>

On Fri, Jul 23, 2021 at 04:13:35PM +0100, Lee Jones wrote:
> On Fri, 23 Jul 2021, Lucas Henneman wrote:
> 
> > This patch resolves checkpatch's warning, "It's generally not useful to
> > have the filename in the file" for baseband.h.
> 
> I would paste the exact warning you get from checkpatch.pl, warts
> (line numbers) and all on a completely separate line.
> 

Ok, I will include checkpatch.pl's original output properly.

> > Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
> > ---
> >  drivers/staging/vt6655/baseband.h | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Nice first attempt at working with Mainline Lucas.
> 

Thanks, Lee!

> The premise of the patches seem okay.  I don't personally allow
> filenames into new commits in subsystems I maintain.
> 
> Seeing as though these patches are *so* trivial, if I were Greg, I'd
> be asking you to bundle each of these changes into a single patch.
> 
> > diff --git a/drivers/staging/vt6655/baseband.h b/drivers/staging/vt6655/baseband.h
> > index 9354ce724446..0a30afaa7cc3 100644
> > --- a/drivers/staging/vt6655/baseband.h
> > +++ b/drivers/staging/vt6655/baseband.h
> > @@ -3,8 +3,6 @@
> >   * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
> >   * All rights reserved.
> >   *
> > - * File: baseband.h
> > - *
> >   * Purpose: Implement functions to access baseband
> >   *
> >   * Author: Jerry Chen
> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
