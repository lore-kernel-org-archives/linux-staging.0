Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911B3612EE
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468423; cv=pass; b=IT/4W2LeonA9ItIkx0C6mnbwX64kA0rZz3vzG8QOf2lZCS8Eb1gkQ7hoxt5+mMdUvgDqrva8ZxHbA0iLyk2cELG4hnyQZ7IIqwygGb/OTA6yOeAbuZOtV/Iof3jsnvoFyZSFIeVWt5MpxX16gtuOwkDP9Xs2LdQfth2jfbqgUu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468423; c=relaxed/simple;
	bh=wnYjSkPEZQyv80cNHSsJv3e31CuX6BxVqPS6Cj5wfU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeXxQPZSnlWOzzl2Q22odbbeqd3zv33OjQ1Wa/cfzwWaMdkzsNfxzMFUF+md9ajONztATHHMXndupUG2Cd5xpDqlewEwNlbBCYM+nFN/YFmBl+pdGgpOX0KLgNwHAFnu9wFGyL47qM7KzVVlKPJPl9E/dlt9MQSr5EYgpCo7/pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB7l15Wd; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB7l15Wd"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c7492a2ceso3323117d50.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 20:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778468421; cv=none;
        d=google.com; s=arc-20240605;
        b=jJpEmIvhmvI+ITAvVXikJ/FBBCIDrnBJeNwg50UVVXpVEn/OKAPv6pz5iBaWYWni7b
         rHRi18pgv8/oZmqvqDoCwXobO9cE2KrG4hZmi1lHEJ5quRhvPwlFwpFupSa9BFHG82pK
         0YnLOhHEXh2pr/grik/xM8rW8D4uZB9itHuzTWDDTVrg41yO65yUS3cNssp/rOccELFp
         zVfEeHjc9wGvDMBEBB7haUcaBrroGs+DWy2pkZuCRR3Oc0dheKImUAs+wcboL4RFVY5v
         TOoIsuiQvKNC+o2ZF8KsYGcBfDXNaP095ilHC084JqkWaSkSiQRTiEcB7VMOgxWMgDhT
         CjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbEMPqybMxS5k6emiP8oE78P9zf/hCdjeiCvMvcaJ/E=;
        fh=021pF5TrQQdnLTKbsCl8KE6Ts+/82jFsOQORltR86CU=;
        b=AB4G1kW5eGoS3daSBKBQt9RkNgx0+V+E+t9xLUA8oxiSHF0b1Ws5V6076sAscE3ly9
         Xpehd6rLZ4qh0LqFme17TYQK9ZCmi1OpJXkEz+KwNRDhtTPSUHsZWHGekjU0NJL1zmdH
         kQnbobovdQJiAV0Jc1aWoAxGxzJbP81ADK+LbEkIFguHcMfEOfJvVPqhzObXYEisoAHV
         kS9FJZO9vLIfsq03NLivqNFrP7oUwJpnNr1D95Zx95FacvfcB0y4pOgHWn15CISNEVRw
         TaareU5BwOBah6gZVwYoEUnr96ZMFI4uUkH0epLMLzw5U1KDr5VlHKNfksIFpbgBQx04
         jDvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778468421; x=1779073221; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbEMPqybMxS5k6emiP8oE78P9zf/hCdjeiCvMvcaJ/E=;
        b=fB7l15Wd2LETgxZ2z0XFShLZ68cy9FfyI468oRNYUPUCLDROAbXmNEfhSzago7l9x8
         13pHO1wuLJMU/TPTqdgkUB4rdobXHVu26kCm3CgtxsfwDMes2EgCBvxuzyJLo/DuH1o2
         v2ukDXRKc0qTpY2KaMgjWumjPgaXCf7d4b4h3YQRuXjt74C3/hYQEqjGHPMVeB9TVjO6
         C5r062se23fQ1iW9CxN69uoK2Nrd9IIxUHxAJGv22uB8D54VNN2RynpCt4spJaXX0kKt
         VVyP6+95B96AJrm1i1SnyDL8yK0W+hfpj+czqlqBDupQMAmFSG/WtXTo3VpHDFhownem
         0tRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468421; x=1779073221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xbEMPqybMxS5k6emiP8oE78P9zf/hCdjeiCvMvcaJ/E=;
        b=ZiQF2dRC6/GLPTI1157FZnd1/vvLMeQ7n2lDhFaiUToNjp5ODt5N6AUWM/mRZZnnA7
         zsQn4pG+aQCW5Si2/HI3utw3bPMcGr+kxajQzKukbESOrzR7YObvrHwxZPPItuFmytV1
         S3RkZ+3aS3NmRYVkoSCzP7IrLVQqgM2Xeiwhu9HTb0bRwGq06bVvJY9/is5Wy5P8DrFw
         rtusm4qBLpl4EvsC3UHY9QNuBogl4LAl+/pCfTqkX+LmywGBbz/2oswnh+Oga3dz/8dU
         2gDgrN7u0Z0CKXBq+KB5OBmiRVoKUwhzrcPsgStAEqlDGEUl0z97yfqi6uyu/deoGk9B
         hUOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BNByK+cPADXp/2lypZiabqkVgb/0NjN1jloT4tkVUtgGbDBEwa3t3HFW15G9PZu2QrtYtFwVU8cEsMRQF@lists.linux.dev
