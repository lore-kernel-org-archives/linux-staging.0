Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D138237F
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667639; cv=pass; b=ApHhsRcExAETQGL25n+hnwH2MoIwOpWQ9Dkd1BalT72vc7I2HjOBcr237RD5ofU2Oa846XD1YyoApIImLH8724iBuBnJvhZZ5KWOfT7wnmJgvCiJPS8PECJ1r9U4ncT7lgnZEauK7HCErKLiEZketuZjEBtd0v+lY8892PYkHH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667639; c=relaxed/simple;
	bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4sk9ObIHYnyJjdHq3vYn2ZDnkr9wmsW7fVX/9TNv1FeGkzDXpx5dnMxMotEafSXiKuILxSQu+xFq+JNE3OO6Z3Ws6wgwzqLt6NAztXA/axypaVi4ED5kLIdLB+pNmwptEhhbom25qzz8uZIozjov1/77DXT253SNY1DmOWQaoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aw+qJf8n; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aw+qJf8n"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9910707d82so402605766b.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 23:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776667636; cv=none;
        d=google.com; s=arc-20240605;
        b=Ev+TB5J4MkTCaof9p5wSTbAqNkH81rBRN19b/QZ6xs+rbWg0tJercc7ZolNml2DfGF
         WaJZl2JI8BoyG6YEJovXXnc+v6Lb4Kw1COXByFcyUUQAgjq3MHWkQDrtcBV9JAgzkveQ
         Jtp97FMF0lFIx7RI+g3xCxLGcQP6XKb2iXVdXzxkUTuwKghw9g4kUXCybTRZHqaJnxQb
         t36SB8oEQy5pZz31BGXEKZSD2RR1pXjq7Y2ga+XX4LCMd5nhYXVkbbcU3b1e68Ks7UGu
         2O+wysNEy3ckL/++Av9PzNKxtzTHHCd42MRvos7VwCHY6bVyDynRUCTy6lT584rgRIlh
         Q20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
        fh=Zb+L6LJj3LUyskSjowoyQHoS+FXdiVTrSpVmmr3ADxs=;
        b=loM6W7UXI+mh62d6AnBXWrM6BB90JnoAuJKpDsvaGYTHu+aq77g8R/3W7CiT/HN9Mz
         hvG4+zMpr1ACZnejUi1a914vDhLEc/WSM2Bnraq1FwBGei6+z7i6RFibxJe1S1oi12lV
         ysJ2bFr6u1bzPF6zADdOp/arlClqcb8yH9r4IaIH6XV5/wbwlR30AWt5gMej+4gSh7Hb
         n7BNJA4QoVMlBnJgAcXsUGqL+jn2o+Wz5bUDY31ZWg9l82zy2Zxi+cBzeCVZ81jhWyMJ
         Y/fqcajxPuvhgsDbQv12ppY5ryQJM3rn/clGoDaQto844uxKlrGkhOCnwpMnKOe/bIKB
         RFXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776667636; x=1777272436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
        b=aw+qJf8naoPjdeel6Avhwvpme4XXLEg93S1MnrtKPaRArBPXoVA+scZDjs0Z1p9nI1
         HF/NzSyWcN28qCjOwVyX50UkMd1jYyLmjMxRh2T00ZwIW5y2GkbdJS0Mm5yJsiU7rO7U
         61hn3IMnCgCtatBWt9Kzgh7NzqZHAOVVy7WPGoCmHJVL1MnpQ5Npp+3QAhBNPIANkmoH
         GWJSrZy7JE5W9dttcoakeySSR1+aNgbcHUpOD4oz/xjkzksumXkGXz+pQQwVR20PRdgo
         y+X5XTZKEH7WqE3skSxsnAGxubXF3Wou1c8KCLt7t5Vz/1gJecB144kY5spimkPF6ffI
         bqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667636; x=1777272436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
        b=qqdsqeUjyt99pjPqYidsc9eDTY1QP7XXnvnDfJ11IBSzkFkgt9U40cQ2k6zCyR6h73
         KX+PTJuiuGUW73hEVG3linmzrapRQniUo/Erh15o8iaLiF/jjm3wpWNmQSkaPaWeF1Jh
         ytIgByin/1FGA9Xr03kB1+YgGhDqWATRX9KstgmQuF1Y13OIMYyRi5KU/zM6X7JtqBb4
         bO7zGOPPZI1g2tGumC7bUE7oaNF30IkPNNS1DnmssJEUpFE/ltzdOdI/iWcGCFfQpA8z
         gIxh9+HMAkaaELJM51Gk4yIqG3NVM4es+I/2zXV22d0FypHGTm33f2NbGvrXJA4NTS0o
         r/1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9LXNmt2Ii11sYl7eH6R5zkOQOJf+4vVWylzMlZubJCEB62nQI6r9PqznCcNwg95lbVq6A/LPvxJTP0SQrs@lists.linux.dev
