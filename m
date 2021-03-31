Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF855F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 10:55:56 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id o19so21779407edc.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 03:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=356R7sQpshoyEfmHEDtb6MkvOb+YyBiiz66/bbaWRKI=;
        b=usqu/C8YTsm17g7Vo36TvPv/O96ZFfzV35x47DmxM20+d2bvcrMcA6nm2XEP+UOGLr
         FajYxSntyoaRlXNaZ7KkLecXC6HiRGJFVY9BL+avWsgEBRBR+K7+rBLaDaE8WsrLfn+7
         1H0LnCHp4p9zvsZgX1o1uDsE1S+0aYcttEVETH8UlfmKeKQI60gh15I9cYZth7l9CEnE
         TsYTzLw7U5Gk2qwNbGZisF0qn+qm4bnrqzU0XFPn+nskJomAOPzP2iMVlYhmRlDAjpwu
         3P6H9Kmmszs9M6CQBi7m6EEGAazge+P5XB9PJIA7Al5QxevWR1NblpKO8LA/dJzOms/S
         SUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=356R7sQpshoyEfmHEDtb6MkvOb+YyBiiz66/bbaWRKI=;
        b=HFPT50ZaAmR++PYSo8cHs/TH3mIQj6aO4v1uGI034hw1RZAjdfJMYs0i75Fn9LyAHz
         GAHo1mu2j1m1sp1T3kT261Op5OQvlTFvjkiD7wLYAuCFZa2qgRdSHOBDU6cKCGysCU8b
         dD6SMpfwdP8OVapIFDDaYntmP42xbdS/0V5qkqcVgMwIKeWlsTQ7FhlTtoWORXxBXiND
         SDyxu+m22CeO7CugmsiKRYJ2xmLXcTC9PBliTDPhrBn11+OsHIf0JyuQDURx3fui8XGF
         iy5/+zn2pJoBNaHnvk0O4PHSXdihmKQyolF6PCq4ONrydcDFhYtK0a54XEW1XtIEFLmi
         gQMQ==
X-Gm-Message-State: AOAM530oDU8nD9K9Po/TrywMb4h1PxXW6Hmq01vAKztX24LKeJFiwUQX
	jB6o3SD+oyBsfaxDxoyxZijLZdf+rhSWDg==
X-Google-Smtp-Source: ABdhPJwQVtfUEe/IkPIPsqHlgrQIWU3tLSJcAA4jBYnI0ZX1UIfb93Kd4dY6m9D4rfDmAdXvCPskAw==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr3021594eds.199.1617188154873;
        Wed, 31 Mar 2021 03:55:54 -0700 (PDT)
Received: from agape.jhs ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id h13sm1299118edz.71.2021.03.31.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:55:54 -0700 (PDT)
Date: Wed, 31 Mar 2021 12:55:51 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/40] staging: rtl8723bs: replace RT_TRACE with public
 printk wrappers in core/rtw_eeprom.c
Message-ID: <20210331105551.GB1450@agape.jhs>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
 <39c2cd878bc914a00e71ea988c3cacb651670822.1617183374.git.fabioaiuto83@gmail.com>
 <YGROiD19tgF8XnK6@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGROiD19tgF8XnK6@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 31, 2021 at 12:27:20PM +0200, Greg KH wrote:
> On Wed, Mar 31, 2021 at 11:39:31AM +0200, Fabio Aiuto wrote:
> > replace private macro RT_TRACE for tracing with in-kernel
> > pr_* printk wrappers
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_eeprom.c | 26 ++++++++++-----------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > index 3cbd65dee741..6176d741d60e 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > @@ -36,7 +36,7 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
> >  _func_enter_;
> >  
> >  	if (padapter->bSurpriseRemoved == true) {
> > -		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
> > +		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
> 
> As Dan said, this is not the same thing.  You are now always printing
> out this mess, when before you were not unless you explicitly enabled
> "tracing".

RT_TRACE is enabled if is defined the symbol DEBUG_RTL871X. It doesn't seem to be related 
to tracing. DEBUG_RTL871X is never declared, is commented out in rtl8723bs/include/autoconf.h

that's why RT_TRACE is never printed. If we try to uncomment the symbol definition we have some
comiling errors..

> 
> And you are sending it to the error log?
> 
> And finally, drivers should never be using pr_*() for messages, they
> should be using dev_*() instead as they are a driver and have access to
> a device pointer.
> 
> thanks,
> 
> greg k-h

I still wonder what's best...

thanks,

fabio
