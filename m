Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6455F9D9
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770880313; cv=none; b=iHLuV9ZdlB1FItAo9YoXUFH2wSwU/CxDhbzD0mEjS8zJoxiCU5m9/nQW3JUOPJfxHK/6RTwk0u5pKswee6BTrNbSKXHtFHTaXSEMtjDQ5ejrMC6xwqulHd4HFkWUlipwNKYi1IJpXaa8T06dMAXzS2OCIOORZbMBKKAqbmpTqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770880313; c=relaxed/simple;
	bh=mQ9g5p3PFQ9DnsdV4ZyTabiHj2k0bkG+Umsw6LpqL6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opm2nl5cUR6HHLVzRzrjapuxWIjWc2jpm8nLBbj0Tu08LazTsoqPJEjDRfFQd/D60TAU2prFeCbpemjsJUOxm9TS/3uvNALfXQywWX4M7crXXcw6RLOQMC8ODpiYdoFaYNh1O1gKXLYUEkfY6bZ2dslsms7W30mtmk+MsJOGtAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJU7zINJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJU7zINJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-480142406b3so60034475e9.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 23:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770880310; x=1771485110; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ggpq/GXQ5AOsKAw9OkU6qyJDZu+KN0UR0WW1TCKg76c=;
        b=AJU7zINJaRnQr9oLm95buG53mO2IHtsc8ofykomrYdzGyGmb41ZIT7HpR51+eIcG2d
         i6OJKnyAtOQYD6rYyX1LgVOD406yUcgt5wgH5/smjIzJIWg+6VWoJAD9p72CequL9wgP
         TRt5lLQmxk3iWd4XO1Txw0N7/VsCpaF/dlrQ/1iDXDPfz+rVHcTN6ivqcZj1OXAuXQl0
         Up+a0oRpRipXmdh/hmjfM+ZaWWCgk7yOLiiVNG15PRm0OTqZ9gw34QmPg5qoGlg+WxQ8
         9GbGbugyneArk99DmMysjr6Sz88tLIRgI9j7PbPjQqHnAkY90K8h+MaLDCyCb4q4ZTSr
         +75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880310; x=1771485110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ggpq/GXQ5AOsKAw9OkU6qyJDZu+KN0UR0WW1TCKg76c=;
        b=vEdvk1u6xuG/j84m60pRrpPMfXolYFe4T/dyXHFjDY8RNz6suAVDOZV7cklXLOkQtM
         78h7EY4HU10HIyZC5Fp77ytjYAuYNZcqIFebHLQrs6zZ3SlmBpdRQMvUqNFsacAbBxhI
         Vki4t82I+nP7wOelqokesdZSLDE9I/S0gU5AQF5F7R4zrwokZ/JZttIje5nzVl0OYsrj
         Fy8UP9oSgyDEIfKj7i3RVRUUE/LBCOCPEdkkcRuRCzkpBVnhZ/uXQaws7BptGGACgdV+
         P/4Z13zRb3r93YrvOf0WB5Bn0aXSBeF/jJJ5pQVmtDN6xz3U/uph18Bpkm+Bm1igJbne
         z9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/xs7yqNYVHT7oJHkvf+zNjVwlmp5Z03TJiEQD0b/vT5FrQdykHLTmijXpJNYuU6jkgt0ONLBR8dudu/nR@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+lrMMc9d9zgexwcdKIhC08Yg9EnitICduxRNhLxake2zH1XSt
	ZQYlulQ0mJSIUt3cNxxqCsoraPoxPJ2L06xIyFM4l7gX+Sm5/TPw5LwuCc3YJ+kOqAZ61mt5teP
	Q2YcS
X-Gm-Gg: AZuq6aK0aYnX5oAIDSYZOW+OyHC/f6cW5WFIaJWHcP9QN+PFmnozEWcflFgNcVAs4wO
	L3JCGyeECYCd4/fJE8cLCfEKrvZcKI2U8COssyrcdny9w0WV93SvlBNRQuTv3UaTRfWmgZAwTbk
	Bq2mhnLwvLetJq2n9KkEgMwbvjxJ+dN99NcuVjOEeW484sp/8NI7hCFs74SFuIR4KuKV2pKaj5M
	F9Z/8LscXQzRze4QEaIGtG28bdMZJiA1OhaNrdjqlwEqMgCdtc7cewMqMipqaAPOoNWqKYQugw0
	EkHEaZfATAg7IKuufw8QwM+ehj0HBCEKuw8PTitL+C+8baS2lYeZ8CkeezyXxdt9ANy6AhFH53Y
	mD7y1x1tvmgzSkIIsquNH5rvlWMqLJ33flA6mU7g9IwJ3xyZXrWuyutdJzMZbse899Li+8Fzhth
	AMTDWPdOu6UHy7WxJyrR96o3uoD9Dr
X-Received: by 2002:a05:600c:c4a1:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-4836570de73mr23997815e9.21.1770880310272;
        Wed, 11 Feb 2026 23:11:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e0ed5sm163736545e9.5.2026.02.11.23.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 23:11:49 -0800 (PST)
Date: Thu, 12 Feb 2026 10:11:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Santiago Almeida <santiagoalmeidaburbano@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix spelling mistake "writte" ->
 "written"
Message-ID: <aY19Mr3sU6gIO8jh@stanley.mountain>
References: <20260212061802.463237-1-santiagoalmeidaburbano@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212061802.463237-1-santiagoalmeidaburbano@gmail.com>

On Thu, Feb 12, 2026 at 01:18:02AM -0500, Santiago Almeida wrote:
> Correct a typo in a comment within the fb_st7789v driver.
> Found by codespell.
> 
> Signed-off-by: Santiago Almeida <santiagoalmeidaburbano@gmail.com>
> ---
>  drivers/staging/fbtft/fb_st7789v.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> index 861a154144e6..9c85430ae82e 100644
> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -221,7 +221,7 @@ static int init_display(struct fbtft_par *par)
>   * write_vmem() - write data to display.
>   * @par: FBTFT parameter object.
>   * @offset: offset from screen_buffer.
> - * @len: the length of data to be writte.
> + * @len: the length of data to be write.

written.

regards,
dan carpenter

