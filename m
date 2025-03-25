Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272E2571AF
	for <linux-staging@lists.linux.dev>; Tue, 25 Mar 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742904906; cv=none; b=VXda0yALS0+iohcSDc3Xr030YyG8VHNR4Z8jGRutVU/xSpazFVPO0TwRCqaF85yrvkvRbDKTSiwyKD0/cWf34U33QHiQEbs7E7Ev5E+3locO8p8whO4a8YKnhg9tSFYxmtl0RMVECBoCS9HI07gJTx/ziz8aBTw4uBV8cqznnPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742904906; c=relaxed/simple;
	bh=UKbfjZ5E4QscHPOYkQaEa00cn5sNfmffGihktUEZ+l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGj8EmR8uHYwCJGFQsJ5BFUbz3QRdmsoklRnaMIa0IE5NP73v5N+obNeizrEj3W/VF5A3pdH3fwwhqQ0KTTJ3djelJY8Sz3EK87P8ocb8SSnwmwJpi/kOiIvTn3PGXR+HhZ3XG/d7a0zdPafpuc2B9h8yKtBmdMY4Y7/A0+bz2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rIfYFxPF; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rIfYFxPF"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c27166ab3so1288435a34.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Mar 2025 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742904904; x=1743509704; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC3ijQaBf4K8OWU+SDgw4P+7cyUwlTWZLf3LU7lx7Xw=;
        b=rIfYFxPFfsBs903E3xU40mcG/bjdEFiA1iD3AZ362Lb3XpPNLjgJM9hSwee2NpGUbP
         vBy9dGzCcEXYjDh3L0Ua2A9kwHgi0pXjiuaPpfBeF7zUsEBS0z/sHQfJksMvg7mRDqzD
         FELwG0qBjmYxLaaMbE17DRvdMoszJSXZfQbibA6mVa9GHIe0GVkw3yMyFdrqrOZWSrLP
         XzI1FJzduWBFjSyVeTRfHVto+yJZ7fBvGGKfG+GI9It5P39A/MkOdBQ54ss3zcKZvLcT
         cONTvBgsH4RzDGB9/rVza5ln3+AdjY/IVYC9x0m2SNxF9DhTtvlvcxEg1XrwPDGAglMf
         VKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742904904; x=1743509704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC3ijQaBf4K8OWU+SDgw4P+7cyUwlTWZLf3LU7lx7Xw=;
        b=PYwQ/C5C5IW/peqy8LfiMx7S84lGz2eczqnF+OSNitQ44+oJFuOiI+NxHaLYb2QNTg
         2NdzO0pCnK6FV7TAITv1hyvtHCLOwAj3F5sE9ckzRaYdryloZpERdOhQnJYI2zXJxPC+
         3FEi/LeqPzFFk0yQKn3p2SxgIlJUDE9cwZMes0nmm33APj5LwpiphUf6yMqdbY5JpKbX
         Iz0PsRR73X1REy0wuOSfr4s6jF5AH2jg09L8t72cRVxtzD4VNf8MA9BtiGtpWyHuKKP1
         oSpNZJEIxiMZ9y08RjQ0XI6JTmDu30gyG5DL5SrRljedIwQlrt4QJfr2qnw5SdjMpPO/
         fTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX69B/AHDdSOQI18wkTm7WQr2WFyqExz2uQzm6SBZAV0J/EvLnEU3Ua3RBP9WTrHwiu6bTf5q0808nXbfPO@lists.linux.dev
X-Gm-Message-State: AOJu0YzA5SNlBP670VViS+RE9vZFINmpOEc8bOvhfZEVzz2ggXuvgQCl
	zHt3MOK+cnlgNuSLxC/xiTPcljNuRLaNgBYwBcGCYP30ZsCSTsvAdp6U+sZDi0s=
X-Gm-Gg: ASbGncvtKLy2OCAYcNPs5SKnprSwfeCgOlozPcDE2uApbWvTaUEcKi+786JT1L22MFS
	vLRDtHo2xD65DQXYX2VSyM5q3tHnQVWlYroVcpiWh23Qd6YUMFRMtOZmJ25lve31+3RkZfvpXcI
	QvXBA/0kwbmVsHTai9N0C4akhJDEXPcy4bXHK87V1W3ppIHa5zpcihIEQLIRM+2gKN8P6c6GakI
	s7HiOHymTJkQL7SYR0Ov2/kus7tn01Vf3Upl0nSeqRVABvhVa00hnucBZI8E2lMlnWyw+LkPRkf
	BGIzwclzXAGuRW32R6ECNSvi4tPStV88bX5AS8LLYxTVLcru3lNtMc0KbS1VWrlaMgNZuN5DETX
	707+Eh4by
X-Google-Smtp-Source: AGHT+IHZKE0q+q2yQSr22P7i6hKjZROug3Xpi7UzBNf6sOzdWBDPPxeLMvXTvddN7ZqquWTR4AKONQ==
X-Received: by 2002:a05:6808:384e:b0:3f9:a187:1f2e with SMTP id 5614622812f47-3febf7382a8mr10579611b6e.18.1742904903718;
        Tue, 25 Mar 2025 05:15:03 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf7927d5sm1974378b6e.31.2025.03.25.05.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:15:03 -0700 (PDT)
Message-ID: <a5477192-ee6f-4273-b7b4-1d9dbd7e7b50@riscstar.com>
Date: Tue, 25 Mar 2025 07:15:01 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Alignment warning
To: Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250322065800.21361-1-karanja99erick@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322065800.21361-1-karanja99erick@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/25 1:58 AM, Erick Karanja wrote:
> Correct the alignment of the parameters to match the open parenthesis.
> 
> Reported by checkpatch:
> 
>      CHECK: Alignment should match open parenthesis

I think this change is OK.  However you'll notice that checkpatch.pl
has three categories of issues that get reported:  errors, warnings,
and checks.  These are in decreasing order of severity.

Alignment issues like this are just "checks", which means they are
minor nits that are often not considered a "real" problem.  In many
cases, white space variances like this are done intentionally, to
make the code more readable, or sometimes simply because the code
that surrounds it used a different convention for alignment (some
people simply align to an even number of tabs, for example).

In this case, the change doesn't make the "look" of the code any
worse, and doesn't reduce readability.  It furthermore gets rid
of spaces after a tab that do *not* lead to the suggested alignment.
It probably isn't a necessary change, but I think it's reasonable.

I write all this to explain that these sorts of changes are in many
cases rejected.

I'll leave it to Greg to accept this, or offer a second opinion.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index 5d80ace41d8e..ec9fddfc0b14 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -1165,8 +1165,8 @@ static int gb_camera_debugfs_init(struct gb_camera *gcam)
>   		gcam->debugfs.buffers[i].length = 0;
>   
>   		debugfs_create_file_aux(entry->name, entry->mask,
> -				    gcam->debugfs.root, gcam, entry,
> -				    &gb_camera_debugfs_ops);
> +					gcam->debugfs.root, gcam, entry,
> +					&gb_camera_debugfs_ops);
>   	}
>   
>   	return 0;

