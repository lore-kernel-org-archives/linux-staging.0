Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB819D060
	for <linux-staging@lists.linux.dev>; Tue, 22 Oct 2024 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606903; cv=none; b=mHg4wJdqcwzPFtQHjjxSgvFICdhpMK08CLP4xL/Kqpmc+xhqxTd1rLsikzcSk/UHizp7i9Uhwuoy3aNUDWDkp0530bPVaQcgRA0NP3DxkmCREbdg03i/+eWu6bcNlUI9ACdSqWPAq/MSM/RSAVI4h8smrzLiBtHAe+p1RcS219o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606903; c=relaxed/simple;
	bh=zb2pZFilP0FY1yJLNmlNcBBInrhhxeM+cH9SmHa58jY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Poek682vsG52TDGe2b1qCnFtCfDqpWmlg2F/4Q2t+X9erk+fC7maQOqEc8c/jCgdGDBIoGKVQCWOn/7LHe1J9DLRbpq6dZ9o/6tKojQPtbUTJ7jPAixYJAGPgRj1mH3jIN3vLm4mYcfMbQtYUUlrYP4jmTAbQYvNTdUJk/eTpAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyEtBJIY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyEtBJIY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so27483925e9.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Oct 2024 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729606899; x=1730211699; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MolLQzD331lVbYoy6Af/QEZhpzzcOB1L48eCfOQYL8A=;
        b=NyEtBJIYNhdcFtIf3Bl1cVi+3LxeecSAhlMPkkDoriwB8pC7OsdKHsJQnHhU+GTu3A
         oSPuTLFtQLJu7Du5+RUcrA/qot+UMliUnZJ+MQuFSLau4dUacDSYQeW86rMVr/PHRN5q
         KlIVrcE9LVn6Js5LqQKQKLONYAPAbkuPU1ujZNGG8GiPbTV5EpPdV5dJaLscmbK1r83i
         ZUKy0q5IOGIvQUkhAsD3cbdwPVZBTMFriOTMGY8bn+alwDUftZwmrNdzrJb8CsQ4GSOU
         d+hyRnjQ3+6G4/Q65ujeL0F10PBrX2aiT624PEwbxXr2J2QrbaloQrNIzOskmzMFx3Qa
         ei8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729606899; x=1730211699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MolLQzD331lVbYoy6Af/QEZhpzzcOB1L48eCfOQYL8A=;
        b=M4jE1THKIu4lHKyS7C3FTTTnhs3+yN1W8JNIqxnWdnDm6dHC/SFuNCzNwxFLph6gto
         VGjOKRQEHdPZuNATNf3Ls7367jqt9Y31gY9tprm8PUSb7c0MVR0xJ0MsKBblaEXsRC5z
         CnbasYXppAzsIqD5Ky30tMoibYcBCrth2Lril8DyLkotQ36bbBNsgETNcT0mFVoy84aH
         pXIq5IvOUi7zFRgWfHbFIbROJrxaiAWyRRmKtBU21oKx0xBtr+IT3OwbCRAi1u97FqT9
         ia4XWJECFa8Ow7cFxj7/wh8qFoHzDNMGA/CSU4MAau0rDBGpIWvtoLdY/1WOpJcfJDw5
         fbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBLsSWjHyf2/vzMF/EbwvzQQR3utPb/m7kl5tqOOqmVODEDCHMBi3kl0PzecALv+wXxpiboAEreC6/3MtC@lists.linux.dev
X-Gm-Message-State: AOJu0YxAca9u9FUX6FaPFyijmZHvKkAS8F18WvpbpJCjLrbe0xCr5GUH
	h7g+x2niFczjMfKCzkAT2+/0TrqCfyhLWhep5BLmHzaJ9u67STce
X-Google-Smtp-Source: AGHT+IEOr9f0Msf1K6xaBWxYFYQKEceNzf7UioGw0VW+ts2gOu+AVYaDIU5aZv1ZsU0lEFe/ws1dAw==
X-Received: by 2002:a05:600c:1da7:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-4317b915dddmr30059155e9.33.1729606898892;
        Tue, 22 Oct 2024 07:21:38 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef15:2100:888:d3c6:a442:4910? (p200300f6ef1521000888d3c6a4424910.dip0.t-ipconnect.de. [2003:f6:ef15:2100:888:d3c6:a442:4910])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37958sm6750173f8f.15.2024.10.22.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 07:21:38 -0700 (PDT)
Message-ID: <3b20cb3c06b7cc196ace5ee0a113b77c99be2504.camel@gmail.com>
Subject: Re: [PATCH] drivers/staging/iio/frequency/ad9832.c: fix division by
 zero in ad9832_calc_freqreg()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Zicheng Qu <quzicheng@huawei.com>, lars@metafoo.de, 
	Michael.Hennerich@analog.com, jic23@kernel.org, gregkh@linuxfoundation.org,
 	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: tanghui20@huawei.com, zhangqiao22@huawei.com, judy.chenhui@huawei.com
Date: Tue, 22 Oct 2024 16:25:56 +0200
In-Reply-To: <20241022134354.574614-1-quzicheng@huawei.com>
References: <20241022134354.574614-1-quzicheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-10-22 at 13:43 +0000, Zicheng Qu wrote:
> In the ad9832_write_frequency() function, clk_get_rate() might return 0.
> This can lead to a division by zero when calling ad9832_calc_freqreg().
> The check if (fout > (clk_get_rate(st->mclk) / 2)) does not protect
> against the case when fout is 0. The ad9832_write_frequency() function
> is called from ad9832_write(), and fout is derived from a text buffer,
> which can contain any value.
>=20
> Link: https://lore.kernel.org/all/2024100904-CVE-2024-47663-9bdc@gregkh/
> Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

> =C2=A0drivers/staging/iio/frequency/ad9832.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/iio/frequency/ad9832.c
> b/drivers/staging/iio/frequency/ad9832.c
> index 6c390c4eb26d..492612e8f8ba 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -129,12 +129,15 @@ static unsigned long ad9832_calc_freqreg(unsigned l=
ong
> mclk, unsigned long fout)
> =C2=A0static int ad9832_write_frequency(struct ad9832_state *st,
> =C2=A0				=C2=A0 unsigned int addr, unsigned long fout)
> =C2=A0{
> +	unsigned long clk_freq;
> =C2=A0	unsigned long regval;
> =C2=A0
> -	if (fout > (clk_get_rate(st->mclk) / 2))
> +	clk_freq =3D clk_get_rate(st->mclk);
> +
> +	if (!clk_freq || fout > (clk_freq / 2))
> =C2=A0		return -EINVAL;
> =C2=A0
> -	regval =3D ad9832_calc_freqreg(clk_get_rate(st->mclk), fout);
> +	regval =3D ad9832_calc_freqreg(clk_freq, fout);
> =C2=A0
> =C2=A0	st->freq_data[0] =3D cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIF=
T) |
> =C2=A0					(addr << ADD_SHIFT) |

