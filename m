Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF80A6D13
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 21:09:26 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so9081058pje.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AwF9gPVb6rSLv8TfNn020arGyAKk62BBC6M1h4xTevU=;
        b=IuuCgqYx4BPxjD5Pm0KgpVEiQmkLhiXA814N3a3j5+lrQsl3YG3LfIiWxoxd14hxZ0
         4RGvWs4JohzN4HqAcSw10p+8j2AigtBErRFlpfywzQL/FDIY/lsOb0NG83DJ301td7tb
         WelLBc/4DuPEX/BXWym6ag2QLgoy/ErPk+MHG/rIxDlThXDp0npeYsciBRX18jxuwDZa
         wZbPHU0r1i1+zY3nLFegD8Q238XrKK8TrfacZDBmtO8GwOdufp9aXEukBKLQ58sH72Ez
         2WJZYxnmYMek26CRaqs0OhCPihu8j1K0ESrFHEbb+kdiRX+MmSIDlZvF3cxErNVlacui
         ioSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AwF9gPVb6rSLv8TfNn020arGyAKk62BBC6M1h4xTevU=;
        b=tR6eMDaaGiRGXBo4xGqFcVQ48/O99D9fFR8UO+s2Nb1NZ9jiMu0d8S+igBQC42XWkn
         GpGMSWBcCgCwJWMQFL6Yt16m1AlB0YaaoVLdE1CQEEX40r+TM7XCFmiOYz9gVZNthvbl
         aeugBfaZxuXwYPiNRk7W3VB5lOdpcme80BLG402St0r5Pph7WdgtdOdAEzXxUX62WmzK
         VP0C4T6H8Vu3f7f9lwjXNjSghwIPyJFHx/n/1wfArf31RW2b/s4KnEWXf+ODKD6Wn7wA
         cw5iOV9f1cvnkV7uRLQ3iorUJ9FTwf3zBV/x6eGHGxFI9xCNqt/mfHZJsnpOnv51obLH
         uDiw==
X-Gm-Message-State: AOAM5319snyBszly5rsq4RGmNablsw+MNrON/QfB89HTQe2nCD9Dx5oD
	PPJLyzXG+42JP92zAAGWpUIcR7slJzkFx0BjFUKtWQ==
X-Google-Smtp-Source: ABdhPJxeGt+jyLedAnAFq7sXc5iu6NqpVBagtGh/H6ypybLGjl+PjfMszRQ60ZHPi49s39/oavnefbAWKC77Y7JrxoY=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr6086414pjq.217.1628802566538;
 Thu, 12 Aug 2021 14:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210812204027.338872-1-nathan@kernel.org> <20210812204027.338872-3-nathan@kernel.org>
In-Reply-To: <20210812204027.338872-3-nathan@kernel.org>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 22:09:15 +0100
Message-ID: <CAA=Fs0k=MeBAHeCK4kFd9p5S5mqER931DGs-mp6Di92rCmAJGg@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: r8188eu: Remove uninitialized use of
 ether_type in portctrl()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Aug 2021 at 21:40, Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit 987219ad34a6 ("staging: r8188eu: remove lines from Makefile
> that silence build warnings"), clang warns:
>
> drivers/staging/r8188eu/core/rtw_recv.c:499:8: warning: variable
> 'ether_type' is uninitialized when used here [-Wuninitialized]
>                         if (ether_type == eapol_type)
>                             ^~~~~~~~~~
> drivers/staging/r8188eu/core/rtw_recv.c:458:16: note: initialize the
> variable 'ether_type' to silence this warning
>         u16     ether_type;
>                           ^
>                            = 0
> 1 warning generated.
>
> This if statement sets the exact same assignment as above so just remove
> it.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/staging/r8188eu/core/rtw_recv.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 9b3637e49052..8df38db9572c 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -495,10 +495,6 @@ static struct recv_frame *portctrl(struct adapter *adapter, struct recv_frame *p
>                         /* allowed */
>                         /* check decryption status, and decrypt the frame if needed */
>                         prtnframe = precv_frame;
> -                       /* check is the EAPOL frame or not (Rekey) */
> -                       if (ether_type == eapol_type)
> -                               /* check Rekey */
> -                               prtnframe = precv_frame;
>                 }
>         } else {
>                 prtnframe = precv_frame;
> --
> 2.33.0.rc2
>

Thanks again.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
