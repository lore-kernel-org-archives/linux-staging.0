Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5D6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:23:57 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s15so5933954edd.4
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3X2i/TtHTFpzqhDJcZ/Ryoyq1t75AmO3pNenaRT82zk=;
        b=N7Ix2SbgX12DZw0PuE9agptLItNucgGZKtEZUyJgDS+4mZh6GOAQT+rynkXF33t3ve
         3OwbLhGkPMg1rJ1TYfigHAy7YsvNBilWjWT1+FqTc8v0D3B4jiss1MDPFnip4emIqYoN
         Qctyd0ifBO6b6bo1qD6z5YkOUBK4moQ39Six+JBTcaoFxy23/mV0PpxBdQfVepBH5Sva
         c94DKASQuqWeNKxQCl6SS06nDbvglBiQnHwZETj3YiP223tlh5ONZhqApuggoJ3N7cJp
         OJzQUB1PhegnNiBPFEVfZKwxHljTOS2sZYupmkz7M0+0H0UQHkx3drnyfgPSh4XyTa6r
         UJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3X2i/TtHTFpzqhDJcZ/Ryoyq1t75AmO3pNenaRT82zk=;
        b=V4BTQjrwQE8jQNtE11yb+1JWn0Vfmcjen4bzJl/xfalTPWUEanL7RsUI8n9NDDBrHu
         FIJVkhJA8MEV2iFn7yrVOuwtmHI5ezWyigMo4f92P8yU/xw5WrgSuu0rdH2Z/IcacRTk
         a6qoN6tLXyb5Hq+8AOlEWLnCfLPiiTtUdwMWcrR1jqATMeC96btlwVM8FeAcYpGKUWwt
         ARfVYq13H9/FsoYbNI3Qv6G1KA+SqpI6bRaTmyFvyKhOLwikLM1FPRYuxNcd6mMfuSUK
         VInNNsmQXhsGR1Q9mrzZygaC02yHYFyIBuiQJF9Mg5BSK80P998TYfMreQ7IrvwyzsE+
         hcww==
X-Gm-Message-State: AOAM5338tmioLvMZmiIHLLMb47pGcblxtvA93P0ozMPZRbuwzlnQB8s5
	f/OdMoXBph2ZDQLLkDA+8IAdQFMXqLI=
X-Google-Smtp-Source: ABdhPJy9DQhPUMHc/oyh2sCyIWQRM29bUH8VsHiwX/1jI3K30I/tBHmjxMsCIxYQLXOTf1b3aYO69g==
X-Received: by 2002:a05:6402:254a:: with SMTP id l10mr16756622edb.160.1617963836242;
        Fri, 09 Apr 2021 03:23:56 -0700 (PDT)
Received: from agape.jhs ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id i16sm605517ejc.106.2021.04.09.03.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:23:55 -0700 (PDT)
Date: Fri, 9 Apr 2021 12:23:53 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] staging: rtl8723bs: remove commented out RT_TRACE
 logs in hal/ and os_dep/
Message-ID: <20210409102352.GB1396@agape.jhs>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
 <85338f2b2cffb530efbd987064d146fc2be49c72.1617640221.git.fabioaiuto83@gmail.com>
 <20210409101252.GL6048@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409101252.GL6048@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 09, 2021 at 01:12:53PM +0300, Dan Carpenter wrote:
> On Mon, Apr 05, 2021 at 06:49:49PM +0200, Fabio Aiuto wrote:
> > diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> > index 9b16265b543d..f52cc4e7a6e6 100644
> > --- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> > +++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> > @@ -1785,7 +1785,6 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
> >  	/*
> >  	if (band_type == BAND_ON_5G && pwr_lmt == MAX_POWER_INDEX) {
> >  		if (idx_bandwidth == 0 || idx_bandwidth == 1) {
> > -			RT_TRACE(COMP_INIT, DBG_LOUD, ("No power limit table of the specified band %d, bandwidth %d, ratesection %d, rf path %d\n",
> >  				 idx_band, idx_bandwidth,
> >  				 idx_rate_sctn, rf_path));
> >  			if (idx_rate_sctn == 2)
> 
> This won't compile.
> 
> regards,
> dan carpenter
> 
> 

ouch you're right! In this case we are safe because it's commented code.
Moreover, this is also the same 5G code block I remove later in the same
patchset.

I'm sorry for inattention, what's best now?

thank you,

fabio
