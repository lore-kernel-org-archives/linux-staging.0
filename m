Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5A2264C5
	for <linux-staging@lists.linux.dev>; Fri, 15 Aug 2025 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755288193; cv=none; b=hm6kgjE41XhQl0dMaFj/lio2Vp/lhCpQZQC4l6hMH6APfIsvs9ejBf5j5qEfcPrj58A5Q7t2NyKMYbgmpo7+7oIdkRQeGGVOtMMNydFrHh8QSAzRD58N0T2ry5txhbhE7awXipaJQC8wl+HTikA2byac95l4md20GwZzQuCp+NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755288193; c=relaxed/simple;
	bh=4STIYGI/Iyf15/bs41CGx8JzbIlb5YFgaQssWbnWL0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cv7MBzxullNNKVj4yOOCxyrDJGqJ4uz8azTiZnlvqaj5WQAAHiBek6iYuz6I4yeQvzcb8oA+hQqiQiFHJ7Q0wUARmhhposxuqovBdvhGNEORmmacvWJyeUcDQNXpZqiPJVsq4a3JBr/y2sDDwLKHQP2UeO7wCgqtbBZycAv3Lfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jKEuqQC0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jKEuqQC0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3bb2fb3a436so729707f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Aug 2025 13:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755288190; x=1755892990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2kePfzDvFml6EXYBDwWfTvZ++1LxjVURGwo9pFDf5U=;
        b=jKEuqQC0cM3rYSvglzM/iVNzYPPizUZ7yDNgUpoADkQyWZhkEQzwtJ835ID22mkOCE
         wN2hj4GCotz7buRTGOL2mw7mMUlfdF+2WSGz9pUalRp6YXtwq7QcUTEti5cVhVKOapfv
         QAWbfDPML0JuVcVIxbcPuLYh+hCCvVwTaDf3hi/gvVznmToWQbp2RpXiIcpcgQPB5cWO
         VYFybn7cE/xloKbSf5dgjXbALg9ApC6x51yLEqMziAGdW49ReboHOahzfwmtm+Dh/YXr
         J6tjuQ3quM2tFz6tlaS0PWWSvUptsKZM4m2S7+FWJzh3venmd2LKtvJIHe2PBbQ01Ech
         L9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288190; x=1755892990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2kePfzDvFml6EXYBDwWfTvZ++1LxjVURGwo9pFDf5U=;
        b=gAoRIWIix1ivrXrZEVYbAHBD7AlOQKxJYuC2L74bAbyAfeIJgC6Pb5un+aoEUjw9PN
         +Im8DuPo+SkQfDvPSYXmi+0F56RdAUDfU4NIzl9rxG8iyivh/l/R90d+hZmGHm0WeWbu
         aGaD+xYIqh/hgUJsePeM2z8Vy5phRuuNXrbPli94qEyDBuKi3BE0b8oFVjq/4hDFjrHE
         UAjZeOiuBa68z5BvfMsOsYixbEfdqNIQk9bqfXzS+oCdx3i5+Tb6w1RezCqiavaGqvNi
         HXVdCgpfYp0qHUBNqE6k6M7xlT1bJgVF3e6ZZx16HBmjGjU2Jm8ZLewJUyzKsoI215as
         AL0g==
X-Forwarded-Encrypted: i=1; AJvYcCVj0l7H3b4o6q9jWihnTw+CzYCbucEMAKZjav/DHvSPxkUXnwLrb1K3o7Fda69+vMf04SZ/0EsqFzjauklG@lists.linux.dev
X-Gm-Message-State: AOJu0YzjwtFSilkhQFYFvy0hoO2+1fDSXK8/2hGBx55KGNMNyNzOVD6o
	SvRJ4ETJB5lcDIdAvEgBJCIsCfOrS8ZI+WP8iWWsxc2uzVlZDOnpyu+IRwVPen2HAuI=
X-Gm-Gg: ASbGnct9Qn5lBiaDVL5NxC5Wsb4jTUMNr3/T7kVLSgNPn46wmoSK9Ad9FqKO91ruWgs
	eRIslkl7dnUtR65oJYnPWCUiHc7Nu7rnB5OwuQZ3qJ9vSI1k507eOD81mI+9rH0cIiaauthcrD6
	roxjEoJmrIuSPu15MDHmI9SdU0kvU/DFLEq7KAz911MmO0eDtN6kwiGZLlUHO8ZaNs0kfD1Leia
	uRPQaCic4Azism316dWuJsKanbCw6yRgSJAfN74xluTkejyCcLOhbKZfO7IrmVHsLJ59Rw52ZRW
	jfXoLw7FBulr9cbQKMfvA8kO2P4yLmioTmLZFePc+z3NCpwWv9lOALUICw3iE2DyBifJSEiGJEF
	LZG1S6i7a2VjftnVeX1c+ZDfnKkY=
X-Google-Smtp-Source: AGHT+IHT14axeSHSDRiAFlW7o6Ist04KA+jLa97KTahHyBEMOM06qghEr+qt8YTS6r4n7TbhWi5LXg==
X-Received: by 2002:a5d:5d09:0:b0:3b7:899c:e867 with SMTP id ffacd0b85a97d-3bc6a83c6a5mr227506f8f.59.1755288190201;
        Fri, 15 Aug 2025 13:03:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb652f9debsm3174669f8f.28.2025.08.15.13.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:03:09 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:03:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] staging: media: atomisp: Add lock asserts for mutex
 protection
Message-ID: <aJ-Sept8uMm2Opeq@stanley.mountain>
References: <20250815170901.32105-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815170901.32105-1-abdelrahmanfekry375@gmail.com>

On Fri, Aug 15, 2025 at 08:09:01PM +0300, Abdelrahman Fekry wrote:
> Add lockdep_assert_held(&isp->mutex) to critical functions accessing
> shared device state. This enforces proper locking and detects violations.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  3 ++
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 31 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 3a4eb4f6d3be..48ca33e1c92d 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3794,6 +3794,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
>  		    const struct atomisp_format_bridge **fmt_ret,
>  		    const struct atomisp_format_bridge **snr_fmt_ret)
>  {
> +	lockdep_assert_held(&isp->mutex);

This should go after the declarations.

>  	const struct atomisp_format_bridge *fmt, *snr_fmt;
>  	struct atomisp_sub_device *asd = &isp->asd;
>  	struct v4l2_mbus_framefmt ffmt = { };
> @@ -4324,6 +4325,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
>  int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  {
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
> +	lockdep_assert_held(&isp->mutex);

Same.  Etc...

> +
>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>  	struct atomisp_sub_device *asd = pipe->asd;
>  	const struct atomisp_format_bridge *format_bridge;

[ snip ]

> @@ -1726,6 +1746,10 @@ int atomisp_css_input_configure_port(
>  {
>  	int i;
>  	struct atomisp_stream_env *stream_env;
> +

No blank line here.

> +	struct atomisp_device *isp = asd->isp;
> +
> +	lockdep_assert_held(&isp->mutex);
>  	/*
>  	 * Calculate rx_count as follows:
>  	 * Input: mipi_freq                 : CSI-2 bus frequency in Hz

regards,
dan carpenter
