Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601D76D28
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 13:42:59 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id kb13-20020a17090ae7cdb02901503d67f0beso1432335pjb.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V2FeJYZDww2DdD1lDXHuBLfVqGEAO/xiKgUfUUlkplc=;
        b=Xcz1bPAXSS1KyUCTgQ0sBGmoucVOtgXkHI9HYiqDMycby0xFc+NYG3kuaLxm7alIhg
         0pyfawO0M8+Q0thPzNkp/n0fExZ23ce4pdUdBfycvIUozGKR+HxkcGVNHiStaxRopMMa
         c9vbYZSFJafxvvH0mW+prBPM2hE76tljvwoiF5gLU/L/KJdkCKxHYGkMNmLdM3EnYvr9
         p+N+7DiP9Oy3RSwLkGsl29FEl4BeQhE+rkzwf3OXGa/CRcainKJHq77YRZ3wpThA4BYQ
         NRyo8gZqXiY7Wwy2WGsL/DO4HiRYxhm/ifYDq7o/8/jnKOWSXAL59zwzpjnTDzQl0Mz+
         0KcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V2FeJYZDww2DdD1lDXHuBLfVqGEAO/xiKgUfUUlkplc=;
        b=De+cYc5LRejgzky9nsvmr0Abpm1el0xs+uH2ZKsIZoaGhanaJRi1ImC8KFwpi70Cw3
         rhhz36vhevNYdXpBEqk5dF6qtisD0DGEyDy6i8ys2AOTQBJGgkBu18jQaowkDVvicb/L
         Ew4Fd0I7q6BVhAJXCEM+LW5kf0aDx5Vg8Hw6OJxWcuYrrqdefRZ7hJtmVuVmwxYHbI7a
         hDNb1R/IQ9uuZCo8SXGXsXhEE+8e+TafUA3q3ckXOMo69IKgLU8rkjUx6ggPJYIOfY8R
         tuKFM6vo/k4rESZ7VZ8RHEEj/BhGFVJJU+1nOhlIAokJc8dIVnMBDuPNZfXNK5XVFp8e
         EgPg==
X-Gm-Message-State: AOAM5330XZWU/wrYdZaRdnCHskJkbNSl83sLt0TR9rMIxoyMjNj/kEot
	m7/5v8Odb3t/ilqEbYPlbUQ=
X-Google-Smtp-Source: ABdhPJzn87a0yL7BPU9C+OUIe3zaAr4YdC6FMnHIDH6L/bQUl0Od5MsehFzNcvP6EBbb3a/lwBq/1w==
X-Received: by 2002:a17:90a:d184:: with SMTP id fu4mr3902551pjb.79.1618494178670;
        Thu, 15 Apr 2021 06:42:58 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id g24sm2715066pgn.18.2021.04.15.06.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 06:42:58 -0700 (PDT)
Date: Thu, 15 Apr 2021 19:12:47 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: davem@davemloft.net, kuba@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 4/5] staging: rtl8192e: rectified spelling mistake and
 replace memcmp with ether_oui_equal
Message-ID: <YHhC1/R6lrWN57JC@kali>
References: <cover.1618380932.git.mitaliborkar810@gmail.com>
 <eda8d3401f2f7ff7a61137b4935c6ccb09112e52.1618380932.git.mitaliborkar810@gmail.com>
 <YHak+7LA6LdrUyzU@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHak+7LA6LdrUyzU@kroah.com>

