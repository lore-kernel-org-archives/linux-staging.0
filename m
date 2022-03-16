Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAB43B41
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 20:23:38 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y22so4184063eds.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/W5laBTZHdKIhPFdmxssAJ/PyZmpniDY63SyfCg8328=;
        b=m92o9PYDH2Pqko8Jg5f/4xBxboNuVcCi05N5Z1C883GeytGPj65qh0BEAk1u10aSnV
         dfaAMMeRsQC/TAaxyiIOWqQKRSWb1yxJ603+SW+QjRXfbag83sfMfwgLhh0F8JHbkNlG
         usP+N+nazlXyrHWY1l7vI/bS20wK1YND8MPmA3KLK8/aS3RaO28+0mAKMA6OsMEMKaeL
         IZncXP+RvYJ5Reg5zdmKDqTSL42/VnFjc7Ngsyjt+cYYUVz/joGRXVc9KTVMnTjc0bMz
         zhVuKHoiMkREpc/5V5w7JYm07Ns+ffWHc5NSOpUh69hf4jkPKRAVviOvU8uOd6X1R6nB
         vbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/W5laBTZHdKIhPFdmxssAJ/PyZmpniDY63SyfCg8328=;
        b=c6G2xdZ0inD9J06XC+Ewi3Pj3ImQJMTvPTT1BT7mSVCg3iDFJ7Bnq2iSLZ1D0X1+Hg
         geIrF1lT8/0v22VkesKtqzcWOnA/I0eIbDJPDoTWKjnxfQwJOpGBvhrNYCfndnhmn50B
         I+rYnGCNZV3ap2H/JGGer1eWWFXhPS4tfBZZr/dQlw/ngSvjC2XPTwBUMdxdoPS0eIp0
         XaeP/Q0jc4CfM0HBk6tCRPHJVQm/XxY4R2tig5Mwnj8p2M1t4QT6k1GJJ585GOe8YOod
         RJD3aMUzAVXBv7Jq4iwdBllFat1rtDGVz5VJEsoLk161Q2QEX6Gzk5WW9fb0QBPlfsbB
         jDHQ==
X-Gm-Message-State: AOAM532pShayowgna1gYs1GrR/6paZ5pWKKJXB0mruuf89QpNGlWFSTi
	ESs0HiUnQlEbmfeMPewOFpo=
X-Google-Smtp-Source: ABdhPJzXsMB8mZpAwg03dI85wTVY9KB/446Yl7/fe+M1GEUQN35mtGFiShQYS+jcP2KIlFVpFfIrsQ==
X-Received: by 2002:a05:6402:278f:b0:416:a887:9853 with SMTP id b15-20020a056402278f00b00416a8879853mr1231698ede.44.1647462217169;
        Wed, 16 Mar 2022 13:23:37 -0700 (PDT)
Received: from nam-dell (dslb-002-203-132-165.002.203.pools.vodafone-ip.de. [2.203.132.165])
        by smtp.gmail.com with ESMTPSA id d11-20020a170906c20b00b006d584a09b9fsm1374872ejz.98.2022.03.16.13.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 13:23:36 -0700 (PDT)
Date: Wed, 16 Mar 2022 21:23:35 +0100
From: Nam Cao <cvn249@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix CamelCase naming style
Message-ID: <20220316202335.GB7346@nam-dell>
References: <20220316113228.21243-1-cvn249@gmail.com>
 <YjHu0FjaHRoqfZ+y@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjHu0FjaHRoqfZ+y@kroah.com>

On Wed, Mar 16, 2022 at 03:06:08PM +0100, Greg KH wrote: 
> Why are you keeping "pfn_"?  You do not need to say that this is a
> "pointer to a function" anymore, right?
> 
> thanks,
> 
> greg k-h

Thanks for the feedback. As newcomer, I really appreciate it.

I will send updated patch soon.

Best regards,

Nam

