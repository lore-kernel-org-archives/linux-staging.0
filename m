Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1635F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 12:20:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id h10so22045477edt.13
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 05:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4C0Nob3kCxAymCSBdPGfWK0bfiuslhH1Vyz8Q3gjxRo=;
        b=WV7syPXn9LH9fJYZqbs1RyWSEpti9lGZmZaUv5egUu2dWg4eyM2Jtm7jTPgNiXftpS
         e1Nsy8Znn/M0En+K+NV/WdwW5T9MuHhcGjJiRB5RPLEzDs0Cu+wqP8uYWl9r6dlcPEnN
         1rWMKD2Dm3LqAiL3f2QrWGL44stLW1Ld2G0TL1ofamr3UyJbTJYHDS9OtmHTzmUmsKPg
         5BAM9QqqsKCgxx2O1gwh8nphdwdZbmS2SYu2h8XVSoCEY5CKcuMtuBZcte9iQf2WZrY/
         7wLW1oa1pwS7+YpKpNgE8P7115ILpXVbfamuYVvmNu9ecxIWWEZvhNLPPjHasCPKe7Te
         lvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4C0Nob3kCxAymCSBdPGfWK0bfiuslhH1Vyz8Q3gjxRo=;
        b=YqRFxkflg6OhPUKUYfVQNxaZmBGfSBRcSbtJdvVlgYkxipGqc9hN69bmKnXTRCQlsJ
         IQh8fv8/xD6wM/TW/zp0S8B/hzfiGy96pH2itSwwOos/Wey7N0QlrEBZDL/sAdQaYCxl
         Jd/RQOwYstfJhZFD0NZQLVz2nSdNpx7QEt8JTbBJv9nEVSzOh6lqHYlvIGaYfqLze1PZ
         QTFAfA0eXVO//aWDy/TKEAHcGqVSRz0hwvOs9H4oZ2yKJ6OYXCmq3c4QpmBI6kgZ5aa/
         zB6CgF71CrliRZLNjUO4XZPPR2brXfysg2nDuEbc5iX+jDo536hjLW1YlvnEmJyBqQgw
         oqNA==
X-Gm-Message-State: AOAM530sYGAt8dK4OcYxy7mInTlOIqGWxLsdA2kiNi0M58FD1sh5VL2m
	QdgMrfVnpnA5ec4XF7A+riE=
X-Google-Smtp-Source: ABdhPJxNdqsV8z7jkT0KwLw67EgrL5lKP2qhXWZ5KRKp7FYjWebkHBniCAIBJvyMuPSzC97k35fKWA==
X-Received: by 2002:a50:ec07:: with SMTP id g7mr3347331edr.72.1617193202749;
        Wed, 31 Mar 2021 05:20:02 -0700 (PDT)
Received: from agape.jhs ([5.171.81.9])
        by smtp.gmail.com with ESMTPSA id dg26sm1432386edb.88.2021.03.31.05.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:20:02 -0700 (PDT)
Date: Wed, 31 Mar 2021 14:19:59 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/40] staging: rtl8723bs: replace RT_TRACE with public
 printk wrappers in core/rtw_eeprom.c
Message-ID: <20210331121958.GB1599@agape.jhs>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
 <39c2cd878bc914a00e71ea988c3cacb651670822.1617183374.git.fabioaiuto83@gmail.com>
 <YGROiD19tgF8XnK6@kroah.com>
 <20210331103630.GA1450@agape.jhs>
 <YGRTdBWseZw72rae@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGRTdBWseZw72rae@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 31, 2021 at 12:48:20PM +0200, Greg KH wrote:
> On Wed, Mar 31, 2021 at 12:36:31PM +0200, Fabio Aiuto wrote:
> > On Wed, Mar 31, 2021 at 12:27:20PM +0200, Greg KH wrote:
> > > On Wed, Mar 31, 2021 at 11:39:31AM +0200, Fabio Aiuto wrote:
> > > > replace private macro RT_TRACE for tracing with in-kernel
> > > > pr_* printk wrappers
> > > > 
> > > > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/core/rtw_eeprom.c | 26 ++++++++++-----------
> > > >  1 file changed, 13 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > > > index 3cbd65dee741..6176d741d60e 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > > > @@ -36,7 +36,7 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
> > > >  _func_enter_;
> > > >  
> > > >  	if (padapter->bSurpriseRemoved == true) {
> > > > -		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
> > 
> > I looked at this ---------------------------------------^
> > and so I thought that pr_err was good...
> 
> But you missed the fact that RT_TRACE() does not always spit this stuff
> out.
> 
> And I don't know what _drv_err_ is, but tracing messages should never go
> to an error log :)

ok, got it 

> 
> > my aim was remove private macros replicating component tracing and log levels...
> 
> That's a great goal!
> 
> > so what's best? Keep a simplyfied RT_TRACE encapsulating a dev_* call?
> 
> replace them with dev_dbg() is one way, if they really are even needed
> at all.  At this point in time, I would strongly just recommend removing
> them all as no one is using them for anything.
> 
> thanks,
> 
> greg k-h

I will remove then,

thank you,

fabio
