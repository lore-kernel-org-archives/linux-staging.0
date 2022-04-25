Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379FE7E
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 05:29:56 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g3so11860752pgg.3
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MStvkw3lE5OmicwykYX3b0gfRyKHWjoxMvSCjFua0k8=;
        b=D5ht9Jzb4ph+C/KWWoHMm+RLBkNhBp9fXFJZziktPQi1C+eGBHe5qttyGHY8jjswmE
         saMdrZ2Ns9j9+2Y2RzUy7UJjN1eRJjKOkWOxtDpUSyLJsq+bAhKMbenPuXMQt52IDAZF
         7BsXGf3S1+rFaUenYd90nmJ8gy5yz6ImScdPzwGQT7LetPM4mNkVCKEJyZc0qXbyQKYw
         HxWZHV3DO4JiJ2eqFKiruUpU+QPWF8PSnWmjCzmd3ypfQOKFlGaKRhq3yjtLVYGAJeed
         ZEiA3r1IF+NHydPxefjzFC2QyMkguhYHekEqpB2MzQxqi86U32DyVSlLb+PQJQPU7Iew
         WGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MStvkw3lE5OmicwykYX3b0gfRyKHWjoxMvSCjFua0k8=;
        b=0IC5Lql3/JrDMDqRhZMm762YZGpR7ext6E3FlG6HzVG37LMn9BePZGL39QxfdBDCA9
         w5DaDp2AHYb2muBys3EvaXJ3ORElmKfw77cLwpEie8/9looFq5gxx1itl5SN1WvX6SFq
         u/u11M58s1hFwu4bPpWsZNFtYvpu7awjpRAaE0182FIEj7Jcmv+PUcxWp1Uli/V04Dzi
         pcegPfEFKzHeEMV8Q/OCkd3bV0aIGbUSeLYoTg68ZYW4gaaM3PkWpwG9mWZdJVajUdu/
         b2F+jXTo1cC2AW8n3pZD/0Ap2MlE1ULH4PqYDJE92efOkT442qM0nLYZJVgW8i5k9rG9
         RAcA==
X-Gm-Message-State: AOAM531TVg5Q21axF39OvnHDIs1pGjty34xTiTuBo+/qcGKNZK+ALZVO
	0rWeq6Bj6dReU4kgVaxLDahgCrgwwBUD5Q==
X-Google-Smtp-Source: ABdhPJxSP92BxEQyCLVjf8jOxz7FwQkPDQ0oW3hV+wR6G+0mcIo9vPJLT+JwF6O6slzvOwpgY5/WtQ==
X-Received: by 2002:a63:2b8a:0:b0:3aa:f59e:a4a7 with SMTP id r132-20020a632b8a000000b003aaf59ea4a7mr8320955pgr.91.1650864595611;
        Sun, 24 Apr 2022 22:29:55 -0700 (PDT)
Received: from ArchDesktop ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id 5-20020a631045000000b0039d942d18f0sm8282718pgq.48.2022.04.24.22.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 22:29:55 -0700 (PDT)
Date: Mon, 25 Apr 2022 13:29:52 +0800
From: Solomon Tan <wjsota@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH v2] Revert "staging: r8188eu: use in-kernel ieee channel"
Message-ID: <YmYx0OrJGLR82211@ArchDesktop>
References: <20220425011612.113664-1-wjsota@gmail.com>
 <YmYnbKeqce5TZuM1@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmYnbKeqce5TZuM1@kroah.com>

On Mon, Apr 25, 2022 at 06:45:32AM +0200, Greg KH wrote:
> On Mon, Apr 25, 2022 at 09:16:13AM +0800, Solomon Tan wrote:
> > This reverts commit 0afaa121813ed602bd203759c339cb639493f8c2 as changing
> > rtw_ieee80211_channel to ieee80211_channel causes a memcpy bug as reported
> > in
> > https://lore.kernel.org/linux-staging/67e2d10b-7f0f-9c5a-ce31-376b83ffba9e@gmail.com/
> > due to their size differences.
> > 
> > Signed-off-by: Solomon Tan <wjsota@gmail.com>
> 
> No "Reported-by:" tag?
> 
My apologies. Included in v3
