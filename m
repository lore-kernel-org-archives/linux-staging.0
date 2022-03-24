Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FB01B93
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 09:20:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b24so4842159edu.10
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wUxU3fOD5HvLRSIgRUZrOG93Jscp2CK4Bk5FgxkJpUs=;
        b=I0f7XIFUmiIz6T697ESW/6vQEHTCQR/9iqVii1Nu5YP2M/w1xM8JFezUeoDTA3NS94
         wm+3sKh20V8YgFadenrWLm2evSLbF6u6oi5/2eLfCRQI3ixaJDsvn6FmISO1sp+nl/gg
         0qPd4JuOfjA3UZsvBQWsqTd4Z1Rv2946U24xNHJRl8oM8FLnpp7k4x9f7VS78tpOH//8
         pXgio5iQRHjZdZkJqQbPJN4tscUgS9yXepEC57kLQWK8cfnrhVHCpvLtvER6JHdwC0i6
         nVlQDXvL9NNapHXnNp1UiNzQLYcK7ARo/xgQuNX/UCc088UgdvAO2KHlXnIvPrso2UGJ
         kQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wUxU3fOD5HvLRSIgRUZrOG93Jscp2CK4Bk5FgxkJpUs=;
        b=D/2cQWcM1iclN8Q/XRdkl+0EFOJB2Ue6Tw5rAbJW6/OB3aiclAkV+ZoknLuVCz95Ax
         NyKqpt3s3vZ7w4uC865E5J5cVwZfxHqs6b0ZtguvQM/pAQyPEEy9BI2li13nXDhSG50G
         1rksd4ehudKctj5Am44htH/YdxJEWfXWAh7kvYUuONLTL3LHlqxqgTG3NnBsKzGWY9PW
         Uk7DwfqLvxE7aiqwYuwVqea+K4Phuyql0NnygM+qeoTy0EFBP1HlGfCzSMYlWH9J3wbI
         kjKdNT8whfmUN+HCD+VVi/QlAgrCGK4tUoPyxfMYmgfb4L5+VO/Uy13eWYVUhtvFuA35
         Q1Gg==
X-Gm-Message-State: AOAM533w5LUWGgcWGZxopqVI3WdsKmMIWmYzoWsnOJwiz1M2KDFRj4V4
	6LXjFFQuOXyDtIcqUt1vwCc=
X-Google-Smtp-Source: ABdhPJxNBk5JbP3n28V5DXRcTZC07vtWRCQie1QiNDHq9oGOareElYrBOfNi6xqMhs2W7xjFU9pIGg==
X-Received: by 2002:a50:99cd:0:b0:418:d6c2:2405 with SMTP id n13-20020a5099cd000000b00418d6c22405mr5469314edb.342.1648113619282;
        Thu, 24 Mar 2022 02:20:19 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm1125552edb.14.2022.03.24.02.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 02:20:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Kershner <david.kershner@unisys.com>, sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: unisys: Properly test debugfs_create_dir() return values
Date: Thu, 24 Mar 2022 10:20:15 +0100
Message-ID: <3480204.R56niFO833@leap>
In-Reply-To: <YjmNIX4RsbG8LpyF@kroah.com>
References: <20220322083858.16887-1-fmdefrancesco@gmail.com> <YjmNIX4RsbG8LpyF@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On marted? 22 marzo 2022 09:47:29 CET Greg Kroah-Hartman wrote:
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
> We really shouldn't be checking this value at all.  There's no reason to
> check the return value of a debugfs_* call.  Can you fix up the code to
> do that instead?
> 
> thanks,
> 
> greg k-h
> 

Yes I'll do the work that you requested by this weekend, notwithstanding 
what I replied to Dan. 

While I reiterate all my considerations, it seems that, if not the people 
from Unisys, someone else still cares about this driver :)

Thanks,

Fabio



