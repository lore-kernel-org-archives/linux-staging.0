Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA482FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 17:22:31 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so25621672pjr.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cj3brR7/gBmdZFywr+8Ggozpje7JHKDRwC1PgsV8mJA=;
        b=GqhHLlJmqw12wvkn0UJ/QoTElJtmFzwFMo0xTTgqQTlSlTWGYf0uQVyd5mlfXnzTz/
         epRzJ4XXvPVgVEgWba/nno+gnkTX0eEM8vms6v92iLD0T8/GojxVPOp2cFxXAMxzBw92
         aIHDkv8QQXyn+eh6GLeofqLcG89QBEY0cuUomgphY144DGbBjCaj0fnKx8PzctJ9oSZY
         WGLZo5xiIJeCfJtruvetrnbCvkbQAjYew/dPichw/R3ZSGa8VHr7fs7hPMNl1k9VIWwc
         RJJ3tDQpIOC7ZupSjb7MGOG8ZC60+U7Psyw7x+5l70HiG4uIY7OrtFvmms9kmru8RiA4
         eRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cj3brR7/gBmdZFywr+8Ggozpje7JHKDRwC1PgsV8mJA=;
        b=Tp9iQBca76UGrGgmBaQsGo13M4EA76+KXBlAebVj1RBl5KRwvt8hCcVwVdVwf7KyEa
         +K2MCEUAu20XqN6AIe/pOElnSLES4HYfbF3PuqYUjyI57mtTu5fXlY9GcDXC8ygC+RMr
         gg1OfFVzVvDDeU+UeuIyGyPkg8+stGJFO7noUeafIYhAIGkrJOTcS82xa0KkgjpSXUQ6
         5jcU7QMJrgagZhfiZ+dRUkOG4A+asuE48SAUA2rphsqFKlyrHndPRm9QDAXUEnhGRzvH
         6JRUOQoad+yawxQ54kDYG0vqpxaQ5QZznVS+qChBHflQhYbCHAkVtlyxrGoV1xt9N/Xj
         15/Q==
X-Gm-Message-State: AOAM532FVLEHx41EnG0EqYDDgIR9Q5sOv6UUX5Wpiyx3WzI3jxmMlY+x
	B3N3H7zdPDO5BUpLXwce2kn1QqfZLmGG+GHndw9jNw==
X-Google-Smtp-Source: ABdhPJxbf3pmQsG8AgZuA9FcoS3029YBFQL8bd3yFDPJ2qyt5ncnYj6PI92zQdiVpMS7euZ1iU5CWU79QKBj63x/mAw=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr7683855pgo.208.1628961751198;
 Sat, 14 Aug 2021 10:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210814160804.11634-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210814160804.11634-1-fmdefrancesco@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 18:22:20 +0100
Message-ID: <CAA=Fs0nR+Jh-1V1DdsZB9pMpeLRRwbQNh2X9UMMabh-vAubvqw@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: os_dep: Remove defined but not used variables
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Aug 2021 at 17:08, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Remove defined but not used const variables. Issues detected by GCC
> running with -Wunused-const-variable option enabled.
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 21 --------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 38ee41f9d2ba..d9fdd83218dc 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -84,11 +84,6 @@ static u32 rtw_rates[] = {1000000, 2000000, 5500000, 11000000,
>         6000000, 9000000, 12000000, 18000000, 24000000, 36000000,
>         48000000, 54000000};
>
> -static const char * const iw_operation_mode[] = {
> -       "Auto", "Ad-Hoc", "Managed",  "Master", "Repeater",
> -       "Secondary", "Monitor"
> -};
> -
>  void indicate_wx_scan_complete_event(struct adapter *padapter)
>  {
>         union iwreq_data wrqu;
> @@ -6666,19 +6661,3 @@ struct iw_handler_def rtw_handlers_def = {
>         .num_private_args = sizeof(rtw_private_args) / sizeof(struct iw_priv_args),
>         .get_wireless_stats = rtw_get_wireless_stats,
>  };
> -
> -/*  copy from net/wireless/wext.c start */
> -/* ---------------------------------------------------------------- */
> -/*
> - * Calculate size of private arguments
> - */
> -static const char iw_priv_type_size[] = {
> -       0,                            /* IW_PRIV_TYPE_NONE */
> -       1,                            /* IW_PRIV_TYPE_BYTE */
> -       1,                            /* IW_PRIV_TYPE_CHAR */
> -       0,                            /* Not defined */
> -       sizeof(__u32),            /* IW_PRIV_TYPE_INT */
> -       sizeof(struct iw_freq),  /* IW_PRIV_TYPE_FLOAT */
> -       sizeof(struct sockaddr),        /* IW_PRIV_TYPE_ADDR */
> -       0,                            /* Not defined */
> -};
> --
> 2.32.0
>

Thanks Fabio.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
