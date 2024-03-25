Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8BE3DABED
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711374423; cv=none; b=WlR22w8bWibxYV9/tf0jYGWAYErPUzYSXxRZf2cYvlIY8kfa2n2DMJILbprBJLUm8bDW4gBPA1T9TnZ1Gw+5l3xQoLS/sJ46yNZ+dZPXsAdbKPXx3dfDli1wkUl1c5AVBsbGeTRPh3s9PavcdtKY5mQ4hbQLCJzcVlqHV/Amf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711374423; c=relaxed/simple;
	bh=Dwwe97Uw4E8QyozheiElFHoECrS4WqQaW5q347hkoPs=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W5tY9JKh2kLASbzbtQ8OReJdzLh7nBJPTrtF0yRtTvHwBsD8YSmsshzgXHQQRVbzYh7S5YmhKYKgYifeu+7zwJwHybwCajuv6F+NJfN1/nWah2mmHZEqRa6U7VxZUDcxtQcZquaMpK5KdOyyPOqsSWwg/BjF/L52TAeJp4WNVcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQFEf4Ca; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQFEf4Ca"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a44f2d894b7so531734266b.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711374420; x=1711979220; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjANd7InPQ7TGU91MaQD797NSrQEpjeld8XW1nZz2cY=;
        b=DQFEf4CaO983pvtu7w3C9Z1nCNq3Kz1Ptw4DG3Vo4On0zycebO4T29lfHockYuMt3z
         ty4RnolLpvTaKWvixRHT5USIM126aaNkopXTq2o69WmiGBdaQN2YJig1sLnhgjPp76un
         cggvv/+GqSjJrKvWhTvu/ECbl/NePSRbIBASzqIuwuw2NKc1/eL/pms4O9ZRf5ZDEyXk
         g9gG6QsBhAvn8oAUWdF+aMu5fm1+O3dCkIaEkUWvVzjIEtz03sihhQHA/grjhf9N4mS5
         G4C0aT6XlLuedzUnPmEoR5rVEy7y6/TCeX9C3BHQfhTSGw81VkKxcYP4fXmoREJZVjLg
         T3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711374420; x=1711979220;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjANd7InPQ7TGU91MaQD797NSrQEpjeld8XW1nZz2cY=;
        b=YhJK7T/dI4EIi4n5Pu981E/pc1thkyMoH06GzwgO85ILmhNc9yTa5DL7KU+fp8kEbx
         SfFQCLVbCSsHVgm2CT4WC8pBGtqa235lsB37Px2sMW8EbGiR16z1rm96iGneadcJG/X/
         o6RT34p1xH1liOV2mXsJssKGbmPurVsT7Ld2YNkNkmdpp2l4lvAhC0iMP7Z7Isx4J4RC
         rVykD3Kb7xrGy1TC/BwJjhMPrfQ1AHHDsjQyJkfiAgj1NuknF03YxQO0rrXXqyQujJiw
         UMx7fHUewRXqHSz7Ql0nLq/VXp3HFPgkW6hFsYQpnLgC4PyktZ+2T6/ZbjiCyO6EWGN+
         E6GA==
X-Forwarded-Encrypted: i=1; AJvYcCXgrbkX6bsgknsDCUAqPJDZNMAXniuQXviUkc/gVdFUzps/IqrpzhFsMTqWHwC4ajzHB6L0Exjhx7CIBYeUDicLk0ty6QAdbjAnlREyHQ==
X-Gm-Message-State: AOJu0YzL1JU0nqA12cQPs26WElCVK7NCDPqUBF/CXPbxuOPikY6RnMVq
	e45yehPUlnx/gx5RFap0z2mCO0fbqKETGPa9cofnUI7KJJP/wTwy
X-Google-Smtp-Source: AGHT+IGY2GkZsbZRFlNvvEq3iO+wOkFjANYYezsdLkZCO/J95dy/uLCmgL/n3kcCZAlAC914R8Cb3w==
X-Received: by 2002:a17:906:a382:b0:a47:34d8:e052 with SMTP id k2-20020a170906a38200b00a4734d8e052mr4747580ejz.36.1711374419703;
        Mon, 25 Mar 2024 06:46:59 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906719a00b00a4a3b693d38sm699440ejk.77.2024.03.25.06.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 06:46:59 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=825d513444cbcfd21e325bb336a957fc7c42f554a23f2161a262d85b011f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Mon, 25 Mar 2024 14:46:58 +0100
