Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9242C80
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 13:53:24 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z9so33468942edm.10
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 05:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IfBpMF7ZpiSkVVFjrUiS9oq4g5AGMq3hHhumCDyyUTo=;
        b=kQUhGaUdZLBCXPxF/kdwC3ug4bfeBbV/4DtwPQPwXGWJbO15X7gfmBVfUmPOgK5cM0
         /0sl/M0RT1dsEj1I+ky70JXWKTEEbYSlTpin4J79Pnmx0JO8CybEziMZrudI7RRrQfKE
         vD1cX5floz8zJtD2xc550oUS1VHhCWoOaPc9I1g2zfDTNmKU0VrPXjM3HnQNb6wSflGR
         9Uf+rv+hY9sl67qcsnHNglxufQNannXokbwSB+B7I4VD88s7XR3KR0pVfNf69JG3OTnG
         UBsxiH9v1pnKmPQIZQiPypi/qfwT3u8yTceeoyg+iajsRGvlmYLEDufz/3oAYN8jTJJH
         rI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IfBpMF7ZpiSkVVFjrUiS9oq4g5AGMq3hHhumCDyyUTo=;
        b=f2xC6qBKOJQKQ8CKgroTqXLOakzquMt2qb9CLEvnHLhO7pDMVrBCQITwSZZW5DUz05
         TpWoNCjTSCTwfCJ3ANfK6R0O5HFbt+iJRKBExg/JuzoqiWlv2Rl0tanIBLUi61y8Qjnj
         Zq1H8SlqhiwgtTQTBLEIt86kB1gTfekd+G/LueVOFWF39eabJOGe+hZDsYTVRW0FOphi
         bm0ze+6dPv3G6queO3JVRbo9F1A3c8QhnUys3UQp5WU9Zrdj/izKX+8+BjEBDDk3tctY
         wY9FOmSyAMDsYneC1ZAh4BxV+rccGstbACCvEyBNe4foddvNhQQF0+ays/BzWqKha/75
         XDFQ==
X-Gm-Message-State: AOAM533dhzCY9scXuRt3HrIB97XsTWezDYx038GiLHLdGw0ZQ6VY5bVH
	/vhpw7JTmc7aqX4K27NEX+0=
X-Google-Smtp-Source: ABdhPJzzyYjDVAKU1HN2s+625kayP58JZA+p6Gzt5uwrUrIVIXEWlS4+KTJ+wwWTvN5Fqk+jwW+s9A==
X-Received: by 2002:a17:906:2799:: with SMTP id j25mr52869223ejc.700.1641650002572;
        Sat, 08 Jan 2022 05:53:22 -0800 (PST)
Received: from t470p (host-79-36-120-235.retail.telecomitalia.it. [79.36.120.235])
        by smtp.gmail.com with ESMTPSA id k25sm537456ejk.179.2022.01.08.05.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 05:53:22 -0800 (PST)
Date: Sat, 8 Jan 2022 14:53:19 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxfancy@googlegroups.com, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/56] staging: r8188eu: remove dead macro ClearToDs
Message-ID: <20220108135319.GA509144@t470p>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
 <20220103190326.363960-4-alb3rt0.m3rciai@gmail.com>
 <Ydb5SrclLcYzUrsC@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydb5SrclLcYzUrsC@kroah.com>

> > Remove dead macro ClearToDs.
> 
> "dead"?  Was it ever alive?
> 
> I think you mean to write something like:
> 
> 	The #define ClearToDs() is not used anywhere in the r8188eu
> 	driver, so it can be safely removed.
> 
> right?
Yes, correct.

Thanks,
Alberto


