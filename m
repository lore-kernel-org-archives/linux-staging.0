Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B5014A614
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718302344; cv=none; b=PT6XhJbHDSKpu4mve9bw2MyA3ZoZcW1ZeOvlxQx5OtIxyMHgxUKNwT2nRf9cc2wnuGttU+6i16pK+vZSg+hZuZuMYBfluoAn2LUoc9GdXSP6PYN+PeNJ7uSbLYRQofep4OKgo4Wc96S+shAzdxyt9DRb2DTF6dtlyrW0nBzagx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718302344; c=relaxed/simple;
	bh=09bkj0aYiRhYPThOrEXj9DZrwqjxIISXp/K4ALT9sCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MinWai1kHgoHcq20tNpmYiCO0rGZ/1LjbpkpNW9pmYjLxcWG8710FrtZdgRuiXew9S61py4eXx6aK8dNZl1AjZKresCYx2ZgaNiJOv7sIVVPgks8xf7lqT+TM6Gn+WGqn1lQRxW6LunD/0/aVZeOjLEQVnDGjJ9Jep7W65vTsVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7Zuzwke; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7Zuzwke"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f3b629b4dso18213866b.3
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718302341; x=1718907141; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEkxYFxJcB/Qc3+AFrMvOaUS2Xwfl9Pd1HSoosJHfmM=;
        b=d7ZuzwkedrRzwvzArB8/ncfdmW23ndvJx/sN1SRwA6QFi+Pul1eM8n/rHYAR7oe07A
         VI3WL9ucrMNmIjMI+QusgSnhz0+nDBA2GdITbgZIY1J8oYPSBYFpIRnrX7Xr2NptpKJM
         Ux9ztWWqd3RMJuvEwRK9I15W0LIzno4YZv0TaQP5pT2ByHSdRtZeu9ltxXEI211S29aS
         74Hq1Z0m9m6XpGfcHz0qu41llOl+91rJcvlHKRQptRFxmPbFMQ/M5xoSMITR2IAxNdJ2
         42v08N+v/trOjuM04U2RWKOpvFp2L9rW2vkdSeR/t4kZBBPRtVzdhojbMWgMF2NmJ0bJ
         pICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718302341; x=1718907141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEkxYFxJcB/Qc3+AFrMvOaUS2Xwfl9Pd1HSoosJHfmM=;
        b=oGEFjyerhGnaG6/SYJ8iXS6gm5YSoZuYas25MsgjPaZxoDfYu1bV3gIDpPfguqd6xD
         7TCHJW+a9+GxGSJqabVEHs7OhUTbOjyqnU8AUXdEttn8r3HMbTteFO42hu66YQA20tdp
         Kawcgr+MaIsFcv5afUQMo6cgW0/7rqjblPVJBgyVxQpCGKu5ijIWiZxQnqts3SF9ua/Y
         kZMzaiTJ9TVBIV8bpyBOKNsiZJFWeC1mjH2+TqQhRlyTYxFJYLU0YBRIWdz3HRbM/lnC
         NMpNpUfFofLmh2ZSiYOg6ce32HUoXV24prAhfwMskgUV3vtuu6LrsIh4DV8R2+wb65oy
         ttfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBie8T/WMf6dxYW6NJ3HSKQpjAo5m29Afq80MEeFzxU05OKsNR6Mz2kf0hYvbUpPHhRqgHswW+fzzxcsYK@lists.linux.dev
X-Gm-Message-State: AOJu0YywfeYr4ZTqIIMFmULNMWy32b8dDagYmndthet+SA5O9bzd5WR/
	8H7oJzhAAbuQY1lLkVuvPdtKnOyjI2RJptDYclCz7jyZx5GhA12d
X-Google-Smtp-Source: AGHT+IHLdAy6PcmCufcU/Hj/bfUFKCJ6XRnfpYJV7AdmG6mHhlAQE2I9MyPtMQFbh9R27xr8Wkhdzw==
X-Received: by 2002:a17:906:48d:b0:a6f:f1f:1d5 with SMTP id a640c23a62f3a-a6f60de5efamr34230266b.6.1718302341020;
        Thu, 13 Jun 2024 11:12:21 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9978esm94520866b.200.2024.06.13.11.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 11:12:20 -0700 (PDT)
Message-ID: <100e5c87-d06b-4d17-b036-2e48fb234a08@gmail.com>
Date: Thu, 13 Jun 2024 20:12:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: vt6656: Remove line from TODO
To: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240613132853.2249-1-engel.teddy@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240613132853.2249-1-engel.teddy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/24 15:28, Teddy Engel wrote:
> Remove checkpatch.pl line from TODO as no valid checkpatch recommendations
> still present.
> 
> Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
> ---
> v3: Bump version number + add version history changes.
> v2: Revert the parentheses removal changes.
> ---
>   drivers/staging/vt6656/TODO | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6656/TODO b/drivers/staging/vt6656/TODO
> index e154b2f3b247..876cdccb6948 100644
> --- a/drivers/staging/vt6656/TODO
> +++ b/drivers/staging/vt6656/TODO
> @@ -11,7 +11,6 @@ TODO:
>   - switch to use LIB80211
>   - switch to use MAC80211
>   - use kernel coding style
> -- checkpatch.pl fixes
>   - sparse fixes
>   - integrate with drivers/net/wireless
>   

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
