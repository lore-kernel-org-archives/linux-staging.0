Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5ED2F30
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 13:43:13 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso4693714wmb.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 05:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jEKlc7EVkMTyYRdqj3rbiRpltknwQ/iRQcgvilfGEVk=;
        b=Xnbv9GetmPU3k7D9txxrfvm6RhKW2pA0FRS9yIaKTAA5NEzAa5qLiDTCE7qVfPDhvd
         ixxgqIaqgEOIDFshihrfKp4H0h0Nj9Duh+rmGF6epE3RKJx5+GUbdelPuY30PSN4VnZQ
         agXN1OYcLFY+WY0T32+EO57VZc8hAAv+nAnAvxi6GNuWz9CAtUJhHJpdWqH+RRs6eMFN
         hjSdKsCRsoH4+PDVRI7NjrAyVHTt0Qi+4LWeVa8WcAgAgtOV5k7VAQz73m2s1lNAvPrO
         g3D1VQqOUaw+PDu39giScWT37vv+WTkWGJ9yrWLQZIY+MbHaFiQLrYYeHtTd0LLPmH42
         Alwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEKlc7EVkMTyYRdqj3rbiRpltknwQ/iRQcgvilfGEVk=;
        b=SJs6QnPb/LHs/v3x+mamw1+Ni3bFtrHTydwm6u+sYPDWkuqu/Q5GIa1oKQErz8lxbA
         v4qq6EzCpnb+CcL0LcsRTjsEzFVsz4WG6D6ZF7fbx0orxlHkkJfTyNBR2ZYWqgFGHLUM
         OFRbg8VxmbfSq2tvRNz40Mj66RNRrcOVfuoh8yjv6U8hl8NH+IOZB8qzWF+kXcJJqi6s
         6F/dKEP3OFmqdtzMbff+K+1jQEc2reOfGVFrPgp6Bbpvs4w95XSMPOFFnzveXgPpZJyu
         Vfz4G4ut0va2Hqb41BuWhaEmlok1O2VD0LqmdIM41GtqDUsNaUKKu6Ammp5mQDdzCYkm
         521A==
X-Gm-Message-State: ANoB5pnKzj1Aw9D+nqvAIhzxYH0Gb/cKHlfZmLAUr+2diqoBAT8hh8Zj
	ti9ezWUhimMSO/gdr7VOwbw=
X-Google-Smtp-Source: AA0mqf4+miOhM3yrbQCqnvEiW1biBNyVqqTa4zHXnXk7SgJWgim9YLDjTWKM89LvFSndCFHjwW7xWw==
X-Received: by 2002:a05:600c:314f:b0:3cf:9efc:a9b7 with SMTP id h15-20020a05600c314f00b003cf9efca9b7mr1824559wmo.10.1668692592112;
        Thu, 17 Nov 2022 05:43:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l29-20020a05600c1d1d00b003c6d21a19a0sm1514748wms.29.2022.11.17.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 05:43:11 -0800 (PST)
Date: Thu, 17 Nov 2022 16:43:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/2] staging: vc04_services: mmal-vchiq: Do not assign
 bool to u32
Message-ID: <Y3Y6bEHCzh3yCcS4@kadam>
References: <20221117125953.88441-1-umang.jain@ideasonboard.com>
 <20221117125953.88441-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117125953.88441-2-umang.jain@ideasonboard.com>

On Thu, Nov 17, 2022 at 06:29:52PM +0530, Umang Jain wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> struct vchiq_mmal_component.enabled is a u32 type. Do not assign
> it a bool.

It's not a u32 type so this is wrong.

	u32 enabled:1;

But also "true" is better than "1" in terms of a human reading the code.

Perhaps this is from a static checker?  I am also the author of a checker
tool so I know how stupid they can be.  When the checker says something
dumb, then the correct response is to be be briefly amused and not to
slavishly obey it.

regards,
dan

