Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76BF6D28
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 14:04:05 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id y32so16965423pga.11
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 07:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5XPT6W5he0UfMYjZNPGLkFire9o8RBMsN2S/bCzx5Ng=;
        b=cleochVxryEm6n+xPLdbi6rWCiJMx6jse9wDAZ2S6KURoNsWa8shkEYnqJ3kerW42j
         aEoddADtBA7Je9fqWlaPShWFbBRSsrqjiFJlKDF1d95merOtepfBt0qOsNOw/vsfS5nL
         tu+zjwAb4PDxVVsaJHws0sN7ld6LlZna6zZlwi3a/wwPIzmb22qvQIBBZKDUv5hhbZqB
         hnNDSD+Wfd0Ps9LdLRQx30WNR/orJZjOCiDSB8EI8TvwtgE69qaWXUiKCJ9R/+O3XSYH
         hbEZo9IJAzM7u9euVsmHGqSqZfPUS9MGhxZqOwNBnq8LDgTrRP3+lD6I8CqpAIOTRW0f
         3tdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5XPT6W5he0UfMYjZNPGLkFire9o8RBMsN2S/bCzx5Ng=;
        b=PZc0l858yLfxJbpVeJRQSF030K3Wv2hRm9JuFvywmCcqGtYPcZs/FpYnjl5CJvUIqq
         YhXUXjm9tcycKf4k7GrQQzLKJ0CQMw31+PJsildLhj4VL4yNhM+rXeQ40Ed9yOIUFTYK
         SZeFhBEOdtzKnxIcQcqu7i5YlLy7CXFrW/lB9IKLPs0Ow39+hQZVh7s/mjKEPuwoQfnG
         /bJcd0o/b+dOvxl26/165du7Z8Ulcdv+7mKuDqoeRtSyayUn4TqHj3b5rlqnz/JjH6xG
         dBYKQP7GEXCBIORvREtTjbgUfybUr3bn9DHKRodCLgqpmJkr1O463WC841mmw4gRIX9y
         IYZA==
X-Gm-Message-State: AOAM533VX/zdvgEOKvSuXxNsanF9L/jxyNQ7i5eSgpD7t8cN4Jckff5e
	ls1edQWRcKTkQs+OjWPHhDc=
X-Google-Smtp-Source: ABdhPJyMP6bMC6WgV254N+iBiedsV3xkfAipyYakF41kVP+RuG4kDZOc8dkzUNLtk5qCeK+hGhw2xA==
X-Received: by 2002:a62:52c7:0:b029:255:e78e:5069 with SMTP id g190-20020a6252c70000b0290255e78e5069mr3227022pfb.45.1618495444989;
        Thu, 15 Apr 2021 07:04:04 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id y187sm2330633pfb.109.2021.04.15.07.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 07:04:04 -0700 (PDT)
Date: Thu, 15 Apr 2021 19:33:56 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, kuba@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 4/5] staging: rtl8192e: rectified spelling mistake and
 replace memcmp with ether_oui_equal
Message-ID: <YHhHzF6A2Syfbxpi@kali>
References: <cover.1618380932.git.mitaliborkar810@gmail.com>
 <eda8d3401f2f7ff7a61137b4935c6ccb09112e52.1618380932.git.mitaliborkar810@gmail.com>
 <20210414075525.GR6021@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414075525.GR6021@kadam>

On Wed, Apr 14, 2021 at 10:55:25AM +0300, Dan Carpenter wrote:
> On Wed, Apr 14, 2021 at 12:26:01PM +0530, Mitali Borkar wrote:
> > Added a generic function of static inline bool in
> > include/linux/etherdevice.h to replace memcmp with
> > ether_oui_equal throughout the execution.
> > Corrected the misspelled words in this file.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  
> > Changes from v1:- Rectified spelling mistake and replaced memcmp with
> > ether_oui_equal.
> > 
> >  drivers/staging/rtl8192e/rtl819x_HTProc.c | 48 +++++++++++------------
> >  include/linux/etherdevice.h               |  5 +++
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is networking code and not staging code, but the netdev mailing
> list isn't CC'd.
>
I didn't knew mail id then, I will look into this,

> >  2 files changed, 29 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > index ec6b46166e84..ce58feb2af9a 100644
> > --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > @@ -43,7 +43,7 @@ u16 MCS_DATA_RATE[2][2][77] = {
> >  	 810, 720, 810, 900, 900, 990} }
> >  };
> >  
> > -static u8 UNKNOWN_BORADCOM[3] = {0x00, 0x14, 0xbf};
> > +static u8 UNKNOWN_BROADCOM[3] = {0x00, 0x14, 0xbf};
> 
> Please pull this spelling fix into its own patch.
> 
Okay Sir.

> [ snip ]
> 
> > diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
> > index 2e5debc0373c..6a1a63168319 100644
> > --- a/include/linux/etherdevice.h
> > +++ b/include/linux/etherdevice.h
> > @@ -87,6 +87,11 @@ static inline bool is_link_local_ether_addr(const u8 *addr)
> >  #endif
> >  }
> >  
> > +static inline bool ether_oui_equal(const u8 *addr, const u8 *oui)
> > +{
> > +return addr[0] == oui[0] && addr[1] == oui[1] && addr[2] == oui[2];
> > +}
> 
> The indenting is messed up on this.
>
OKay Sir, I am looking into this.

> regards,
> dan carpenter
> 
