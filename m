Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A423EE1C9
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430906; cv=pass; b=LH5pBCnog52W3ePqgOtin/UfXcMbGGm6KGOSJKuW3+nSKj33jW19hq8+VO6w3mvyF3PzC4ImkX8UV5PZZE4A67vbYoNjvbcQB7cJKxmNCI6O4sasqOLHdYSOi/1KwlwBCoosRa6wEf1bUNthpZ+Pap5AtmcAkshY2G47ejjS5UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430906; c=relaxed/simple;
	bh=20IqqGBnVvGjIfSi3DFJXqNEQAaNfil+bS+MiKOJZhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/p6nWA6nqzQq3fda+/tIwqs/RHPRm42/gJXZtlqwJAWNzkUokU4jH4unYciGhiPDu2y+A6YG2gqG5nRfK//sfGYlaRfExwY7hExGQSbQyMADzXucg0FXzKZ9C7l1t1whxeDTDdoE9qmS94aCjd+bmgLEu32IKbw5nHK9nzFYEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW/a3Qfq; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW/a3Qfq"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-736eea06c3eso1249873137.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 06:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783430904; cv=none;
        d=google.com; s=arc-20260327;
        b=Ni02GNuAXRsbHjhIRgw4TqT8+wbP8BY254CwDztLVcOfpEjpmOjpT9MGTYXpuyrdD5
         D2fiw7aY6j/Za4nJrX7P5GM12zHtODofW7Xm0OE4JprU7EzyWV3xQEBrqS/Mj+61RA/l
         1wSybcPV78yFqPcjvOWakwHjiUCZtlDOOhuEI1WNZhu+BgRcGrO1MXDgFePMF+L0AyqO
         +O+ok2urn+IdrDzox+ULOBAJQVftaZzhcH2D207AZWG0u5eMWEtsaX1pNFFBTwNJwB6b
         xncerT/Ctingm8vTNveVjxfaO7RrZq/Wv13EUCVIoOhmAfulTQfsVh6yEAEZujdD3uYh
         /CAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cOGlQ0ru/oNUpQ0lA6d/gMFDYWSl8uOsn6usqjQw688=;
        fh=kZSvyqyV+js4bNu16rwMEVuMgpDzqg0OPOpKBv3Pnv0=;
        b=oz4sXhz3P0Zwm7ssKDkp8bDyrNIEu1P6morMgbuwuncr17AumdDppOl8pthdgZqiz9
         TKXdsRexUS1yEk5hwzsYLMdWupZ6pkZFx4OW0KHmRjdMJ16X0Rj+fc/184A/3VePD6Fw
         NbtlG4xoaTdMgZfCQ7uVisnMRCJ6c3uAwPuZgJT1zsFIJC8SLMrVuXucrv47IIRxZ2lh
         36amvW04rxkdnNK6uPEgZsWpj2kJbKsnW8tggrM9pWITJhf4PkU/YOsXdnlF7k4TpbNL
         3tZKh9CeCVJu9PXmKch0DQrpSOcy1zrZLHE0yfBOHMEumQSE1gGx92NrdnULqtLLFZPu
         HFfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783430904; x=1784035704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOGlQ0ru/oNUpQ0lA6d/gMFDYWSl8uOsn6usqjQw688=;
        b=TW/a3QfqL2L7umjUB1ckCFp6yQf8KBjErbOAqZJEuW6bBTHzqmngkYi+954HoL+nJj
         a9j95GkcrawRUz4DMCJ1tPIb6UUd994Mw0j7WcIJk5v26RY8ujuy9x0481JijYhphbC8
         zU97Cm7A0mya5cTBNWbgP4g60s8R241dM8XYX+gn/SnShMho/gJfUKQNvNoSRIM2yPqq
         eQFCch30HdrPpeXt6ERP5+pAIo9A76FK3u72DdYs4+OltkD9wUqZDAMF67h3RT5GDEQs
         mu/JHkG+KZCne3zJ7N+smfJp245RN/zaQjoFm0ozbYAJX92XJ4nvH492tFNlyzpmMmto
         oGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430904; x=1784035704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOGlQ0ru/oNUpQ0lA6d/gMFDYWSl8uOsn6usqjQw688=;
        b=GZGZeuSzea5X/GNSMGeXiP3tLPa0rQwg+eaPuzfco+/Mpe5GCh8QXJcVIav9utkwuK
         +2dz62iGU/eRx25Ycmv/MaTfrOmkyuXfhs/QvefitbnZ4FIhYv946jLmhAIHidctoTRL
         UAbop7m2Pbwt8PH9yrz20rRGV+hnwjEm5xcH0BOhzfyWa5bB3Pk5D0dGYvgDSGTgaOkw
         Nby5F2lGIetFCMeKQi9/S7voxN09cQv8Bn8NheZxH5GmVx/iedM815/mYQsDWD0tUx2s
         4FG9Pr+FyW/ggwXt4RDjkR3ZcfL1FeTVuQIfoLFIb+mG0EClZLCqBreDoNpcja2xHqqB
         1kzA==
