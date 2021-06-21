Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164071
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 14:22:37 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id w31so14301136pga.6
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8L+cd+ZQnTliBnbuqbahlYKMU/bFlGdaEWT+XDryuZI=;
        b=dDIxGFZonS5d2guwsqbUn2ZNdVnahSjKxnJNiJ2rDNoD8zO8Jk0pUBBIAWfU3PkRPH
         KuFeaDX33DXkPKL/5wJCUaMyaYDyC+RDoYasJymcxt68eNG69MeQei7wGMSk9S8FYP0k
         VMyIVd1WlDqNOTkQZDQVqlUuXCqEXCUZEIDkH+u/JJKbuvJQqKCZ1Yr60pm7+gT6Ra9L
         fNj24dLytBMmOz0TRnxMuIsGRkG59I3GALaGaxtF0Vmhk1KhcWXcxTNMjJdOAvK3nlIU
         Je8nYmTxMYaiOxR+Xw6+myXxmoyuoXDSJ4vcpacn6Dw9jJg/QrLiOKyAD5ygpjr+XHYM
         1Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8L+cd+ZQnTliBnbuqbahlYKMU/bFlGdaEWT+XDryuZI=;
        b=jaPpLCig+SaZWmzfsQoYJlK96u7Hg/bEu9/jq7fSF12RIliJ6kOgEw441SLjiiMMjM
         Ph6gGOI6JsEEL7Nk3YrQukQaEp145Cgs7NTe9Z8oIj28gkTNNjK2oQzV2wpadvyZ0GuS
         4GYLC/wlVY88ej+lzNznBVE3C1KCHRsCf4YT8Wjeo6jO8mq3KPDxgdGbFwKfo3SgZXli
         /AbLaKaPaG/qWTvZ8RFIpodBB9mhiyr0hUAw7fpPCO3fSD93VNOTdcT1CH5++7UiPa4F
         dBDkfzkh0a0zAahbx9A7Iz3PsQgUSRfPOyG6evpgoweq+mNsez4+65DAS/ZK/IWJviit
         J0cQ==
X-Gm-Message-State: AOAM532UQPmLHF88Jqh9NTEn1cLortD7WMAyVCgwOAP0cguCFlCgaLSC
	2bw1zZd2OvqILmCi/tx7HoU=
X-Google-Smtp-Source: ABdhPJzZ6AmPiFqoTJcZ4tUQRgeJ1RJjJAfN/W5xkONC67cFCSfCwrZunMX6TFVg9VAcgVbj4ZSUEQ==
X-Received: by 2002:a63:185b:: with SMTP id 27mr24580741pgy.164.1624285357096;
        Mon, 21 Jun 2021 07:22:37 -0700 (PDT)
Received: from ojas ([122.177.154.120])
        by smtp.gmail.com with ESMTPSA id v4sm17119750pgr.65.2021.06.21.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 07:22:36 -0700 (PDT)
Date: Mon, 21 Jun 2021 19:52:26 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nsaenz@kernel.org, gregkh@linuxfoundation.org, stefan.wahren@i2se.com,
	arnd@arndb.de, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] staging: vchiq: Refactor vchiq cdev code
Message-ID: <20210621142226.GA186979@ojas>
References: <cover.1624185152.git.ojaswin98@gmail.com>
 <e786f8c7f92561065b840490c32959932526dac6.1624185152.git.ojaswin98@gmail.com>
 <20210621082132.GC1901@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621082132.GC1901@kadam>

Hello Dan,

On Mon, Jun 21, 2021 at 11:21:32AM +0300, Dan Carpenter wrote:
> On Sun, Jun 20, 2021 at 06:25:46PM +0530, Ojaswin Mujoo wrote:
> >  	vchiq_debugfs_init();
> >  
> >  	vchiq_log_info(vchiq_arm_log_level,
> > -		"vchiq: initialised - version %d (min %d), device %d.%d",
> > -		VCHIQ_VERSION, VCHIQ_VERSION_MIN,
> > -		MAJOR(vchiq_devid), MINOR(vchiq_devid));
> > +		       "vchiq: platform initialised - version %d (min %d)",
> > +		       VCHIQ_VERSION, VCHIQ_VERSION_MIN);
> > +
> > +	/*
> > +	 * We don't handle error here since the function handles
> > +	 * cleanup in cases of failure. Further, we can proceed
> > +	 * even if this function fails.
> > +	 */
> > +	vchiq_register_chrdev(&pdev->dev);
> 
> I feel like ignoring errors and just continuing seems helpful, but it's
> actually doing the users a disservice.  If it's an error during, boot
> that's different, in that case it's better to get some kind of minimally
> useful boot so the user can debug the problem.  But if the error isn't
> going to prevent the system from booting then it's better to just return
> an error so they can fix the problem and try again.
Got it, I'll fix this in the next revision.

Thank you,
Ojaswin

> 
> regards,
> dan carpenter
> 
