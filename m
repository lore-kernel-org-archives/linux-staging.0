Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225F3FC2
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 22:57:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id j2so7465923pll.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EfubSOF612V2DUt6cuIT4/UdrIQSTLdh4xmGE4/MlMs=;
        b=TEEzDM582idM5C9dZDQbevAm9/fNLPtUFzMV7Hkg/Efb69wknfmKTQNKIcx1mdcaX0
         bIePfUvAfsb6ykRWWvZe9AztshkGpV1ZQfB5XJOwqOv4qcarDWothKHOtRuxBMNjduh1
         yWmz6vmN/3Vggd9w3Lf+KR+ewOT+3RXT0Cu0gdpZjXRh2LPKOwSjrMtyZGzWTpA82o5C
         0Wth09fY6fZ+Fz/YxrznUgG6sl4g8uwi9jU0GGQc1+bQWWDNVAmMrYxBrgM3tbwwSJf8
         rG5yQkXiEFgR4Gfu4Gvfsv0RwYfXy1VQ3o/LuxfjVS5YrVrU7DbZyq6JKcTf4KChujxa
         SHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EfubSOF612V2DUt6cuIT4/UdrIQSTLdh4xmGE4/MlMs=;
        b=PpJeSlAS28dtJu6Gstzw3dxRVqtIRMkAzzNiByPuCree7Vl8kAXPtUZlKdkFQ2SXNg
         jJpmfbUGyKYS4yjzAOQCoJfQVT07sx+LpEvf/jjQW8S4dnbiwHI6hNNuQNDNdWHx+0iY
         KLguUaG7E3BSFvl27NXBqfLuxMdVSglqAHNl2BfBCTJlFgsG4YkjgyrmHmauhr/tB0ce
         K4TfYEi7QJK+1fi89sYVqMnTVWyMAXq+NfItPBJ34S8SH6dLRrV1ZSU6LPCuO0aRNZRh
         SBtjXhrpq1tKV57ZbxOjswyNy5rSETYwFaM+DU9hU0Gd3X7uWRnXDJlUuN/gl1GM2rqL
         eRSg==
X-Gm-Message-State: AOAM532ck/esWCgs25WEWRVmGFHF8xk5U9cLR2w7D42pAfT/tapa7OkV
	f85+cb2HES65hk5gukTo3EUHRxWspSCwY8/Q2xRzRA==
X-Google-Smtp-Source: ABdhPJzCX/xFJh1YP8PqZ4vZHXe/rLrVN7gGJkz/tzPv08zOUlJvf7FkqLuXNTulofkxzN0w5oQtEuPSuH3954/IpNk=
X-Received: by 2002:a17:90a:10:: with SMTP id 16mr20894890pja.162.1630277846584;
 Sun, 29 Aug 2021 15:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210828212453.898-1-phil@philpotter.co.uk> <3f63d7e1-0eb4-21c0-49eb-262cdadf0e87@gmail.com>
In-Reply-To: <3f63d7e1-0eb4-21c0-49eb-262cdadf0e87@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sun, 29 Aug 2021 23:57:15 +0100
Message-ID: <CAA=Fs0=hDfN6a+r-d0rG=7CdTFZdS=YmJvRsrS07om4oirdm4A@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: r8188eu: cleanup c2h_handler code
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Aug 2021 at 16:04, Michael Straube <straube.linux@gmail.com> wrote:
>
> On 8/28/21 23:24, Phillip Potter wrote:
> > This small patch set cleans up the c2h_handler code in the HAL layer
> > of the driver. In r8188eu, this field of struct hal_ops, is not even
> > used, so dependent code has always returned _FAIL. For this reason, we
> > should remove this function pointer field, and the wrapper function
> > which checks it. This is done in stages by this set, and helps get
> > the driver closer to the pointer where the HAL layer is
> > deleted/integrated as necessary and no longer a separate entity.
> >
> > Phillip Potter (3):
> >    staging: r8188eu: remove c2h_handler field from struct hal_ops
> >    staging: r8188eu: simplify c2h_evt_hdl function
> >    staging: r8188eu: remove rtw_hal_c2h_handler function
> >
> >   drivers/staging/r8188eu/core/rtw_cmd.c     | 23 +++-------------------
> >   drivers/staging/r8188eu/hal/hal_intf.c     |  9 ---------
> >   drivers/staging/r8188eu/include/hal_intf.h |  4 ----
> >   3 files changed, 3 insertions(+), 33 deletions(-)
> >
>
> Thanks for your patches Phillip. Looks good to me and I've built and
> runtime tested this series with Inter-Tech DMG-02, so...
>
> Acked-by: Michael Straube <straube.linux@gmail.com>
>
> Thanks,
> Michael

Thanks very much Michael, appreciate it.

Regards,
Phil
