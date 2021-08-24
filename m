Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E243FC6
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 00:17:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id m4so139870pll.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7yibjZJUpbZ4+P8Zg5i3r1lSVJYnEnK9gSjxsDfYQ5Q=;
        b=AJtytBIeQqFlDapbL33j5fzOVo/pO9w5Tpb/y/OSsmkJ2iSk0z46mwp/PcEPIGrWOm
         aU2W7Adw64NicX6OTFgf8cnezXRb9ggRgxwWczKVpxMATQdtD6wgN4B0hqN4euAH/PrG
         IDpHB7uzmOGEk1OHok5hifIUUjlDSh5c1ptaiK26KLu9Sxef0kzsjCvOSVB1Ij1E2IXW
         Oigk3kE0ymAFRL+qOMjmLqwMJxoQFczQFokKxW5oRj9HkjWx4gPp3uphmaCk6QuTEsqS
         SAi1GIOfKV2zNSTilppo67bbxOLtXPFb6VunNMZ30gaASys/v1KJMiH1plu5xfgk28Qx
         XUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7yibjZJUpbZ4+P8Zg5i3r1lSVJYnEnK9gSjxsDfYQ5Q=;
        b=FCJuFjUR0nZdg3l1jxd3R24XRpEzcuuyAKrfRKrYyfEh8mznu7n1MJ2Jl2sdrymxrI
         TIzKl21Yery/KcRVz0IiDjpibuncySKD5WV0lPQKLSGCIK2/Fg47Ydjv2Epd7bV/iwdv
         JEkWJ4ghhyEqYetGFJpPNSiOOIOCf4tYRkOLKfuRpCy1H4EdyX8Ro5fAumrfz2RZgvFF
         JNhau2fbKebNvtXP2meSPYIsOs7RHJ+zY93YJngNOVMRKlyBrNBdLe+Erxw35Ae3JxcE
         90jA9tikZ0ggDLDU+wePUmM+sI9cawX2e9Aj47VS1LTf383QINMkfLeqm5IaUYTLP4gh
         /y9g==
X-Gm-Message-State: AOAM5303HS6ARkw7j8OkaBDxEcB6qSMUlrmsPTkPGDejJcVESFzjG2R9
	hsnnFKz8vVIgp89h/0hFwtCZtR7EddZd7IDDJuSLJQ==
X-Google-Smtp-Source: ABdhPJwGGQFuHpqJSpswfjuCKkLgTaxj95DS+ddmgfEC5xoHhnOn72dJd6L3b8+sJvVpRyECZTObkKequJKSuxMCyQg=
X-Received: by 2002:a17:90a:1f49:: with SMTP id y9mr1215786pjy.225.1629764274425;
 Mon, 23 Aug 2021 17:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823234858.2633-1-straube.linux@gmail.com>
In-Reply-To: <20210823234858.2633-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 24 Aug 2021 01:17:43 +0100
Message-ID: <CAA=Fs0=SiVhTrHNqwrXBA2PFkm1LpWTOkv9b2c7KdijaO1iRsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: r8188eu: remove unneeded header files
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Aug 2021 at 00:50, Michael Straube <straube.linux@gmail.com> wrote:
>
> This series removes the header files if_ether.h and ip.h as both just
> duplicate in-kernel definitions.
>
> Both patches were already sent as single patches but only the one or
> the other can be applied due to conflicts, so I resend them in this
> series.
>
> Michael Straube (2):
>   staging: r8188eu: remove if_ether.h header file
>   staging: r8188eu: remove ip.h header file
>
>  drivers/staging/r8188eu/core/rtw_recv.c      |   2 -
>  drivers/staging/r8188eu/core/rtw_xmit.c      |   1 -
>  drivers/staging/r8188eu/hal/rtl8188eu_recv.c |   2 -
>  drivers/staging/r8188eu/include/if_ether.h   |  94 ----------------
>  drivers/staging/r8188eu/include/ip.h         | 109 -------------------
>  drivers/staging/r8188eu/os_dep/xmit_linux.c  |   2 -
>  6 files changed, 210 deletions(-)
>  delete mode 100644 drivers/staging/r8188eu/include/if_ether.h
>  delete mode 100644 drivers/staging/r8188eu/include/ip.h
>
> --
> 2.32.0
>

Dear Michael,

Many thanks, applied/built/ran with both patches applied, looks good
and works fine so far.

For both:
Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
