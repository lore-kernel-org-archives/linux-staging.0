Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2A2C85
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 17:31:48 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id o14so1896518plg.5
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NtXayfTUJqN0+HnL18EFdYPTjw8r+9ANxCl9WnYlDq8=;
        b=Voisx85ftQ9ebXLfKeWT0X2TDAchK9ZJ5g6bI2MkUr27Rms+2MCI5wdkc9NM+aI3L7
         PIod2Fxk6BGbz/JSbHuIpVOuAAa1wkx6btD6dNUf00nU/Ucfk22S0T/fndYSvrOEnsIS
         wlvk6doBhqvOEuuQoukZ44SDZSoatTrTma/IeW+Ju3/3ktTACSFVZgx//Eezf8Xmh2Nx
         dOhk8v3NSeFo/pOfqDUyCSgd4nwiIAGmKMqkUpXeFnOTyhjRw8nczRX0g9Vo8hQI8+o1
         +P6UY/TJo2rBYhNeoEJpDx5xSDSViK5elD12VITHXChm7D5an8+tjbTqDjUWHtDMmfZ9
         Uz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NtXayfTUJqN0+HnL18EFdYPTjw8r+9ANxCl9WnYlDq8=;
        b=zDqrGGJl7li4mRmbV5j3R8btnspeylTRy55wMSTijvPaZe/v0WKQQxVOh3Vnx9JR5X
         sQpfs6SkwJA6JXLRBmxgxc5TcrAS6RL4Nuz/hd5wMPAAy3xBG8b8EMqCBkgszjZxWqt5
         nbNiNnuNvblnCni0F+y1gMlVCr9bUyQEZIVMwrK5GKKPgS8bnBgxDHzNG3/UyZejEJEg
         I0Z3x1Aq6BXRPidbOHbDk9iXWCA0zAp89yVOjLE3QVxvy+sLFNqDepwaXSr00G27hAQh
         L5xZiDmh6/kYYGpltz/pyQeLfCfL5PZvVDlhbrlh1BFlzVtcGuqwRh5rxZPdTwtQszB7
         8mwg==
X-Gm-Message-State: AOAM531ghf1s69FkVKSYqJ0zVRiw4w+0oVs0RfOSO8qgD/vzNToOVTJk
	XMsKj1gCo28HaJHGhfNnXuc=
X-Google-Smtp-Source: ABdhPJxcYS501VmNX6gHmkSUboOHq80KnozPWaDUu/SJ7HdJd6F2DxV0pqHKuSXV2xOvQuTdkccByg==
X-Received: by 2002:a17:902:bd94:b0:13f:f96c:aa22 with SMTP id q20-20020a170902bd9400b0013ff96caa22mr26544710pls.43.1635787908362;
        Mon, 01 Nov 2021 10:31:48 -0700 (PDT)
Received: from ojas ([122.161.50.72])
        by smtp.gmail.com with ESMTPSA id ls14sm77889pjb.49.2021.11.01.10.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 10:31:48 -0700 (PDT)
Date: Mon, 1 Nov 2021 23:01:21 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: nsaenz@kernel.org, gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: vchiq: Replace global state with per device
 state
Message-ID: <20211101172843.GA17771@ojas>
References: <cover.1635764115.git.ojaswin98@gmail.com>
 <5b51970f601c4bf5165fc70174085a809b3c0316.1635764115.git.ojaswin98@gmail.com>
 <84300618-98c8-0f44-e5a5-8d7fd6c853b0@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84300618-98c8-0f44-e5a5-8d7fd6c853b0@i2se.com>

On Mon, Nov 01, 2021 at 01:19:17PM +0100, Stefan Wahren wrote:
> Hi Ojaswin,
> 
> Am 01.11.21 um 12:09 schrieb Ojaswin Mujoo:
> > Currently, the driver has a global g_state variable which is initialised
> > during probe and directly used all over the driver code. However, this
> > prevents the driver to support multiple VideoCore VPUs at the same time.
> >
> > Replace this global state with a per device state which is initialised
> > and allocated during probing.
> >
> > Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> ...
> >  
> >  /*
> > @@ -1763,6 +1795,7 @@ static int vchiq_probe(struct platform_device *pdev)
> >  	struct device_node *fw_node;
> >  	const struct of_device_id *of_id;
> >  	struct vchiq_drvdata *drvdata;
> > +	struct vchiq_device *vchiq_dev;
> >  	int err;
> >  
> >  	of_id = of_match_node(vchiq_of_match, pdev->dev.of_node);
> > @@ -1784,7 +1817,18 @@ static int vchiq_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, drvdata);
> >  
> > -	err = vchiq_platform_init(pdev, &g_state);
> > +	vchiq_dev = kzalloc(sizeof(struct vchiq_device), GFP_KERNEL);
> > +	vchiq_dev->state = kzalloc(sizeof(struct vchiq_state), GFP_KERNEL);
> > +	vchiq_dev->vchiq_pdev = *pdev;
> > +
> > +	g_state = vchiq_dev->state;
> > +
> 
> just a quick idea: how about storing the global state within vchiq_drvdata?
> 
> So there is no need to reinvent somekind of vchiq device which is the
> "same" as the platform device. After that you are able to access the
> private driver data via platform_get_drvdata().
Hi Stefan, 

Thank for looking into this. I agree that the vchiq_device is just a
sorta extension of the pdev. However, regarding using the drvdata, I had
some questions.

So I understand the purpose of this patch is to make sure our driver is
able to support multiple devices, that is it can work with say, an SoC
with 2 VideoCore VPUs. In this case, we would need to maintain 2 states
for each VPU instead of a global state, however if we use something like
the following:

 	drvdata = (struct vchiq_drvdata *)of_id->data;
  drvdata->state = kzalloc(sizeof(struct vchiq_state), GFP_KERNEL);
	platform_set_drvdata(pdev, drvdata);
		
Correct me if I'm wrong but I think the assignment to drvdata in line 1
above will return a pointer to the same structure. In which case, the
line 2 will always overwrite the older state that is present. 
That's why I was initialising a separate object (vchiq_device) everytime
the probe was called so that each device can have their own device
specific structs. 

Please let me know if my understanding of drvdata is wrong here.
> 
> Best regards
> 

Thank you!
Ojaswin
