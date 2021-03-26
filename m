Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8C5F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 15:12:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso5102362wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vJD63yjhBQ/6qYwEetX6fhqse6jdADR22GvZycMU1kg=;
        b=h0hbKyyF+cz/P5CbiOOmWKzwR06PsSPq55Ngy4fgoALtC8yuEaEK9doN+YeSVlmXW7
         B5lHRN88SDNUGzyEq5lgbxDHGRdQLgTnbIj1LAt3TbE/CvkUGy+ZvReX8GRwSLk+W3cU
         gNQ8Is9QE3RKW6y5gW6MURu0sX249kNivRQfFVyyfWgBZrtOIngY/ahyw3zYH23k6Za8
         pRbAXDn7/nGJAO9/FGgLl0y7M3rF0pWi89oM5lf9hdTWX1qB0tuwK6fPXcVNooucHvlb
         ziw7h/BTS4zTad0L05dW3NDH3hnAUwCOjTKO17HS0RhIe09iUfYZdQHWLIJAuzdfKfVt
         O5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vJD63yjhBQ/6qYwEetX6fhqse6jdADR22GvZycMU1kg=;
        b=FbUQU30Z5TGKU6/95RAg7rLgB2FJ8ROmZUsFJ6Za8JL1ELvaIjn9NB6iJloUsz81qT
         dCVNPW+VHc5uj+9NKJ+WULqVr0kO2Y7a2LWZy1AfQQDbGloCD/en20LtjJ6wddex/kCK
         n2snwQwqN0+zTmUgDWQew462oxwQjFTv3NszmVjD0dvQC6u6+0GXGwS3TTLK+zlfl2K9
         q+9sqeOKCgn8UMz+Ti2mUCR7T08Xxdlvs9fQ5QHCiihfYfhhdxFesnjxn69hJC1vYKaG
         md735g9ADLg0ADmZ23jlenDmfUFCsGsc+4cu8jsdeWNF1RkTcMaaPlrvdNpJQ1pd/P3+
         TWRg==
X-Gm-Message-State: AOAM530EN72m6pD0hjYKNlDt0f1Jkjzpj3Te0GU3jOQHComEKAiiGnQm
	H1/NCX/I/RMnhefT3j6VM3I=
X-Google-Smtp-Source: ABdhPJw8EeC9Q8VHNqjHEsGlaY++EiB5170/0PwXVd9gGya6NS6wd71RY1bFBzzeTOfZGpRZEWE3sw==
X-Received: by 2002:a05:600c:3796:: with SMTP id o22mr5872060wmr.139.1616771567854;
        Fri, 26 Mar 2021 08:12:47 -0700 (PDT)
Received: from agape.jhs ([5.171.80.141])
        by smtp.gmail.com with ESMTPSA id a67sm2558576wme.33.2021.03.26.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 08:12:47 -0700 (PDT)
Date: Fri, 26 Mar 2021 16:12:45 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, david.laight@aculab.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/15] staging: rtl8723bs: put parentheses on macros with
 complex values in include/drv_types.h
Message-ID: <20210326151244.GB1952@agape.jhs>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
 <fea98d1b0260494dc5cb0dfb7fc03d6f74d9acdf.1616748885.git.fabioaiuto83@gmail.com>
 <20210326142257.GF1717@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326142257.GF1717@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 26, 2021 at 05:22:57PM +0300, Dan Carpenter wrote:
> On Fri, Mar 26, 2021 at 10:09:12AM +0100, Fabio Aiuto wrote:
> > fix the following checkpatch warning:
> > 
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 279: FILE: drivers/staging/rtl8723bs/include/drv_types.h:279:
> > +#define KEY_ARG(x) ((u8 *)(x))[0], ((u8 *)(x))[1],
> > ((u8 *)(x))[2], ((u8 *)(x))[3], ((u8 *)(x))[4], ((u8 *)(x))[5], \
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> > index 1658450b386e..ead4cb9c1e5a 100644
> > --- a/drivers/staging/rtl8723bs/include/drv_types.h
> > +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> > @@ -276,9 +276,9 @@ struct cam_entry_cache {
> >  };
> >  
> >  #define KEY_FMT "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"
> > -#define KEY_ARG(x) ((u8 *)(x))[0], ((u8 *)(x))[1], ((u8 *)(x))[2], ((u8 *)(x))[3], ((u8 *)(x))[4], ((u8 *)(x))[5], \
> > +#define KEY_ARG(x) (((u8 *)(x))[0], ((u8 *)(x))[1], ((u8 *)(x))[2], ((u8 *)(x))[3], ((u8 *)(x))[4], ((u8 *)(x))[5], \
> >  	((u8 *)(x))[6], ((u8 *)(x))[7], ((u8 *)(x))[8], ((u8 *)(x))[9], ((u8 *)(x))[10], ((u8 *)(x))[11], \
> > -	((u8 *)(x))[12], ((u8 *)(x))[13], ((u8 *)(x))[14], ((u8 *)(x))[15]
> > +	((u8 *)(x))[12], ((u8 *)(x))[13], ((u8 *)(x))[14], ((u8 *)(x))[15])
> 
> KEY_ARG() isn't used anywhere that I can see.  Just delete it.
> 
> Please take your time when you re-write this series and think about each
> change clearly and fix the underlying badness instead of just making
> checkpatch happy.  I would really just throw out the patchset and start
> over from scratch.
> 
> regards,
> dan carpenter
> 

Hi Dan,

KEY_FMT is unused as well. I'm rewriting the whole series, will send
v2.

thank you,

fabio
