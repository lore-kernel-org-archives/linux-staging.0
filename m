Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504808;
	b=esczUbkbAQoRrRE207Sb1JqecEj3sPqRimtBSq2jsUwG0r4PqFvbsEmwin5ruG9XWEN7
	 C2wIYZ07haCJmIq7+CuP7BTro+MdGtIhNs2ZALX7GtpCwHB635TuYppwip1D5Pk+BSUaF
	 VwrYjALrxxAFcyVdMlLnmBIGBhTOveg+VcUeF8UzUOQQtmC3tunpZJYTNGB8W8IdEKR2e
	 jxyJczBjE3w3mb+s0oaD8Gf8fgt0i1dHN1viXDGU0LPsIoLS3d9iBOZvmZMF3N4cHFHk7
	 ckngZXE8p1SKs32AoOrDMVLRjYXLSixLZ4tj3/HhLoSbMDEng8NxaN+fldYyMsuRqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=REF0is0/vKENL6ZoojOgV2yic3mbfdUjFSqvl0PsZXk=;
	b=B9Ov56AwPdPIVr4ChzlP4HEu6EhQ1vqieh9h+vAbSKnVueK4EAsY+3HztYNjYu4dSBO2
	 cXMZEuYXK/hvLHC7vjbsLgUIvnxO5beVJPqJ0GFguAlKEI14yxVvlkS8TMAcauD7JrPyn
	 53wm8E6CJ4NMtLA2aEGxW4LZKHpyWRqtmD2KUJ9ftHG7AXoofFzp8t3g+CRdFRPcYaBeG
	 hO1LIjtUh0dgb+FCl7aAkICt7yG+6aeJmPp0jdPPFq1zCMefrsg7XFYiRXGkPywa9yuSH
	 bj+fcsYRbGKlVpkMAaWVw7YHw37/eF7ixDz370PM/S8LEmueKA3eo2i3k2ZutvQzRPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=fvy2sMG9;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B460A2610
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 14:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36B460A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=fvy2sMG9
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53ec9237600so1281098b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792504806; x=1793109606; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REF0is0/vKENL6ZoojOgV2yic3mbfdUjFSqvl0PsZXk=;
        b=fvy2sMG9v0VM4QcXHURPdbb8UPxTm6LOpB9nhF8UhfM8wnEzRtHKBCtuNFLBIPYfzK
         Kc2zTKhsUKKcHay1mdSV7fwKSoXy61kqbA6edCc+ZI3E5BOTW4uylMuKHN2uldn1czPE
         6t13Ar43YY//EkfxDg1oEj/gTWrRaJcGeGvNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504806; x=1793109606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REF0is0/vKENL6ZoojOgV2yic3mbfdUjFSqvl0PsZXk=;
        b=0RE+0oL9j3AYTPhgiHGK7uC4BT60tXhoiC1whAWoqhOiUPfOnYPHIco6+ZYPNPXxek
         HZ5voo08kiFedJwqQbWIVYT+i15/3fxvbAiU6TBr/uU3Xke/y8coYVl3RavYK3EyIXO2
         +iwgzIRpDAz63ZQN3zLgHGdhRLGnHgjZ2kWz6hSaoBZKH1biZPjKV/fo4bSH6WhUPK8D
         JroSCLwnWlrYb++CpT34ib8MOKlZxMg5nHwJA6YnJiWTRqZaRg0ZruWqtvqqz6wLJzdy
         cKaAsZ/nZe6mMB3uKiljpehMQ1b5q6WHKyNJauj2QqnwugA2EwTD7rL6SMjy974KA/S9
         832A==
X-Forwarded-Encrypted: i=1; AKwUvBz4CGF5Yu4DL+o5A3pKE+ysxG/vPRVqq9vb9Mt+h+sR3S+mctncQhKC3ixSp+LBGoCATKDJrwomNvnJF4PQ@lists.linux.dev
X-Gm-Message-State: AFq9FYIU1FLZmn2ZJHWHN2v8zA54b0gdNwNO1WyNwN+SRiUYiRkwQn8N
	x4v8d7gI7oyrEn+trZVwyt7wBPVdtwkhsYAjI5Vg1Q8VO99MrANpMbkajEca0Ie9Jg==
