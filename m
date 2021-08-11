Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933172FAD
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 23:50:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id f3so4877600plg.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 16:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kWMH3PAZAv4+GfGaXs+oiFyMUncS1K0IUlvwZ19DPTY=;
        b=bAHTHIB0S8t5JP0/xnmGPJUG3eA6pFDe+sC32aFryY5J4JP13QgIZOUd5JIuZYPTEe
         AgmWgxnTMW7Uyg+rz77mN7xoZy/svlKW55kIpnCizYO+tOnR+TAvILJiaCi56aAQ0mY4
         Wjt2PPapVUVJgyo/a9NbV/kvjKVrhHEThh/FCqkqLIa803giAKyy4BGVAJWaIb07uvUX
         VKOkACa5/uKr6jT47s5VL+upD5nFny/lQnWJs570hfyHztRBa2DqH4WoGPonN1pR/plt
         91DujdEkt0x2AkN9uPNfKsreGmfKjUfPbmWSz073VP+YOm8zq4WwRQXsczJUYlG3Cab4
         Y+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kWMH3PAZAv4+GfGaXs+oiFyMUncS1K0IUlvwZ19DPTY=;
        b=iYt75li01gl6fRHI1FIzaR83yQmJnVZyStelqNIzOBHfpaDVIttZJw7raiMWCgjrH/
         TrQZwWdy3UtOWpmwmCX6Ld56STqYNP6kM3Ve1QnWNsSSu74GPEqHgTOkGI9aU8McrODP
         C12ljVv6q7705ki1F5+J7bS7NvD7Qz8pI7M6KZMUi+DS+dUOh/L2bC2oltHhLU6+wTFh
         vJpb6bhVMxjRPgKQIgM2JlhSClI06rC4s6vl5V+S/6zcNyhJFSSJJJswfX7DsyynRWsa
         I2kEgxQWeOGnoT3xP5RWuC6XLRTKyOwVE3T2rY2rfm2PYi3qT6Yt7f8OvcwZyNe+4HsS
         73pg==
X-Gm-Message-State: AOAM533sstdYD5d/5rqmocqSIBQPpcBKqzO/CFPTHNgeV931gNi3biEm
	CqoddUjVsdj4HaKn2ovchxitXE6cpstcDJoLZQip9g==
X-Google-Smtp-Source: ABdhPJzPyRs+oWgbMbNXOaBBE90nenU0GBlkAf1I4jaw+EF4bTu41rtzPc0sNxm9DuXwkbmIjwJ2LKQhLIDnaW+9eqc=
X-Received: by 2002:aa7:90d4:0:b029:3b3:2746:5449 with SMTP id
 k20-20020aa790d40000b02903b327465449mr1263455pfk.81.1628725808142; Wed, 11
 Aug 2021 16:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210811201450.31366-1-martin@kaiser.cx>
In-Reply-To: <20210811201450.31366-1-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 00:49:57 +0100
Message-ID: <CAA=Fs0kjxzObRFYU30KhAu_GxA9oZ2R45MHCA-oD3NoFqW88vA@mail.gmail.com>
Subject: Re: [PATCH 1/5] staging: r8188eu: remove unused efuse hal components
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 21:15, Martin Kaiser <martin@kaiser.cx> wrote:
>
> struct hal_data_8188e contains some components related to efuses which
> are not used for rl8188eu.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/include/rtl8188e_hal.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> index ea879572d6e1..3939bf053de1 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> @@ -263,9 +263,6 @@ struct hal_data_8188e {
>         u8      bAPKThermalMeterIgnore;
>
>         bool    EepromOrEfuse;
> -       /* 92C:256bytes, 88E:512bytes, we use union set (512bytes) */
> -       u8      EfuseMap[2][HWSET_MAX_SIZE_512];
> -       u8      EfuseUsedPercentage;
>         struct efuse_hal        EfuseHal;
>
>         u8      Index24G_CCK_Base[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
> --
> 2.20.1
>

Dear Martin,

Looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
