Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBCA3D6D
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 23:44:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id q3so7133309plg.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 16:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xb/o1YoXSro4rOpc/9fDNjy0WQI2db6K4zofA5onjWE=;
        b=fbBS9qslB4mC4FEqVvu+uErZXwLjKCng4BXLZFBxGTgyHo+5Ou/a86ZV88oAlcJHxF
         CGakfLnXzRRf+QVcu0f/HUje5/q4SFlRtm2gMQj9xAJaHiYl4JowiwyTHu+TAfnd1MRH
         yFq4vCLGWren79EmvXzHAt+n+vzo6N3jK4oeHxucBQ3x5Lj/F3qs8RIDFQIkQom1mGUq
         dSbxu6S/rNdBNe9ZqRlWRAteTTlGbGnWxtgzmehIixwRuOrineCykxEF9ohdLi2C5M60
         2hBbQPvnSFFv9XLx2LAp89CTxDVu54ZmDCUj2vGpJi28+nlNCLO13SOdGRhjS6k4PvtO
         34HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xb/o1YoXSro4rOpc/9fDNjy0WQI2db6K4zofA5onjWE=;
        b=21Kb/F+xf9PfbACqBaO+ulx///C17rw1tVecFfSx2FDaX+egYmBd1ssr8IkcmAwJuf
         FVX7fMBH89tmwLOqpfQY8pnBaDpdmBDaNEYCRSfStR3hwyOY5dA2Va6e05+8BGXAZjYS
         Ry5w1k3/SiSRDSTImnEjAyZNCT2x2iRGDGQy7+IixFju+DaKiThHxgd8TMyMixciG/kC
         ImapbJBOVslsK/gxbutiyHxTuScj/fbnhqtl1FZrizqh7Lyjk5Zl20npsSBQKLn2xs0w
         ZextFv2CqokuCMea8lv6zEywS5GkmJjSQqGKufsfEuOBO2fVfl1UeK6e9eNejwfek+Mq
         H25A==
X-Gm-Message-State: AOAM5334NHhw3lJtyyo6ImuAeyRT7tcvzTbJMu9Mvt5TtIn9DtnYm4jo
	duEVmszGCgCQUWbl+arCV6G73H49vbg=
X-Google-Smtp-Source: ABdhPJxkwDxhATvNMv4TbI7vaKOXz9suZHw82pJjsBVJzLyfCEoi+E2Wd576UIhZCC6VrS7cmeGYYg==
X-Received: by 2002:a17:902:c613:b0:159:9f9:85ec with SMTP id r19-20020a170902c61300b0015909f985ecmr1856237plr.67.1650584686188;
        Thu, 21 Apr 2022 16:44:46 -0700 (PDT)
Received: from ArchDesktop ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id y190-20020a62cec7000000b0050adbfee09asm212056pfg.187.2022.04.21.16.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 16:44:45 -0700 (PDT)
Date: Fri, 22 Apr 2022 07:44:42 +0800
From: Solomon Tan <wjsota@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk
Subject: Re: [PATCH] staging: r8188eu: use in-kernel ieee channel
Message-ID: <YmHsannu/vcKX9Kk@ArchDesktop>
References: <20220421015811.2745-1-wjsota@gmail.com>
 <20220421170010.GD2462@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421170010.GD2462@kadam>

On Thu, Apr 21, 2022 at 08:00:10PM +0300, Dan Carpenter wrote:
> On Thu, Apr 21, 2022 at 09:58:12AM +0800, Solomon Tan wrote:
> > The rtw_ieee80211_channel structure just duplicates the in-kernel
> > ieee80211_channel structure
> 
> When you say that they are duplicates, I expected them to be the same
> but they're not at all.  ieee80211_channel has a bunch more struct
> members.
> 
> I don't really have a problem with the change necessarily but the commit
> message should not have mislead me.

Sorry about that. I will amend the commit message and send it as v2.
Thank you for the review.

> 
> regards,
> dan carpenter
> 

Cheers,
Solomon