On Wed, Apr 14, 2021 at 10:16:59AM +0200, Greg KH wrote:
> On Wed, Apr 14, 2021 at 12:26:01PM +0530, Mitali Borkar wrote:
> > Added a generic function of static inline bool in
> > include/linux/etherdevice.h to replace memcmp with
> > ether_oui_equal throughout the execution.
> > Corrected the misspelled words in this file.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  
> > Changes from v1:- Rectified spelling mistake and replaced memcmp with
> > ether_oui_equal.
> > 
> >  drivers/staging/rtl8192e/rtl819x_HTProc.c | 48 +++++++++++------------
> >  include/linux/etherdevice.h               |  5 +++
> >  2 files changed, 29 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > index ec6b46166e84..ce58feb2af9a 100644
> > --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > @@ -43,7 +43,7 @@ u16 MCS_DATA_RATE[2][2][77] = {
> >  	 810, 720, 810, 900, 900, 990} }
> >  };
> >  
> > -static u8 UNKNOWN_BORADCOM[3] = {0x00, 0x14, 0xbf};
> > +static u8 UNKNOWN_BROADCOM[3] = {0x00, 0x14, 0xbf};
> >  
> >  static u8 LINKSYSWRT330_LINKSYSWRT300_BROADCOM[3] = {0x00, 0x1a, 0x70};
> >  
> > @@ -146,16 +146,16 @@ bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
> >  	bool			retValue = false;
> >  	struct rtllib_network *net = &ieee->current_network;
> >  
> > -	if ((memcmp(net->bssid, BELKINF5D8233V1_RALINK, 3) == 0) ||
> > -	    (memcmp(net->bssid, BELKINF5D82334V3_RALINK, 3) == 0) ||
> > -	    (memcmp(net->bssid, PCI_RALINK, 3) == 0) ||
> > -	    (memcmp(net->bssid, EDIMAX_RALINK, 3) == 0) ||
> > -	    (memcmp(net->bssid, AIRLINK_RALINK, 3) == 0) ||
> > +	if ((ether_oui_equal(net->bssid, BELKINF5D8233V1_RALINK) == 0) ||
> > +	    (ether_oui_equal(net->bssid, BELKINF5D82334V3_RALINK) == 0) ||
> > +	    (ether_oui_equal(net->bssid, PCI_RALINK) == 0) ||
> > +	    (ether_oui_equal(net->bssid, EDIMAX_RALINK) == 0) ||
> > +	    (ether_oui_equal(net->bssid, AIRLINK_RALINK) == 0) ||
> >  	    (net->ralink_cap_exist))
> >  		retValue = true;
> > -	else if (!memcmp(net->bssid, UNKNOWN_BORADCOM, 3) ||
> > -		 !memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
> > -		 !memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3) ||
> > +	else if (ether_oui_equal(net->bssid, UNKNOWN_BROADCOM) ||
> > +		 ether_oui_equal(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM) ||
> > +		 ether_oui_equal(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM) ||
> >  		 (net->broadcom_cap_exist))
> >  		retValue = true;
> >  	else if (net->bssht.bd_rt2rt_aggregation)
> > @@ -179,26 +179,26 @@ static void HTIOTPeerDetermine(struct rtllib_device *ieee)
> >  			pHTInfo->IOTPeer = HT_IOT_PEER_92U_SOFTAP;
> >  	} else if (net->broadcom_cap_exist) {
> >  		pHTInfo->IOTPeer = HT_IOT_PEER_BROADCOM;
> > -	} else if (!memcmp(net->bssid, UNKNOWN_BORADCOM, 3) ||
> > -		 !memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
> > -		 !memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3)) {
> > +	} else if (ether_oui_equal(net->bssid, UNKNOWN_BROADCOM) ||
> > +		   ether_oui_equal(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM) ||
> > +		   ether_oui_equal(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM)) {
> >  		pHTInfo->IOTPeer = HT_IOT_PEER_BROADCOM;
> > -	} else if ((memcmp(net->bssid, BELKINF5D8233V1_RALINK, 3) == 0) ||
> > -		 (memcmp(net->bssid, BELKINF5D82334V3_RALINK, 3) == 0) ||
> > -		 (memcmp(net->bssid, PCI_RALINK, 3) == 0) ||
> > -		 (memcmp(net->bssid, EDIMAX_RALINK, 3) == 0) ||
> > -		 (memcmp(net->bssid, AIRLINK_RALINK, 3) == 0) ||
> > -		  net->ralink_cap_exist) {
> > +	} else if ((ether_oui_equal(net->bssid, BELKINF5D8233V1_RALINK) == 0) ||
> > +		   (ether_oui_equal(net->bssid, BELKINF5D82334V3_RALINK) == 0) ||
> > +		   (ether_oui_equal(net->bssid, PCI_RALINK) == 0) ||
> > +		   (ether_oui_equal(net->bssid, EDIMAX_RALINK) == 0) ||
> > +		   (ether_oui_equal(net->bssid, AIRLINK_RALINK) == 0) ||
> > +		   net->ralink_cap_exist) {
> >  		pHTInfo->IOTPeer = HT_IOT_PEER_RALINK;
> >  	} else if ((net->atheros_cap_exist) ||
> > -		(memcmp(net->bssid, DLINK_ATHEROS_1, 3) == 0) ||
> > -		(memcmp(net->bssid, DLINK_ATHEROS_2, 3) == 0)) {
> > +		   (ether_oui_equal(net->bssid, DLINK_ATHEROS_1) == 0) ||
> > +		   (ether_oui_equal(net->bssid, DLINK_ATHEROS_2) == 0)) {
> >  		pHTInfo->IOTPeer = HT_IOT_PEER_ATHEROS;
> > -	} else if ((memcmp(net->bssid, CISCO_BROADCOM, 3) == 0) ||
> > -		  net->cisco_cap_exist) {
> > +	} else if ((ether_oui_equal(net->bssid, CISCO_BROADCOM) == 0) ||
> > +		   net->cisco_cap_exist) {
> >  		pHTInfo->IOTPeer = HT_IOT_PEER_CISCO;
> > -	} else if ((memcmp(net->bssid, LINKSYS_MARVELL_4400N, 3) == 0) ||
> > -		  net->marvell_cap_exist) {
> > +	} else if ((ether_oui_equal(net->bssid, LINKSYS_MARVELL_4400N) == 0) ||
> > +		   net->marvell_cap_exist) {
> >  		pHTInfo->IOTPeer = HT_IOT_PEER_MARVELL;
> >  	} else if (net->airgo_cap_exist) {
> >  		pHTInfo->IOTPeer = HT_IOT_PEER_AIRGO;
> > diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
> > index 2e5debc0373c..6a1a63168319 100644
> > --- a/include/linux/etherdevice.h
> > +++ b/include/linux/etherdevice.h
> > @@ -87,6 +87,11 @@ static inline bool is_link_local_ether_addr(const u8 *addr)
> >  #endif
> >  }
> >  
> > +static inline bool ether_oui_equal(const u8 *addr, const u8 *oui)
> > +{
> > +return addr[0] == oui[0] && addr[1] == oui[1] && addr[2] == oui[2];
> > +}
> 
> Staging drivers are stand-alone, we can not add code outside of the
> driver directory in these patches, sorry.
> 
Okay Sir. When I tried to add static inline bool line in current file, it
showed errors which I was not able to rectify, but when I added that
line to include/linux/etherdevice.h file, and replaced memcmp with
ether_oui_equal, it worked fine.
I may be wrong in application. May I know how to resolve this?

> And as Dan said, this is wrong formatting, did you run checkpatch.pl on
> your changes?
>
Yes Sir, I ran checkpatch.pl, on both files, it showed no errors
against the changes I made.

> thanks,
> 
> greg k-h