X-Gm-Message-State: AOJu0YwItqQdVVDezNYz1GN/F0GD9qk5oQlIw+4oyQOvAVGk4eJOuvcT
	AH1lb9mVoCQ71b+hDrJhPMMPHH/HduqsnYquJHC1322WaC27UxBzFivSuBwFW9UrF4czZxBu+B2
	4bSYqXSdha92gzeT4S4Pwrd6QwLgVejk=
X-Gm-Gg: AeBDieut4tNk0YeMtDvCbhunvwg6cIdlobZOYYomYN0OOL5Uq+xFM46hTIJZF4n8R95
	K/UXwG+VAg1miaQDetJ1Nu0I+nC4SwQ6eqiFfLkTvLTSzKND21gq3qnpvgPhaiSc/1sUDuEywpd
	/l7k7vUL4guNuZxiEOPF44v9fPwgnwzXKV78OETBYy5gJJRxYc+cM72dmVwtdEe/Q7xvKNsv9on
	KTuDdngWwmeQ2TZOzTQGrhedDFXnkSVF4m17fKp57sxBHODurRAxMlMArIauC1LaUbuHpM3cWT6
	1Zc6qZmucMgaiY5hDG4yvWOtmBMThnCN/ijP1vylaEIr79+iPy5UOhiZ3Rv/KMsQWvBK5qP2Wwa
	miJa4IkRVwYFQikjrrw==
X-Received: by 2002:a17:907:3f11:b0:ba8:a829:e64a with SMTP id
 a640c23a62f3a-ba8a82a9a1amr15950666b.23.1776667636060; Sun, 19 Apr 2026
 23:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420032701.33250-1-debjeetbanerjee48@gmail.com> <20260420043442.60982-1-debjeetbanerjee48@gmail.com>
In-Reply-To: <20260420043442.60982-1-debjeetbanerjee48@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Apr 2026 09:46:39 +0300
X-Gm-Features: AQROBzDARcD5sLeznh1z-l3-bWrWKreTWgrMaYI-OYrDcqQB7Ms6YHfZhqQl0vc
Message-ID: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: csi2: Fix DPCM decompression
 for source pad format
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 7:35=E2=80=AFAM Debjeet Banerjee
<debjeetbanerjee48@gmail.com> wrote:
>
> The CSI2 source pad format was set by blindly copying the sink pad
> format, regardless of whether the sink pad is receiving a DPCM-compressed
> mbus code. This was marked with a FIXME comment.
>
> When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
> MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
> before passing it to the ISP pipeline. Therefore the source pad must
> expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
> the compressed one.
>
> atomisp_subdev_uncompressed_code() already implements this mapping via
> the compressed_codes[] table in atomisp_subdev.c, which pairs each
> DPCM mbus code with its uncompressed counterpart. For codes that are not
> DPCM-compressed, the function returns the code unchanged, so this change
> is a no-op for all non-DPCM formats.

No, please spend your time first on learning the process. When sending
patches like this, do not rush with the new versions, keep at least
24h distance between them.

...

Also, drop the "staging:" prefix from the Subject.

--=20
With Best Regards,
Andy Shevchenko
