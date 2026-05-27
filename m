Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE528250C06
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859654; cv=pass; b=YW7lATcug4ALJm2sXOaYsgknKe2enUaXMz3OiwDctv/lcirspHzmiSUeKv2MsdUB6upC5Ny7LM0YCjZNvNgE6TxkJDdCxAb9DlgWstntOkQQlp9BDMs5s8jUedAVy7q/hpa88Y3t9sbOYaAaQmdtpATx+vNTb6LvL/AfKScUzew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859654; c=relaxed/simple;
	bh=cxls03Gx0NL/K0IJ/azJa75evpNsWxLShOkwzxy04iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MItTZzrk5Wkj/MEUI3O/I7C+ctTtX3rbLxTpBVhoVulMqvXLb3OWStN64oammAkhLVayBRCevZxGpwr1g75HemN/iagL7HywybB7QVCTxVPZuuR56p30UtvsJwy/PUiF0pP3+sOU5D5VwaFSewwynRS2GNJXzKPFMaSbs6upT7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7haRTde; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7haRTde"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso21101662a12.1
        for <linux-staging@lists.linux.dev>; Tue, 26 May 2026 22:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779859651; cv=none;
        d=google.com; s=arc-20240605;
        b=Kfb/V1f2Vd/RzgL0DixQ5baXM3MJmgd05cb8OdWRXadhgpH3a2NqiBD5lV2bHo0KOc
         Xkgn4dKxNN5eOx6VHBSLphkV7FcueUAm3evzV2Y+S2egkJsBE39FSMnnRj4PeEjcS4Vw
         xKFLQB6ZQlEQxnRh9+jyHoD+etqt3dyRCS+ABx8wTNgv8SNxTM8jlMJeuF/40WlKFHUL
         c09KH1qmKgQk+d+Z/Vfd0Q1JmAU+wbTRvMIqnyGwwLPIuu8JK38LSMVqT+4CMzq7+aLd
         0ybJm4NL48/nV13RvWEHlHTCZ3ve5S7sJqEvOMF1WfV+lW262G02rf9HCjPLpGQzFTlY
         kroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yeOMPaJvVCStq+rPePFEXjs4Ciky1rWly6VAPL5W1yk=;
        fh=wcWa7pyQuTJkP6WFn1ZsO5Z530J/T2gOA+6VNMX2GxM=;
        b=QHhTdrtBsIyS4B72TUZXdCRG69l+r+HCOfYY/jlbSWoipji0SA7PmyevnFgwdk8zfL
         knwosYaPo6orc1uej/aM1QYHa6kpbo+PE9MzIiaoFE3a3xPrGJeq+UpXde75bb0qaOBJ
         z7LsOUJT5+Pr9qAAHVHLwp4z/LfB8CHTW2n3czmFiD9hf6xYgGnynYuQOGsjwJu9U7fk
         hEUBzjQ0G+W8dIaJRAZqGBFU6etToomBi3UD9xdGuyYwlQ2fQrM1S6PNSN07omQkNZ01
         ayMs+LMkZ3VNE8K2V9SfWpkvj6ISfA9ZbV5+fQkpvzLp+3TG/L/CYaaLKQRAbWm/i4K+
         CMBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779859651; x=1780464451; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeOMPaJvVCStq+rPePFEXjs4Ciky1rWly6VAPL5W1yk=;
        b=P7haRTdec13ENm+R0lqetAYuIY7pUzTD7bkBnGsB9M80Mw9mIsJsJQ+UiCF+lJ2oAF
         SBso2H1QSHQzvVdjFxRRXGzXkCZ+2Jks3WxK9qpK0qCWeDjJ8SUrJvt7LaFvYVut8I7/
         CdOaOGv4FNLkvGsfskn5Rwr2Vk3peknJFUNYNdFnfBMzGzdqFjN+h+FpYr9lN/eDROQN
         Fvau0xxFIQZaa0nxhs6sPPAMXT2a4k0aECdooWcY3lsZtsgjbcjBP2madfCWTzLA+fIO
         aNjvfXSMbM/9Lh9++uAxbT/H/FfaNVq2TohNY4Q08TDGOPAOFwqXOgFHrqH+yEpN+KDa
         abYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779859651; x=1780464451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yeOMPaJvVCStq+rPePFEXjs4Ciky1rWly6VAPL5W1yk=;
        b=n8XTP3+uHDMPdjPlKvMMuRPJ6wB+0pQdgSJX86U0nmeCJJ+HMQ48SR9/bYnSWu1EkS
         yxV+WAWu7eoGHdl7rfPWylq/NXRFw4zADsj1OsHtkUMfbQcb2ZnZOU4l8zrWxmP8/5qt
         d7sAktAgO5p+fHhHaadGCwmUxNKb5lggcCQFNuTewzh3Dt1+0UCA0V91mwQARi/x+r9i
         7wCAqRMm0zr6CXhN9byYOHKO/Gnmbqu15XiEvz8P3VlZBA9Lr3TQW/hRmO4ETv4AsFtu
         NQCn3dcS9jHf0lgbkHoWyP1F5IJGlmQxkEzjZvT4oBPBRKTISk+VOYevGR9dZMjO1B24
         3YLA==
