Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB37F31B803
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749213; cv=none; b=IU/OzcROA8hliC+d/aBcx7oTrOCPA1sR8Wob1hdtpRk2TQHDct/EG5xmDqrGrlxR194S2U+8xogtwifNegg/PA8gp2Ir3qovpBG6X+mnz0BqcqJpmufjqrhm2GZ2itvtVW0mHHLCMuW1EV+XjSc911OZL4V+8rfEtmyCrvzuWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749213; c=relaxed/simple;
	bh=NhChq0mbuSDRx8lv6OsA8KYmeRrq1h5IY9GCMo98X/k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WL2HN9jPCgL3kLR9hLq+OwAYVk2EjhRC3HHCPoXYWjJdW9aemOovv8wu4m1znv2tXAqUaYg8WhkZJJLAJry7xd8ghOoi+HRG1NiFPlFOOrUs/ISYLJWcCbR7a49nBHlQ3+ODpL1Z6DM5jObMMmLcb7WPM7p7Qw7ulwxJneJ6NUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erA4/s8r; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erA4/s8r"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50143fe869fso60575381cf.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 10:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770749208; x=1771354008; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxhVtlHqLQVjAT+2NlUYl/ca4V1OJPEEmLd1oGMJyM8=;
        b=erA4/s8rA67Z4+9lJH/lpmVCwCDSJFCFmIh/SpEgjKnH1DUd+WnHGf0q5Fx5SMNctd
         hUPYDGBxCztk9nCMmJXNdAdPpIeAioAwlvKtHsLdLpPzZIoRqzEHrmvvz239970nQrhj
         2OHQq2EbBdfs7Vy/hw6S7khQQnB0k+6ROHuph08Z9wvUft9CXF0rFASEKXSxHYQGL6Sy
         Yo9+RmY/CURgR3rbI+fPsZQdsXkU6FLtN/vJO8FMIHV+A/aEKYF9KLVekNhZPaYqVbL/
         Fqz5dT58GtYUzJhxqzQ6ZtyZmMtOEfF5O8ehFDoonNUL/J3Vid/AzTuIiyqc6tHxG5vZ
         +T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749208; x=1771354008;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxhVtlHqLQVjAT+2NlUYl/ca4V1OJPEEmLd1oGMJyM8=;
        b=TeHTDg1QXqdKKhs/+m1C3zO1L6RibFHpYvs2lWWFhzO7dEuPmJvZT8rpCXjNnauGYZ
         vEGIPM3wXbX5EXjf0lX2UloLEVBTgYL7mUG92/Tywr6S5ppJVqYikfx5PBlbzKrSaf5R
         w4v0wWTljQ/Wi2nScBtUxUL0Pa3T1luAruq6TbrMxTYKdLdZeFTFf1XXIbKs9v6UnGYd
         zDyaXTbEd2KcsWuv0fJZTwOizU1UWeIw475NjqEevSe8aC2nDVpWJeZx+0aPFvVPwdgA
         Fn97izqVijv/bBOJszk7CG1V+78+tKtC1KeNZWp7spdkgwz+4u4Vkweg4Frcyg8ChDb1
         4uow==
X-Gm-Message-State: AOJu0YyUctKwCkQHgjk+p9xpj0LtIJv2iXUcj3nU2f6uk7U0NYR06qv5
	83k+/3Ra/A2/4XVei8D2uGYjwSbdLmC/e4r/MRGTIML47gu8f5j+B1AXk2AN3dZlzws=
X-Gm-Gg: AZuq6aK3uYW+1qm8V6QIrgcmOMW22O2hESantDD2dOSa6Xqjg0t8MHmEoknojRYvu/2
	S6+ef8tbzQUG5DsIu0aA3z7xuNMmFz0tDJobudYcIGtCAAS+WkUF5dqxq/9D6tXVkZ3Or0Si29R
	F/lbpc250J3wkORoHnjY+yGhHFa/02YIWIz/tSUVTu5VrhTPuiEcauksSuPL5OfzZClDe+pc9ki
	PX+j3j2HQJCSgiBj1/IV+V7PApf9dACfI5hyyKsHDNyKvpLwaKknn/o9F85AZkqEaK0Yw+fRIcx
	405/vr/zt7AlJ7lXaaiLOQrx3t4ydHWJfgKRgtz7V20/hBtRqzFbqrY8m4g7MDYhTyy7sxr2ske
	AP1ez4Y/6dgSzWznFfQ04BTlBPjXaDwnOKQNRbfnrlM1ejA+ueloxS2NVkowKsnhTDBXcROAj6f
	9ybFRu4X+jVYneYrYsNeAw0PvwAWKCYQefj8pZ8QjL5vj8LVXTLztgWak+kf87greVTApajjuz9
	6uOUgrY1utBgQSkkMWhje0WLMFShFbW
X-Received: by 2002:a05:690c:fc7:b0:796:3981:fd6e with SMTP id 00721157ae682-7963982096cmr80565947b3.10.1770748749129;
        Tue, 10 Feb 2026 10:39:09 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a28a62bsm125287887b3.51.2026.02.10.10.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 10:39:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 12:38:51 -0600
Message-Id: <DGBI1D0LN96R.1B34WZQVUSUF8@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove redundant 'Adapter'
 variable in HalPhyRf_8723B
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210171433.52164-1-tmimiharoen@gmail.com>
In-Reply-To: <20260210171433.52164-1-tmimiharoen@gmail.com>

On Tue Feb 10, 2026 at 11:14 AM CST, Haroen Tmimi wrote:
> The variable Adapter was declared and initialized locally in
> an if-statement, but it shadowed a variable of the same name and
> value declared in the function scope (line 169).
>
> Removing the inner declaration allows the code to use the existing
> outer variable, resolving a -Wshadow warning.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> ---
> Changes in v2:=20
> Removed the white space in line 211, which caused a coding style warning
> (reported by Greg K-H).
>  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/sta=
ging/rtl8723bs/hal/HalPhyRf_8723B.c
> index f712d0345b99..0f915589b518 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -208,7 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  	}
> =20
>  	if (Method =3D=3D TXAGC) {
> -
>  		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] =3D pDM_Odm->Absolute_OFDMSwingI=
dx[RFPath];
> =20
>  		pDM_Odm->Modify_TxAGC_Flag_PathA =3D true;

I don't see the Adapter variable here?=20

I believe you meant to use "git commit --amend" but, just made the v2
its own patch without the previous diff.

Thanks,

ET
