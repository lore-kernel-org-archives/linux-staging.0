Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9321238155
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593917; cv=none; b=AqUZcSGD4gZnb/ujOM5svtGf5Y69IknODqZc73S9mu6rkY7YlpGqoEeTRcQt96PZNj8fYC+J0BEGMWHxlBugAT4rBgL0fbwYQMnOcIknFT+skc2s2D22x2fWAGTBOQJHJuro2Nyhf3UVzO2MGXm5W18CVto0h2e1pks6PkG5imY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593917; c=relaxed/simple;
	bh=GUggOhobSrOlcUDTeQcYGsk57ggzviGGHES/ecK+M4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfQNOztDuuAKfC7dytbvuThBw8DlCqeGrRDy8CCQnXAPNMVhG7p9O/HXrnBAETOlMDsn8KGN1jNADpkOvS8i4EYDzvynDMiOO7qh3iol4UBzufmL9IJhbkQkAiQImLLNnpPz4d6vtlMcLtNxmlhCWW5gu7s+4Se1k7TRodKZ+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFxUEY6x; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFxUEY6x"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477296dce76so59150471cf.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743593914; x=1744198714; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRqA63UFWrU/kbVz2yqnfo+CaGznFARvu1jMY3Mq+6U=;
        b=aFxUEY6xNQM8Lwg0tAci97+xzJL/Awwrv2g9zlIQDYLsarFvgm2pvLzWFpQ9t/tARl
         SDWqk8v1lbRzQ40A64+vz9pdaF1xJMro5uU3wk2wa9JmKcDfh9UIyD80J7wRqjP5nezw
         y7cLeujLgu5/FzKKzLO9vwhv3RR7wvAdvkZNM45DJ2fegl2y8IyB8MPGUaPT3OTH69sy
         qL52fRN6PEA8KgEmu4esY/ELz4/8iuxjfyzXa4Gdgh8441TihTyvgCaToXml/V9J1DDM
         ER+uqDHCPugl/NaOlH9pP6YU8DhXiFn0eQPpc5ukCZrpPOdydK08B7KXeNKi+c7OJLp5
         K/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593914; x=1744198714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRqA63UFWrU/kbVz2yqnfo+CaGznFARvu1jMY3Mq+6U=;
        b=PVhCLBjgXdnG53XS0f1oQlZC8Lm5BlxfGc+rpjqkLfCY45YCi0/bjKDhj0ZjAvP2Sk
         QN3NPDAjGTWnV3ocJzSTgPJBWljyvl7LokjLD741XerCxvvWIagFXmXY0StWolFFaH9N
         g0QDjmeFCQNEDv1COp3cOJ2zT9+o9rqui1Al8iK/aITzvak9I/NE1Tm6sqZ9cLhXUh+v
         hJk2bSvp6gB9KSfCOHsx11mchAy5bPYivhe6/lMHZXESV0aYcHC9U3CabzNwRCTEpx9b
         bMrtwXsZLzlAFELALKw+eFkyLlP7mebJJW0A8RyNXmIqweqp5/aDj2fZbi/NcyrqhrQV
         Wd5Q==
X-Gm-Message-State: AOJu0YwA6CsV+Z/r4t3TP2COLcYgJtEzJc/CRSR6tBLnc2Wo4deZJUAI
	jwXD1IKaCA2sOCR/GcyVraSUuThIZ+M8KMK/aAahaZrXRcaWwEYPD637jFeT7A0baBaHRo6exWt
	0SOXhCDwzwjvrNGP7igcUDnkjaeaR1qlVMG4=
X-Gm-Gg: ASbGncv1Fvm7+gtI5eey+HPVQg74sRYKUR9m69IHGBVY8X0Q1zxLr8suYsV0+Dcp/rR
	aPveNIWwbR4qnbWza7DDwiLl8DqlLr3m43+yjGsZAuSIM57vbgqyYfyujDzabxRL7f5d73RihLX
	6YxGlm3/3l6AOd0oleuyyysAtK421qkxuTKRrMpnNQEU4dqrxJfDSp4D+9
X-Google-Smtp-Source: AGHT+IHn07IIP6+NU94AilqOS6twG644NgpX+0KmOrIAxkFFiYdraDmeVxNFjYfX16bn6CJ8/NKAnwQlbffXBjglfdU=
X-Received: by 2002:a05:622a:1206:b0:476:7669:b947 with SMTP id
 d75a77b69052e-4790a01f711mr29016171cf.36.1743593914167; Wed, 02 Apr 2025
 04:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402113158.45760-1-gshahrouzi@gmail.com>
In-Reply-To: <20250402113158.45760-1-gshahrouzi@gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 07:38:21 -0400
X-Gm-Features: AQ5f1JpkOnQ2KG1mFrP2M4hqJ1HoC8ryy307ZDAG5XuA9hGC2YPKPvsG8alR0ZA
Message-ID: <CAKUZ0zKst7us8LfZCP27=62ExiGisuW0ZqyCvgKETZbvTv3_yQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com, eamanu@riseup.net, 
	linux-kernel@vger.kernel.org, kernelmentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 7:32=E2=80=AFAM Gabriel Shahrouzi <gshahrouzi@gmail.=
com> wrote:
>
> Remove trailing whitespace to comply with kernel coding style.
>
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/st=
aging/rtl8723bs/include/hal_pwr_seq.h
> index b93d74a5b9a5..48bf7f66a06e 100644
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> @@ -209,7 +209,7 @@
>  #define RTL8723B_TRANS_END                                              =
                                                                       \
>         /* format */                                                     =
                                                                       \
>         /* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value=
 }, comments here*/                                                        =
    \
> -       {0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, P=
WR_CMD_END, 0, 0},
> +       {0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, P=
WR_CMD_END, 0, 0},
>
>
>  extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU=
_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
> --
> 2.43.0
>
Adding Greg K-H to the CC list for visibility.
