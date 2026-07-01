Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF639FCCC
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894698; cv=pass; b=TmdldFz3nv8j0sIcydQu0XTP2cWugTgm8LqIMkuL2UUjyPCuHyeM8rc6XvU4Q7AdWHmSKc6erIjbiKY3HjelEqoMNikdWIFK40IrN6m2B+Jymzw1nDxvNaCFJ/1EvXUb9qaKMFpPGj36GHJYNBYkQuLDgw1c5QSIa84/RPVutdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894698; c=relaxed/simple;
	bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHRyInLiWPiNZxKBhx4wMsn8KfaV3Mdvh9vC9bHKpctisc6DlENrQqkOlsNAWddZDR1+fvHWhyHilDjkEv+iUo1RG53vfWkN5dPOJFEercd/LPGirnuaPSBooVP6a2N2/ECvDm62lH3ZNKtCMaW8kixVOSlJ1o+PAYPqFxRv5WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoS6z59G; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoS6z59G"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39ad9c80fa8so3459721fa.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 01:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782894695; cv=none;
        d=google.com; s=arc-20260327;
        b=As3MyveZZ6VunLZSCWMtlwXngZ8LZGz4Jn3guQCvDdhTMJvmdHdCiUTVI9b6DtRZiz
         KYP7JyXVGOeDu6ohCJvoEzNVQk/Fc1j8iTapMVl8O7d1STp7mOgMeQ0kvUaa2b0JMEGv
         S4DrR7rjRLcd04TzY/LmkHqkWjoEh1stHIGQzyV4+LSZDpmn5B9HsDZQbToPg6s8qXll
         48qmDFHtOieEgW4li9Q0s2+rV2qPLiE4w0bZcIXm1FcOUlALNefxFS2A0vxvDem/YxP+
         dpzba+gKyVt5fKysEL4vautulAW9eIkNf5xSiuPvpRZ48bo+wz3zWYa1Ja+2wGDQc68X
         lBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
        fh=yNllHiPkNwK6n67m/lceiAtHT00Rz7Kld+ECRu5ErXM=;
        b=tCp8iHGk8AoWRmCRW0bPD+LmS9ht+vuh3cLV13AvIqVsS+Boyh+H1DnyIsw7XwdhOl
         Jlc5Vwem9j7v4Ak4b5cAvHUVTlP5TO8AVaukK3uckEdFQXONNyLws6Xd/Erme9VmFNmH
         UFl8CUAVHA8Aadu2E86A53JB2CaCxe7ClAxXz/PXxg4Gi887ZvD07tCLm7hOYh30ON20
         YtdAl0kn8vmjmUNE7mQQgvtWtzA8S+NHeRefmgyNehjeyKJtkqyaXGsQflJL9qlrhDw7
         hQl7I9gPmQHSvG2J69aUwz1epMtoIuuRCF6Qf2Dnz6pS8siWOTBKJY+GuV2zeCCsXvcL
         LbFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782894695; x=1783499495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
        b=MoS6z59GyrEVSdleSmyhbg0U87doizjay7ulMYyyNtgRNlLCBMYxUzDCudaiUdfz4Q
         Nd+ZEtwroVleMbkCtX2HTAxxdWmJQhKKlXVKaGz8TCUOqEXX/TC0KrQlL04njLFNWDZS
         txtY2r7Q6r2MGSjtWqwAVSBn9wcLiRUCR5pRt9b4TQ2QTvvE8Az2ABDm8FC6V84MdLlt
         tWvup3b1lUL7RAAIIGVSYSJ2xphIZevk3scfJm/nCJTW5JbhGleA2EjMcH5xFIfs1xmw
         im7m4yPFP6/4ho+uz86/JepUvJkfZbGW+vzs0r9EQdwdhBqvVqfqRSrzHDCmVBZYjzMs
         xxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894695; x=1783499495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
        b=CnGf9cpCUPMqgcadNuePqbWdrLlqXw5lL6I5RzIokrABy0BAVcga2y1wkmX4ysU8Qt
         1+TKSBlF20BeTArqUJtDrw3VninAyTwxSoRAsHkbpH/gbzGlDobrkAAeqrttwFZYyxKK
         Hk+QX+FvefUldPt9m6n4ljPLoeSUOCwkkPDRGrdHEKMdSZnAAUOCSIYgek3D5H6SeMYa
         2xm3x1B4szLib8TVpSO2c/wHSmBiq4zNcEThUMT4tXVoxGgO9rJNNFEzYg0dglRXJy9d
         uY30AZGpRbF9dLKpb/uF9Yym7aOcxakJdb+YqGcu4MWxOJMMy9LQftlHTXSmL1xmIBFw
         N8NQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTTEM7C3GU4ex32cHx8KQC477JzjWOpPZ+zlBqcbnA1ApolR+kWdUzmNpZe01pHJli4n64FR52aPZl3vIY@lists.linux.dev
X-Gm-Message-State: AOJu0YzN0vCyZgKdEeXZji4JFCWPwNPb+GA3qL1wjW/Af9tuYiT38MTV
	DKk9tk17qcWlB2dBAr7BU0IpMUCCsCcMp04X0EMXM4z0wdhbEKVlmAGSfKxdpzQsgotorf0kNNG
	CwFfAxkAR1tkUr34NceUKWPZtk5LzF8Y=
X-Gm-Gg: AfdE7clzI8d6spM9KSXDkv12lsISPOozxF5B5aZIQ/Pui5W02z+PXAk9Xw0IKOr5gne
	StflK15Xqf1lzG90gUll9gahKJ4tVr7ZL8/suKp4sKBgQBbdvrC0ItuWrM8bzL+O2ax3Tfk8Kkc
	BAp3RaAkbK5rwJhe63xXHDJAwxkzGMY6J9fTIa+tOeFwlwZjQFo8PPxMqdKhnB0tE3PAPvXiN4i
	1m+K/N8QmCAwGQ1LK2mun/bFEdfMRR74ExTTiCekoAHLMiV3hHRDnL0Qfc9YxwmOXIT2uDgcnvq
	QNygFx7YJ1jjccBU+hIt74FkyJixGLLkEX6SX6CwGNcZhFVPCeWkFnUKMXOrwZ3eCNp+5RaX0gh
	lJr2552/8PVcmEaZCXNRyyl+kxpS5Aa87VgV9uwXjF0/3GGa/vpt8T1lgM+2Xf2gkeyYZ
X-Received: by 2002:a2e:bc85:0:b0:399:850b:d84e with SMTP id
 38308e7fff4ca-39b33ffb8e0mr1356361fa.14.1782894694673; Wed, 01 Jul 2026
 01:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630160435.3293-1-bohdandmarcus@gmail.com>
In-Reply-To: <20260630160435.3293-1-bohdandmarcus@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jul 2026 11:30:56 +0300
X-Gm-Features: AVVi8Ce_LyxAKkEUSOJM9tn5_55aV7q2ZfHH2Vk45bF6ZIsK4SPABGdVQ6HUQyg
Message-ID: <CAHp75VdX_DmiWXc_pYCgZd88cO3=yB7vFsgHx_8HLAJtaJOHow@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fix block comment formatting style
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 7:06=E2=80=AFPM Bohdan D. Marcus
<bohdandmarcus@gmail.com> wrote:
>
> Fix a block comment formatting warning reported by
> checkpatch.pl in atomisp_cmd.c to conform to the
> Linux kernel coding style.

Almost the same comments as per v2. Please, slow down, read other
comments and act accordingly.

--=20
With Best Regards,
Andy Shevchenko
