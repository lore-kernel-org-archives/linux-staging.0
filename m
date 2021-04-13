Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471F471
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 09:25:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e7so6732453wrs.11
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OZorieMompIxVxiOSBvMLNyGFhhT3O9ebYrLxoCzZzw=;
        b=GqrGoa3RNiKS6efPceckOlU44wflpHz5xdRT6AdSCOOketGZcQ2saS6DOFpnEqzYCr
         BTQ4DVDv8vScsUH0P1Fx5kPhwFOVCmeJJTaSgo5mMt+PkGM6BFsfwLkqzBlGiTcYLQtl
         n3vJu/sInehd0DQ7fjJuLXvcBLmkKg4e7GoHMXdcWbFEqoxS/2O76KnnqU0mdgLlQ+7e
         21WEcVplPuptUsIc6ndGPGD/5HFcSwzXYW4WHFgbxQ6prmorm2rJQl6rLEALcgNo0Ji4
         InC7ZqLJnY/pwZvEHCHGW2CWw9oJ/7CzY82PfhgVsU+W5akwVNsFCLE9HF9kHFdQpmeJ
         ZvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OZorieMompIxVxiOSBvMLNyGFhhT3O9ebYrLxoCzZzw=;
        b=AqeH1rDqQvp8bhzGj0U0VQpQPbV8TZArhMRjDqxKNuR5PMucPrUmanBnb6ShWg21lR
         PPyae7Sp7SMtv1R6KbN3p/lQvasSNQ+3u0LI2+SgxDvVBT89ZJoRAwcDQe2BDwIpJgiT
         sRKQyT8W+m6BcEN4B7piRypM2m1n9bb0pESHcw7LkdzTdedezl1qka4H9x1tbNyAZlsV
         +lBczlNuE6JHq+SgBU8ksZWjFnLDt5pge6Qvz5qO3ESA5i8qKyzhPfyXpT78yRASXlyu
         jqiR7S+3z8NlE+4G40d4TjQepkiGyChnkiNNJvRt0ipwFjSP4raPcaHfeK/tQ5Iv/cDI
         //mA==
X-Gm-Message-State: AOAM533/1v5WMjfccM3woTyqrbxVs+XtvN6N44D6GwYH8hfPwBYmr2y5
	NpuRdClHr6CJvNoJfwirilc=
X-Google-Smtp-Source: ABdhPJwukRLtu9M/6ocyZVdNi1uA2QaIjYM0UHLePhfg61Mk0ONZezguAbdxRev4hWRj6zQ2xOh0sQ==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr536230wrr.390.1618305898904;
        Tue, 13 Apr 2021 02:24:58 -0700 (PDT)
Received: from agape.jhs ([5.171.81.136])
        by smtp.gmail.com with ESMTPSA id h13sm1786917wmq.29.2021.04.13.02.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:24:58 -0700 (PDT)
Date: Tue, 13 Apr 2021 11:24:56 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joe@perches.com, julia.lawall@inria.fr, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: cocci script hints request
Message-ID: <20210413092455.GB5477@agape.jhs>
References: <20210413090400.GA5477@agape.jhs>
 <YHVgSuRCW1fdabrH@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHVgSuRCW1fdabrH@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 13, 2021 at 11:11:38AM +0200, Greg KH wrote:
> On Tue, Apr 13, 2021 at 11:04:01AM +0200, Fabio Aiuto wrote:
> > Hi,
> > 
> > I would like to improve the following coccinelle script:
> > 
> > @@
> > expression a, fmt;
> > expression list var_args;
> > @@
> > 
> > -       DBG_871X_LEVEL(a, fmt, var_args);
> > +       printk(fmt, var_args);
> > 
> > I would  replace the DBG_871X_LEVEL macro with printk,
> 
> No you really do not, you want to change that to a dev_*() call instead
> depending on the "level" of the message.
> 
> No "raw" printk() calls please, I will just reject them :)
> 
> thanks,
> 
> greg k-h

but there are very few occurences of DBG_871X_LEVEL in module init functions:

static int __init rtw_drv_entry(void)
{
        int ret;

        DBG_871X_LEVEL(_drv_always_, "module init start\n");
        dump_drv_version(RTW_DBGDUMP);
#ifdef BTCOEXVERSION
        DBG_871X_LEVEL(_drv_always_, "rtl8723bs BT-Coex version = %s\n", BTCOEXVERSION);
#endif /*  BTCOEXVERSION */

        sdio_drvpriv.drv_registered = true;

        ret = sdio_register_driver(&sdio_drvpriv.r871xs_drv);
        if (ret != 0) {
                sdio_drvpriv.drv_registered = false;
                rtw_ndev_notifier_unregister();
        }

        DBG_871X_LEVEL(_drv_always_, "module init ret =%d\n", ret);
        return ret;
}

where I don't have a device available... shall I pass NULL to
first argument?

Another question: may I use netdev_dbg in case of rtl8723bs?

thank you,

fabio