X-Gm-Gg: AYBFou3apwSr1JIqmmrkQ8L1fHw/ECnCD4H3136mlSqNzZUhF13A1jiBMWyJXp4dnNp
	slZT56K6HoWFmIG7q/Yut+hQbYRwPkc3ACQjZPjYGYfBQef6YUEkLo/C0jyrnoN0ArN2sOR0dQc
	XKjXit8Yo77KGHJOCAOS7h9YlPexb/ZRQlRfzhYAzfD2JY+CXBykr6zYyrgBXuSXmL1QadgvSZl
	I+SMKLyvjq54P0oGR04Z6ObJQjJFkreAJrlEKJ8YZKLo15lwvvRa5cMJ7moubvKElMHjblYACsI
	VlpszU55Jexjy/ALCQAw+jOt3rzQvbrTsQ1nq1fAp3m9a3vN2a6+AoeD4DPZjvWIrVC/Iml/I9H
	c+vAa/W9IUc18TNMqGp2WjIHJSCOhv77JGEVXM3hGfWdBqStd7EdrKb/mfp8NxefsbvZlbP9bqq
	dsKFQmw5SiUG3eImPiyfEiZSTUeR7ZkH7P+ryWURVG9W6XcuDyKnnPxY5658NEQkL4MJEyJY6uG
	wJo
X-Received: by 2002:a05:6808:c226:b0:4d6:93c3:1af4 with SMTP id 5614622812f47-53cd561563fmr8452317b6e.63.1792504805444;
        Tue, 20 Oct 2026 07:00:05 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-5388a5572a9sm9566960b6e.4.2026.10.20.07.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:00:04 -0700 (PDT)
Message-ID: <7e71d57b-f3c7-48b7-bcdf-75254ee87cdd@ieee.org>
Date: Tue, 20 Oct 2026 09:00:03 -0500
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: Align function arguments
To: pavankumaryalagada@gmail.com, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 rmfrfs@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ethantidmore06@gmail.com
References: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 3:44 AM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Align the function arguments to follow the coding style and
> improve readability, addressing the alignment warning reported by
> checkpatch.pl
> 
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

This patch is OK, and it's a good kind of thing to do for
getting your feet wet with sending out patches for review.

But I encourage you to try to really *read* and understand
the code, and see if you can find anything you think is wrong,
or some bit of code or comments that you think could be more
clear.

I just scanned through "loopback.c" and one minor change (to
*code*) you could try is using fsleep() in one place that
uses other functions to delay.

Another thing you could look for is printf-style format
specifiers.  I see more than one place where an unsigned
value uses %d (which, for large values, produce misleading
results).

These suggestions aren't especially complex, but my hope
is they lead you further into understanding the code and
not relying heavily on checkpatch.pl to find things.

Anyway, this change looks fine to me.

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> v2:
>   - Rebased onto staging-next.
> v1: https://lore.kernel.org/outreachy/C560A15E-6F28-4FC8-8BE2-277B503340AD@inria.fr/T/#t
> 
>   drivers/staging/greybus/loopback.c | 3 ++-
>   drivers/staging/greybus/spilib.c   | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index fe48a687377a..efc69c10cffe 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -652,7 +652,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
>   		}
>   
>   		if (!gb_operation_response_alloc(operation,
> -						 len + sizeof(*response), GFP_KERNEL)) {
> +						 len + sizeof(*response),
> +						 GFP_KERNEL)) {
>   			dev_err(dev, "error allocating response\n");
>   			return -ENOMEM;
>   		}
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index e4d1ae8308aa..c1982f3fb931 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
>   
>   /* Routines to transfer data */
>   static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
> -		struct gb_connection *connection, struct spi_message *msg)
> +						    struct gb_connection *connection,
> +						    struct spi_message *msg)
>   {
>   	struct gb_spi_transfer_request *request;
>   	struct spi_device *dev = msg->spi;

