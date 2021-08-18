Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C86D13
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:23:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gt38so2629273ejc.13
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OtuTHgk1vpqukCNNGvb6/1jnVEMLRfbzK5iP4DPgChc=;
        b=USJwsT0QGrIMRQazK6too1bYjc1/Jr6MZpIJhiprZhMs9JWgurShMOdabEiA68Lp2N
         MPWIHF6t9cOMkm9A/e+p9Xlslq+EJcFSCiO45bK5aX5+E5LcclT1ymONdwm93OMPT3Tc
         0OgV0CLW2VIQ7gvdVdfLPTzXTc2vJAck3jCRHOxbRS7FaekfGd0j2fqAmDqk8lYFP5Xv
         MIsdkA3YtTNVFBkRVsB+zc5NxKEl7TREkRLYk2loK45b2r0dzFv0l1zEBaRvmq+GQgIP
         YkvqkZ7Zi3chTbay3j3YuMaTXZlFPUdci50JXGhg3ZPLFvv4q59boXGSuD8uYg4Ov3tA
         Jndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OtuTHgk1vpqukCNNGvb6/1jnVEMLRfbzK5iP4DPgChc=;
        b=RTt9I1g3UM+/wLNBch2mqD8dkEP9THZQl/4IiORqODXYMi+egjYG0S4ipPaTaBYGzi
         3zDSqdIChN+XjV44oNJUBVf1KW+mRHa42RjkZtsXZPM7VMAGGOKjh+4omz/SZFv2Q8X/
         GWBNx2nJi3irpkuCyer2CYSnfh98CV3u3SWylEOZV8BPE7s3pVxkEaWpafv7vyiHMXGV
         Lpd04d71MeDyByRo6CuebLHmhCQy1pWy9armueC65GdA5WisA01EhqIfCf3RDMeTQ/P5
         sA+Db9oVQjDMZb4AlzE1kSkPolh31Rkff3mA3abuRWqyDE9XjAxuc/MbAJf21P8gPgPQ
         5xOg==
X-Gm-Message-State: AOAM5324KGE3v+p8qwEQLfGCIx0x2UDha/34gwiCMqBsnenmEYlGybu4
	ZhwNV5sEr13nG5y18XR1zkw=
X-Google-Smtp-Source: ABdhPJxjfwat/n+QRrqqUm5kAjo8tQ+A40RJTEcBVq/E0MOXa9s+GDtTlSt9MEmg/WQhabWfhIGTgQ==
X-Received: by 2002:a17:907:2cf1:: with SMTP id hz17mr2892026ejc.438.1629267800444;
        Tue, 17 Aug 2021 23:23:20 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id e22sm2054955eds.45.2021.08.17.23.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:23:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: refactor rtw_is_cckrates{only}_included()
Date: Wed, 18 Aug 2021 08:23:18 +0200
Message-ID: <2509261.CYLKgzzBkz@localhost.localdomain>
In-Reply-To: <YRwEyrSLTPl/KY9t@kroah.com>
References: <20210816193125.15700-1-straube.linux@gmail.com> <11a09af791c5453175a6bdac1c51bd9fcb0685bd.camel@perches.com> <YRwEyrSLTPl/KY9t@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday, August 17, 2021 8:49:46 PM CEST Greg KH wrote:
> On Tue, Aug 17, 2021 at 11:36:09AM -0700, Joe Perches wrote:
> > On Tue, 2021-08-17 at 19:57 +0200, Greg KH wrote:
> > > On Mon, Aug 16, 2021 at 09:31:25PM +0200, Michael Straube wrote:
> > > > Refactor functions rtw_is_cckrates_included() and
> > > > rtw_is_cckratesonly_included(). Add new helper function rtw_is_cckrate()
> > > > that allows to make the code more compact. Improves readability and
> > > > slightly reduces object file size. Change the return type to bool to
> > > > reflect that the functions return boolean values.
> > []
> > > > diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
> > []
> > > > +bool rtw_is_cckratesonly_included(u8 *rate)
> > > >  {
> > > > -	u32 i = 0;
> > > > +	u8 r;
> > > >  
> > > > 
> > > > -	while (rate[i] != 0) {
> > > > -		if  ((((rate[i]) & 0x7f) != 2) && (((rate[i]) & 0x7f) != 4) &&
> > > > -		     (((rate[i]) & 0x7f) != 11)  && (((rate[i]) & 0x7f) != 22))
> > > > +	while ((r = *rate++)) {
> > > 
> > > Ick, no.
> > > 
> > > While it might be fun to play with pointers like this, trying to
> > > determine the precedence issues involved with reading from, and then
> > > incrementing the pointer like this is crazy.
> > > 
> > > The original was obvious as to how it was walking through the array.
> > 
> > It's sad to believe *ptr++ is not obvious to you as it's very commonly
> > used in the kernel sources (over 10,000 instances).
> 
> There's lots of sad things in life :(
> 
Dear Greg,

Please reconsider this issue, I mean it. Let me explain why...

Obviously neither Joe or all the people who knows how much you've given to
Linux during these latest two decades (or is it more?) believes that you have 
any problem with operator precedence :-)

Said that, since operator precedence is one of the first topic that every developer
learn in a course on C and that expressions like *ptr++ are used everywhere in
the kernel you are sending a dangerous message...

It looks like you don't trust people here to be able to do anything more than 
trivial clean-ups. If someone here at linux-staging is not able to understand 
the precedence of operators, please stand up and speak!

We here at linux-staging are not class B developers (compared to A class 
developers of other subsystems). For sure, most of us are newcomers with
less experience than other developers who don't choose to work with
drivers/staging, but you should not prevent us from getting experience and 
using common techniques that are perfectly fine in other areas of Linux.

Thanks for your attention and your precious time,

Fabio
 



