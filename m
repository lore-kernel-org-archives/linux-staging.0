Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63F2CA8
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 13:23:05 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id g14so71182329ybs.8
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 05:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jPuiYEcG4FnWkIuFPqkRcRVpvVkaLhzeqgzV7xKH14Q=;
        b=ewLZjb/kz8m2HtjYdnAVs0d6LZQx+WTZt+orOV0l8nTnUgSVQ0eUfPjPKOuGXOprqH
         q+nkNGxOfOEWLG/1cFI1B3cNzRFe08HtHDclQ92/sVafT+mn5HrRKJ214D/lJNSExvNy
         TYDj8iR0Buo4hq3h/SksMeQeDptCb1a8BBpGIQqqYeWdCCQKSGP4sWEZlNzwcqj9Rvyw
         /LahDA5l0TYjKmCykL/i86UddMiaPtnHjEUtQpSI9ONIGFC3a0yBAmWCkgTc9AR7WIfe
         SOjSbumt1c9aEDI92MdG5iUhzjYt0LSSBXSmWbhfsBnJLgJfBKou1pKtJBiAZcyJtBOm
         D7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPuiYEcG4FnWkIuFPqkRcRVpvVkaLhzeqgzV7xKH14Q=;
        b=b3aBaFHUTmdFRsXX+zVY1ivifCwRk/PdadXsHVEtTS2/noWwybKYpY1wAQkeOQ5FCf
         qAHULjj5mkvrF1hVNH2EQMfEbvguNCCUPDVMyvAFMi7rAcpZxIH/8RESr4Hf5OVYREij
         E7jdLiePaxsRdBvWMUb0+wI90t/52cVBBGQ4CDMiZksbeMSgWcaFvUdkS3Tngd9e0I78
         57g6TCe51TStM5EKo5OVRSmRy1MvA+H2kLSYekRvxIAKYDrSPBc8lWXxAbiyru3NJaMJ
         MJMd4FN+fxFb8ESuWxywlsyApDhqTmZQE+dqqr9BdDZBVxyKojGuc6y1roOyc4CDpw65
         96Nw==
X-Gm-Message-State: AOAM531OR7BX5SOHBQrIP+Z4ncFv3rn+Z5FV560zHehbfoysSQhSTzGU
	Df64LHpSjzx45NKZ7YsojezD6lloWerFk6oAMumWDg==
X-Google-Smtp-Source: ABdhPJxxCbMVJG9gHaE8ZKo4BsT/wUzC0M9V+d+2hU/nFLU0sy/IPS0viii6yaS4V+oGBlN/XPYsea0s2HkXU8/+GU8=
X-Received: by 2002:a05:6902:b:: with SMTP id l11mr33020891ybh.376.1643203384097;
 Wed, 26 Jan 2022 05:23:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com> <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <YfFHa3ayE9wtil9Q@smile.fi.intel.com>
In-Reply-To: <YfFHa3ayE9wtil9Q@smile.fi.intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Jan 2022 13:22:52 +0000
Message-ID: <CAPj87rPMOP6W0u5y3FNfpGXHqPbMyLn4JThMY_6+AZLiy0UD5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org, 
	Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, 
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 26 Jan 2022 at 13:08, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> It's not useful to bury the /dev/fbX out for the devices that
> the use of are black-and-white output on small embedded systems.

It's not useful to decide that such systems should only be supported
by a subsystem which has been deprecated for a long time and which has
little userspace support. It's also not useful to spend time working
on that subsystem, rather than the one everyone has agreed on for the
last 15 years, is supported by userspace, is expressive, and has a
kernel subsystem which isn't a forest of CVEs and broken locking.

Cheers,
Daniel
