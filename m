Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725663C7E1D
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777818180; cv=none; b=pRUHeou6gcWElEDgaAZAqVde9lciTyBWSkADJPCkZ5q2P4Oo/ZGqVJ9EfZCESiuVXKd6wfVbRP9KUXq111ankO+wcPtsVyGomNYJfBrlIsU4WkdfZr7v06PRtNpXdfwL6dlhcItvXZn0gbPO2nviOuEfl9utwHrzVAT8VLrBqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777818180; c=relaxed/simple;
	bh=U7pwhyXBMDtWvkMIs7VuTEmpG9+lGG+wV56eRoTfp48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGReJpIt9v0HOaUUktJ6ezjJkNwz6D41I3R1F2KjAIuDNMYe5z/MXSlwTy71KcQL8ktDI+YmVWkWnqvJeB/osIHpdYSLTU+zx+9138/BPGJGPaYzTutsuxpymGPM7VvccxysnubZzb2H02ahIs4+zSZL09rnA2U+O3LVttdqHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHOaIlyP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHOaIlyP"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38def541b0bso29541341fa.1
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777818176; x=1778422976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q65oEaXt2ePAiS+XY6Tj0z2vpKPplbzs5MIN/+Z0Bf4=;
        b=UHOaIlyPBdAOFc2yhH3+lsDvW5x7qSOMslSfjm1nbGm8xFaVfpGJpLwUeLomSM94Dt
         Sds2QqIv4mVDyu3H9FXiwGerN6E50IM5JFiSk6nALyI/GEGetTBmfRKSgmYSQOVMO634
         VE6DpGWCfxzOijOKJTSvsbemfM7szpw1g9/mXDOjBxRXYWZoeHj4B8Vpotg60ZCaQbD3
         3AqkW0WcibjAQ9+QLHhuPshisbbVvP4r7+BCVSKnhJiWJ0ISFWctfPNdLVcyButdlhbv
         JXEYlDP7kyhy7jyc4qzkoKhtiOuE173C7mGVYBvamG0rLD0Eug7VJI4QVju2yNMuw9ME
         O0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777818176; x=1778422976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q65oEaXt2ePAiS+XY6Tj0z2vpKPplbzs5MIN/+Z0Bf4=;
        b=sjAKEIXbhmM4P/n79NQInTXsNZega6o2J5e7evPlaTUaQvyiSWjTQiSLA+muPoC3yH
         mIvI1xAiWfLT0zyUMIIqtQfpRzoLBQFvG84EidGcaGS9qqg4NbzbJ4fNu+61i0JUy0O9
         FzTbH5oOMP5f1CTaJS0mrjBbq9/k+zn0c0MdJ/8uwr/AsAzj1DsE7lYwVFdZHf93N0Ed
         J19j9AGpXLIQuQIl1Zdo3qTpI+NC5HLSWh4Nv8KODzH636RNS9uKTytWpV4fD/pzgtDt
         rWTcly5z8PeRpjEAmKvF3OS25ssIY83HecK54Q7zIcuqTrtr80DQfb+KwfsTvFmTnRPR
         OfCg==
X-Forwarded-Encrypted: i=1; AFNElJ/CikyirDJN3s66ByxSGtYHoB+6C5jFjzHBydgmcqK6cONX1Enkd1DuVAhTYu/ymseQEXYt4pvgbSzSdsf2@lists.linux.dev
X-Gm-Message-State: AOJu0YyY4W8+gKMduOANw1esQ+hjxofXA1XITEIt6LUn6Fb+A/L4Pawo
	QCgmfYWyTJtnnXILe7c25g12ZqVGe/8gPrflznW9Xf5DhM9Z58GnTr6c
X-Gm-Gg: AeBDieusAf6kCmYvOxFB1Prqp96bpnfX1m0rZzpfHbWLBiGGo5vJy4hu2I7CqpWiDtx
	kV62YphMiEWH1FIL0lRxsB065oUPWuzQ4R5U22vLTiiydjn8+vdbk/KLGln07wn3+2XgcVmnG4z
	e3YrPt6+iNtvPCmRzCt7Dzc9u5c5bFYUCQGlecOfKza0eRkOy/1kHFoPRiEr7qNdzWJ6T3UqGkH
	WgcsmdonY+qjy+zcanjSWT8Q6obeIQ6K76p29PNdRPUmrWe15+6IlmYqLAMZm+JL/dan7ZhxY4O
	41DI5KeS1c9cFxP9oFHdKi2mQh3OA56/BCivJw6836Kn3sm3mKMi9EpskxM0g1jaj7YANfWBcHp
	xS4PQe7lvk4gp60P8oW3zJyiA8MBbFGhkeBqIoatOVFotSH6b77cvlS4EVQwn8jp6aP2qAq9Nv3
	E5pTWdteQ/jiwDuWh3zSr4lK1wMShoyE8lf4A=
X-Received: by 2002:a05:651c:1602:b0:393:93c1:b7d8 with SMTP id 38308e7fff4ca-39393c1b8ddmr7860961fa.28.1777818176057;
        Sun, 03 May 2026 07:22:56 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300984sm22026751fa.21.2026.05.03.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:22:55 -0700 (PDT)
Date: Sun, 3 May 2026 17:22:52 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Ashwin Gundarapu <ashwin.gundarapu@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
Message-ID: <afdaPMw7F_Bczd_T@archlinux>
References: <CANAeh8e6rfBackrS4Vm1x2rFA2gW08iz2t1Kc3HCcPgN9S51xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAeh8e6rfBackrS4Vm1x2rFA2gW08iz2t1Kc3HCcPgN9S51xw@mail.gmail.com>

On Sun, May 03, 2026 at 06:40:53PM +0530, Ashwin Gundarapu wrote:
> Remove unnecessary comparison to true in conditional statement.
> Found by checkpatch.
> 
> Signed-off-by: Ashwin Gundarapu <ashwin.gundarapu@gmail.com>
> ---

> From b49d621579be96ef71e3206b888f3ab39c297491 Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <ashwin.gundarapu@gmail.com>
> Date: Sat, 2 May 2026 17:19:48 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
> 
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
> 
> Signed-off-by: Ashwin Gundarapu <ashwin.gundarapu@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> index c70541f95a73..c100a0d70fe2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
>  	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
>  		goto release_mlme_lock;
>  
> -	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
> +	if (check_fwstate(pmlmepriv,
> +		_FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
>  		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
>  		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
> -- 
> 2.43.0
> 

Hello,

Your patch arrived as an attachment, not in the body of the email. The
kernel development process requires patches to be in the body of the
email so they can be viewed and quoted in replies.

Please resend it using "git send-email'.
See Documentation/process/submitting-patches.rst and [1] for more
information.

[1] https://kernelnewbies.org/FirstKernelPatch


Thanks,
Nikolay
