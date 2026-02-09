Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0276163
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 22:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770676707; cv=none; b=msICp8czZn+AV2NaTnS9i7qEuy0yo7moUMr3a4pzZjeFbRcdpVUmjXUfSwcOyEsQ0XyT+Y9UPwisBwHJHSlD8cgOXo4cLtKor5CvfPtaeavI0YyLrsrL7UMBpkkSoo3nHqB2196LOiuZ/pGR91c3yAcngMsj8EwpQmmw8ArQ7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770676707; c=relaxed/simple;
	bh=+1F8FnL8CSpeYwsWHRcAkwnqlL/SDejneXcwMoqm+MA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gaiQMgvP6FIT1o2vkwJitnNJHWHMGZFPpwKS+WUjn/etObbiHZLbqqhpOrvUlV5T7xicVmpVhKBw4uDWb8h4LMauB0F9T5hi4eNUV5att10nWqwD8sSWXm+NZK6ZnTkpcB0LUTtDzZBcbppoKKqc+KjPTWK2OdTHQKeHDRHU4mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqRBj6IZ; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqRBj6IZ"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64aedd812baso242735d50.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 14:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770676705; x=1771281505; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylGPgnUxLH7s6xZuSjA/UAp1Het5Y0hOy+2+tVkQq1E=;
        b=DqRBj6IZfjVItBy650Y6SgnXJ8lAtHEFgJxA/Ntz8YtPmEVfl2HOhMe6GpuAEwm2N3
         +o9/0xeRk/gxtqwWqoBu4G18PC5PaWLpibYlAiBxvQz9e6MfZzu3x127gS4dMAeBu/B7
         45r3Trh2YDSHOb83tCHcR6oVjCr6fN4ckoikHANdDCYzopFiXoRYQ41Vox/1n92hffY5
         YoMcKHlMI6QZn0MWCEtIymDHGodpES1mfqHCG/ckeR0bSKslWG+KfdYd6/9kSYor348Z
         29keKduBzRL+jt2ITFC3ogOrv79QHCpI4QQKjv/IPIbZm/mmPW8asx9KcUHyDE2++IMt
         7flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676705; x=1771281505;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylGPgnUxLH7s6xZuSjA/UAp1Het5Y0hOy+2+tVkQq1E=;
        b=Rsyex8V/pn1RQqAYfZf+V3xWgt8W06u0TS52YYPON0/QSwuduEqDFjK1UT6g/cZxRf
         uPr2NeWaw2VR59/NPL+9VCmo8SxQCSHeW91ha6pFlxUg9l5xwOiIE5S5huUGGULmEHpo
         RkA/V7GewUyxdoUG95AIFex+ESa8JFifONGwXULsUB6CUKm/DtdGsPaIyBjjn7OGerET
         diw3Y23OBHaSOieuWI2GdoG2ligOQFrdkkVGFP+Nmmtl4pZi9eiPEliiXKqpVPlhaUOg
         N4cIOAFhBnT7XXxFjlkI3AoDafdzBMtRurds3nt7kz1z0wxzE47SzAyM2HcfNB63yidM
         QL9A==
X-Gm-Message-State: AOJu0Yxdi7ctXxQ/EBZHNFDX6hRQaDbpkvfksDJ3yVxkZtsaxXN2L1+V
	ZMEUNHc3ZRM4IT+bK8ubjZ/YY+y1Y2x6aHuHv9K/I17fPFoIqzG3Vpc+
X-Gm-Gg: AZuq6aI6vrK5Aoc/MZwGeIBVg9Ugwyzvma0u9N7jPgi706XTIh4Eac74ocpDipXRnAn
	+0ZqyPIqgFr2i2c8YYts2PBoVfxD5l/LKKSpkBfJKni25F2IRrqYfHRG5LB1zds8N5kKJiOlX1E
	9CLCmQpEB+o447NRtbI5lr6PZ/BCe0TvEfh/xuF5843OD9GrSIuIcgY4X0g9WDyaL/z/DOVjs2a
	nQf17YrZJYgSbo1irQ2nGHFXohwrpLRJjRUn7X5mZY9+MSumxQTXIgqkiYpvx50wxhhsG2b8N9o
	9hTVSxanrYC/3+LPhYGa9mHrHhvz9wjMT/5qsjqH9FsDjxOdxc0g248AMZh/hfElLuoHsBkjiwo
	7A204i4KLlMdS4wPJx1t92jlm6v4fHX39Skj1I5/eYGfo5RRAcBLhBhohs06y1LTHnr9zRjYYVc
	Em3lmZ3bKNrI4SyPW3rg9yMGBsvrXI1aTEC0AHeBsYh4VmB381Rf05yfekD4OFXtjz/fU0jbUdV
	h+6y0NpUd+P995KnWfx
X-Received: by 2002:a05:690e:2067:b0:644:60d9:8648 with SMTP id 956f58d0204a3-649f21bf408mr8255301d50.87.1770676704762;
        Mon, 09 Feb 2026 14:38:24 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64adc34f7easm6426581d50.20.2026.02.09.14.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 14:38:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 16:38:09 -0600
Message-Id: <DGASI1BELRMN.OCCUPYE9KJBE@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: improve comment placement and
 readability
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Matthew Marsico" <mattmarsico1@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260208225648.11207-1-mattmarsico1@gmail.com>
In-Reply-To: <20260208225648.11207-1-mattmarsico1@gmail.com>

On Sun Feb 8, 2026 at 4:56 PM CST, Matthew Marsico wrote:
> Move trailing comments onto their own line, preceding
> the referenced code, and rework them to improve
> readability. No functional change.
>
> Signed-off-by: Matthew Marsico <mattmarsico1@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ioctl_set.c
> index 587a87fbffeb..fa3b4be11ab2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -174,7 +174,9 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, stru=
ct ndis_802_11_ssid *ssid)
>  						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
>  					}
>  				} else {
> -					goto release_mlme_lock;/* it means driver is in WIFI_ADHOC_MASTER_S=
TATE, we needn't create bss again. */
> +					/* Driver is already in WIFI_ADHOC_MASTER_STATE, */
> +					/* do not create BSS again. */

The linux kernel coding style wants multiple line comments to look like
this:

/*
 * Driver is already in WIFI_ADHOC_MASTER_STATE,
 * do not create BSS again.
 */

 Please consult Documentation/process/coding-style.rst under Commenting
 to get more examples.

> +					goto release_mlme_lock;
>  				}
>  			} else {
>  				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_JOINBSS, 1);
> @@ -310,7 +312,9 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter =
*padapter,
> =20
>  		if ((*pold_state =3D=3D Ndis802_11Infrastructure) || (*pold_state =3D=
=3D Ndis802_11IBSS)) {
>  			if (check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true)
> -				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before =
this function, we must have checked whether issue dis-assoc_cmd or not */
> +				/* Will clear Linked_state */
> +				/* Disassociation has already been handled above */
> +				rtw_indicate_disconnect(padapter);
>  		}
> =20
>  		*pold_state =3D networktype;

Thanks,

ET
