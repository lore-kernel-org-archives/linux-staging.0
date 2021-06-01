Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542B772
	for <linux-staging@lists.linux.dev>; Tue,  1 Jun 2021 20:05:27 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q25so360275pfh.7
        for <linux-staging@lists.linux.dev>; Tue, 01 Jun 2021 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=unxYYUIJtzBYSX4MANGuQqbleLprmVLiT5PFu/4IgM8=;
        b=I4Y2WG6Fm0u56jprweWhvuUHM1OeSnYiQyyVI2kWvbTGhM22BtdsOkQBPkjs31huYB
         Mmzi/aCBh+wLAEaOlC30D+9T8IItdg638U/Poy1jQVG4vIMrqd8BLVayZfriNqFUWcoK
         KKhO7ietySBL41WRLIdm0WigKvuKY7tnkbb2lafcRFNZbvEQ5r8N3pzoBH/JPoX3Ux1R
         bpcyWADATVqSHOW07R3fQYLATcL1Tfsfeb4Ry3toczn+qmm4tgYpcLnmw3MtV+oJ2vHI
         fXqk6QJsgD7g04fmJW9t3TY/4eT4k167TNOJX05Q7kUErUl6ewk72PRaenwmnUS1x6+0
         Og5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=unxYYUIJtzBYSX4MANGuQqbleLprmVLiT5PFu/4IgM8=;
        b=Bt3DtYc5yoRxaxGGjTD71g8oUz1XL87Iyci3OuUJMxKII5KDVP7lzgiyO0d6vsniZN
         rZLY688F9QdeaYFQDL5qPa2JPnCUArDmA68rF8XNtG375djMdOhYFXN7+JLw5/Mdtm0o
         XkfPl7u6CEAuZHGNU48E0wsnFw3CtAZQJNbjGKFWnhyAeoChZJ8qOAKmafeB6eyBGg1K
         evootRA9zjEUhBl8qq6jzRDPtW2CHllouGvPe+7Kwna+v9kKznAEpt/Ld/+hw5wmF+YK
         yDEAZ0Gf6wc7DUP0Ovpa9vi1WYAM2b1cfH7N5/UAmrPB/r4hTwciTD844t1Cnw0M3s5m
         HavA==
X-Gm-Message-State: AOAM530q1CWr6ePrNb9uo9rNd5ikNx8JwIwun+WwPmDsK7UeV1yBV8MQ
	FEZORDSXsxV4IvVfIh0HNSQ=
X-Google-Smtp-Source: ABdhPJwxegWvJ6SacBtxU7EltgrnbygfeJpMF1B4eYwaVNQ9R7wOaR6qDVUnnGdIsdi4HMskObkOyg==
X-Received: by 2002:a63:1559:: with SMTP id 25mr30519910pgv.384.1622577926897;
        Tue, 01 Jun 2021 13:05:26 -0700 (PDT)
Received: from ojas ([2405:204:130c:d068:69c0:20e2:ff2e:7df0])
        by smtp.gmail.com with ESMTPSA id z19sm2747045pjq.11.2021.06.01.13.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 13:05:26 -0700 (PDT)
Date: Wed, 2 Jun 2021 01:35:13 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, dan.carpenter@oracle.com,
	phil@raspberrypi.com, bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: staging: vc04_services: Need suggestions on trying to fix sparse
 warning in vchiq_arm.c
Message-ID: <20210601200513.GA10204@ojas>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I was trying to address the following TODO item in
"drivers/staging/vc04_services/interface/TODO" and would love some comments and
suggestions on this:

>  14) Clean up Sparse warnings from __user annotations. See
>  vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
>  is never disclosed to userspace.

More specifically, I was looking at ways to fix the following sparse warning:

	drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1001:26:

	warning: incorrect type in assignment (different address spaces)
	expected void *[assigned] userdata
	got void [noderef] __user *userdata

From my understanding, the issue seems to be that the (void *)userdata local
variable in vchiq_irq_queue_bulk_tx_rx() can be assigned a (void __user *) or a
(struct bulk_waiter *). This makes the assignment tricky since it can either be
a userspace pointer or a kernel pointer.

Right now, we are just ignoring the sparse warning which is essentially
resulting in the __user attribute being lost when we assign args->userdata to
userdata. This can be dangerous as it might result in illegal access of
userspace memory, without any sparse warning, down the line. 

Further, this issue seems to boil down to the fact that the (void *)userdata
field in struct vchiq_bulk (in vc04_services/interface/vchiq_arm/vchiq_core.h)
can, again, either be a (stuct bulk_waiter *) or a (void __user *). To fix this,
I was playing with the idea of modifying this userdata field of struct
vchiq_bulk to be something like the following:

	diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h 
	b/ drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h

	--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
	+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h

	@@ -227,10 +227,16 @@ enum vchiq_bulk_dir {
	 
	 typedef void (*vchiq_userdata_term)(void *userdata);
	 
	+struct vchiq_userdata_or_waiter {
	+		void __user *userdata;
	+		struct bulk_waiter *bulk_waiter;
	+               
	+};
	+
	 struct vchiq_bulk {
			short mode;
			short dir;
	-		void *userdata;
	+		struct vchiq_userdata_or_waiter *userdata_or_waiter;
			dma_addr_t data;
			int size;
			void *remote_data;

I was then planning on modifying all the code that works with
vchiq_bulk->userdata accordingly. I believe this can help us overcome the sparse
warnings, as well as preserve the __user attribute in cases when the userspace
pointer does get assigned here. 

However, since I'm not very familiar with the codebase, I just wanted to confirm
if this is an acceptable workaround and to make sure I'm not breaking anything
or overlooked anything here. I noticed that we also want to make sure that 
bulk_waiter's address is not exposed to userspace. Will it be possible to provide
some pointers on how/where this might happen, so I can see if I can try to extend 
this patch to avoid that.

I would love to hear you suggestions and thoughts on this.

PS: I'm new here so please do correct me incase I missed anything.

Regards,
Ojaswin
