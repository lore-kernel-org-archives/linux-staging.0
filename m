Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C17F259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 15:21:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so6045820wma.0
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Sfd8DudOIuGyL5rc9egOme31BdENe1jWkpbRM3j4vK4=;
        b=jEDVz8cl2My814T63UzgroWd+kp0KmVUAkA7sgDtHGXGaNzmczXBRY8so0VSq3gC9I
         TmXIUH6O+6g+HjLMoEP3uevChHVfWFlg21/wVlOEf/Hx6yReHEyK8NQO9x4egfSVi0X7
         BpLJ3QDDJaDxzNYAoLPhKUbkfDwFExlsrWbmzGrKcThu2BGgCKy2HGYYJ2ehgIJRAxdv
         jxk3bgzC10GmReX/E0wkq5fpYR1D3erjJ0MwgWyABxQxKfK+Nd0i5liGJbQZQPB008H6
         5fz4ecQQ3U907EIZQx+0cDNxzKc4aKPvi5/xGR1DpU8GDkOlhN+/jqSWWweEthKZzi63
         zMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sfd8DudOIuGyL5rc9egOme31BdENe1jWkpbRM3j4vK4=;
        b=DHhJb/9jxRVrIE+u8hge89SjbjL6B9hoMF5FUUjiaJmqKg33mbrt3+bM5BDshZAFeJ
         gQwrRKCff9IaRndZv1EMEl245wFXNRwS4iurPiY7yLjVT+ZWVZQ+zRAwN4TxoBLxfmqp
         rMWZ3SnqGvxGv3WG2ptAVf1x3ewAsWup3bM9G3esYiDz9jLBZMWx8Le8cyJe+DkC+MB3
         l7f/0kZAm4Q0eGWsYMYjBZz9rmFMrnPbVmZVe2HtoEyw3Dy32rXnaWfqDNcnHOX0xnPi
         ieIs8Tm+LZyaHdb9en5BcQ7/UCqtF2gyabWOLCeX9gtMXRpCZ4/C/Tf5iE+SweHC74u0
         q28w==
X-Gm-Message-State: AOAM533w1VX8cVapPfhV/5vDcNVS8vcvgrat/wGVXgn2oTCEuKsTtuQY
	jrG1wLM/B11Q29CbwZSopuM=
X-Google-Smtp-Source: ABdhPJwAEt0LVv6M0lFMPoOMwzxS7AjYpuF6d6KzLlofSUyjl/EAkv4Q1L4Kd3MPDM90iid9t3LZiA==
X-Received: by 2002:a1c:a958:: with SMTP id s85mr18137514wme.4.1617463307078;
        Sat, 03 Apr 2021 08:21:47 -0700 (PDT)
Received: from agape.jhs ([5.171.80.6])
        by smtp.gmail.com with ESMTPSA id v18sm20291660wru.85.2021.04.03.08.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 08:21:46 -0700 (PDT)
Date: Sat, 3 Apr 2021 17:21:44 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Joe Perches <joe@perches.com>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/30] staging: rtl8723bs: remove RT_TRACE logs in
 core/*
Message-ID: <20210403152143.GA1403@agape.jhs>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
 <1cd79d781cdcccf621ce8e104a9cdf1e90e7f803.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cd79d781cdcccf621ce8e104a9cdf1e90e7f803.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Apr 03, 2021 at 08:02:25AM -0700, Joe Perches wrote:
> On Sat, 2021-04-03 at 11:13 +0200, Fabio Aiuto wrote:
> > This patchset removes all RT_TRACE usages in core/ files.
> 
> and hal and include and os_dep

Hi, 

I was just about to send the second patchset relative to hal/ files.
The whole has been split up in directories in order to reduce the
number of patch per patchset

> 
> > 
> > This is the first of a series aimed at removing RT_TRACE macro.
> > 
> > The whole private tracing system is not tied to a configuration
> > symbol and the default behaviour is _trace nothing_. It's verbose
> > and relies on a private log level tracing doomed to be
> > removed.
> 
> It's nice, but individual patches per file done by hand are difficult
> to review because you are interleaving removal patches with cleanup
> patches.
> 
> I believe this should be a patch series with a single patch to remove
> all RT_TRACE macro uses using coccinelle and then use separate patches
> to do whatever cleanups around these removals you want to do.

It's a good idea, but the patches relative to RT_TRACE removal
could be huge

> 
> All of these below should be done for all files in drivers/staging/rtl8723bs
> at once instead of submitting per-file patches.
> 
> IMO something like:
> 
> Cover-letter: Explain why you are doing this
> Patch 1 of N: Remove all RT_TRACE macro uses using a coccinelle script
>               and include the coccinelle script in the commit message
> Patch 2 of N: Remove commented out RT_TRACE uses
> Patch 3 of N: Remove RT_TRACE macro definition
> Patch 4 of N: Cleanup coccinelle generated {} uses, if/else braces and
>               the now unnecessary if tests around the RT_TRACE removals
> Patch 5 of N: Cleanup whitespace
> Patcn x of N: Whatever else related to these RT_TRACE sites...
> 
> https://lore.kernel.org/lkml/c845d8ea7d0d8e7a613471edb53d780d660142a9.camel@perches.com/
> 
> Using a sequence like the above would be much easier to review and
> would be a significant shorter patch set.
> 

moreover every non RT_TRACE deletion patch (clean up patch) is near 
to the contextual deletion patch (parent patch or grand-parent)

but I do not have experience in code reviewing, so I will do like you
say. Maybe I wait for other opinions, but what you say is good and
elegant.

thank you,

fabio
