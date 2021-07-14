Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C38168
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 19:05:01 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d12so4475833wre.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yZxgDbkz/wK/8pAt9zmxGsfsC4FQ0CTK14inhloUOtg=;
        b=VjAbEYiuI4OYqkqtTeTjCMnbSYYv7dMyhPllFLPr/eotqYiekLbYQca1Xan34vq17T
         AUz/x3xk8Gjoy4oo9AY8SOawu3TMoXXwQ+PMybQ/++nrwZ/8kGxO23t8vOPKrtfuGzHp
         7wvq7PP569kYUWJvCwe0nIZ/r4AHeAjK7pmQfTtzYKHU3enD0/mFdzoQvrKQp72uybWI
         j65j/FEScl633ra64t0Vu3oBqLXb8YLEyfujK8HgLiiXGBTPkPgOg+TuH/7s34INxmAC
         0brmF7pLTHSaC/XNQrC6puUtt+BfhPgf65Lk9sFxvPSjgdTZ90Zm2oLqngp9Xq3/wNOJ
         JPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yZxgDbkz/wK/8pAt9zmxGsfsC4FQ0CTK14inhloUOtg=;
        b=snD4yp3ke2f66JGiic8m8HLPlX6pqQ+A+WtXX40ebv2GHfBK+LjErCDL+i7xTfoMvq
         GvGcO4dxr/0Miv7GjA9VM4GbK7EX+cAJlRKm29GvzXejsAgM1qQ5xdyfqGtozwP3PG/o
         1TMc8RceXtNBV1SY+9xMWkkRgUDyuIz/osbO3T2cadCWKg/2PMYRZox23UARG38kLyR6
         ZngO6h2ARWldnCrvL8Yir6E7+s8Vno75cC84m6AzxEYU/wM/fD4KF2AWLNuehgfQ+bXX
         KhAVp/A9xkpMfjbmFQPefAJAhzlQjHzd0/VqQboU3r7KsZItmubIpNeFhxJSRiULr9ex
         5K2A==
X-Gm-Message-State: AOAM531JVFk2CEF25V3OJp5XeR6QedjCesazJYRo2kn6x3FMP8J3EPlG
	opk/p2qGInLDYWXO8+kqiDw=
X-Google-Smtp-Source: ABdhPJzLVD38+GgK9W+4LhvLLeVJU+GLxXbtOsjDwu00SylAXFgbPiLjxEEst1ye1L8In6S4l8u64w==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr14994057wrw.194.1626289500277;
        Wed, 14 Jul 2021 12:05:00 -0700 (PDT)
Received: from agape.jhs ([5.171.72.231])
        by smtp.gmail.com with ESMTPSA id p11sm3569952wrw.53.2021.07.14.12.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:05:00 -0700 (PDT)
Date: Wed, 14 Jul 2021 21:04:57 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8723bs: fix camel case issue
Message-ID: <20210714190456.GA1402@agape.jhs>
References: <cover.1626275102.git.fabioaiuto83@gmail.com>
 <a708b2b9902bedf5bd0466b05516a4c5b4f43723.1626275102.git.fabioaiuto83@gmail.com>
 <20210714152605.GK1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714152605.GK1931@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Dan,

On Wed, Jul 14, 2021 at 06:26:05PM +0300, Dan Carpenter wrote:
> On Wed, Jul 14, 2021 at 05:11:14PM +0200, Fabio Aiuto wrote:
> > fix following post commit hook checkpatch issue:
> > 
> > CHECK: Avoid CamelCase: <NetType>
> > 45: FILE: drivers/staging/rtl8723bs/include/ieee80211.h:170:
> > +#define is_supported_ht(NetType) (((NetType)
> > 	& (WIRELESS_11_24N)) ? true : false)
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/include/ieee80211.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
> > index 8eb0557a077a..b2c1a7dafcee 100644
> > --- a/drivers/staging/rtl8723bs/include/ieee80211.h
> > +++ b/drivers/staging/rtl8723bs/include/ieee80211.h
> > @@ -167,7 +167,7 @@ enum network_type {
> >  
> >  #define IsSupportedTxCCK(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
> >  #define IsSupportedTxOFDM(NetType) (((NetType) & (WIRELESS_11G) ? true : false)
> 
> These are the same.
> 
> > -#define is_supported_ht(NetType) (((NetType) & (WIRELESS_11_24N)) ? true : false)
> > +#define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
> >  

NetType -> net_type, or did you mean something else?

> 
> regards,
> dan carpenter

thank you,

fabio