X-Forwarded-Encrypted: i=1; AHgh+RoSF6+ztUq9N/iAsNziD1yxIv7TQ7DaqQvk0ovBzb9oqVTLToxZMO7zYZEkESwQP4tgNgBQtkZripFwCpto@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2IVZhPpV2q2rHtIGrK5DdJ3cFakvkigh4QhdM+Y62k24cDwxx
	d0pBsIEBnzEJ/IkkbAPnOUfrAypL6HTivINOCF0g6qUEB7rjauK31LndcSMMMQfrod18+sEAOmM
	w86i1PIv18e6OZCACBSz9KeUBJYNNIag=
X-Gm-Gg: AfdE7ckkGCLmiNZ2PMgrhztCRAd1k+phxW59JY0Gy3cK4jiHEkQW49ahLC/e3H8Q1CT
	PmfFGGwRYzfLq37fxMcX86b2b/sMJDNWCSEOBX1d+2G3lk/hlcaN1+9XZ0Zva1RrZyrwLO0vgRh
	bUQz7ix7qK2arhmJUQLKsC0b4cKOUyq6HUankGBHzHNlu6NhYgI6/BVMblnqLmQhh/IXoqRtjZw
	UzuvmsgrrDuSddi/nA7BBPNRo1/JOF1vwwWF7+LFhAucWXl2X3wZlY3xDdmzRpCyRsyAeqCY3QU
	PAaRvb10
X-Received: by 2002:a05:6102:440c:b0:739:77a7:90bd with SMTP id
 ada2fe7eead31-744b7eaa2d9mr2663891137.26.1783430903719; Tue, 07 Jul 2026
 06:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026070710-exact-unveiling-e321@gregkh> <20260707131529.38340-1-andrem.33333@gmail.com>
In-Reply-To: <20260707131529.38340-1-andrem.33333@gmail.com>
From: Andre Moreira <andrem.33333@gmail.com>
Date: Tue, 7 Jul 2026 10:28:11 -0300
X-Gm-Features: AVVi8CctDRCOTX5qGqEfPyxWGD9YLPcZTNP47ks-LFrtZ_mPqmuPeYfvt0Nxn9w
Message-ID: <CACO0qFLD_7BiG_Dfy8x_SQLRHiGMejPmwGLFCWjTZZmc6h1Ovg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: sm750fb: rename variables to comply with
 kernel style
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this v4 patch.

Upon closer inspection, the 'init_status' struct has been completely
removed from the driver by a previous upstream commit, making this
cleanup obsolete. Sorry for the noise.


Em ter., 7 de jul. de 2026 =C3=A0s 10:17, Andr=C3=A9 Moreira
<andrem.33333@gmail.com> escreveu:
>
> Rename 'setAllEngOff' to 'set_all_eng_off' within the 'init_status'
> struct to avoid CamelCase and comply with the Linux kernel coding style.
>
> Signed-off-by: Andr=C3=A9 Moreira <andrem.33333@gmail.com>
> ---
> v4:
>   - Drop register renames 'pvReg' to 'regs' as they were merged via anoth=
er upstream patch.
>   - Keep only the 'init_status' CamelCase cleanup.
>
> drivers/staging/sm750fb/sm750.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm=
750.h
> index 0324778768cbc..3a1bd38ab347a 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -39,6 +39,15 @@ enum sm750_path {
>         sm750_pnc =3D 3,  /* panel and crt */
>  };
>
> +struct init_status {
> +       ushort power_mode;
> +       /* below three clocks are in unit of MHZ*/
> +       ushort chip_clk;
> +       ushort mem_clk;
> +       ushort master_clk;
> +       ushort set_all_eng_off;
> +       ushort reset_memory;
> +};
>
>  struct lynx_accel {
>         /* base virtual address of DPR registers */
> --
> 2.43.0
>
