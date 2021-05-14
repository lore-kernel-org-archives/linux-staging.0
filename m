Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9172
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 14:24:03 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id t193so11676199pgb.4
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sjqOcTYhx7FLkQmHt5WpgoQOTVEbNARnsInkpqxUIFw=;
        b=hA/MVEdbUU+zFmvDEr5zcjB8z7tOFUNCYzvBiqsVL0nh7NxoYJ/wp12KuGN0eZlNDb
         uMsvelfIWSHF+kpXnDBImyPvpiRGW0PqQLu4PR7P/epoG5JaXCkROCyZ6UAG+/TULes7
         WzuYq++5cLktampH8blX+EqVD8OowfwxtHY3xKWWwyCyHcwhH1qDp2gvYCMZ9SGaNsOZ
         WUcQhXxB2doyp7XJqfZPOxD4ydXHKfcC+Q2e3rdcc6AaYYx94eLmnD4tXBlhtECr/hCM
         H5G7P8TzpI2VW0OgeIaWBYsOc7GjCqWF43QTCxpKbhXtI7PELsDqSjEdg5K8+lU+zvfP
         Qkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sjqOcTYhx7FLkQmHt5WpgoQOTVEbNARnsInkpqxUIFw=;
        b=bVsAToAERm+vgDGkTtOOUqyVHPasLr7Me18R+s89sDVEVxx8E6XAw5TzJ3fGhbMHep
         z2RL4x9/1QdWbLhf9vrltBVZ3dhnVzwz07I0LVoZMW6zzgOjWbPPwANVWgrjsug8P7eR
         dKA5OiOC1+We1Vf2n7kLmVWhcISuOFEbg+T/eTUWueGD3EQk9kq1YbM+Sj7G5jcVeRjd
         ao0dCaMDJff4gfi/t+5nue597X/FFqphQxRGK7+JLA164KlaBnr2VQXw42+TLnQ6MEJL
         H1STcfWONPq2frzOjTiixqRDrJHDCi3q0/BqG9AXbXN52PGS1OayTxmZhGOSKNkY6G2f
         6PXg==
X-Gm-Message-State: AOAM532TpSmWpVlZyiqz9mxmJdisEWCwKNLk4c+waFkJ3b4yjKoXNxJ9
	/CeOwROThXn7qg7NWBaLbzM=
X-Google-Smtp-Source: ABdhPJwZxndpiXExilm+A8RkJakXbSgnMJ6SlOqS/vi81wdoEdrGz7YRVKPfvpaN9WsDSPUH5+3Qnw==
X-Received: by 2002:a63:4610:: with SMTP id t16mr46631158pga.171.1621002243300;
        Fri, 14 May 2021 07:24:03 -0700 (PDT)
Received: from fedora ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.gmail.com with ESMTPSA id u12sm4130975pfh.122.2021.05.14.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 07:24:02 -0700 (PDT)
Date: Fri, 14 May 2021 19:53:57 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
Message-ID: <YJ6H/WsojYcN/bLO@fedora>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com>
 <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ6DrLiMsdkG5loA@kroah.com>

On Fri, May 14, 2021 at 04:05:32PM +0200, Greg KH wrote:
> On Fri, May 14, 2021 at 07:18:38PM +0530, Shreyansh Chouhan wrote:
> > On Fri, May 14, 2021 at 03:36:25PM +0200, Greg KH wrote:
> > > On Fri, May 14, 2021 at 07:00:39PM +0530, Shreyansh Chouhan wrote:
> > > > The gb_loopback_stats_attrs macro, (defined in loopback.c,) is a
> > > > multiline macro whose statements were not enclosed in a do while
> > > > loop.
> > > > 
> > > > This patch adds a do while loop around the statements of the said
> > > > macro.
> > > > 
> > > > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/loopback.c | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > > index 2471448ba42a..c88ef3e894fa 100644
> > > > --- a/drivers/staging/greybus/loopback.c
> > > > +++ b/drivers/staging/greybus/loopback.c
> > > > @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > > >  }									\
> > > >  static DEVICE_ATTR_RO(name##_avg)
> > > >  
> > > > -#define gb_loopback_stats_attrs(field)				\
> > > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > > -	gb_loopback_ro_avg_attr(field)
> > > > +#define gb_loopback_stats_attrs(field)					\
> > > > +	do {								\
> > > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > > +		gb_loopback_ro_avg_attr(field);				\
> > > > +	} while (0)
> > > >  
> > > >  #define gb_loopback_attr(field, type)					\
> > > >  static ssize_t field##_show(struct device *dev,				\
> > > > -- 
> > > > 2.31.1
> > > > 
> > > > 
> > > 
> > > Did you test build this change?
> > 
> > I built the module using make -C . M=drivers/staging/greybus to test
> > build it. I didn't get any errors.
> 
> Really?  Can you provide the full build output for this file with your
> change?  I don't think you really built this file for the obvious
> reasons...

I ran make -C . M=drivers/staging/greybus

I got a three line output saying:
make: Entering directory '/work/linux'
  MODPOST drivers/staging/greybus//Module.symvers
make: Leaving directory '/work/linux'

I just tried rebuilding the kernel with CONFIG_GREYBUS=m, and now I can
see what you are talking about. Why weren't these errors reported when I
ran the previous make command? Does that too check for the config
variables even when I specifically asked it to build a module?

Also sorry about this. I will be more careful next time.

> 
> thanks,
> 
> greg k-h

Regards,
Shreyansh Chouhan
