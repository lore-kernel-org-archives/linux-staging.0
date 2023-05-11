Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9CD1F956
	for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 14:18:28 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-24e16918323so6025971a91.2
        for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683814708; x=1686406708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cZJOUXZJ2eCAjaNz00XUp42dWxxFQ/eDmJ9k4vXyg78=;
        b=P2rPFmJGKzWvt3PXPRWlld6P6GFHQWdIFnoPJtcDQDuiWcYdxvhNhRH9p7m9tJRfYw
         VteVGhj8SCzEgP6yWM3s6EWoSDuJKu/IvtooQCgbD7aTRpaxkK9dzwkgMO2bbqswRip7
         A0PKGvu/4M715sa0y7XxVQoIqZLQGSq2yzwEoo4zGyPzneFNb8w6el8/yZus3AT4BFIM
         bnaH4DofuJnScbpvmbSu0rPcOr/f33HzkgZS4AIcjF3fryuODtiD8cJeWgoOY6qmmCBb
         ESy/Ojsh1iyN+xKhhaWGmjyoLpHrv8i1kByviYjRBccivHXC1FFQ9eV3XbPmvBMCPjOk
         KeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683814708; x=1686406708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZJOUXZJ2eCAjaNz00XUp42dWxxFQ/eDmJ9k4vXyg78=;
        b=MVMRcCfzfUT0f3WG3mJorlGSjRmbIA7flTew5AcQsKIHNE4Zu6/kRkjSoAPigZ1nwm
         eHQbYkXLTz5TyP4k4+ojaWMyd+tCEkHImt8C/vlyHyNLbneV9GL7u5t/sD5XtHcPytLV
         ntZ7uuwvxDh0Dk86uDvhgxwKcY+jnX4ywRSXuadZvfhtSuI9K9j7EenggkSbeDq2Ztap
         YsVPri50HfKUNNCuY5sq+G9SOce2ivZvG0Kg38VvC07g3gfJs3bhwL2tREip/CmmwM/s
         gcX6cfAXZwsB/1kt57rzIvM8eAQjbZugk+PTCksAqzuSgwnpwfsvRr/8yFQXMo2/uB2e
         P0KQ==
X-Gm-Message-State: AC+VfDycW7ZoG7e9TEmTpUkNYhy6wXq4lwvnI1xIxvm2ouZ/SbXgXFxH
	FpWXQDdaffswXtHzn+hRFmY=
X-Google-Smtp-Source: ACHHUZ6lPXcBfjNjgg/y4qZ2dzq6XtovI1TWHqyerTp7GzA+GFRkXRT4YVt0w1ceB5Lebr1Y8gJu1g==
X-Received: by 2002:a17:90a:b292:b0:24d:fb21:3d7c with SMTP id c18-20020a17090ab29200b0024dfb213d7cmr21350328pjr.30.1683814707993;
        Thu, 11 May 2023 07:18:27 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id o3-20020a17090ad24300b00246be20e216sm15258205pjw.34.2023.05.11.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:18:27 -0700 (PDT)
Date: Thu, 11 May 2023 19:48:23 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8192e: Rename tmpRegA and TempCCk
Message-ID: <ZFz5Lxc/gUTKkLNX@pop-os.localdomain>
References: <cover.1683730854.git.yogi.kernel@gmail.com>
 <c9c67f832db3a776c04f26e0afb083ae3ba99c07.1683730854.git.yogi.kernel@gmail.com>
 <290473de-5946-49d4-9309-6bebf7cc9873@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290473de-5946-49d4-9309-6bebf7cc9873@kili.mountain>

On Wed, May 10, 2023 at 07:56:29PM +0300, Dan Carpenter wrote:
> On Wed, May 10, 2023 at 08:39:07PM +0530, Yogesh Hegde wrote:
> > @@ -680,17 +680,17 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
> >  		return;
> >  	}
> >  
> > -	tmpRegA = rtl92e_get_rf_reg(dev, RF90_PATH_A, 0x12, 0x078);
> > -	if (tmpRegA < 3 || tmpRegA > 13)
> > +	tmp_reg = rtl92e_get_rf_reg(dev, RF90_PATH_A, 0x12, 0x078);
> > +	if (tmp_reg < 3 || tmp_reg > 13)
> >  		return;
> > -	if (tmpRegA >= 12)
> > -		tmpRegA = 12;
> > +	if (tmp_reg >= 12)
> > +		tmp_reg = 12;
> 
> Not related to your patch (which is fine) but this if statement can be
> deleted.
> 
> >  	priv->thermal_meter[0] = ThermalMeterVal;
> >  	priv->thermal_meter[1] = ThermalMeterVal;
> >  
> > -	if (priv->thermal_meter[0] >= (u8)tmpRegA) {
> > +	if (priv->thermal_meter[0] >= (u8)tmp_reg) {
> 
> And casting tmp_reg to u8 is nonsense so that casting can be deleted too.
> 2 separate patches:
> patch 1: delete unecessary if statement
> patch 2: delete unecessary casting

Thank you for taking the time to review my patch and provide your
feedback. Your suggestions are duly noted, and I appreciate your 
guidance.

I will make them into separate patches and submit it. 

Thank you for your time and valuable input.

Regards 
Yogesh
