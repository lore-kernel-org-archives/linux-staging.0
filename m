Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2744A259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:42:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so5855021wma.0
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=manp5WyYRzbgV7XgwB1/gokIu0V9Lu5KMjavj/C4ckc=;
        b=hJWUrzJhx6M+X7GDYaopIwPDuDKw0dmRqDXfY2338Repp9jCvo96MoaxsCkVoiwOK7
         3sMCpFxjNSHvRCfXZ2roJnUymm3q2KflGxgswnDs5wHMSbNlFEO9AxFmiLc76olzLVb6
         dDCDEQ8ejlbTO57JHH4UNKogGDJqZDBWAnAuUXjUNUJhv1SbvSjuAIYc6PpPJqAMbsUm
         E5m6o3QYBgCFTf0G4PoauRqss7044jx1sUp0VqWQzD0EgU5uenckgTdEG2xsNMoglKfw
         GsiY1fD++IFoDmJc6AC+VaYFvitounvhAVSaD1h19qqDIn7hOzSb4i+rwpo7oziqG0jg
         wSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=manp5WyYRzbgV7XgwB1/gokIu0V9Lu5KMjavj/C4ckc=;
        b=t3RFm86NTt7dk3n00DTonU4ybe02N+EtuyI0zImmBDYSDw/CFigsd/FRVPi3jmFwbu
         DjfC31xI+L+0Th4wI3rsCQhDfBFR6ecrrcS41m8RqB0hXBn3e52NQWmHuMxt2nRsVVnR
         PECTbyxVwGP7LyNXaiIXKMM0MA7u5ehcLBuwv0RewUZbnS9+3q5ba0XoxcEaREkdP/sj
         pKR2anpDrufWiBhp8fzCZ53FmFDFF1ew7deE+BoLEgU9tQKZHul/sokXbOlbwIYNKfjr
         XhWbLup4LFokYsVF2UvOJ9893TPje8FiS2lyIsAD4yubEDmMi942ZNovQExFHhlR/g9g
         2LRA==
X-Gm-Message-State: AOAM530hy/EhO9ABEu9b8K3hip76hudz4srMliPKA4XQlFR9FMpMxDW4
	4C5aPR7uNWOJNDdT5TNReQaQteVdr7g=
X-Google-Smtp-Source: ABdhPJynMj+T3YGzHJlD68A+g2yJx6TTX69kgc56uCkOrvrPBj/ui/93zw2CGdvgD3+FSrUhLnBFsA==
X-Received: by 2002:a05:600c:259:: with SMTP id 25mr16959940wmj.5.1617442970643;
        Sat, 03 Apr 2021 02:42:50 -0700 (PDT)
Received: from agape.jhs ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id m3sm18083541wme.40.2021.04.03.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:42:50 -0700 (PDT)
Date: Sat, 3 Apr 2021 11:42:47 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: dan.carpenter@oracle.com
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/30] staging: rtl8723bs: tidy up some error handling
 in core/rtw_mlme.c
Message-ID: <20210403094247.GC1563@agape.jhs>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
 <d8ad88bef77430107f8593091770b6a514b6f0e2.1617440834.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8ad88bef77430107f8593091770b6a514b6f0e2.1617440834.git.fabioaiuto83@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Apr 03, 2021 at 11:13:38AM +0200, Fabio Aiuto wrote:
> the RT_TRACE() output is not useful so we want to delete it. In this case
> there is no cleanup for rtw_cleanbss_cmd() required or even possible. I've
> deleted the RT_TRACE() output and added a goto unlock to show
> that we can't continue if rtw_createbss_cmd() fails.
> 
> Suggested-by: David Carpenter <dan.carpenter@oracle.org>
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Hi Dan,

I put a Suggested-by tag on one patch in v3 patchset. But reading the docs
on submitting patches I relaized later that maybe it requires your permission before.

It' written about Reviewed-by but not about Suggested-by, should I have asked you before, should I?

I'm sorry if I should have.

thank you,

fabio
