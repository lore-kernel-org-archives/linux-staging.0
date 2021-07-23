Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D7173
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 12:59:14 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so8776422pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=admFING+RTwbfb4knH3wY0aguWQ8mq91cUYAMzqn6ZY=;
        b=WDOtDkjiFEClp/1dGC+DmEeghNPtOkKgH+2CbbTqLzl86nXh39DjrOL29GlO2l0YpE
         tSqt59ExJJhqIuLls0zBfNdulOX/TCK/CRRZDtfb9S03gYNmfymoT45hfp+U8+MNQEBO
         Z7BghqfiPc24awdBF28qCON6SqJa690UZ2v0tYadUAF8V3rTHsoT8jfdnUTFLBzVRDUo
         RO9XbimJJiXBEzE0zKZ3FfyHBVIJ5DXzt1azyCFinR80CVFBxOenwANpfsmtuemzFMTV
         bbOP+fYYaZlEJlsn7CE6a5kAnF61WK1cawtGhqO48RwnAeBNzMs+WDczu8ZieiB23sPv
         AUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=admFING+RTwbfb4knH3wY0aguWQ8mq91cUYAMzqn6ZY=;
        b=RQIwIYnzESM25lVYlDS8ey8MAtZ+y8kc0YFa8L1V0s1L64VchRUjKo+65SbuIvWtvB
         /8js2C3CxrdvGorjC4Hmar/ZlEg797RBfOx6ZJ6PW/1Z3nSRMdFpG5K30b2+FmU0UiBW
         3xnKxLdckMeybZwgJLPZbNCbY8zOr3GHsECLQXyOtLpelGUYzJhuWuanQHBK6/uhbBRL
         VgBC+Ebid0KaJ75LZAwg5Z8MtB9hwVNVhAwQcmfnnJQUcFeqAlXf87tzy5jMxVIE83pe
         AL3yY046OOtVvBLc9dqiQbtyWCIVucxQmnGkXvpyz9KydxTUQlYLMLtrhFMZ9jB5R7pz
         +yJA==
X-Gm-Message-State: AOAM533u8HfDHXyB0nbXTgmgyaiHn8KF7i6kKqycGj6P5/Q0EQangp08
	VNBMXcW1ghHA+SSi3axcpjo=
X-Google-Smtp-Source: ABdhPJwDFkxQliqpPV+ayjxdoyQilsjLkT4M0H0k1VhO6v+eON3/S4gIfLAe7fgx9iUJA/6Fj6CJQg==
X-Received: by 2002:a63:a1c:: with SMTP id 28mr4660873pgk.445.1627045153855;
        Fri, 23 Jul 2021 05:59:13 -0700 (PDT)
Received: from ojas ([122.161.50.107])
        by smtp.gmail.com with ESMTPSA id k4sm27967694pjs.55.2021.07.23.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 05:59:13 -0700 (PDT)
Date: Fri, 23 Jul 2021 18:29:00 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] vchiq: Patch to separate platform and cdev code
Message-ID: <20210723125900.GA279903@ojas>
References: <cover.1626882325.git.ojaswin98@gmail.com>
 <YPqh0SHa8n3BugnB@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPqh0SHa8n3BugnB@kroah.com>

On Fri, Jul 23, 2021 at 01:02:41PM +0200, Greg KH wrote:
> On Wed, Jul 21, 2021 at 09:50:48PM +0530, Ojaswin Mujoo wrote:
> > Hello,
> > 
> > This patchset adderesses the TODO item number 10 specified at:
> > 
> >     drivers/staging/vc04-services/interface/TODO
> > 
> > For reference, the task is:
> > 
> >     10) Reorganize file structure: Move char driver to it's own file and join
> >     both platform files
> > 
> >     The cdev is defined alongside with the platform code in vchiq_arm.c. It
> >     would be nice to completely decouple it from the actual core code. For
> >     instance to be able to use bcm2835-audio without having /dev/vchiq created.
> >     One could argue it's better for security reasons or general cleanliness. It
> >     could even be interesting to create two different kernel modules, something
> >     the likes of vchiq-core.ko and vchiq-dev.ko. This would also ease the
> >     upstreaming process.
> > 
> > A summary of the patches is as follows:
> > 
> > - Patch 1: Move cdev init code into a function
> > - Patch 2: Shift some devlarations from vchiq_arm.c to vchiq_arm.h for
> >            sharing
> > - Patch 3: Move vchiq cdev init code from vchiq_arm.c into vchiq_dev.c
> > - Patch 4: Decouple cdev code by defining a Kconfig entry to allow
> >            optional compilation of it.
> > - Patch 5: Merge code in vchiq_2835_arm.c to vchiq_arm.c
> > 
> > Changes since v3 [2]:
> > 
> > * In Patch 5, replace forward declarations of some of the functions with
> >   function definition 
> 
> You dropped the reviews of others, so now I need to wait for them again
> :(
> 
Hello Greg,

Apologies for that, I was under the impression that a new version
needed a separate review :(

If its okay, I can alternately resubmit this (as v5?) with Stefan's
Reviewed-By tags on unchanged commits intact. Let me know if that's okay
or if its better to wait out.

Thank you!
Ojaswin