Message-Id: <D02VLMHNDLXY.16ACXUWB3TWZF@gmail.com>
Cc: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] staging: media: tegra-video: Fix
 -Wmaybe-unitialized warn in gcc
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Ricardo Ribalda" <ribalda@chromium.org>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Sowjanya Komatineni" <skomatineni@nvidia.com>,
 "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Hans Verkuil" <hverkuil@xs4all.nl>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
 <20240323-gcc-arm-warnings-v1-1-0b45cc52f39e@chromium.org>
In-Reply-To: <20240323-gcc-arm-warnings-v1-1-0b45cc52f39e@chromium.org>

--825d513444cbcfd21e325bb336a957fc7c42f554a23f2161a262d85b011f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Mar 23, 2024 at 11:41 AM CET, Ricardo Ribalda wrote:
> Make sure that tegra20_vi_get_input_formats always assign a value for
> yuv_input_format.
>
> Fix:
> drivers/staging/media/tegra-video/tegra20.c:624:72: warning: =E2=80=98yuv=
_input_format=E2=80=99 may be used uninitialized [-Wmaybe-uninitialized]
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index c25286772603c..c39b52d0e4447 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -176,6 +176,7 @@ static void tegra20_vi_get_input_formats(struct tegra=
_vi_channel *chan,
>  		(*yuv_input_format) =3D VI_INPUT_YUV_INPUT_FORMAT_YUYV;
>  		break;
>  	case MEDIA_BUS_FMT_YVYU8_2X8:
> +	default:

This default seems rather arbitrary. Maybe we should follow the
tegra20_vi_get_output_formats() and default to UYVY? Also, maybe follow
the same scheme as that function (i.e. assign the default near the top
of the function rather than add a default case)?

Thierry

>  		(*yuv_input_format) =3D VI_INPUT_YUV_INPUT_FORMAT_YVYU;
>  		break;
>  	}


--825d513444cbcfd21e325bb336a957fc7c42f554a23f2161a262d85b011f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYBgFMACgkQ3SOs138+
s6Eydw//W72tYXdcn6FA3pjJOx89WN25ap9DecvjM0hvEGCYVJMvI2Tqxzp515tM
7setppTdJlH3fJIjNYv/LtBogx0bqd9pbyI6XVjKAXCdVuRM+GDHk3GHeUbloF2x
UPAemgsN18OjM6OsXPTqQNnEmcQH8LNaJMoEaursTaWEyIEQjp1e4jDXbeZ+GI2L
BBiQG/HqqpMExqtkulveghFtjrEDvo3WFhsGEyXikSOUmee2D0MBOf06IG7XgayE
SGiNbT7oDItuyZAq52Cic0woWiKsxo21MnVAJryem/0rLZSdDyjP8mORhIDdS2LT
9HrrhJBs7lPoi277e9GoVfDm8IiGtMZ0TIHJR0m93REatLyrhToyvXp6yJpGFDnb
vvoHvVapZBm1jauoE9Tpjf55rwhcEdtWi82ZbDdFzFp0PxDMpPZXPg9xK7hNuY0b
ejVcIjeBlwZHp+pFYawE5tTAyyfobc9zNPL/q7r+uPlhOfUw+pIo1BpNAq/ZYjK6
fgMZqUSX7fEydg63Mva45QKvuEX/LCVDueiieSKZPWwh865jyDgk9VZECSumOwKq
lwj+bwc9/iQBHbfg0KFGNurKz3fpBIC9TazXe63Sr8CPGJdDOMqUdVS+BhXYRxAh
d2kp3EUfFEkG2O5FaAhksqtCAc2Uwf1ZX3hMRz/PL6IYVTwRm4E=
=0X7r
-----END PGP SIGNATURE-----

--825d513444cbcfd21e325bb336a957fc7c42f554a23f2161a262d85b011f--
