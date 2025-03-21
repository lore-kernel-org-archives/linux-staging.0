Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494F13774D
	for <linux-staging@lists.linux.dev>; Fri, 21 Mar 2025 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566490; cv=none; b=kF6G1v6DciQZtf3PYu4lvDkWHlQk7JClujc59VizXhm0C5tVmq35vDtkbhNaQ+3zGym1rt2iT+Ho6W7jYm5Q2pwFAclIt+sumQ4mxcT5Kmb+dpuMZOBflZ0tuOjWKzb/EcCAVgBUwZRLN7EWcYUIwOUb3FyJlLoGpdgWLNuIMQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566490; c=relaxed/simple;
	bh=y+FLQhrEzaYM8D0JtN8Az276b0i+rEP5XnlDlVs/pnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cn0lNwgU3AybdqBLmZP8c0Dc5trldmS3OJk+KUqMC3PknsHYCtOUJzwGFcoVSqbTivz9R3K9SguGOLym40MsE1a5P3a5kodvgPBGw5j/xrtO6c7rgAs/31kNcn+8TrdUa2RFUNqwpn0q+pbMdMLLu7EnRFgQm8VKy2w9yoqXppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=UD74474S; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="UD74474S"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c592764e54so239338285a.3
        for <linux-staging@lists.linux.dev>; Fri, 21 Mar 2025 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1742566487; x=1743171287; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9exEh3HjSKqcTsxFRqa5eN4Zk07lWBlI5tYJFrmxJok=;
        b=UD74474SIstLYG0R8AtdGIk5wq/hiFQ59zR3o4jirdIAOnmzP5Tojit+euIOCGDPTy
         x0LiGU2E3HD6gv9DsU9TGQU+u3HvHC4XqfZ4ofoBFpUHUkK8B75PBcbl/81VafA9sDVp
         ers+EHZtkLjZrrmD91/l9E20cUPdX67JH1+Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566487; x=1743171287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9exEh3HjSKqcTsxFRqa5eN4Zk07lWBlI5tYJFrmxJok=;
        b=NZH+PXaTIvxfbOUE/xC7wbdGfKZuifDqCkZySVpsCvDDAISFoBdt/xSheSPL1hM8XG
         wgCgCGNWbDtSvLT5LSG1o4SwxzqESuUnLJX/CWnWdrZrnoNYaXH1HfFDxrLxlyXPMPua
         Y21UxmzWFK6azAIuCgDnrD762w6svljvNlWEcelNoA8QNmBwVoZyruFXoebXDhKu9/22
         0Nh4bGm7v2cHYjWkS6y6g7d3ZvZvmUif6gm39MKzF4dazTg8NCi5FXEP9FziVrE32ZMe
         ykZp2xpjo75waZrgbZFw6zyVcvrv7+YBC7hwvRbfuqXlQUDAkZu/iG3wpwLZ0ergohT3
         jRKg==
X-Forwarded-Encrypted: i=1; AJvYcCWwN5j6Xt95TaNIgagqF0sjePkd3YBGSSzT9NpvuKGV8SLkWLbgX0eKbFRdgGqVJooEqJyDUww+V36aaUjH@lists.linux.dev
X-Gm-Message-State: AOJu0YyRaQU59ORtLcyo16V4ay3bOwIO72PimLi5XXZ6KRoi7MV+KHdd
	iHcTsraodjBz1XdfH/8rtU9bFwW6tXiUOJGob4Vk+YhhcX2zK0qJy/yZ6Hcftg==
X-Gm-Gg: ASbGnctgipE9/EDqmrc3qRK/Url8wxuDwF9syqCkZl0NqgQOG8PWAPdNoSquJW+E4pS
	Y8WJqgKQxBTRtfefPERd88zhtXZDZ25/1T10JbGIM2a5WPySEXEs3Cvz6z3SqcdD6WF7L2wDSwx
	yglrbmE55eU0WWyQXSPqO54vuJXu2gFNqZSgezNaglPts8pckieVta61kLngQYK5VQI9dcT4eZ+
	uuvjhBb6Jr1h9SxBmcJ/qvwSDIwKBcFKHXnQj7I8Fg5Yl9OH2IQhMVo4nQuCKu3VNeB3VJ7hTZU
	G601/eWlsGh2DZzPVV2B6LC5+nTTQ44jnZSAE87Oqjui8fSqrWbTa4ScO5uecKMyUkqdc6x246d
	68+aV8N6I7LSzCHvcAlrfcqA=
X-Google-Smtp-Source: AGHT+IEAlcWkAnwmrnQqtFTWuwfNBTAEVhK3IQoOiYeHqUDv1MVsDaGZ5Aw/RjXX/sF8QL3K1Ct2sw==
X-Received: by 2002:a05:620a:390a:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c5ba1e3f3amr432552285a.37.1742566486918;
        Fri, 21 Mar 2025 07:14:46 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7c5b935772fsm134988485a.91.2025.03.21.07.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 07:14:46 -0700 (PDT)
Message-ID: <24b17317-a153-404c-af67-79967bf49968@ieee.org>
Date: Fri, 21 Mar 2025 09:14:43 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fix line length issue
To: ErickKaranja <karanja99erick@gmail.com>, hvaibhav.linux@gmail.com,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250321115545.24468-1-karanja99erick@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250321115545.24468-1-karanja99erick@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/25 6:55 AM, ErickKaranja wrote:
> Fix line length exceeding 100 columns in arche-platform.c. The code now
> follows Linux kernel coding style guidelines by keeping lines under the
> maximum allowed length of 100 characters.
> 
> Reported by checkpatch:
> 
> CHECK: line length of 101 exceeds 100 columns
> 
> Signed-off-by: ErickKaranja <karanja99erick@gmail.com>

Sometimes a good strategy for reducing long lines (which, as in this
case, is partially due to indentation) is to define a helper function
to isolate the code (and reduce the indentation level).

Another approach can be to define local variables so that the arguments
don't make the line too long.  Here though, the name of the function
(arche_platform_set_wake_detect_state()) is pretty wide.

Ultimately the goal is readability and comprehension.  It's not always
cut and dried the best way to improve things.

					-Alex


> ---
>   drivers/staging/greybus/arche-platform.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index d48464390f58..1a82a7a3991c 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,8 +179,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>   				 */
>   				if (arche_pdata->wake_detect_state !=
>   						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +					arche_platform_set_wake_detect_state
> +						(arche_pdata, WD_STATE_COLDBOOT_TRIG);
>   					spin_unlock_irqrestore(&arche_pdata->wake_lock,
>   							       flags);
>   					return IRQ_WAKE_THREAD;