X-Forwarded-Encrypted: i=1; AFNElJ9/ah5Lvit3/tINCjTFgyFpN2wah9EWyeeLUdsxwmr2IBjpuoKOZJ8i6H36a3lIMouga80eVkqDyiPqbHhL@lists.linux.dev
X-Gm-Message-State: AOJu0YwYfppB6V9bMDXnM+BS0ovUgX2ogykl8bV4RqY9NtIlUZ56cbV4
	J2TQjiPuEQP3zrKTgWH+sFgdRaCyYdemMnFfJKj0bCXF5Q6qJw4s9BMRQaa+akr5ufCkuSh+puO
	laRjg6rcYak9d0sapexsrIa0Q+g7PoEo=
X-Gm-Gg: Acq92OF6cbaiM1paw+BOyogbtYr1vC4gqRivDRlWILDDeiUCoNtCE56hO1/HIuf47/r
	VRJUw2zM031PheDHNtYCY/fVkOkPCxvDBgJCBgKaDwWKIM47c5f08GzF9NOlpHOdnClQAWojIpE
	iDFW8Qs1GbzhwWbACZMgI7DXD6dYezIMBlZh/inEUyMZrs8fQr98UdWFWuOPzbJDq1tBEiXSgku
	c9KRn/9NXRJHWNihFRNUpGfp7CZcp1uup2QVY1axTBva+/WXMsAN9d7/jWRHqTiIhMxz0Ack7q5
	BPAmFj77kWvVlJ+zULkNKZHWUjTPlSLiLuvqmsA27wrgfOmrC4Xs0argkcOs2BfL03i7oCaNPc0
	IxwgdbVH7vG8YA1+TPMjiPowR7oPwiImHfV28B3tvKjq8CPAHwDMCzkrqQpd2u1JE8th6QmTzZn
	09SKCc
X-Received: by 2002:a17:907:9690:b0:bbf:bab5:ecd9 with SMTP id
 a640c23a62f3a-bdd4a09a7cdmr1107323766b.15.1779859650913; Tue, 26 May 2026
 22:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526200222.330280-1-jeongin.yeo@luaberry.com>
In-Reply-To: <20260526200222.330280-1-jeongin.yeo@luaberry.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 May 2026 07:26:53 +0200
X-Gm-Features: AVHnY4IX56ERP2tXIY5lOBi1rQdYTr7WKxxGTfNiBMqgwiTS-0PWmOJO-MZZzwM
Message-ID: <CAHp75Ve5Kntx5+mpr2hZCcFWda7GDUgME_G6c=1kRJJsYGt7eA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: remove function name from dev_dbg calls
To: Jeongin Yeo <jeongin.yeo@luaberry.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, matt@mattwardle.net, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:03=E2=80=AFPM Jeongin Yeo <jeongin.yeo@luaberry.=
com> wrote:
>
> Remove the hardcoded function name prefix from dev_dbg() output
> strings within ia_css_binary_find(). dev_dbg() can already emit
> the function name via dynamic_debug's 'f' flag, so embedding it
> in the format string is redundant.
>
> This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> introducing __func__ to format strings.
>
> No functional changes.

...

>                         dev_dbg(atomisp_dev,
> -                               "ia_css_binary_find() [%d] continue: !%d =
&& %d && (%d !=3D %d)\n",
> +                               "[%d] continue: !%d && %d && (%d !=3D %d)=
\n",
>                                 __LINE__, candidate->enable.continuous,
>                                 continuous, mode, IA_CSS_BINARY_MODE_COPY=
);

__LINE__ is also provided.


--=20
With Best Regards,
Andy Shevchenko
