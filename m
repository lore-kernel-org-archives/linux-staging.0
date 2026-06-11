Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461EA377EBA
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166366; cv=pass; b=Aj6/rrLkkH+bMAgT+rgPixpcCGK1kCsnkLQ2p7bCzkNMxAHdoWzKj9Xgiii6GSrFUIrsOkde1jGRoh1T4GhUM7mfnTxoWxKXSDCyyR/wDxADhvwCGgM3H9y+csb7IacgYwQPn666qMlCRkKAaNcU78fKrudCOIFD9ByRZRenCr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166366; c=relaxed/simple;
	bh=EA27f03wqfSLUjm9fLrJBQkdwvXFjzYtq+ykvgvKYQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZH+KJpgtuv7gbeVvvLu4K98MCaVUSNLss+ba5pjANDdrgEMpdhxG3usawXh6Y3ZeS6zDHp6LB9JVH4kVUnfwvJ8VJvQY02l+mEUpFc9U5uvrI5UVD5rY8FW95B6YsXUPz4JEvcuPAX+kOwoihZ8rZGkCI4eR8y0JUNM3KRt2iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGTIH6x6; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGTIH6x6"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa679cc2c9so1056902e87.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 01:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781166363; cv=none;
        d=google.com; s=arc-20240605;
        b=YjDOqieZ0XLW8IfuIq75e+uSxqJY2/JOFr4p8uAjrmsZpr5leIGxzzWIa2bPOeALZt
         KksNaogUO51dMeKnXSb1dN/rY7X0egS+zBaIXbJ9oPJ73MAFuK54mdwxdFT6V1SdwfQv
         Sh2kJi0MWd0h5MUk0QLB0/aVZ/1XpfeL6TmBI1iSAfhMuYpaYZOCSZJF4xVd09AQYSZp
         GnJx/HUaLtt+Sjkk5ZzFsUgnXdI2/AjrBReccNl1SUUFJ23AfJuwjEYal6pXT+90Xc90
         +FENM77R09xHVvCtCySHasdsOOSPteGuq191HEoha+Hy21LnCtDzRJq9UTa4LUP1CTFW
         6/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ohV4NYOrr1fRGWbfNsQdCkeM5F9T17cJR4rqvdE7anY=;
        fh=4/V9UusCEJ1SKNwhUBij58qT0A4Xu76hlR/duic60vg=;
        b=gMLviSqYhwBCKNZYk2rDQGVgXasskA01ZUHPn+/wWNhmosGsFMerwf8rWMRI00VT6u
         1mBSL8ava1ehT6kWmFF8gjqjmi95PAaeH2Vetk9+ZWTkRI857oqqBptd7bfAlC+rerKR
         vjA/lUcVGfIzJdwB2qfhXm0h02Mru8ufeJKIp3zpn4anytS9p02U/KHrDDqGiM40wdYx
         Kx60PUrQuwfUsyknFxMpQeOp4Z1XTz5Eac5OMNt5qlGEmeApIke3mTKJBr+9FttWL2f2
         VfZv9PvREAE9D8tbs8WmmuJ+YupnSAoa28EVWmd1xibRfc+TaK197g2ShnAs+I/PFmN2
         94ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781166363; x=1781771163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohV4NYOrr1fRGWbfNsQdCkeM5F9T17cJR4rqvdE7anY=;
        b=fGTIH6x6wv5Mhh146QDZvo9qjVgm35bgogc0lg94nzsxed3i+XihdlW8MT+dEl8EpT
         fEvYGTMI4dsSv6qAOs3hEjaBxRef6rM3kQPuvtwPPzfK+vptcpQCVKhtPm8wjpdC0WLk
         JSVKeNHlu8+PCrRMlNcmEqknSDi5WPtKjNigtXKX8kBOY/01hRTwY2CSSKpCIrJv/ffd
         nX3fm2i8aOd/LxdyVkfPsKjXY7PukGk9cmo3L18ysp0wC5txwcrR37eWJiZBbtrR6vt4
         9HQdXGXJvuAxQeokWy8lRAukRkKEKNxBoFvcRIU0cYOVaWW2vgJbWoDjN1/I5p1+64RD
         1iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166363; x=1781771163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ohV4NYOrr1fRGWbfNsQdCkeM5F9T17cJR4rqvdE7anY=;
        b=I22O82svShj2s+mulVgJycaZtYV3KNti6nn77KFV47f5GZQmZqKREC2wt15/r7xPzn
         fygBJuUldQm6joUXj0Lk4mkTNlPKHbvOQLVj5p9EB0BSThZ1+QfXmGrh2PsQ2OQATG8C
         4PjRZ/I1qxnkLegzOZxDcfDQQDqZX2qtDTdquMlHbl0+6Y9/iIzsSddOu2KzHjkSnZPs
         4/N5eAdxAKNTLtIonZ7FQ0OEU+P0gZGznVYsP72PGp8phEC/Du3CZFFc/etQkH8Gg/Sp
         /wPXby2rmjYNhjizWe6OKCsJhAVwkYV5AlC6QFoYYbxn3zl/S53/1U35vLzRjy5FfkBL
         /t2Q==
