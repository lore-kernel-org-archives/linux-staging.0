Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBE71
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 16:52:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c15so40082280wro.13
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9tb7u/DpAkV0Suiokby9iWVlYLDwOXtPXfFXKs/iF3c=;
        b=aznGAWk5e294SbU2cMMw/mNdZng6zwqph1PWWlygg2hb6DaDD2veMhcyn03CpU0lbb
         lezjXJWfi8PriUYUEDvwWLY9jyzhWTAY2NvBV/IvNy7i3hkq1/VZMQS0qneaPJf3wvh1
         vjqRrNPGdLNWGBDk3JiZkztlkLsdOhuOmqd7glheHEMGjV8x9vFm+iV+M4jEoPraKNB8
         eRrXNdKwabUvPVzFQgT4cMmUSWufNKpx8z2KQKN/HGstJnhLZ0x3JhvFIBu6pQea0FnH
         qUXbzA214WBtdcPvv3CcA8hA/80anbIylW2HMhgAOMQntnSoi+n4mGwn2RPJq9K/6hG8
         zHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=9tb7u/DpAkV0Suiokby9iWVlYLDwOXtPXfFXKs/iF3c=;
        b=oGxIaCRtr58Fc/c/eZpxOlbJ+uQw6Zwpq5cig8g+1WXlC0sxxCuAi6FRJYlLsBSuBN
         xS3iFKFreMCMd+5LWm2StDlD6FudGygrKIbl4L8WJSjuiN7UtE3ehkB5R5KELhES2gMk
         vZUM0bY1Y9LZXj4yUgFtf5RtUDApo4GKzMUf9YxcUiijsYVaThDRvthyVlPD5FlhbZDy
         C3rbFkfUEXByhJlIa9HfPcacuialOYWlVig2aVNTFd9pYZql77ZIMmYgJJanEbJoKAp0
         R+lzwQJ1ytnXA1ljgNhsYVbLhl0/WfD+gbRM0D+upPBAyMNq1bmfO3CcUNlZUlk0sWY9
         DF8g==
X-Gm-Message-State: AOAM5325Rkt5jstV7Mc9gXh2WyRG7jdRl4H4lUFhwmug4YVDOOiNRL+s
	vLuX6dOMqhzsdfx4qK/q/To=
X-Google-Smtp-Source: ABdhPJy2J+JRVR6CxxPl3+91w9mwKINYMfv4HSPJYB99mp0TeatcSk5rYYe7PTz7gcm7hCstYjqUqg==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr6005051wrt.0.1619196772627;
        Fri, 23 Apr 2021 09:52:52 -0700 (PDT)
Received: from agape.jhs ([109.52.244.233])
        by smtp.gmail.com with ESMTPSA id x23sm8089171wmj.43.2021.04.23.09.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:52:52 -0700 (PDT)
Date: Fri, 23 Apr 2021 18:52:49 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/49] staging: rtl8723bs: replace DBG_871X_SEL log macro
 with netdev_dbg()
Message-ID: <20210423165249.GA1419@agape.jhs>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
 <9e6a1e4dc8962bfd58375be98619c76e8e28febe.1619189489.git.fabioaiuto83@gmail.com>
 <0a68fbfffba4cc801814e3af1e3a7571928c1921.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a68fbfffba4cc801814e3af1e3a7571928c1921.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 23, 2021 at 08:27:58AM -0700, Joe Perches wrote:
> On Fri, 2021-04-23 at 16:57 +0200, Fabio Aiuto wrote:
> > replace DBG_871X_SEL log macro with the net device driver
> > recommended netdev_dbg().
> > 
> > This macro by default does a raw printk, and the alternative
> > behaviour, never triggered is a seq_print() call.
> []
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
> []
> > @@ -23,9 +23,10 @@ void mac_reg_dump(void *sel, struct adapter *adapter)
> >  	for (i = 0x0; i < 0x800; i += 4) {
> >  		if (j%4 == 1)
> >  			netdev_dbg(adapter->pnetdev, "0x%03x", i);
> > -		DBG_871X_SEL(sel, " 0x%08x ", rtw_read32(adapter, i));
> > +		netdev_dbg(adapter->pnetdev, " 0x%08x ",
> > +			   rtw_read32(adapter, i));
> >  		if ((j++)%4 == 0)
> > -			DBG_871X_SEL(sel, "\n");
> > +			netdev_dbg(adapter->pnetdev, "\n");
> >  	}
> 
> This makes a mess of the output as each netdev_dbg call
> is a separate line.
> 
> Dumping 1000 register lines into output logs seems impolite
> at best, even for debugging.
> 
> This _might_ be rewritten to something like:
> 
> void dump_4_regs(struct adapter *adapter, int offset)
> {
> 	u32 reg[4];
> 	int i;
> 
> 	for (i = 0; i < 4; i++)
> 		reg[i] = rtw_read32(adapter, offset + i);
> 
> 	netdev_dbg(adapter->pnetdev, "0x%03x 0x%08x 0x%08x 0x%08x 0x%08x\n",
> 		   i, reg[0], reg[1], reg[2], reg[3]);
> }
> 
> void mac_reg_dump(...)
> {
> 	...
> 
> 	for (i = 0; i < 0x800; i += 4)
> 		dump_4_regs(adapter, i);
> 
> 
> 

interesting, sure that will be matter of another patch series,
the ugly output was already there, old macro used to wrap a raw
printk...
