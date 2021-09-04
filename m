Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F3C3FC1
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 18:27:33 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id w8so2385399pgf.5
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 11:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Fns04cE5BXdKVsmK/GY2GcSPCFvJit7ANvkRff/qTM=;
        b=jsiEFu0jMzNkLooJbS1VXjiPxriZKiIM1gBLb3hvXY+dbw99HS5CVpWVduWxVn3Kgr
         Sr9bobsSWtfnWHBqWPIXyPY2yMceqToVCxkhH96P//DhqULJg/FgjdcKkYzr96IdZrXw
         hqtkv1lNHY9GZkFFvPeT8sh4GR243ZprJDijulXQhn7AJti7yD4GNx5mH3Bd+pMX6Yy+
         moZVXB5FsizMV0Yyz6+tgievXelnmjd54IrrnBMrqMxlW8mqh4vLfIF3hzahja1apYz5
         HxNC3HNiNgHxV/TxKE+XBeHhIcycMtqZptkrzR+4S6RW381U/vf9Y9O5V63lQPay/SGB
         8Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Fns04cE5BXdKVsmK/GY2GcSPCFvJit7ANvkRff/qTM=;
        b=dEn8aZ9MuKwGD/q3Fpw6SidDLPzTMxbOFhI0I+HwI8+9/Tt7RjVJvVOs5d4SSsOrcD
         3l9Ood6wSD8+7bW2gDmP09uNAZv8COPeFZHoKhQUxrI0AOZ3F8xxaXhXO/EormW1YmiE
         nv5GQU+rBrSpSCXJuFMaTCVUSoRwISfLeCgAbec1pJtcHmwUJ6haz4xz/CGft6SWYDce
         oS7zsv0fFbGl+uE5zIVmEit6nWd4z0JMJAOp+tu3dp5los6HtRPIsUYF6m06inCE5Mhx
         b3Khz7/LhEH3gXDiIsAXR885kfCzgdlpSCsMLMOOjQ/Qmoltd4yRShtOeIx6rIShIEui
         gsag==
X-Gm-Message-State: AOAM533knW4OwHP6lI+UNFOzPFpLRbgZdblnJhKcXkImJmYQIIs69mIA
	glNE7iIPUpjXlnfPNHthNHywWWPhAWUTX6Of23D9065uxixLBg==
X-Google-Smtp-Source: ABdhPJyLQk3qH2MbDZP6z6A7PQOKjZWHU3+ItqvLCf6iVk1YdVfXBET5kJsJcGvUjvjGKxlh1BMI2L+2DEl28RVfsXM=
X-Received: by 2002:aa7:8f37:0:b0:40a:4c62:3f91 with SMTP id
 y23-20020aa78f37000000b0040a4c623f91mr8820558pfr.46.1630780053127; Sat, 04
 Sep 2021 11:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210904124033.14244-1-straube.linux@gmail.com>
In-Reply-To: <20210904124033.14244-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 4 Sep 2021 19:27:22 +0100
Message-ID: <CAA=Fs0ntWh8kanSBMA+jBLHAgVTAjH7SFJ8ROrmncZTkzSy-gQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] staging: r8188eu: remove some functions from hal_ops
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Sept 2021 at 13:40, Michael Straube <straube.linux@gmail.com> wrote:
>
> Getting rid of the hal layer is on the todo list. This series
> removes some functions from hal_ops and make the driver call the
> pointed functions directly.
>
> Tested with Inter-Tech DMG-02.
>
> Michael Straube (6):
>   staging: r8188eu: remove intf_chip_configure from hal_ops
>   staging: r8188eu: remove read_adapter_info from hal_ops
>   staging: r8188eu: remove read_chip_version from hal_ops
>   staging: r8188eu: remove wrapper around ReadChipVersion8188E()
>   staging: r8188eu: remove GetHalODMVarHandler from hal_ops
>   staging: r8188eu: remove init_default_value from hal_ops
>
>  drivers/staging/r8188eu/hal/hal_intf.c        | 33 -------------------
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 16 +--------
>  drivers/staging/r8188eu/hal/usb_halinit.c     | 10 ++----
>  drivers/staging/r8188eu/include/hal_intf.h    | 22 +++----------
>  .../staging/r8188eu/include/rtl8188e_hal.h    |  2 ++
>  drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 +--
>  drivers/staging/r8188eu/os_dep/usb_intf.c     |  7 ++--
>  7 files changed, 16 insertions(+), 78 deletions(-)
>
> --
> 2.33.0
>

Dear Michael,

Looks good to me, built and tested here:
Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
