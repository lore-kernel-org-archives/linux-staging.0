Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70361AFE8
	for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 18:40:10 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2478485fd76so927946a91.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681843210; x=1684435210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LHv9N9/HFVqKxzoKPoqcmb9LbcWkIAFqisfybYb+MY=;
        b=q/DWOACuVLUo32r9r6o5lmoYVt3TeJIwgwWAuun3IfYo8MAoz4A5IYJRtJ27dJVgcd
         zOFM1mW26IBes8vCDwso578PDZWdnr3OkKQF1xFU87nFrY33FHdMpxACIbiH2Mrw79lR
         A915rnN0qgcrL4hzO2nxCzrgVZYQSBROH+MzxkfAP4q0mVfHF/RQRejfqjswUMBibvqP
         K0DnWhOMmpGHITjqPoE1P80hdXN7rnQa/NzsiqNCby1zFeC/Ywyyp3apt79KbkFqWt8c
         /BCgjQRPiDqJYf46YMfitthcTDGgBxg0JGxWavUY4lbSzZURU1TpH8EyWQIoxmpN5mP7
         CfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681843210; x=1684435210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LHv9N9/HFVqKxzoKPoqcmb9LbcWkIAFqisfybYb+MY=;
        b=gQoH8TRI7N7ZpJx1XGPCl2PkJ4ODMNq8vQHCAiBrWmDboae7Rre7Hyh+fzgD9EAa49
         EBjcN+ighENZAZvbripD6f7ATULNR8+i1PMfOAGm552S8cMKhwM0PNzsDH7iuVDupvvo
         Y/HKF4QRlt/wLidNsISEGZdNXLZc2BaK/l2jzk1w2WT8/RwaK0iiltp51CjT+vkD3U7K
         dN14fei3GqY49L45OTXnISE/PUpHlRImlMWhbyjFdBzrRNBwNvvhlZBD5W3QIPEGbQGk
         xdjkf7WiDmir1umNO2BgK5psqRJdJfwRHHPVxwF3LTPmc1VEcfsOVGlIN6uPOEty8NY6
         lxrQ==
X-Gm-Message-State: AAQBX9fkEZ+hoTXFgSVXDTTw14uapV4xEnN8t7l1gWiPqHjotGBgwiA/
	4iBlXOf4VbQ0gp1GP/GOQTNCdTbnhhVTOLYOTzgYNA==
X-Google-Smtp-Source: AKy350ZsK0yvZUWE1zRa05ieglnNKlLegyMH1ze252gPEOO5e1sXfeTVgJKdDAD52WLV5jZmdlmhwNoN2Zeo0NR/WbA=
X-Received: by 2002:a17:90a:4594:b0:22c:59c3:8694 with SMTP id
 v20-20020a17090a459400b0022c59c38694mr444300pjg.44.1681843209703; Tue, 18 Apr
 2023 11:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
In-Reply-To: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 11:39:58 -0700
Message-ID: <CAKwvOdmuwuSn+4csSCwsNXM01ohsp+ZzcWQ1WfM_kgj_NRugZA@mail.gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
To: Simon Horman <horms@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 4:23=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> vchiq_platform_init() is only used in this file so it can be static.
>
> clang-16 with W=3D1 reports:
>
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: err=
or: no previous prototype for function 'vchiq_platform_init' [-Werror,-Wmis=
sing-prototypes]
>  int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state=
 *state)
>      ^
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:1: not=
e: declare 'static' if the function is not intended to be used outside of t=
his translation unit
>
> Signed-off-by: Simon Horman <horms@kernel.org>

I would have kept the return type on the original line and just added
the explicit linkage on top, but it's fine and checkpatch doesn't
complain. Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 40dd62cf7399..59312b9f2058 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -462,7 +462,8 @@ free_pagelist(struct vchiq_instance *instance, struct=
 vchiq_pagelist_info *pagel
>         cleanup_pagelistinfo(instance, pagelistinfo);
>  }
>
> -int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state=
 *state)
> +static int
> +vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *st=
ate)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct vchiq_drvdata *drvdata =3D platform_get_drvdata(pdev);
>


--=20
Thanks,
~Nick Desaulniers
