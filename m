Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98F6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:25:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f12so12436779wro.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JUwBXCTGmPDS35FUGhOGZPUnfRPqWKMKWqMQh69PbYY=;
        b=ni8a/QUvQsQXYEF5YryW7qdVsKKI1+UVPsVhm34u54TJ/om9o0h7lk2I4d23Bvr/OM
         vkCQfDu6P8ylGUSODT8iWRjmcnsgH9HwHdmZ/N/fj0W46yqYK2isBvHoiAWkxjP6ARZ3
         fT+TBI2NFWv4Rq0XzN3P9mPMlMwqI4T8t7Ib8yiD9smY3OubNobX3IFqfbjY4+911ufN
         0vON3rSHDGNM2uRECvqIWHNepBKcgT7PCpWBVPDisCnnnFyZD8vNRilbeaFWyP1TsPy2
         fz2ikL8dyzWgkm+6BTtYG82U21cufYYwSbTl2c8KMwBl5qmCtmDFXbJGcgwl2v2hsWt6
         DPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JUwBXCTGmPDS35FUGhOGZPUnfRPqWKMKWqMQh69PbYY=;
        b=fIhnx7MntRfZmsgBnvRfCR/rzWJrfXsJqy5Sy/N9eicR+XTaf0hPbAYiL28kTxShvA
         UbNkWq4lcCt5ZQb8ine6XVX4SjkPsL+mlIzHdFMMBiR3hnTa06k2ZG2+cyl/FF5AVtR1
         hGnEjoLtOsSKnGTaDvOe60aswMWLZn/XVOhXcSVgFA+Y3gx8hgSt8oc0htlqgYcnm0ai
         uxFV8k8uwefJjNFljl6Qw+HVCBDZxx222b2vghlGzxYaxv7/f6h2W0VYMbfYG1Z9aGe9
         gK38GrBEupJXy7BWATk2P/FMyLMVDuOPZyyDw6h4HnDGsi6iBPTmrXqUKQBOA9ujOlAe
         kNvg==
X-Gm-Message-State: AOAM530V3L9cTMVSfGfwKocJfI0oDz+5dzhahNKWpFNfQdDcK1bR3117
	ZAT5gygVPWJohl3nyT/2eaI=
X-Google-Smtp-Source: ABdhPJx+Z99oYdhRrRh6e+qoS2DXuyI+FVmkkIsf66K53VKb8Cz/SBlZJ/GTkORUwlnqM5USPBrLbw==
X-Received: by 2002:adf:e843:: with SMTP id d3mr5123664wrn.56.1617809137992;
        Wed, 07 Apr 2021 08:25:37 -0700 (PDT)
Received: from agape.jhs ([5.171.72.217])
        by smtp.gmail.com with ESMTPSA id d20sm9118092wmd.48.2021.04.07.08.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:25:37 -0700 (PDT)
Date: Wed, 7 Apr 2021 17:25:34 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/19] drivers: rtl8723bs: rewrite comparison to null
Message-ID: <20210407152533.GA1590@agape.jhs>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
 <0c6d53c851d1b07eb0183108e0bad7b4f273f04b.1617802415.git.fabioaiuto83@gmail.com>
 <YG3MOCQHu3o/qHTg@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG3MOCQHu3o/qHTg@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 07, 2021 at 05:14:00PM +0200, Greg KH wrote:
> On Wed, Apr 07, 2021 at 03:49:31PM +0200, Fabio Aiuto wrote:
> > fix following post-commit hook checkpatch warnings:
> > 
> > CHECK: Comparison to NULL could be written "!psta"
> > 97: FILE: drivers/staging/rtl8723bs/core/rtw_ap.c:2115:
> > +		if (psta == NULL)
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Nit, your subject line has "drivers:" not "staging:" here.  Be a bit
> more careful next time please.
> 
> thanks,
> 
> greg k-h

sorry, you can drop them off the staging-testing branch and I will resend you all if you want,

fabio
