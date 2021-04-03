Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE596259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:50:34 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k8so6598232wrc.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BsuX244Qwo5U14rjmt302Jci2DoZxQVAfqhH3h6HqLE=;
        b=E/Y+lZfdQok49SrEQ0ilEV83pkM0lBsRaVK4hSZWm2uuJja8OO+6SEKBfvCinRi173
         GOSdXrvumuOIM374gfHoI/7UX2JKxSozXhueTsMElNqu7LqCZeNPy0X5BDbDjEbeYzF9
         FJFr4bP2eOJjz+pp27ZHwNkkANcYAv9kFuSFXhAk4WssKRB8wrlr9BCRxdVYNL2jtDaz
         Wh/T62sv7aEexAX1qjLCQtSeo3fzeceBAQ/6qpOGoxCnkArTEz8tzz7qnn1GuJj06CyF
         vBoZrkVXXvnW48j3/hYxgD7oxwXqTWXVKshJwuHQu6T9NpZERBuEKBxzlSWAxW5PI28Z
         Y4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BsuX244Qwo5U14rjmt302Jci2DoZxQVAfqhH3h6HqLE=;
        b=gfCN80PoMAtCr4lJkq/oeq/SHT04m8mH1768M1Gc6KyD/Aa4GGvBILBOFC4+y+R5C9
         sGP4lTHaZDNe0aAxw/lb+7S/JZUkGC4upVvTGusuZCL0nqMFP68kKGaTw+WPoXQJxLN2
         l9ETl94HNr8q/Fz2El0HDAKr2kZhf2P9eMQA+O/J06/aZORHUN1odSXaMpplKU52ok0y
         vmSywO5liPr+6RJK9iM6xccZ+BXdxr4OjATgvod37houTe3DKZ+hRgu1x8pSZAI4szWJ
         ERNjbNOhVsn3LtVajIM06O8LaZYDEOPIbXQ91MhLhhzmR6MJKAiN9cYz6QxplL0shzrW
         DFFA==
X-Gm-Message-State: AOAM5328L4K+rLhUemY/tapl0bIDK5r3lyoIwso4WEZsrsFM07vDskqv
	2BOkwrx7ajsXQSJEfWvSLXbgbJYfykQ=
X-Google-Smtp-Source: ABdhPJyftwBaOHZfgx34qVXAjk+Abj+CNEOgp1rC+jypa7eQC/o6R3jpjsduR/osuXKXZ6TtpMB8DA==
X-Received: by 2002:adf:a1d8:: with SMTP id v24mr18987172wrv.378.1617443433390;
        Sat, 03 Apr 2021 02:50:33 -0700 (PDT)
Received: from agape.jhs ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id g16sm19513787wrs.76.2021.04.03.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:50:33 -0700 (PDT)
Date: Sat, 3 Apr 2021 11:50:30 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: dan.carpenter@oracle.com
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/30] staging: rtl8723bs: tidy up some error handling
 in core/rtw_mlme.c
Message-ID: <20210403095029.GD1563@agape.jhs>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
 <d8ad88bef77430107f8593091770b6a514b6f0e2.1617440834.git.fabioaiuto83@gmail.com>
 <20210403094247.GC1563@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210403094247.GC1563@agape.jhs>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Apr 03, 2021 at 11:42:47AM +0200, Fabio Aiuto wrote:
> On Sat, Apr 03, 2021 at 11:13:38AM +0200, Fabio Aiuto wrote:
> > the RT_TRACE() output is not useful so we want to delete it. In this case
> > there is no cleanup for rtw_cleanbss_cmd() required or even possible. I've
> > deleted the RT_TRACE() output and added a goto unlock to show
> > that we can't continue if rtw_createbss_cmd() fails.
> > 
> > Suggested-by: David Carpenter <dan.carpenter@oracle.org>
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_mlme.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> Hi Dan,
> 
> I put a Suggested-by tag on one patch in v3 patchset. But reading the docs
> on submitting patches I relaized later that maybe it requires your permission before.
> 
> It' written about Reviewed-by but not about Suggested-by, should I have asked you before, should I?
> 
> I'm sorry if I should have.

Found it, I'm really sorry

A Suggested-by: tag indicates that the patch idea is suggested by the person
named and ensures credit to the person for the idea. Please note that this
tag should not be added without the reporter's permission, especially if the
idea was not posted in a public forum. That said, if we diligently credit our
idea reporters, they will, hopefully, be inspired to help us again in the
future.

I wonder if in the case of this patch was needed this tag..

> 
> thank you,
> 
> fabio

regards,

fabio
