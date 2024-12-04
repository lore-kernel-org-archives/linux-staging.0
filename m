Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B9192D8B
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301187; cv=none; b=ilWbbocEufhdgHCRWn6jEftsLQt13XTmUAHxizr+E5tPurYcz3Fh7PdJfBltXfpEHvhm7Ug5EIhZBR2zOJOydalIjqS69UNMpaerHWihrw1EBsXGDAlqxsMRFRK0S9f7Ed+jHay0hZIsGC7CCsau234lOSX/hUQ7vZMKp4RrmIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301187; c=relaxed/simple;
	bh=eaVTqrnLcSvqSeHgiAGMeuVqAGJ0Z+uaOXHZkDI7jJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgw8Jjxw5LSxJTfSFWDZ7cjVOACNQlsjYAoyf9SD/e1J/4QlYm69MRqLbSRwi21O3q9s3vDBvT+90rrys1ykrY303lWYpCg/JQtgr5EpDqAjYr6lxTGo+UDd9O6EsglFN2Q4mE9P9lQZzKEvcpw6KSdDVo79UbSrrYZeqneUfTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OrjGrohv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OrjGrohv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a2033562so53485755e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733301184; x=1733905984; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XM0M3/5dx4Uwy2+HHwie/c/1qf4lMtXq3L0KJwbY528=;
        b=OrjGrohvAKQ4fpoznQIRvGz1WVorwR1LkfDATYm6dhnhWNrm3fu3RkCDLSuhf2pQzf
         0yhCYbRyaxYcQG2KrahSMOt2KfH2DBOg3By4NrKMVAmlG0pGmC/H53WwzqCP2gTlV1jG
         6dnT6FFrTrWUZQnEn1AXDNASvXNHamK6nmVKpi/YLvVmUvG0IcrspuZFbfmkysb5ieWk
         giGrTpUP+hWmOarwJKYt1f1bgmZt4ZS8EXsfAlTgg28pQn/at2/fxqAelx2dbsHUGHOY
         jNtS8PJEQrdxaDWQ4SOySgHzfd8NjbWYl+vNkkAPj/m2MTsMtONjQwkECd3gw2XmlMBg
         J9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733301184; x=1733905984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM0M3/5dx4Uwy2+HHwie/c/1qf4lMtXq3L0KJwbY528=;
        b=HHUTsEanu0YUlvQ4gb6o+3ZaWXu3yBWtnfhJyWfKrqfHZAkQXqOEZFZuh1KcxPfVC7
         9NpswGh822ay2R9h28S/Ba1+mwXq83IBUpCAXDRAZodQtiko5pqIwE5H8g6TJzB9T8F0
         YOGAQBa6YGzCQn7uENVd8UxBkjBL/bXagEeWc/p5vTb+1inCn7teZSFQjVyqgyW3dKPM
         vuGgekLnmSYDNxhIg2OlNKD1GQqM5O/engXKbuE/9f+knQHRn+Tm6QcuLpXmFxamadZc
         8Vn2RWWxnL6jG7+t/Ooas1Ze6i09oM5gSGbPZNDGwQF+8BfrjD/B4aH2BMH+9GjTrrde
         33Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX4P4yOeNCvCd+cx79GedIsLQ12geUAVANUY9JHRoqRC26T5kbNKzJ3erb5lacqt7wdv8qAPg6Bor2Yru1Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yw13dM0cFRYTxQ/rfMtcGkbm4sKxRFceuGroZOg7wmrWOq0wn2M
	aOtIo43odo++bO/JQqIqHJadzhRoeTwmbJikE0Ol+c7zrv2+FuZRpg+qvbQIdoQ=
X-Gm-Gg: ASbGncumHCgToB7TfElgrVxVuHMVPhNlm6Ln5IJ9WDyvq21XU1CUOntxz7+SfjvpoTl
	jfWSOHD7r7mmyxlF1qpCLQSLBgt5rHQm6TYf7rGpNF5uOMjOiVO8sEnAIpKZtq+zIowm5GvCCg6
	4pC5SG6G0Az/tZ2yS23h5kf/AbR9oC99cyo/0nkT0aWWqX8RmexnMPsfvrYZ/wc64+/9AgTJXcH
	w6oENFbyqGmZar4lXBWKcfkqNL4tdtlSkm1mC6kohRqKl2QDfIo9dQ=
X-Google-Smtp-Source: AGHT+IE+Fgf3i7WYOHBgZVu2WScurxt2yWtjCETS3pz3YbW6ZOFMTKZatopzgDHP0TrCPTYtHxKlig==
X-Received: by 2002:a05:600c:3b23:b0:434:a924:44e9 with SMTP id 5b1f17b1804b1-434d09c1598mr50365995e9.15.1733301184221;
        Wed, 04 Dec 2024 00:33:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527f86fsm16236975e9.18.2024.12.04.00.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 00:33:03 -0800 (PST)
Date: Wed, 4 Dec 2024 11:32:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenguang Zhao <zhaochenguang@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: Add a blank line after declarations
Message-ID: <2137176c-24a1-4257-a658-cbbd72094e90@stanley.mountain>
References: <20241204081314.194701-1-zhaochenguang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204081314.194701-1-zhaochenguang@kylinos.cn>

On Wed, Dec 04, 2024 at 04:13:14PM +0800, Chenguang Zhao wrote:
> There's a warning when using checkpatch.pl check rtw_io.c:
> 
>     WARNING: Missing a blank line after declarations
>     146: FILE: drivers/staging/rtl8723bs/core/rtw_io.c:146:
>     int value = atomic_inc_return(&dvobj->continual_io_error);
>     if (value > MAX_CONTINUAL_IO_ERR)
> 
> The patch fixes it.
> 
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  drivers/staging/rtl8723bs/core/rtw_io.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
> index fcda9db6ebb5..fb72d64f4403 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_io.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_io.c
> @@ -143,6 +143,7 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
>  {
>  	int ret = false;
>  	int value = atomic_inc_return(&dvobj->continual_io_error);
> +
>  	if (value > MAX_CONTINUAL_IO_ERR)
>  		ret = true;

Instead of mechanically adding a blank line it would be better to step
back and say "What does this function do?  How can we make it better?"

"value" is a useless variable name.  It's too vague.  A better name
would be "error_count".  And instead of setting "ret = true; return ret;"
we could do it in one step.  "return true;"  Get rid of the "ret"
variable.

regards,
dan carpenter

