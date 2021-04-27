Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824D2F82
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 13:01:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54A8F613C8
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619528460;
	bh=sMMeX2PJBF6m8rhX79ZC4RUHtpZBjUk0ZeG/LM2gpVQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f5uyBSLY9BkmLZ9/nbavDv8EcjhXMhlhI2GVrNHWb0QoNlqGLbru0iNWE/J2q3+t7
	 fgyYYPPqTWCjGzY8B0ebTCRB2cLfd+k5yAIYvfTGkBhocYrmTodwjfitamjvO8AKgR
	 9xOIaz+aT0LOhOtnbrRrnZXxLiLPKKY9H8tnRf+yO9uJi4coQ1cn9soWBZbigqDqRQ
	 cwlIchVMGf6NRKeuJRTc+Yq5p5t+meCSkRpC5q46NuIbZI2ePyn7mklhZVMXVN+bj3
	 XuaU+7i1uKQR5mGCBJCfutdpd8/mqLh54QXjVERSyxGFre3lCKlWGvYhv1eKImNAKe
	 cggOGdCow/50A==
Received: by mail-wm1-f50.google.com with SMTP id m5so5004416wmf.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 06:01:00 -0700 (PDT)
X-Gm-Message-State: AOAM532/YZrQLz8GQjSUCiDo4MhMaTy72lJ/bGFrF3klWC2Phuh8tEWa
	p7w035lONoynyYmqc0LwTDHAcfBwJeLT57DE6FY=
X-Google-Smtp-Source: ABdhPJzWued0Rb/h+zEDra2lvsobjBacdViv7NvecpuHwCUC+7jhVY9MepeuKnu3kpaptlruxLb9OPFvyQJYWLjnGKk=
X-Received: by 2002:a1c:6382:: with SMTP id x124mr4264396wmb.142.1619528458888;
 Tue, 27 Apr 2021 06:00:58 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210422152648.2891996-1-arnd@kernel.org> <YIfaLbsAUjs86418@kroah.com>
 <CAK8P3a1N-JV-yJSVCXT__Aqdkj6LgdHqemPo2=7iZg+-EL32KA@mail.gmail.com> <YIgGiMFvXlM4MYiK@kroah.com>
In-Reply-To: <YIgGiMFvXlM4MYiK@kroah.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 27 Apr 2021 15:00:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1TN6r6p=2ZTQ_3f=5hK7n31VwzagCiy7ukG4Occ_3GYA@mail.gmail.com>
Message-ID: <CAK8P3a1TN6r6p=2ZTQ_3f=5hK7n31VwzagCiy7ukG4Occ_3GYA@mail.gmail.com>
Subject: Re: [PATCH] [v2] staging: rtl8723bs: avoid bogus gcc warning
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Ross Schmidt <ross.schm.dev@gmail.com>, Marco Cesati <marcocesati@gmail.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ivan Safonov <insafonov@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 2:42 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Apr 27, 2021 at 01:59:32PM +0200, Arnd Bergmann wrote:
> > On Tue, Apr 27, 2021 at 11:33 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:

> > >
> > > What version of gcc causes this?  Should this go into 5.13-final and be
> > > backported?  Or is this only showing up on "unreleased" versions of gcc
> > > and it is safe to wait until 5.14?
> >
> > As I understand, this is related to
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99673
> >
> > gcc-11.1.0 has now been released and it produces this warning.
>
> What's the odds we can get gcc to fix their bug, as it's not a kernel
> issue?  :)

I think there is a high chance it will get fixed in gcc-11.2 or 12.1, but
anyone using gcc-11.1 will still have the problem.

        Arnd
