Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182F233711
	for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766994100; cv=none; b=PQdD52mzkx3B8Y+uZV5ye2Wj++w4nbuCG6LI2/5gJT//K2E3FWUYc6PSTO+2N+WeFCZAxwSfE3CgUPFrHpXDPwi+UYa4wCW1AjtcbGwEBSd+gLu53iyRN4zv4JjEd+vQHdmk45kJkZaylcqho6zxXgMJkI123c0DfzkNrtv1qe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766994100; c=relaxed/simple;
	bh=eOkQciggp/BXsj7NQj5bVAYGclg96Z8dCMeXzgcsVS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5X8I4+a+2e7dKEPOxMtSJIVR5hI6uIcdIbphreWouWEQjDie71XvetR4DzaX0b4fDBhTWDf2hm7cHOilLYx1KfPD6JRu5FTWQX1OEIt2ct+mJFkCIGhXJqmiLWH92j49/NWebSAzeWX2Q5qB2G1eqKRUf+poqZsHsIkqbTyfhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUUHcAjt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUUHcAjt"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79af62d36bso1501516466b.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766994097; x=1767598897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CA0M70EsX+ac4/joS2XDMeJK6N5Tfgg4wZNTxTHbv4=;
        b=MUUHcAjt3IdQ9NC9cr2s/UcRUfb1AZW8tlN8jgsw1NuHWRDUfPH/Zkn3uoZSBGfHJv
         C2BDvidkLFHO1JNj8epB7PJ6vFQNl/TKueyJZ7dx3EDHMD8TjTZFvnSeB4yNwPcfH3y0
         MqDgTskCPivVAn2BOSbTPDolsPbz2wrhyj6gl8BBRbRnMdGwSWoAhoA6G8oE8BZovxCp
         FLoSbHmqMam6kP6pSRqCR1vVKhY0W8Q6yz+6Wzc6VYUmhwtBVTpaRZUm1iXRnSJNU93v
         cTpZ9nkTyM4roKBMP62gwDrK+Zxg0GnU6UvvCiV8NyGWEuudofu3GOhwpl8AvBHEvOg0
         Ccog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766994097; x=1767598897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7CA0M70EsX+ac4/joS2XDMeJK6N5Tfgg4wZNTxTHbv4=;
        b=OMdtmJK6ALZWoWZHVmCLlJ9MkZttxgK9T7EyCPsi34WJP9F2+BNPugA9Enxgc5g9Vo
         37Udyk5L89wQw6vr+gg8SZ+FNmcWXetZIlqjbhFBKgkbHSJG04YnKPNKhJkHDkMSDy3V
         kat4uo6r3mOnqVa6cmP0uD/2ufLI052ukG1WcK7IfdSiTNMmjtxRMEWeXKw8FpR5afxL
         IpOMpU1QOGzKb1B+LfWqWpnXt0UUH9JrG3BclPg2/YY3vuEAHDL5n2H8HMZYoaoZzglj
         1i9H51nKpiFcLbc9GgN30dt3IRFvGpLtQvX4bf0CRhSzEc40TXiEGYGBL7jd8l1lEB3t
         u6qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJiaD0LrSQh1O/0+FEqgNCuU/LYpzZOxIQxS+l1vsOZ7SM53suNb22yM6C5VOtCpDJp8y6siodoKW/8BLe@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq3K3phS9szKGIZhJ3PwnZF/5/6uJfpk26gZQx0j69lxES5956
	SUjUNBAb2Oe1aQwyK/TLvjRtfQUp6+99IK2ZKSSCrpSP4n5G9IhC4+uPVal2W3MzTFSADxOmBZ2
	Y/3793p6i7T0BDYXqHvDf/JrD1eGM0SE=
X-Gm-Gg: AY/fxX4iS9hEcw/Ce/xRKMjLoz40+bAHpFfHspVgKRFz+nXWf/aRM4VNOyHuhSUETmY
	CjVMU5HT5kMcEKxSJ/jH5UFHcWdReAjicLG8qtn3wW/6aYgQLItEcyZsymsEylSC+Di1TluygOg
	/wM0dhnkfskf5kZQ/bD7ONN0Wgpv9uRV07T6D38p9BB3QK8QIk34GhITdi7WeCaBcP+1P97ggwU
	BKZ7G2kqRlAzmWDHXeYAAhh0tIIAhR0yNvTDibBEIF7W9nvBuJtfCE1nJbRrU9aqCNVB/+zZGKW
	CJTpvqtVyRPyHVcG3dtyKscRI/0OT6ICVuF9GrslNs1YgPIG0mDd2sc68V4hEPP31OZnuB+3Vwp
	dM0U8gqI=
X-Google-Smtp-Source: AGHT+IFsiw3jWtdQEDQH/mXP+tcbghOYcPeWqAbdVDVv7o7/abPtivB78goQWZ0idTFYi+CcJ/7gCrJl+TRRu/MiPwo=
X-Received: by 2002:a17:907:9809:b0:b71:ea7c:e4ff with SMTP id
 a640c23a62f3a-b8036ec9e3emr2773470266b.6.1766994096979; Sun, 28 Dec 2025
 23:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251229010814.94255-1-spxxky.dev@gmail.com>
In-Reply-To: <20251229010814.94255-1-spxxky.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Dec 2025 09:41:00 +0200
X-Gm-Features: AQt7F2r1dDWzOTpFWamMt3UW53SPeTfq7dsNRjTugzb_U_DAnDoUbownyn-BlB8
Message-ID: <CAHp75Vc9fnuMb3s-KtX5r+nmOH5BztP=d+h9FXpn2i34sCv2-Q@mail.gmail.com>
Subject: Re: [PATCH] Replace udelay() with usleep_range() in PLL
 initialization code. According to Documentation/timers/timers-howto.rst,
 usleep_range() is preferred for delays "10us - 20ms"
To: Alexandru Costin <spxxky.dev@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 3:09=E2=80=AFAM Alexandru Costin <spxxky.dev@gmail.=
com> wrote:
>
> Resolves checkpatch warnings:
>   WARNING: usleep_range is preferred over udelay

First of all, fix checkpatch to point to a newer API, i.e. fsleep().

...

> @@ -210,7 +210,8 @@ static void write_reg8_bus8(struct fbtft_par *par, in=
t len, ...)

> -       udelay(100);
> +       usleep_range(100, 120);

> @@ -231,7 +232,7 @@ static void write_reg8_bus8(struct fbtft_par *par, in=
t len, ...)

> -       udelay(100);
> +       usleep_range(100, 120);

This is an IO function for the hardware in question. Have you tested
it? How do you know that this is a non-atomic context?

--=20
With Best Regards,
Andy Shevchenko
