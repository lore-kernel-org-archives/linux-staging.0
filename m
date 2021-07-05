Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47C872
	for <linux-staging@lists.linux.dev>; Mon,  5 Jul 2021 10:58:17 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id mn20-20020a17090b1894b02901707fc074e8so11260899pjb.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Jul 2021 03:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TS5725BMQ0gKTaaRgTF2dpCMOSOYoKyPmGmSv9N+v5s=;
        b=q6FxVJ0dJy7lazmhe+1rZ3CgvAlLA66cQFTv6qVfww3zQ5mf6UpwZmgA+l6UvMWqyK
         hNU+O5GKNzofInBtJOneWyrcSRVm+KBB5me0/udCDLq89GtSOBcf8pOFMLuXsl+edomV
         0w9YZzfiksxizixHFErivxdXVwLRW4FU9IdsMXwfU0+osN1H+EEQu0NzDFi8oyp9DehN
         3hWz38gIByHT06yo3Iwzxbgb5xz5NT+tjsqxhrg+lNipnmDtfXH6DJli3sLaXQAihmVT
         jFnaOToyKIdLh10DsOn6lvwwY9geYgFVTCTniqrP9G/8RMSOMjN1fP3QyqQhSAy4YasU
         ssQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TS5725BMQ0gKTaaRgTF2dpCMOSOYoKyPmGmSv9N+v5s=;
        b=edhdyH909xMiMMAD2DQbkME6CO8tCphmekzDtYGE2RQDElw79BfDKsOr53sNz/+JUp
         MrZRHJWDWU2SYsFIrIJJeEHY/8SLNoFWhPbFklKksctyxKZaXu4Lrr+A/YNbTIyOxksT
         AVntbr0aDWF9u41sZY0z85I2WoKa5UlwOVKHr5Q814YODGHMmJ4t6wKV0uzLnlkob5+Q
         Gsj2F2PeBBxwWZI0d/s0nMKuNuOA8QbUs86AOfqR3vdOmJT5DEj9Dut/4aTFjyK0haTD
         YE+Ya5to+9s8EQyol7buSMQEbjghQV2TXXQdE3vG0vSH5gZSUTxcKbUbffRVc5GqLlvm
         /goA==
X-Gm-Message-State: AOAM532LqSWCZwrL3HYDgC+1GyxkhlTzPHHYPPWuh1LoNGGPwI/0DZiu
	X/JpYOiP+RRBF9MEWfNWUk0=
X-Google-Smtp-Source: ABdhPJwo4miumHlV9SzFxEreIAG6c8AlmvbD4WrmSza2hsZ++IT8CQauoy2cJDMiVS489a13jj0S2A==
X-Received: by 2002:a17:90a:d598:: with SMTP id v24mr14189644pju.185.1625482697293;
        Mon, 05 Jul 2021 03:58:17 -0700 (PDT)
Received: from ojas ([122.177.226.131])
        by smtp.gmail.com with ESMTPSA id c2sm21335050pjc.40.2021.07.05.03.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 03:58:17 -0700 (PDT)
Date: Mon, 5 Jul 2021 16:28:04 +0530
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
Message-ID: <20210705105804.GA41070@ojas>
References: <3b7178086322f774772d95141764ed99d0698139.1625401927.git.ojaswin98@gmail.com>
 <202107051622.6i1l1vdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202107051622.6i1l1vdL-lkp@intel.com>

Hello Dan,

On Mon, Jul 05, 2021 at 12:56:09PM +0300, Dan Carpenter wrote:
> Hi Ojaswin,
> 
> url:    https://github.com/0day-ci/linux/commits/Ojaswin-Mujoo/vchiq-Patch-to-separate-platform-and-cdev-code/20210705-000124
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 77ad1f0e99bd00af024e650b862cfda3137af660
> config: i386-randconfig-m021-20210705 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:1235 vchiq_release() warn: argument 3 to %lx specifier is cast from pointer
> 
> vim +1235 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> 
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1227  static int vchiq_release(struct inode *inode, struct file *file)
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1228  {
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1229  	struct vchiq_instance *instance = file->private_data;
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1230  	struct vchiq_state *state = vchiq_get_state();
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1231  	struct vchiq_service *service;
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1232  	int ret = 0;
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1233  	int i;
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1234  
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04 @1235  	vchiq_log_info(vchiq_arm_log_level, "%s: instance=%lx", __func__,
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1236  		       (unsigned long)instance);
> 
> This should eventually be converted to %p so it doesn't defeat KASLR.
> (Not that we really care on raspberry pi, I think?)
Yes, that does seem right, however, this patchset only moves the code from
vchiq_arm.c to vchiq_dev.c and I've not really touched any of the
existing code itself (Except moving it to a new file which is why it shows up
in the patch). 

Hence, I'm not sure if this fix is in scope of this patchset. (I also
have a similar warning by kernel test robot here [1] which and I'm not
sure if I need to act upon). Maybe we can look at this in a separate
patch?

[1] https://lkml.org/lkml/2021/7/4/138
> 
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1237  
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1238  	if (!state) {
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1239  		ret = -EPERM;
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1240  		goto out;
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1241  	}
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1242  
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1243  	/* Ensure videocore is awake to allow termination. */
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1244  	vchiq_use_internal(instance->state, NULL, USE_TYPE_VCHIQ);
> 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1245  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

Thank you for looking into this,
Ojaswin
