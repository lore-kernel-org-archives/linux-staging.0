Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB57B;
	Fri,  1 Apr 2022 22:46:22 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id hu11so3129929qvb.7;
        Fri, 01 Apr 2022 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3SlGevsQL2lAXYmUm86OvjV9WvM+ut7+9oaiLvI2qng=;
        b=fOLVerVUR8dkocBQsva7JQDvU8BzRpyj/lrEqDFTfn35ZpqBFyLXPyF/ElhffQ5UTv
         a3H+7rEmP5QqfaEzC0uV0rYPlOZZfPudTJ/UTbRy7rzRTiG1DXIJDOWMl20ns8XkHwAu
         cfpbkjLw/ygCc5xKKqgYWtA+BibvM8GOf1qaMlI8vkeJsFWBwtvIvXm+c9hgCAkdhvDv
         7vJwe6T0X4pmauPJP1UQx+ybu8EsLoERw/H1NiJdczfl2aCSyijVRT/9ayGEFtg5aJaI
         07EZgznDGfkZ2n1X9t+6cMY4P9lS4ohVuYXV898Qtx9FrH9YwIIsP+fMlKqkWW9wcVOt
         AbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3SlGevsQL2lAXYmUm86OvjV9WvM+ut7+9oaiLvI2qng=;
        b=vOr3PpyJWkEAj7vYo+Bvloa9vypptL9kcbJFV2yGWlHPWzg1eAvCIuDSMTqTJOdFuJ
         Rl35CPtgjjnF5+jjI7Pg5YOSqz35XaGIUBp2JdDul6TL0gSHxCWGyug3DD/36IcSOl12
         HhVBmX7TAcWB29f6BPQZm8b/eVy6Nmg0/ZemKS30hKYReB44RuSzWit4x/K6BL9g11fZ
         7vBgAQvt/GL/BYClSXOiCR5MNwtgIEK8oZbVyRMoI9SemZIGWgQax4m1vzg99tQTZUJ6
         OmrFTzzSZtAADMi9Lrq4M7K1+T+3/FCNl7jN5Sh+zGPvMTYFQrW2v4hDdWZKqjfUmc0r
         ZjcQ==
X-Gm-Message-State: AOAM531qqKy1ppqYavVNGuHWt3OPBnz3xO+tnkOJK9ZJbl6Lwfof6zSc
	kWGK9tZ5WxQ2HpjJvVOU/qE=
X-Google-Smtp-Source: ABdhPJzzlbdrkppwgElbTfX/WDZEz5bJKqpG1sU7SQNG0a3ngv+x6jZvNFvAU2ivitMACviJpdq44A==
X-Received: by 2002:ad4:5dca:0:b0:441:55db:2835 with SMTP id m10-20020ad45dca000000b0044155db2835mr41929429qvh.31.1648853181855;
        Fri, 01 Apr 2022 15:46:21 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id j18-20020ac85c52000000b002e1b9897ae7sm2754617qtj.10.2022.04.01.15.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 15:46:21 -0700 (PDT)
Date: Fri, 1 Apr 2022 18:46:19 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: simplify control flow
Message-ID: <20220401224619.GA71483@euclid>
References: <20220401114635.GA567659@euclid>
 <YkdvzIyz/WGlm2uy@iweiny-desk3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkdvzIyz/WGlm2uy@iweiny-desk3>

On Fri, Apr 01, 2022 at 02:34:04PM -0700, Ira Weiny wrote:
> On Fri, Apr 01, 2022 at 07:46:35AM -0400, Sevinj Aghayeva wrote:
> > The function iterates an index from 0 to NUM_PMKID_CACHE and returns
> > the first index for which the condition is true. If no such index is
> > found, the function returns -1. Current code has a complex control
> > flow that obfuscates this simple task. Replace it with a loop.
> > 
> > Also, given the shortened function body, replace the long variable
> > name psecuritypriv with a short variable name p.
> > 
> > Reported by checkpatch:
> > 
> > WARNING: else is not generally useful after a break or return
> > 
> > Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> 
> Wow!  Nice find!  This is a huge clean up.  Extra kudos recognizing that it is
> not just the else statement which is broken here!

Thanks! It took me a while to realize what this loop is doing.

> The only issue for the patch is that I don't see any maintainer emailed?
> However, I don't see a maintainer listed in the MAINTAINERS file so ...
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Thanks for the review!

Greg, please do not apply this yet. After I sent out the patch, I
noticed the comment at the top of the function:

/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */

So I did a git grep to find the original function and fix it as well,
and it looks like there are three copies of the same function in
different files:

$ git grep IsInPreAuthKeyList
r8188eu/core/rtw_mlme.c:/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */
rtl8712/rtl871x_mlme.c: * Ported from 8185: IsInPreAuthKeyList().
rtl8723bs/core/rtw_mlme.c:/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */

I will later send a v2 patch that replaces all of them.

Thanks

> > ---
> >  drivers/staging/rtl8723bs/core/rtw_mlme.c | 28 ++++++-----------------
> >  1 file changed, 7 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > index d5bb3a5bd2fb..3eacf8f9d236 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > @@ -2036,28 +2036,14 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
> >  
> >  static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
> >  {
> > -	struct security_priv *psecuritypriv = &Adapter->securitypriv;
> > -	int i = 0;
> > -
> > -	do {
> > -		if ((psecuritypriv->PMKIDList[i].bUsed) &&
> > -				(!memcmp(psecuritypriv->PMKIDList[i].Bssid, bssid, ETH_ALEN))) {
> > -			break;
> > -		} else {
> > -			i++;
> > -			/* continue; */
> > -		}
> > -
> > -	} while (i < NUM_PMKID_CACHE);
> > -
> > -	if (i == NUM_PMKID_CACHE) {
> > -		i = -1;/*  Could not find. */
> > -	} else {
> > -		/*  There is one Pre-Authentication Key for the specific BSSID. */
> > -	}
> > -
> > -	return i;
> > +	struct security_priv *p = &Adapter->securitypriv;
> > +	int i;
> >  
> > +	for (i = 0; i < NUM_PMKID_CACHE; i++)
> > +		if ((p->PMKIDList[i].bUsed) &&
> > +				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
> > +			return i;
> > +	return -1;
> >  }
> >  
> >  /*  */
> > -- 
> > 2.25.1
> > 
