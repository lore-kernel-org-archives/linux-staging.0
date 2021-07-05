Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3172
	for <linux-staging@lists.linux.dev>; Mon,  5 Jul 2021 11:24:48 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id u19so10086991plc.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Jul 2021 04:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7HWSIChMpvUjyne/+iJK2NPPKvcxByEobpjhiLGyCKk=;
        b=bPA/eh65H3IBxzAl/nscoi1CePeGE5JUOHngiDPYOwI161KXtYRyGEqH1FUqqIwLft
         97jn4zqxhljeQ78qtpttp9UGw5flJbhVGQU3RHuB1DIQfgCeuBA5wDhvRy89YcchNRIV
         VQh3kU5ISqOov3FaltGDSNlOIkJg8sFA909+eFzzP9WjJ8ql5LPdT3qqF2AO0JbdClzr
         M1ao4D4ABua/DyW+EJc/nNskJ7n44JmzxOKSdf/uwkRBnklC54/SqvjQoF3uugmLaRp4
         PFXpaN9p6hRAyw5ir03FV4B41Mp2XLgPFUyRxjgrfQJIdB7Hjmc1YIfzEH1Cs0xIlTIJ
         NWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7HWSIChMpvUjyne/+iJK2NPPKvcxByEobpjhiLGyCKk=;
        b=lyGO9EdRPhnLotBAdfCdz0+vnO4FkPkTmzSVYDR0gn6O0Z6yf0tbrVZd6Fymn5XiuA
         W0jZw9sehdp72zIxYekN6l9QEm4h3ezTmjJ/ig8TRaGnqRPCTyygRctOswys0gnUuToN
         ZgdJVMio5ohluahQsFPjRSd+6vVCAQPJ+gu1yWRqiwEJNBPd15bCq0Zh5fvPVoA7PFk/
         QexGFQq5P/hjxdNVkBkTIIQFevuKxzLX2YAFh4O3QM1C7xHbkAUr7CVNeb7gyq2+frvA
         +Dz1Ea6rq+DnVrfI4GqZnZ2TyuihKOpuC10j0JpVJgBmBsHa0PMVNBQeMUJopOYbTSZJ
         lgTg==
X-Gm-Message-State: AOAM530fFV0RRnnIuabvxAmYGmawIqsxf1dv+eYeuwHzpCwZ2jbQjSpZ
	xl+ldz6Iuv4wPHMXmdWXGBk=
X-Google-Smtp-Source: ABdhPJyhdW1IXbRJTGRkQQldq1nzoqRNJAfPauv5zx+jq/5w2S/3Erw0Ek8YX4oIplABIeeZeiFCSQ==
X-Received: by 2002:a17:90b:2307:: with SMTP id mt7mr14580381pjb.131.1625484288340;
        Mon, 05 Jul 2021 04:24:48 -0700 (PDT)
Received: from ojas ([122.177.226.131])
        by smtp.gmail.com with ESMTPSA id c184sm12408849pfa.38.2021.07.05.04.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 04:24:48 -0700 (PDT)
Date: Mon, 5 Jul 2021 16:54:34 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kbuild@lists.01.org, nsaenz@kernel.org, lkp@intel.com,
	kbuild-all@lists.01.org, gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com, arnd@arndb.de, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] staging: vchiq: Move vchiq char driver to its own
 file
Message-ID: <20210705112409.GA42167@ojas>
References: <3b7178086322f774772d95141764ed99d0698139.1625401927.git.ojaswin98@gmail.com>
 <202107051622.6i1l1vdL-lkp@intel.com>
 <20210705105804.GA41070@ojas>
 <20210705111944.GH26672@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705111944.GH26672@kadam>

On Mon, Jul 05, 2021 at 02:19:44PM +0300, Dan Carpenter wrote:
> On Mon, Jul 05, 2021 at 04:28:04PM +0530, Ojaswin Mujoo wrote:
> > Hello Dan,
> > 
> > On Mon, Jul 05, 2021 at 12:56:09PM +0300, Dan Carpenter wrote:
> > > Hi Ojaswin,
> > > 
> > > url:    https://github.com/0day-ci/linux/commits/Ojaswin-Mujoo/vchiq-Patch-to-separate-platform-and-cdev-code/20210705-000124 
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git  77ad1f0e99bd00af024e650b862cfda3137af660
> > > config: i386-randconfig-m021-20210705 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > 
> > > smatch warnings:
> > > drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:1235 vchiq_release() warn: argument 3 to %lx specifier is cast from pointer
> > > 
> > > vim +1235 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> > > 
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1227  static int vchiq_release(struct inode *inode, struct file *file)
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1228  {
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1229  	struct vchiq_instance *instance = file->private_data;
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1230  	struct vchiq_state *state = vchiq_get_state();
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1231  	struct vchiq_service *service;
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1232  	int ret = 0;
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1233  	int i;
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1234  
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04 @1235  	vchiq_log_info(vchiq_arm_log_level, "%s: instance=%lx", __func__,
> > > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1236  		       (unsigned long)instance);
> > > 
> > > This should eventually be converted to %p so it doesn't defeat KASLR.
> > > (Not that we really care on raspberry pi, I think?)
> > Yes, that does seem right, however, this patchset only moves the code from
> > vchiq_arm.c to vchiq_dev.c and I've not really touched any of the
> > existing code itself (Except moving it to a new file which is why it shows up
> > in the patch). 
> > 
> > Hence, I'm not sure if this fix is in scope of this patchset. (I also
> > have a similar warning by kernel test robot here [1] which and I'm not
> > sure if I need to act upon). Maybe we can look at this in a separate
> > patch?
> 
> Yes.  Correct.  Don't mix this into the patch, do it "eventually".  Or
> you don't have to do it at all since it wasn't something you introduced.
> Someone will check the driver for Smatch warnings before it can be moved
> out of staging.
> 
> (I just forwarded the kbuild bot messages for informational purposes
> only).
Ahh okay, got it.

Thanks,
Ojaswin
> 
> regards,
> dan carpenter
> 
