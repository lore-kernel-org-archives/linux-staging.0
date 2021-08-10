Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5931A177
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 22:50:38 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso3051748wmj.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 15:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xfyFHHFlfEpnQFC6plmot+LFQsVamLEZ8n6xAQLz3I0=;
        b=sQEFllmDCQb6T586tGCkYXElYhLj6oIP0gskBtlvlf5V65+Xm+JtJApGA7V4vwfHHT
         TcTUSYuoXumJK8oOTGxP3ccerMhqu8PX8zjzM4q8N8KPnZlKVVlz6b0Hy5Xk+9HXW+7d
         33ZviV5FNBPiDXipLiCymxMPm5JRoGNaKPas11h2C2edIWzqClA0uEUWZcpSv77Hwt2L
         Z4aep4FwqYNmY1E0ln22zoSFmDBryD4pPeWRzasDHR4LPChNZv9gMQz8UWDzLM6ylm05
         k9WwTMQKOu64RFm//ssGD3DrXYF+dJPRMIZdDbc0nFi0zm3EjJG50f1A+Q6JE/gqzmKM
         u3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xfyFHHFlfEpnQFC6plmot+LFQsVamLEZ8n6xAQLz3I0=;
        b=Zh3uEEPMb6tXj8SwuKy0p3On2x8cpRQ0l5f1T6EVHs++cC8+0GrqRVvlyEpA4CYdns
         xRIVsuD2dSknJZzM59pBs9I+wfZYdYrh5RgFPKGPbyNusDHHKwzecnIMck/sGkNazW4I
         4YQTGjzjFpsb4pRtUI3EhA+18iznhHO6pLuGD9/r7rgIqk/R2zL4tIwEnUkNRY004Z7v
         zuVqmOpwmk67d/KLBHCEgN8cBpyawi+784dr16sS3hn/XMEDcMGkxoh8n7hoyjWl9P/3
         NkWgn8NzhIz5Lw3wzObhlpE3uw6D7EuM0xW9lBs18hB758rW8aIE+w9oC/Wq6CEGMCdv
         hKrQ==
X-Gm-Message-State: AOAM532Ig5o/nMd48foUvw1zzNp05d2vIwrUwTba438N176L40uGTihA
	KAEeFKlXmyX9y52gQcXcPWlC7A==
X-Google-Smtp-Source: ABdhPJwKNK0wbQ2CzmeUk4pisA2wARwQSZ3SQSPHKRNT/TuPutCdQEwDkDO3C5V9wmauQER/o+CWyg==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr6930211wmi.36.1628635836729;
        Tue, 10 Aug 2021 15:50:36 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id z137sm4090938wmc.14.2021.08.10.15.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 15:50:36 -0700 (PDT)
Date: Tue, 10 Aug 2021 23:50:34 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: Replace BITn with BIT(n)
Message-ID: <YRMCug2ULtA6JoLn@equinox>
References: <20210810180511.8986-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810180511.8986-1-Larry.Finger@lwfinger.net>

On Tue, Aug 10, 2021 at 01:05:11PM -0500, Larry Finger wrote:
> The driver uses BITn instead of BIT(n). All such usage is converted.
> 
> Note that this patch does not address any warnings that checkpatch
> will find. These include missing space around operators and lines
> that are too long. These problems will be addressed in a separate
> patch.
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> 
> ---
> v2 - Removed dependency on incorrect patch
>      Fixed typo n comment noted by Dan Carpenter
> ---
>  drivers/staging/r8188eu/core/rtw_ioctl_set.c  |   2 +-
>  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  40 +-
>  drivers/staging/r8188eu/hal/odm.c             |  68 +--
>  drivers/staging/r8188eu/hal/odm_HWConfig.c    |   4 +-
>  drivers/staging/r8188eu/hal/odm_RTL8188E.c    | 116 ++---
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  14 +-
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  66 +--
>  drivers/staging/r8188eu/hal/rtl8188e_mp.c     |  34 +-
>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |   8 +-
>  drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  10 +-
>  drivers/staging/r8188eu/hal/usb_halinit.c     |  48 +-
>  .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  14 +-
>  .../staging/r8188eu/include/Hal8188EPwrSeq.h  |  84 ++--
>  drivers/staging/r8188eu/include/hal_intf.h    |  16 +-
>  drivers/staging/r8188eu/include/odm.h         | 106 ++---
>  drivers/staging/r8188eu/include/odm_reg.h     |   2 +-
>  drivers/staging/r8188eu/include/odm_types.h   |   8 +-
>  .../staging/r8188eu/include/osdep_service.h   |  42 --
>  .../staging/r8188eu/include/rtl8188e_spec.h   | 415 ++++++++----------
>  drivers/staging/r8188eu/include/rtw_sreset.h  |  14 +-
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  |   4 +-
>  21 files changed, 518 insertions(+), 597 deletions(-)
>

Dear Larry,

Looks good and builds fine for me.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
