Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BFE173
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 00:46:00 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r25so6189406wrc.12
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 16:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qu6RcOEnnJ7n1O+3zkO2VX/ZPqBKZq4dTc8Y7asn2hs=;
        b=DUPTpJjYxMkSVGLerpRQE4ciZdIEeO7DCTe20SUYDzzU5zRiPnaAZcBdarIrOXCwXb
         VFv0TV6wlrXZ3hOFzS8GBkRtGztDGn8jWDl1kB+E9Rw91/ghpapnt7QFFj8Evki2gEc+
         WgtA/0tIlSZFMCz/tjeKLF+Kn7/rkC5831FSnwjL1f9qb5ZubTVMVNUCeYu0r32D7bXs
         3tUedzQJmnvHF2mtABtYHGLU29PTEhqPjlRG6GWo2xr/fYOWb7daqSknepMULVbKTdRX
         jcMd2o/YVWjBAT4gP9P16cC15ZEpRjL6Rj8FA3Zw66C1KSwXe7f5xOIRe3U0VAoWrZc0
         gysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qu6RcOEnnJ7n1O+3zkO2VX/ZPqBKZq4dTc8Y7asn2hs=;
        b=08RTpDwqOfdVBXi04e6X+QqCtrFi00zJBTdv553261oc5X2FHMEphQFQx4IDUqfiLv
         WGnWOABByeghgTyCXzIA0N4avvp4e9O9Ii9EN7ed/aB7Sjw1jL6N6/hDMT+0UZgx1iDT
         tesxahPDh9h7RIIwzPkN6NAzeM2Gzj6x9iHEmIQl/up5FzHm1fiH5L+DSVi1RkakJZMP
         zYVjmoUV5GRk1r2lqRmA7zoF5xt/HH+AFxQ+vjp7djpkFIcUYsBUcotkwfkPr6niAP/i
         PodDVtDAR80io7djZQQSKNTd0+sgA3ulmk3NCJML8CoojkArzx4WiQh3q+z1S+fLIxkB
         6knw==
X-Gm-Message-State: AOAM530Ww3e5X/5sR/t3MWZE3JwtQdLiKOSi5CBAgWhyxCxHZ29T+Xva
	pKud+vAWoY6XjOecfC22zTTqRg==
X-Google-Smtp-Source: ABdhPJz6AXD0tkjXtIWSiI3DHUpUliN8lfcnXu80abGd/+D5nNzMgi0yDhedkdHkX2Qn9hdx95Hx9w==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr19942033wrv.174.1643157959373;
        Tue, 25 Jan 2022 16:45:59 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id w8sm18385528wre.83.2022.01.25.16.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 16:45:58 -0800 (PST)
Date: Wed, 26 Jan 2022 00:45:57 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: Re: [PATCH 00/10] Cleanup and removal of DBG_88E macro
Message-ID: <YfCZxZ1RyB00RoTi@equinox>
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <YfAYOVY7jFDubwc5@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfAYOVY7jFDubwc5@kroah.com>

On Tue, Jan 25, 2022 at 04:33:13PM +0100, Greg KH wrote:
> On Mon, Jan 24, 2022 at 10:44:05PM +0000, Phillip Potter wrote:
> > This series does a few things in order to effect the removal of the
> > DBG_88E macro:
> > 
> > (1) It removes previously converted calls for consistency.
> > (2) It removes all current DBG_88E calls.
> > (3) It removes all aliased DBG_88E calls.
> > (4) It removes the GlobalDebugLevel flag and the file that defines it.
> > 
> > By its very nature, it is a large patchset, so I've tried to group as
> > appropriate. I went by file as I did the work, which led to over 40
> > patches originally, so I've listed the largest C files as their own
> > patches and then grouped everything else by subdir which gives closer
> > sizes for the other patches.
> 
> Can you rebase this on my staging-testing branch?  It no longer applies
> :(
> 
> thanks,
> 
> greg k-h

Hi Greg,

Yes, of course - this was to supersede the previous 'conversion' patches
I sent so that is probably why it doesn't apply. Sorry, I did e-mail but
I should probably have made this clearer. I will fix it up over the next
few days, as it needs other changes anyway. Many thanks.

Regards,
Phil