X-Gm-Message-State: AOJu0YyQFhZ6PDHUCWEdnkkrxdFZRoYXfjzDXA82p/z5Fq0UEYVt6DJW
	L3EXrpdUkYg2vcq8ERshBDpH45A8Q72a+tcnKii32Vwv2cAXXVuDPf+NbwMUa8L7tapXfak8yr7
	LrS1S/Q3MAgiXyEj3cp3FY8BtUrYDOEY=
X-Gm-Gg: Acq92OHBRdv7nmw9Jc9EHwgJGParxASdcUGClPwde70MW6AbACucyZqxSNT+nCqqem0
	HcxQnsh8kY5/gtrc3sB8VCjf0IwGQXwSrOyP2B/Kpakmgq5/QiiTNbWS1E6NvWifGCp1v3Rjora
	XNIILVZq2pGEaJQNF6CdcxdQDXZhpXIj1p9d4vEvBb61gOediyU8lE88xwPoFTpvYdAVIgNqSz8
	bDyW5FpWhprM+DeAQLLSgem41hQWgRY60I1EkSQDTcHEGoPt4519XcrIZY3LxXSbdlHHRVDhGBw
	YYZiTnUlQgRXhJynQhYrBODTKH+xoyk=
X-Received: by 2002:a2e:bd88:0:b0:396:7eba:a8 with SMTP id 38308e7fff4ca-3991a28693bmr2502891fa.8.1781166363096;
 Thu, 11 Jun 2026 01:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611081644.1553264-1-chenyou910331@gmail.com> <20260611081644.1553264-2-chenyou910331@gmail.com>
In-Reply-To: <20260611081644.1553264-2-chenyou910331@gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 11 Jun 2026 16:25:51 +0800
X-Gm-Features: AVVi8CdqTgv8wWF4RMiCElXnJspTnIC3HnLiqZbM9JC28K8ex3Fc907RQkI8p68
Message-ID: <CAKspUhKdfwxmYcQrfBQYvG7X5xst2Jc7jdeAeNHouakCuJBhGw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused netdev format/arg macros
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrei Khomenkov <khomenkov@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, please disregard this mail. It duplicates my earlier
submission of the same patch:

https://lore.kernel.org/all/20260611074613.1550984-1-chenyou910331@gmail.co=
m/

It was accidentally resent due to a shell glob matching an
already-sent patch file.

Chen-Yu


Chen-Yu Yeh <chenyou910331@gmail.com> =E6=96=BC 2026=E5=B9=B46=E6=9C=8811=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:17=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> NDEV_ARG, FUNC_NDEV_FMT and FUNC_NDEV_ARG are defined but never
> used anywhere in the driver. Remove them.
>
> This also fixes a checkpatch error:
> ERROR: Macros with complex values should be enclosed in parentheses
>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/osdep_service_linux.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/dr=
ivers/staging/rtl8723bs/include/osdep_service_linux.h
> index 2ec54f9e1..c8274da94 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
> @@ -98,10 +98,7 @@ static inline void rtw_netif_stop_queue(struct net_dev=
ice *pnetdev)
>
>  #define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)), (sig), 1=
)
>
> -#define NDEV_ARG(ndev) ndev->name
>  #define ADPT_ARG(adapter) adapter->pnetdev->name
> -#define FUNC_NDEV_FMT "%s(%s)"
> -#define FUNC_NDEV_ARG(ndev) __func__, ndev->name
>  #define FUNC_ADPT_FMT "%s(%s)"
>  #define FUNC_ADPT_ARG(adapter) __func__, adapter->pnetdev->name
>
> --
> 2.43.0
>
