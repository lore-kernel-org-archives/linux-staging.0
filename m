Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270141D95BE
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729185228; cv=none; b=lKc5XI71VLkJFwXur+1GQtsJ6OwGhNjNwjfbC7IH12suyGdDTb7fZcr+NQX5wzbBR/P9nuozJSfPeXQS5oUIy1l4IWZ8O5CilDCVtrMzFplkIhnMpN3qpRfBF08fdto1uvJkWy0s5zqJgyDNPXSU5nDgOdafUHgBGKg3PldPJDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729185228; c=relaxed/simple;
	bh=eEYjvbSCrSidE/j4nhJWhCpXBjWno+p5FELbUerSbBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThwYXFDN3ejjlmdKJBBWvcma8avUkZj6l2l4wGctdrMn5dmndlEQfeg/AvETxwwg08Nae+tH6lOhK1Is3IC54MuxncyDATFFtW9EzBqhckt+2QtgmZflzNaDpo5icTU/S1o7n2/XOffgTA7xCR0QlSpdHh7eUl9BOLEHK5V2XkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AA9IGUlC; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AA9IGUlC"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-83ab5b4b048so27337339f.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729185221; x=1729790021; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lcg8SW5sDFbo3q7gCqKFyajtHU/vxCvG0fWEJrcN8T4=;
        b=AA9IGUlCaAqodn6mteszwvBM6cYwQH1+e87CZmbSQeiKITGNLxN6akGc8zbV8AZHTG
         /WTizWJDuQoDIDN7ygrGn9MRCJG8XWZt7iSx7FleoKPnX3EeVvLIbRPr6TPEzRLf8RCW
         klV7ZN1Rhe8SaQSW8X0OUnU1svNMOZd+k5jDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729185221; x=1729790021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcg8SW5sDFbo3q7gCqKFyajtHU/vxCvG0fWEJrcN8T4=;
        b=R2wMRj2fqL4jGmC6oP/b3u5VKlh6DTlnFyP8ikBwjj/yujp4cZ9TO2eHaSIT9vG+Eh
         PnZz0SCFxakaLndE5Q8kUB+sigGjOA7d4f/aCTgzQaCddsgW/yp5HllbvGrdo3XY+wzt
         ALC1qLQVtVP0vwhgYS1v1aFiExy2yjjQY/u+wlyW8SDlL+okfRdtr/DXlDZXm98xSrKb
         oHV33At4XTFPWEesolLisgPsc2zy8q1DkQVeTTkDWMFOdCbwMTwKbfZtePQyjTjsyB75
         tBziz6EqgpgZxy81BtrvC2unwpca6t4wzsWsXIAYvDU97RYTZ9qH7j7SvtuikLNL+YdY
         NdHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6tJk7GYlm4h8sW6FtRD9nICChFEfYAPTXY23EeQYOu7SDBUxBcr2XiNJEs2udu4h6I6P2xa4G9KyOZF2u@lists.linux.dev
X-Gm-Message-State: AOJu0YwKBUg1K1LTQUU2ZA+bNsQMhHhKPGLz+xT7eWqXLS2nODEmetQY
	Rpd1a3SrH3eGlLxuTLnNR4tULsr3GzyG5oY63LQWYCC/iPB7BBFCOymW6lPNGK4=
X-Google-Smtp-Source: AGHT+IGZiPAankpZ6ezL2qr45if5WhYtPXP9lskByoniZm+THu59gaqG1gCP/FSBdgQ9R3dDEukQBQ==
X-Received: by 2002:a05:6602:1407:b0:83a:71c6:26f4 with SMTP id ca18e2360f4ac-83a9473c0bcmr939132139f.16.1729185221165;
        Thu, 17 Oct 2024 10:13:41 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ab2d89005sm36193339f.38.2024.10.17.10.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 10:13:40 -0700 (PDT)
Message-ID: <10af294f-97db-4af6-949d-8be778277157@linuxfoundation.org>
Date: Thu, 17 Oct 2024 11:13:39 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] staging: gpib: Change return type and error code of
 fluke_get_dma_residue
To: "Everest K.C." <everestkc@everestkc.com.np>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241017092511.17621-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241017092511.17621-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/24 03:25, Everest K.C. wrote:
> fluke_get_dma_residue() returns unsigned int with -1 as error code.
> This error cannot be caught.
> Fix this by changing the return type of the function to int and
> returning the error code, that was captured. Also, change the data
> type of variable residue to int in the function fluke_dma_read().> 
> Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
> V1 -> V2: - Fixed the caller
> 	  - Updated the changelog
> 
>   drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> index f9f149db222d..378687eb619f 100644
> --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> @@ -536,7 +536,7 @@ static int fluke_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length
>   	return 0;
>   }
>   
> -static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
> +static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
>   {
>   	struct dma_tx_state state;
>   	int result;
> @@ -544,7 +544,7 @@ static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t co
>   	result = dmaengine_pause(chan);

As a side note, out of 21  dmaengine_pause() callers, just 3 check
the return value, spanning spi, stanging, tty, sound: core and soc

This exact same problem is in staging/gpib/fmh_gpib/fmh_gpib.c
unsigned int fmh_gpib_get_dma_residue() returns -1

>   	if (result < 0) {
>   		pr_err("fluke_gpib: dma pause failed?\n");

This could be a dev_err using dma_chan_dev

> -		return -1;
> +		return result;
>   	}
>   	dmaengine_tx_status(chan, cookie, &state);
>   	// hardware doesn't support resume, so dont call this
> @@ -559,7 +559,7 @@ static int fluke_dma_read(gpib_board_t *board, uint8_t *buffer,
>   	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
>   	int retval = 0;
>   	unsigned long flags;
> -	unsigned int residue;
> +	int residue;
>   	dma_addr_t bus_address;
>   	struct dma_async_tx_descriptor *tx_desc;
>   	dma_cookie_t dma_cookie;

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
