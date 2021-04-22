Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE8670
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 15:26:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C661F61425
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619105166;
	bh=cNV6IkI3EWzn8eh94ZL3mGzZvUvtIXIKPP3ff/Wu2r0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WJZxSKgRGaYojFqnI5Xw3j6lv7JhY7L98wi+C+a1WMBbFsFJ1H7l3zaqGAqDdwzS+
	 IleJy4AsqgKVCCRwk1Z3sp72pXPeTTQnrtzW+RPNrizfomALb5atfy2nZg/rLhKuB/
	 gW1K0myY7rh//GXDX4NPFFfZSpExnTWLiXIRYz3KEottrfk+4LNZ+X55vjxQMm2FiU
	 YAprcp304ebdB5zm43yXtykwrFoaoT8qBblOSPgbW7jMLt6GcYNyjIUFb8gXrjQW9S
	 lmVaXl202s2MrcE5HvT8Lte0ENIrNQpUTz4svtsy/QXoGzGWOJtVxZ2ZOsSK8B2Vd9
	 cjCJeZmPJaUgQ==
Received: by mail-wm1-f52.google.com with SMTP id o9-20020a1c41090000b029012c8dac9d47so3499058wma.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 08:26:06 -0700 (PDT)
X-Gm-Message-State: AOAM533vx0+G/rU2RAke6kS36U+FNO7TuTABH4WVp8rt+o0VGJfmwGJN
	c9s90p3JaWVb5Df+mY8UVOP2C2yG+dH3Ww0B3o4=
X-Google-Smtp-Source: ABdhPJw0ywSPUuI3ypsEpkKqT93BmtVIDmqQz9BrkPsEzaNRiU2utOqsHbURvWDUj66X33ir670K0POBCVRbOl/79Mk=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr610378wmj.120.1619105165273;
 Thu, 22 Apr 2021 08:26:05 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210422133219.1689027-1-arnd@kernel.org> <20210422151740.GI1981@kadam>
In-Reply-To: <20210422151740.GI1981@kadam>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 22 Apr 2021 17:25:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0mMFesdg14s2WjL7txpryev7Jm0VN1Uy3c9vTDOybqaQ@mail.gmail.com>
Message-ID: <CAK8P3a0mMFesdg14s2WjL7txpryev7Jm0VN1Uy3c9vTDOybqaQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: avoid bogus gcc warning
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Ross Schmidt <ross.schm.dev@gmail.com>, Marco Cesati <marcocesati@gmail.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ivan Safonov <insafonov@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 5:19 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, Apr 22, 2021 at 03:32:04PM +0200, Arnd Bergmann wrote:
> > @@ -762,7 +764,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
> >               }
> >
> >       }
> > -
>
> Since you're going to need to redo this, then please don't do this
> unrelated whitespace change.
>
> > +#if 1
>
> These seems unintetional?
>

Indeed, both (and another removed line) are artifacts from debugging
that ended up making it into the commit by accident. Sending v2 now.

       Arnd
