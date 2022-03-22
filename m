Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8289AA31
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 09:09:27 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v22so10055960wra.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/1rlicvjRZ8VsB2zz7DEBNteWHvxmtIGKnriEjiwbXo=;
        b=EWucjHmK90N5Kw9y229FrvTX2t9MS+0MLqUzxnovTe9p8dGNnikFtOKNwIAMpyUq3a
         ZRZTb3RquMTnDOhdAFKPP4yXurRXDHgM7xlTAho1O+ZCJKlPImUm+8goPdEQcqMf5Ghl
         ymz9Lxv5xFCTW3fVx1IsqpTZ4e7VNAiWAhuPrBpDi0l09llTfqEmeoD7GWzYYPwPrOIY
         nUOvGUhMKo866OeMIkVCyDNNo53thokSlLRiNbBx7XKuQ0UdyyTHdFP3BR3LplTe8C0t
         FY0XDKW1/kDJ7txrsrd+S3fMmqGbCcKIN/73BUNvbrMlOhypccEwY8JVEJrDvZEDpmnX
         JVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/1rlicvjRZ8VsB2zz7DEBNteWHvxmtIGKnriEjiwbXo=;
        b=D4hACt3Gh/tfRtcyhg+yejlc8/c1h/i+K7HnIpYGttnMYTeIrjBmlDojHgJ2QgqVSe
         dxvkOb+w2P+9h5MJClLgFYYMdKuK1kh5JduB37kioRWyaj3h0Ty1BpjARqug351Y4udf
         pFqfJ579nI/0lClS4UM5bQ2l5BA1uwAoKFIyewjvr1qdrvecL0lyL/ic3uMLLI00mE0A
         Iss6KuQx1+ZU917RupKxdHF8XN09s+/tYb8b8HzrYduijgmOEcE1oAQICvJmXonLYIAE
         FGSngNM0HnTC3/675G22fNOnrxBF34u3Y49BU9/WnOptXeQ8XsagwPDKHbgFmW2or9WG
         YaSQ==
X-Gm-Message-State: AOAM530o98qdwQAsGGwBY26hw1trpuCnDpQVF8M7ggIq7nPr9C2vyCL0
	QM1Gc3Nmv8xPYjgs2jnKBbU=
X-Google-Smtp-Source: ABdhPJxEcA1X9hNexTw4rh6b8gunWxPhay6h57jxYz26xCAhQsbReprjuVb694nQ8O72PDkHUMBTmQ==
X-Received: by 2002:a5d:6b0f:0:b0:1e7:9432:ee8c with SMTP id v15-20020a5d6b0f000000b001e79432ee8cmr20895553wrw.216.1647940165623;
        Tue, 22 Mar 2022 02:09:25 -0700 (PDT)
Received: from leap.localnet (host-79-37-100-169.retail.telecomitalia.it. [79.37.100.169])
        by smtp.gmail.com with ESMTPSA id v8-20020a1cf708000000b0034d7b5f2da0sm1436402wmh.33.2022.03.22.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 02:09:24 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: unisys: Properly test debugfs_create_dir() return values
Date: Tue, 22 Mar 2022 10:09:22 +0100
Message-ID: <3166283.44csPzL39Z@leap>
In-Reply-To: <20220322084928.GM3293@kadam>
References: <20220322083858.16887-1-fmdefrancesco@gmail.com> <20220322084928.GM3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On marted? 22 marzo 2022 09:49:28 CET Dan Carpenter wrote:
> On Tue, Mar 22, 2022 at 09:38:58AM +0100, Fabio M. De Francesco wrote:
> > debugfs_create_dir() returns a pointers to a dentry objects. On failures
> > it returns errors. Currently the values returned to visornic_probe()
> > seem to be tested for being equal to NULL in case of failures.
> > 
> > Properly test with "if (IS_ERR())" and then assign the correct error 
> > value to the "err" variable.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/unisys/visornic/visornic_main.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
> > index 643432458105..58d03f3d3173 100644
> > --- a/drivers/staging/unisys/visornic/visornic_main.c
> > +++ b/drivers/staging/unisys/visornic/visornic_main.c
> > @@ -1922,11 +1922,11 @@ static int visornic_probe(struct visor_device *dev)
> >  	/* create debug/sysfs directories */
> >  	devdata->eth_debugfs_dir = debugfs_create_dir(netdev->name,
> >  						      visornic_debugfs_dir);
> > -	if (!devdata->eth_debugfs_dir) {
> > +	if (IS_ERR(devdata->eth_debugfs_dir)) {
> 
> Normally I would say to just delete the error handling.  But in this
> case you can delete the whole devdata->eth_debugfs_dir and the related
> code.  It's not used at all.
> 
> regards,
> dan carpenter
> 
Dear Dan,

I think that you are right and the whole thing should be deleted. There are 
a couple more of these kinds of bad error handling in the Unisys driver.

However, soon after sending this patch I noticed that David Kershner email
account at unisys.com is not working anymore. Furthermore, I am recalling
that in 2021 I made a conversion from IDA to XArray for the whole visorhba
driver and nobody at Unisys replied. After one month in queue, Greg decided
to apply my patches while noticing that nobody from Unisys cares.

In summation, probably I'll follow your suggestion for this case and the
other bugs that I was about to fix but I'm not sure at all at the moment.

What I mean is: if people at Unisys don't care, why should I?

Thanks for your review, Dan.

Regards,

Fabio M. De Francesco

P.S.: I found this and the other bugs in this Unisys driver with the help
of Smatch. Thank you for this precious tool :)



