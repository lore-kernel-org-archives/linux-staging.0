Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD11C2B
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 09:54:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id bg10so12806498wmb.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 01:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gGbWpL0DNZKbYvlvS2zwuY6SU88y6BayDLXZUlHWO+I=;
        b=XAx5xBafnAL9dpqePbaKrhbnMREVc94BB5V3q71Qm8hMsTq7P3emFNVfRfMAAqCJwh
         DzcSGs9WW3Hq67TjVliWzQXmNQZIx9i/Hf6TaQPGf0oVB51AMbW/4IfHrbsGxt3zICDM
         dpA64u4IjV8Mf4I9BjAKl37V3FF6yN10ZaORyQZomlsBJuhmWMte00ijXsj1iVgv0Vcr
         s3VTDRs3eOf4hrAt1gfrSefLSGFNduwNxaASf2j5IrUK/rxsL741H/h5b2ESsP7jxNUJ
         KgDPzi1uasq8BGY0/DEuQjYOgQ/AYkcLv5PSTOOQmjuQZaaK4+j46xqKR1PmP7zjF5Br
         IMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGbWpL0DNZKbYvlvS2zwuY6SU88y6BayDLXZUlHWO+I=;
        b=Y6TY6aNcme9C+uiNv6nRgIfaAQ89U+1H+HUDIU1uiUg54f/POqDGVQz1aK+pA6CWWS
         3iotGZwh2oBYxejgrmSRfKkUPJKsLyaDbhaNZ2MlEcJvJapwKjZOXmOShNrSvGJHJei3
         l0L1SJo6FO3raTQ5V//TzbjjiDKxgWTK/khvaIas2DgeYg8Tb0s8cy6y3JGy8Z5IVPAS
         pdOgaokOcg1cIc/HYn1lWdbOLHGwhjrX0CHofeISnaOnTAgNUC8wTAFQjEG422cmGrGb
         Qid6EQQtFIZ99BwcKkRmgUVrcNafwuYNCApiq8MoKFwFbvdhiXmxwiq1hQghOAd6oALq
         1y9g==
X-Gm-Message-State: AFqh2kpgVOrq/OMh4Cbf6LorP/yu4IGo9bIqXW0vKXDIbr7I5c9Jo1B/
	P7c/P5AkMRlZ08qXlZpr+2jtI7HbVpuonwlI
X-Google-Smtp-Source: AMrXdXv1yxSN05BwXx/7xpHfFtmInzrvAXkdw+kTEUqLfln0bgcZevJfZjphRsbPvaHfnVEd7D1D8g==
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id y4-20020a1c4b04000000b003c6f0b874e6mr20245900wma.4.1672307671861;
        Thu, 29 Dec 2022 01:54:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b003d34f170487sm36078662wmo.0.2022.12.29.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:54:31 -0800 (PST)
Date: Thu, 29 Dec 2022 12:54:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: yang.yang29@zte.com.cn
Cc: gustavoars@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, xu.panda@zte.com.cn
Subject: Re: [PATCH linux-next] staging: ks7010: use strscpy() to instead of
 strncpy()
Message-ID: <Y61j1JRx0ZMeVjji@kadam>
References: <202212261903245548969@zte.com.cn>
 <Y61hpuMcp3NKbqL5@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y61hpuMcp3NKbqL5@kadam>

On Thu, Dec 29, 2022 at 12:45:10PM +0300, Dan Carpenter wrote:
> On Mon, Dec 26, 2022 at 07:03:24PM +0800, yang.yang29@zte.com.cn wrote:
> > From: Xu Panda <xu.panda@zte.com.cn>
> > 
> > The implementation of strscpy() is more robust and safer.
> > That's now the recommended way to copy NUL-terminated strings.
> > 
> > Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> > Signed-off-by: Yang Yang <yang.yang29@zte.com>
> > ---
> >  drivers/staging/ks7010/ks_wlan_net.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
> > index 044c807ca022..e03c87f0bfe7 100644
> > --- a/drivers/staging/ks7010/ks_wlan_net.c
> > +++ b/drivers/staging/ks7010/ks_wlan_net.c
> > @@ -382,8 +382,7 @@ static int ks_wlan_get_nick(struct net_device *dev,
> >  		return -EPERM;
> > 
> >  	/* for SLEEP MODE */
> > -	strncpy(extra, priv->nick, 16);
> > -	extra[16] = '\0';
> > +	strscpy(extra, priv->nick, 17);
> 
> I think this code is a buffer overflow.  This is an implementation of
> SIOCGIWNICKN.
> 
> net/wireless/wext-core.c
>    169          [IW_IOCTL_IDX(SIOCGIWNICKN)] = {
>    170                  .header_type    = IW_HEADER_TYPE_POINT,
>    171                  .token_size     = 1,
>    172                  .max_tokens     = IW_ESSID_MAX_SIZE,
>    173          },
> 

Yeah.  I was wrong.  The extra size here is .max_tokens * .token_size so
it's 32.

Sorry for the noise!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

