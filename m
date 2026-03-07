Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE66275864
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772893994; cv=none; b=cB92hGbJVxKtqKNafSjiwpJu/bIikub5op6iZMOHfK4YxBhqCnxjMxNR/0gtMpHtm4XhS3XwYBmJmXSDqAMXHojsRWC3CkJx3mxCkKDPDmF74zvqpk2K2N6ELs/CUlO5RjfZ/sdUeCZWZO3/4RtZPvyhw/mRwDUbVl7n5NU9t8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772893994; c=relaxed/simple;
	bh=rS6b16/hkZ07xE8nfhxFOacBl8y+93atddSnP763e1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNVp9OdSkGY75RX4yX0SkwlPGcbKZXtC7qbP9QcPF+74mRcP52SfMfK/omCSBZmhBLlsl4U3DGgsqJxH4yOqd50tc/tPEDbeQuqVX/dglJqg4Iwe/UyXetKatGFzrPxQEmOBllZmn3aNO+g2fVGB3B4Ru00GqWniz/SeSEMtSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKvcFqHk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKvcFqHk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483bd7354efso135150265e9.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772893991; x=1773498791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+AG14uDgdvn3cNVJ9sOyyXspA9JFk+QIORGWvOKi48=;
        b=oKvcFqHk3+zO3KiDPrr97x8SXs3dOELj4TGuOvqms7i6tHV7DmArBy8woKrVf9XscW
         O0HceaE/0UrImmChCEj/qGsv40LcW7fZbnRHrMOMHEYu9dC762SID30q3XY+GNNUEewG
         66cdIPy3sBQmrufVRHaBDOHgxogb+iEjQSGmP65QDJ+zP2Fn4raa2VBaCGGgjazrGOcs
         LIKYPvxq1owT1gSaq1/6hs3qm/P+/pRK6KLBYKwmC6pLSfjdqKuh6GfgGvDK7nQNmmFQ
         dknLBMZ0yxpnpth1Yel5ggwG1gdTo9tTJccjpIpqMyxY61GQw2Mn2drJRxL7vjJ1wmLu
         fIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772893991; x=1773498791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+AG14uDgdvn3cNVJ9sOyyXspA9JFk+QIORGWvOKi48=;
        b=mQDMkUneKaKMYByL7PXCoa/+g3sBGOnE+4m72t/xv4S6fMKt2t+r8D9bcDAFA23KSJ
         4lTvm8Qyq73Z7aqXzNV97x4lEMGDY16tE/gpN03eEzu0WIdoyD4qUXHVcRc3bED4AFIO
         e91d6RhevDODuAcaDDwkmm33h41lrkhcb+Vl2V0pOMrbx8g+H1Omw+NNcX4rUmtjaBOP
         s4yV++qAreP93o0QYNGR6rqGxijHY5yumtLyzfHohNMaPKntSFj/noJD928YW5W9Bb+1
         DKiC630xudxoeTiAa7owBF5tfy+v1M59PIC3zgnmcnCynYxMYdFDX8f3W4gebd7WalfV
         aaEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaJ7R26jKRUSxWk4MEx3dSi9VaL3QKj3KiYtVy+pGDPjFt02PFzYcXjvG/Avdkgc6KVKHENsDwqG+0UOxy@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7s0U3qUqoKTv2kvzOVpj3txY6YdostJKy/vb0q6ikSDSxYI4i
	gLOHmU+HfohHcAAq62gIw1Lg1MvSCLlDprAUyM0tX2h0JLKIt9aobCV0VL57jCeb0eY=
X-Gm-Gg: ATEYQzz2VoRVBLv9lxyTbeUfjaWd8uxE8ISzGq4pj7NtA5kWg3mmEHMJCW9L5vUHgyx
	fHwkCzNWOiAXBAdj7UfWbrb4A5nrAym+m1gsO7dx1vPQk3O8Ig1+V2SE6C6HMagGnfALET/Jlxg
	eRr8W8o3U34H/G+VofHvt2bY9Rai62K7nVHJWp7v+RHpQIY81w/jxHWr3fEdpI8TORbMyP28AmC
	ozh1uT1rPeKMFHtg3ZEGBa4s1eeq2DV/XUrklYKWJ4ywqzSXrFrme2QceSEQ8VvCYDuTWj32S+b
	huaR30GSkgQt9vK7mIHBx1C07a6/jeYx7MzdENaOWqs29u5ay9d3ifXm5P4/Ccm2KkslgOihf4N
	ujD9O5KSdPohs7Cb03Tb6Ab0GAlDroPJXulpiypoBHeYPs3lSlW68PGUWSt6sJbs8Ke3T4dbGa/
	HqEE2db86Eo5n5DgmLEFm+52s4gNo3mv59xKQUFBg=
X-Received: by 2002:a05:600c:8219:b0:485:2fd9:3d4a with SMTP id 5b1f17b1804b1-4852fd94025mr27629545e9.22.1772893990712;
        Sat, 07 Mar 2026 06:33:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852767dd5fsm107786445e9.1.2026.03.07.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:33:10 -0800 (PST)
Date: Sat, 7 Mar 2026 17:33:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: circbuf: Fix leading space
 indentation
Message-ID: <aaw3IuOQbzPcAvcS@stanley.mountain>
References: <20260307113959.67116-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307113959.67116-2-giorgitchankvetadze1997@gmail.com>

On Sat, Mar 07, 2026 at 03:40:00PM +0400, Giorgi Tchankvetadze wrote:
> Fix lines starting with spaces instead of tabs to comply with 
> kernel coding style.
> 
> No functional change.
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  .../staging/media/atomisp/pci/base/circbuf/src/circbuf.c    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> index cb34d0b5abb5..9aa10cb1185d 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> @@ -192,9 +192,9 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
>   * Please refer to "ia_css_circbuf.h" for details.
>   */
>  bool ia_css_circbuf_increase_size(
> -    ia_css_circbuf_t *cb,
> -    unsigned int sz_delta,
> -    ia_css_circbuf_elem_t *elems)
> +	ia_css_circbuf_t *cb,
> +	unsigned int sz_delta,
> +	ia_css_circbuf_elem_t *elems)

We would normally do it like this:

bool ia_css_circbuf_increase_size(ia_css_circbuf_t *cb, unsigned int sz_delta,
				  ia_css_circbuf_elem_t *elems)

regards,
dan carpenter

>  {
>  	u8 curr_size;
>  	u8 curr_end;
> -- 
> 2.52.0
> 