X-Gm-Message-State: AOJu0YxmwO3QICftqVl71CM0OpTQLUlGVdnG6AzQfWp8Mh1M92rrthaP
	LQTp8vbx0urGR4w5oVaCK+4jl3rP0AfCghofSWtaQfcXjjkhM7t73ryVN0NHpGkyh2lzkKuryMy
	QC3XW0vwBFk8ZgBkj6rzWBr7gEMnw1W0=
X-Gm-Gg: Acq92OF9IOdbLneNYgqheHV2Mju4BA/emR53dRuiwrGw5pN2k34JpLJArMCkEnap+7i
	7Lq/ad2HU0IMDGpzxLAhpvoLyT56xse9BJj0oV4dAF7Na9W3uBSgT6MKYrOL9pnJcAR1WyBNvWY
	bf5b3LdLpW8lYr11NVOPyU6uMBVtqU8h/ghR1z0Qp17gIVhqimsg1HTSitBIeS0EVmW0KPoSdie
	yOqeTPhkm8kmd0q0ojxZmIJWwF7k677v0en6uHToG6U+HZrycsG2alhkfIMP4O6nvlbH5xmf6WL
	x/Om
X-Received: by 2002:a05:690c:ed5:b0:79a:6249:a046 with SMTP id
 00721157ae682-7bdf5d98b5cmr230355457b3.9.1778468420966; Sun, 10 May 2026
 20:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511023127.86113-1-dennylin0707@gmail.com>
In-Reply-To: <20260511023127.86113-1-dennylin0707@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 10 May 2026 22:00:10 -0500
X-Gm-Features: AVHnY4ItALizYXQfDO8oKAdbFa7ZxLNbEt0uRHNyscwB74f03CvaVSJUZ7IqBrU
Message-ID: <CAKqfh0GVDCQzjTj7Hcejx3fgEPYeuT7cv7PWNgxOBWG3wEyUng@mail.gmail.com>
Subject: Re: [PATCH v3] staging: iio: addac: adt7316: document SPI interface
 switching sequence
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 9:31=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> The device powers up in I2C mode. Switching to SPI mode
> requires sending a sequence of SPI writes as described in
> the datasheet.
>
> During this sequence, the device may still be in I2C mode,
> so SPI transactions may not be recognized and can fail.
> Such errors are expected and are ignored.
>
> Add a comment to clarify this behavior.
>
> Datasheet: https://www.analog.com/en/products/adt7316.html
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v3:
> - Add Datasheet tag
> - Use datasheet name in code comment
>
> Changes in v2:
> - Add datasheet reference
> - Add TL;DR note
>
>  drivers/staging/iio/addac/adt7316-spi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
[snip]

Reviewed-by: Maxwell Doose <m32285159@gmail.com>

best regards,
max
