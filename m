Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9C7406B
	for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781714; cv=none; b=G34+Qt66MFwU0KACdV0U6Opvxj48GN6CgQxyek6ul+3bXgQ1MnYADf+s1ek8CTOC+ctEZSJfNNn+JlMmqpKliV7H+6u+ilNTKe44cWUPajYLC4/Q1DOt2OK4kRWvU/RC4w3RBjq7d1k9Nz5CRbmlU+47UqkUYWzs4X6W02rKk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781714; c=relaxed/simple;
	bh=R/kmyQPRM325I/bwHAyp+h9CTCTqygm4C67yMCBClTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9WTvrae0OOP5h6Eiavt56QN6Yu0QLu233CVEDYwCopr4xr85cEkIOJS1mO24iAmsaeWX+6VVtq2WrBHtcVbFxxXC+QzmTETa3f2RCiwEKCIKlaO7mkUHLVOYOPd53UXQV/9J9b6+tw8yn/V0LsmU56tabL/SjT1aN98sG8+smY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdVB+9Qp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdVB+9Qp"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so2602724f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718781710; x=1719386510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5FlCuYx89OMN7s2VzglpB6pm+N8b7rvZjLOnkOOQ78c=;
        b=gdVB+9QpQO/UVPfPeR3YZF0d4WCwsRIrw7JPIWWHe3fZmLsPJXOtwniq1PLEYI5Te0
         jcNxQu2nWBC8Vc6AMD9I79YY3d5cpZWhUoktr1ARtQuyKLO6p1WkBs9/sgu14aSXQMrU
         JJ8NqohOEU1OvKqQjTW692NeuXsR17LPy8HO+bZBXUr1J+7wc+0OIRDXqjUu+IF0H5t+
         RxwdTG5GeMAFG3jMR58S/ayAf4TE/GG6lQttq4GaIGZ6dzdVB8g2p7ULqX9XcpALLeLN
         TGca6zHpkVIn9DL/HjnndiEE2X30jHJGbakP/GevTsuO8z68XAK1fLfne0It+FQs+JM4
         LMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718781710; x=1719386510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FlCuYx89OMN7s2VzglpB6pm+N8b7rvZjLOnkOOQ78c=;
        b=k3wEwY/942jrSV0/smV8htrf3P/u53Zluqms2KKPhOFLGWwsTrOSJianpndFHJVjOC
         c+ujGnWtrEPRliSmWmBQh/URGdTlQSfQzlKPTqlqJjwzn8GpCOa7qIq1vwpwWGoprLkP
         B0VqaLSSVIg1bypxLT4ttn+w5ptaikbrVqFT5yybkoS5KWs3yHYgtr/zLBzoOodH/YG9
         I3wyg7ZTLETt0767W8BkpFvWZEgYsNm+dAW+lj/wv0WBqYW6j001xD9+vOhzeN8mb3q1
         2/ryn5GvmMG2RkUgyiRAU3+oy2yueNBC6wg4E4yAEYkFXYeea0IUatJxmp5rtPzSCUCA
         K9uw==
X-Forwarded-Encrypted: i=1; AJvYcCXHIugwFPeauAm7gXQsR5A9bH0hX6M7KK+DCsMDNX0EQ4MRx5FrpZF8tryZHZ8pSAsFZhjFLDJY+11I7/OLxCpATlIL6Q7bFYL1WSLJSQ==
X-Gm-Message-State: AOJu0YwkRxP9R3AD0bHUz1WsKwmfdhjD8U7SLTuzTdQz3Lji6g1KZv7l
	jblBgPPkVN2/WGTaENvQoZR9jmUOjzpjgaTEBMBoOXDkTVahtB/BqjrxFHXI9cA=
X-Google-Smtp-Source: AGHT+IF2UOLV+qz3Kk3N1LJ8/j7ro1aIbV92WwNj2KhCxSSnTu3IwZUZX9P1RLZZrBmMGynzY0ETcg==
X-Received: by 2002:a5d:5402:0:b0:35f:1f91:c23 with SMTP id ffacd0b85a97d-36319990751mr1278337f8f.65.1718781710339;
        Wed, 19 Jun 2024 00:21:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-363bd4668aasm534412f8f.48.2024.06.19.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 00:21:49 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:21:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/10] media: rkvdec: Add image format concept
Message-ID: <f7e4b0be-fe09-4db8-b081-21c46c0d836f@moroto.mountain>
References: <20240618194647.742037-1-jonas@kwiboo.se>
 <20240618194647.742037-9-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618194647.742037-9-jonas@kwiboo.se>

On Tue, Jun 18, 2024 at 07:46:32PM +0000, Jonas Karlman wrote:
> +static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index,
> +				   enum rkvdec_image_fmt image_fmt)
>  {
>  	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	unsigned int i, j;
>  
>  	if (WARN_ON(!desc))
>  		return 0;
>  
> -	if (index >= desc->num_decoded_fmts)
> -		return 0;
> +	for (i = 0, j = 0; i < desc->num_decoded_fmts; i++) {
> +		if (rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
> +					   image_fmt) &&
> +		    index == j++)

I really don't care for this j++ which is tucked inside a condition.

> +			return desc->decoded_fmts[i].fourcc;
> +	}

	int fmt_idx = -1;
	unsigned int i;

	for (i = 0, i < desc->num_decoded_fmts; i++) {
		if (!rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
					    image_fmt))
			continue;
		fmt_idx++;
		if (index == fmt_idx)
			return desc->decoded_fmts[i].fourcc;
	}

	return 0;

>  
> -	return desc->decoded_fmts[index];
> +	return 0;
>  }

Don't resend if this is the only issue, but if you do resend could you
get rid of the j++?

regards,
dan carpenter
