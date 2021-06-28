Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6470
	for <linux-staging@lists.linux.dev>; Mon, 28 Jun 2021 10:43:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b3so20641753wrm.6
        for <linux-staging@lists.linux.dev>; Mon, 28 Jun 2021 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kpVDqJjTsV6KUUcedf3oTLOAJmdQa+JJY9LMWukXSqo=;
        b=yCQFimJnN5Zggw60MpdaWZIe1NTqOfLKDJEa8GPhevVcJNBL80sEFngYtEEQgsorgP
         dn7CLw2OCHEQXXA3hKjsjHvBmCPVqWpMXRVBmuj4Yv9Kv6VOxdYnXp58mYzsVDsakQzh
         Jm+idSCPaxSS+3hq5+SqfYL3+/ZFhTkfR3G7mcPp68QKR/6uBk3ZqiBKJ9JrUJqnMfC2
         yL5RI4X6cGzQUH37FaVMy7TtUvw+OLMRL9nADcULkEyB7yXGMrmi8T3Lq/ZdcjoKqoMn
         lUmp3FJX8gLogD+6vF+8i+Y+DbSFcRmGqyhhxfAPZHU6JNSS5opP/l4gi/XbwBOn+fpc
         czWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kpVDqJjTsV6KUUcedf3oTLOAJmdQa+JJY9LMWukXSqo=;
        b=rPwI8qIQxLAYvyXkqrlJpqkarmF4OAGHdMJNX0bWXO2wMdvEchgJsWVC2apbpytSR8
         dBXj8vBHgygJstFOdENL70Da3zmbS4SQgb9NT710opXHPDHyTxNGcaACMRs5KF1PN0td
         bWR1dhby2hZkfHNB1jUrP/xIOnSp05xSOPrs222RRqQ3XXo9IAVHmS2FhWMsnyXuBMOh
         sx0sq17YpMY8J6HsuNbg2v1mp6hGF8U76qBsra5l3DPI4bwh2nEDbK1HRosNhFM0oc1y
         v1q0CQN49V0aOyk5jGB7q+HzW+fcmuTLnFpphLrYE3x+bZ0GpHKKoPaBfxSlAYf1zxVH
         FXUA==
X-Gm-Message-State: AOAM532Af2kwP7UZSFO00nl/pG8oo7YEKosX4pybyPQHDJMBQID2uGaY
	b2S5fDm8DUiaQSkIey2IOx1yCQ==
X-Google-Smtp-Source: ABdhPJymb0v5YtMlhsEo3r1NYhZqP7/TUQekY00Lvp9/sGijZkZ/qQJ9s1afO+S60QIjI3ifbHYAZg==
X-Received: by 2002:a5d:6d8b:: with SMTP id l11mr26103631wrs.21.1624877038493;
        Mon, 28 Jun 2021 03:43:58 -0700 (PDT)
Received: from dell ([95.144.13.187])
        by smtp.gmail.com with ESMTPSA id b18sm17476490wrx.45.2021.06.28.03.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 03:43:58 -0700 (PDT)
Date: Mon, 28 Jun 2021 11:43:56 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxarm@huawei.com, mauro.chehab@huawei.com,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH RESEND v6 6/8] mfd: hi6421-spmi-pmic: move driver from
 staging
Message-ID: <YNmn7H2gPzthzxL2@dell>
References: <cover.1624525118.git.mchehab+huawei@kernel.org>
 <1ad2cbbd182d18ba2cae716fb5f1497b1cabbdbe.1624525118.git.mchehab+huawei@kernel.org>
 <YNRrISOGujxcJAGR@dell>
 <20210624143605.153e1e34@coco.lan>
 <YNSRwIMr8+m9Sxk3@dell>
 <YNSV+N0h7NoRpo/w@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YNSV+N0h7NoRpo/w@hovoldconsulting.com>

On Thu, 24 Jun 2021, Johan Hovold wrote:

> On Thu, Jun 24, 2021 at 03:08:00PM +0100, Lee Jones wrote:
> > On Thu, 24 Jun 2021, Mauro Carvalho Chehab wrote:
> > 
> > > Em Thu, 24 Jun 2021 12:33:28 +0100
> > > Lee Jones <lee.jones@linaro.org> escreveu:
> 
> > > > > --- /dev/null
> > > > > +++ b/drivers/mfd/hi6421-spmi-pmic.c
> > > > > @@ -0,0 +1,316 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Device driver for regulators in HISI PMIC IC
> > > > > + *
> > > > > + * Copyright (c) 2013 Linaro Ltd.
> > > > > + * Copyright (c) 2011 Hisilicon.
> > > > > + * Copyright (c) 2020-2021 Huawei Technologies Co., Ltd  
> > > > 
> > > > Can this be updated?
> > > 
> > > Do you mean updating the copyrights to cover this year? E.g.
> > > something like this:
> > > 
> > > 	 * Copyright (c) 2013-2021 Linaro Ltd.
> > > 	 * Copyright (c) 2011-2021 Hisilicon.
> > > 	 * Copyright (c) 2020-2021 Huawei Technologies Co., Ltd  
> > > 
> > > Right? Or are you meaning something else?
> > 
> > Yes, that's it.  I know this is just a move, but to MFD, it's new.
> 
> That's not how copyright works. Unless Linaro and Hisilicon made
> nontrivial changes every year from 2011/2013 to 2021 you should not
> change those lines like this.

Thanks for the pointer.  After receiving these, I went and did some
reading-up on the subject, and you're quite right in what you say.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
