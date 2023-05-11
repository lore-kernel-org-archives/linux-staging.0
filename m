Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1471F920
	for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 14:21:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f423ac6e2dso36927355e9.2
        for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683814882; x=1686406882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X4TGtpdbw9bD18atN5kE/HuvcKSp7uR+zidBNAhHlJo=;
        b=SVoR1J5McR7bzOwVTqcF5UTRFeXPjduzAUfjR5e4d1fFZGppSENYT+4/M5FKd5sAnZ
         UFCsYfKLeXcEVpdXeeqCa+KuBllAsamed2Be2fRc8d/bvuPMtaAYe4rUBbXReBCvkA/X
         fCxD8dXOg1dXI9oawBSOcUnvBISvIOvvok8GZpNfj8vihZePcMQrm5hhk7x8bXltS0YW
         60bcm/324w4kkzlVqEEvemM3mqVzaF+yEtE0jXj8q6NUTxfcRzsGU1B5YudNgocuMXeS
         GiVaQAkpDY9e4WHr9Mg34YLZSFJ2lrJLdZgTF1JYBbLzV5uGkNObqv5rmBy3sIEAR7s4
         lciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683814882; x=1686406882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4TGtpdbw9bD18atN5kE/HuvcKSp7uR+zidBNAhHlJo=;
        b=QZ1LvJaprf6sMJVNyhLqMjzt5bpyIZqUYEday4waY/bLe6w6UHjZDC2Gp5AuXx+KBK
         yyxm6T7fCwiDnfUuJPF/wrvlFePZEWvRvDZIbs0wCPXuQZ+TuPonpTyoJqrnkMFid2Y9
         ZcvWo8q065nDb8WfRbgrc717M0bv6coGEx85WoXH4QPBrLZ7UR1Mpyy44g9jQMQUwYST
         u2zj5YHpzNPeXpUNtkg00HKUWuwM3loHQ2SoBo02Zub5zkviPllyT7VMVWI3kyLpiZOS
         mtVUyfOHsE1drprj0aLf1j7vZ3GCJgaVJzz1JZ6yc6JAjTl9vhKEU6jOzhsWXZts5pX+
         84fQ==
X-Gm-Message-State: AC+VfDycCsPpn58xQZffm9VgUT6teAV4KjUmPGalGZGGc+P3S7lPwjoM
	si5hXa3Pu6x/6VV5XldoBhdGng==
X-Google-Smtp-Source: ACHHUZ7QUXYkrnHkb0i+q6zk4yZEtJTc2jM2rdWoYHjLfSdxde8JMO4u63TJKBpnd3HN7PadpUGHkQ==
X-Received: by 2002:a5d:4c85:0:b0:307:904b:29e1 with SMTP id z5-20020a5d4c85000000b00307904b29e1mr10675394wrs.20.1683814882088;
        Thu, 11 May 2023 07:21:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a11-20020adfeecb000000b003048477729asm20472093wrp.81.2023.05.11.07.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:21:20 -0700 (PDT)
Date: Thu, 11 May 2023 17:21:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8192e: Rename tmpRegA and TempCCk
Message-ID: <613ae5dd-2b36-4c87-8b6e-959e58d077fd@kili.mountain>
References: <cover.1683730854.git.yogi.kernel@gmail.com>
 <c9c67f832db3a776c04f26e0afb083ae3ba99c07.1683730854.git.yogi.kernel@gmail.com>
 <290473de-5946-49d4-9309-6bebf7cc9873@kili.mountain>
 <ZFz5Lxc/gUTKkLNX@pop-os.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFz5Lxc/gUTKkLNX@pop-os.localdomain>

On Thu, May 11, 2023 at 07:48:23PM +0530, Yogesh Hegde wrote:
> On Wed, May 10, 2023 at 07:56:29PM +0300, Dan Carpenter wrote:
> > On Wed, May 10, 2023 at 08:39:07PM +0530, Yogesh Hegde wrote:
> > > @@ -680,17 +680,17 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
> > >  		return;
> > >  	}
> > >  
> > > -	tmpRegA = rtl92e_get_rf_reg(dev, RF90_PATH_A, 0x12, 0x078);
> > > -	if (tmpRegA < 3 || tmpRegA > 13)
> > > +	tmp_reg = rtl92e_get_rf_reg(dev, RF90_PATH_A, 0x12, 0x078);
> > > +	if (tmp_reg < 3 || tmp_reg > 13)
> > >  		return;
> > > -	if (tmpRegA >= 12)
> > > -		tmpRegA = 12;
> > > +	if (tmp_reg >= 12)
> > > +		tmp_reg = 12;
> > 
> > Not related to your patch (which is fine) but this if statement can be
> > deleted.
> > 
> > >  	priv->thermal_meter[0] = ThermalMeterVal;
> > >  	priv->thermal_meter[1] = ThermalMeterVal;
> > >  
> > > -	if (priv->thermal_meter[0] >= (u8)tmpRegA) {
> > > +	if (priv->thermal_meter[0] >= (u8)tmp_reg) {
> > 
> > And casting tmp_reg to u8 is nonsense so that casting can be deleted too.
> > 2 separate patches:
> > patch 1: delete unecessary if statement
> > patch 2: delete unecessary casting
> 
> Thank you for taking the time to review my patch and provide your
> feedback. Your suggestions are duly noted, and I appreciate your 
> guidance.
> 
> I will make them into separate patches and submit it. 

You don't have to if you don't want to.  We can apply the patches you
sent as-is.  (No need to resend).  This was just in case anyone felt
motivated to do some more clean up work.

regards,
dan carpenter

