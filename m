Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E135223B6
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 07:59:00 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id s68so12292979pgs.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Jun 2022 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yXfk+pV14N8uRHKyKDyfNelIYS7BHAUOLYy6g/CrD/Q=;
        b=oN5ZTX/u0mjNJXsVTHRx05wP3sAoWHsew7muqi3kK4IDOlcQe79pIP7h7A5UEJS4uZ
         lCI/GOCyaU1c+i8rQ4Jv204cN9b+vi8F6PbG/oqlB05fUs2jKfiUEu8FZktISIeJe+vf
         g2dAMBWeIVMfdoS6xZSdMo3JS6jiRnRPAK9RCWYZd9lFCZF4Xyls2EoejoOcidxuZOKz
         TP6P9mZponxwgy2Rrr74FTy2wY75EXwO4a+zC0QCiB1cw1vCiP4e610fgDBez+rEbOo0
         cKd6feG6sNOiv8P/aFOUmCLZMlag6MqwSu7GVQMf5sCqZcgGblXbnnnKlgayw+2eeWEu
         zo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yXfk+pV14N8uRHKyKDyfNelIYS7BHAUOLYy6g/CrD/Q=;
        b=bqpmvJNmX74HuOV0/vr7R25oPMOmTNvJBr5AyzJtyqO7FQ6l4/jUnIb3+uEVOhUy+Y
         OscOoBFYdAUvR8RlYOd2hn7GQQlMaEnbRUKCstKzP2JqM15PjC855fu0bbsgGp6VKWcp
         56eMEDutw0iE4FK2WB0LXGq3XZ9H6H/hmjiEQLGFEd7zPw8K2blxjo3OrKZhA7nL294E
         gRqAUBplDYx//cU/pFntgq6PDPOTgRUNQaSmkmoPTSnau05NzImPBIYrCRe6j/OdyhvS
         3YQa5glSULzkTAcIAAy1K+r5xf9rEcU+2GVYr6qIEdddd5QBqgCIpUPhxil+tR9zVtmJ
         beDw==
X-Gm-Message-State: AOAM5338JgLzeWoQSQ2mfR4hih7ocKP2f8Eihpb6HeBl5WFh0e2yL2eW
	k3RatQQgp8KfXSbUh+ldddk=
X-Google-Smtp-Source: ABdhPJw/2S40bNMLgP5EwoSMIjOlqJNvRgzfhEdg6IHM/ugfgOyuCvD/EKx0isk4ffOnTccP0LokEw==
X-Received: by 2002:a65:694a:0:b0:3fb:9d3b:431b with SMTP id w10-20020a65694a000000b003fb9d3b431bmr20359002pgq.276.1654502340347;
        Mon, 06 Jun 2022 00:59:00 -0700 (PDT)
Received: from localhost (subs03-180-214-233-76.three.co.id. [180.214.233.76])
        by smtp.gmail.com with ESMTPSA id y189-20020a6264c6000000b0050dc762814asm10020438pfb.36.2022.06.06.00.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 00:58:59 -0700 (PDT)
Date: Mon, 6 Jun 2022 14:58:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] staging: r8188eu: Fix kernel-doc
Message-ID: <Yp2zwBqn6uDvGNWN@debian.me>
References: <20220524083914.68736-1-jiapeng.chong@linux.alibaba.com>
 <Yp2WPrOz85/70CZx@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yp2WPrOz85/70CZx@kroah.com>

On Mon, Jun 06, 2022 at 07:53:02AM +0200, Greg KH wrote:
> On Tue, May 24, 2022 at 04:39:14PM +0800, Jiapeng Chong wrote:
> > Fix the following W=1 kernel warnings:
> > 
> > drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:291: warning: expecting
> > prototype for Function(). Prototype was for rtl8188e_PHY_SetRFReg()
> > instead.
> > 
> > drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:257: warning: expecting
> > prototype for Function(). Prototype was for rtl8188e_PHY_QueryRFReg()
> > instead.
> 
> Please put build warning lines all on one line.
> 
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> 
> No, gcc reported this, not a robot, right?
> 
> You have read Documentation/process/researcher-guidelines.rst for how to
> properly document patches that are created by research tools like this,
> right?  Please fix this commit up to follow those requirements please.
> 

Hi Greg and Jiapeng,

First, IMO this is not research tool (in the sense of academic purposes),
but development bot used in corporate environment, kinda like kernel
test robot <lkp@intel.com>. When the bot reports any build warnings,
these will be followed up by developers proposing fixes.

What I see in the patch message is just "Fix this warning..." without
saying why there is the warning.

Second, gcc DOESN'T, again DOESN'T, report "expecting prototype"
warnings. These are from scripts/kernel-doc, which enabled these
warnings on W=1 build.

So the underlying problem is mismatching function name in kernel-doc
comment and actual function.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
