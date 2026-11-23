Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419232;
	b=sy4NEe90WvhTXOA5x/i7SdvrNds9wGz3MiQgGRVDaXBv2JG2w1K+/GcaJKIvHno+qCFV
	 p7BfyyfQfxkU5G6Tv/xmlztg911GwhR7IyZngIwF1N9nsNVMFqqNlzFioioCdTkcJcsjJ
	 IoueBCqC9JwXtxTmSmdSq2HjAVF+41i4ZgHbFzcs5NMsa8CPlfid5kSn6cfH/2ShN6tu4
	 UAncKqdTcf0dLu5WxknKYN8yhbjEIyWrLaPufN++IrDsCKX8u7I5vxhlKAyAyCTueRLvH
	 9tdirBdF3LOsxVKy9cTh0ucTZzmoHYQ+UfoVEBtom0VG64TrwfSIqobQWJoRogJDRHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vCLV3XBRX2wh16raJXcCmA/lhiX2jHGFoT2tZZcD4OY=;
	b=kJT8j+gwBrvpQdfXCJHmMOOD+akYbN+HAxESmsRkCZR278H32Y12M2WeRRRebX8pGSVx
	 /l48ImO4wWHhbr5qXf30xrcfoRGPysHgr7zGWUz1TF2nD30VnHctP6HX1deMUL97ryQFl
	 4yYK1d4NOfvXE8vyZtDZQ6ENikwXoALasnAWkDrSJVhsNiFE4VPiXL9J3UzjXTgYbWwK9
	 lr7HUowk2Fk6JeMInYvHh/mHEqsKvUAgBkag7lWZKXZu/w4iByu71HXXEfeP73azfbZyQ
	 44kIJ3jHVKF2fS2A3s9zHGPZM8YvqiA8piDoZTYrYwYBuBXgiYI1FItHoyhzce6rofw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vas9uPDV;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD90606A31F
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 07:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD90606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vas9uPDV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20406605e9.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Nov 2026 23:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795419230; x=1796024030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCLV3XBRX2wh16raJXcCmA/lhiX2jHGFoT2tZZcD4OY=;
        b=Vas9uPDVRRoIvJTjYjTty67jz5vEJb3HYih7yVcvMIaUgxPviG5pkunW0a0LntX62O
         bxozmfzNwswma5sGaMUj6aCAhn7NGmSD7vTsgrS+OolCOY2xgnKh6R7bPlCVl6BLdP+g
         0aEy28Kq13OPGNdboK4bLR9cXBBvtZlrzpvpXzP/FdK6znm4op9w9AS+XaqB83vQ8hoQ
         kZU3NykYfUc1UJWuiKnoZXv7XVE0kM9XdyOUp33sJO2btUhIotZwu8OkfUnH1w+QmF4y
         1tzCzrqrm8Ecim8HRlWYtpy1Cj9eIqwhBWyVKNPayY0rEVg1r7v1XHTfF8pxcqn8J/+d
         qeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419230; x=1796024030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCLV3XBRX2wh16raJXcCmA/lhiX2jHGFoT2tZZcD4OY=;
        b=Xt89I3jTqTmoBcTsYGfG/v8LFCR7kg1qSjUhkhCEDV3gOmUK7dujGGlvmQKjWPY10y
         +Hqc5pZoXxKEP86VunYJa3/tiso8gMfKxmLXQy74qK87bdxwd6NbM00u+6GPNJYYzns8
         qXiCoC/3ZPdeNOzU+kxCc2ILoswQJIq7+DHYOssTX03eFOn/K7bYMr5kKpAM7+D/ycJ+
         yMsOTraHr3qsvBQ9uJussjfOnk1jt29m6PCZlHNR2EjYBmcAyiWZGsRUkOvvrgUtg7zC
         L735anlFrXEvbVzNJPvoxUc0+d+T5+XOWrdFe30ZXDSC70xO3sqRCbmgtS/c8UxK+0ON
         R4KA==
X-Forwarded-Encrypted: i=1; AL+hErHaH8fGyOsK+FzvX6vVcAP8mPFWZvH2j8+Qp4KnEXH7dPA8QQao0F2YfIkTwUc1p7E+7mgMrz1InxO8m9DF@lists.linux.dev
X-Gm-Message-State: APuU4Z8c4iZDSgzMXulEcYihH6cStQERhkmRzBPlHkWr7oH7TMzca0Rc
	5zhFzuAhAKgJwH2oDBLNCImxBr3GhPU+xA29Ok24XHk6MmxJA/8xlEE6
X-Gm-Gg: AZFdTZeELM917TgSfqPoW0pCEjqDdD5boaa1yBMQ+hTcpn13VSw9NExknOLl9Eye9Kx
	3YtzG4prpKy+cTjr6er4ubfWYtxf9s3HYjnFhDhDUpK33mwGjMC5HbGKpJAv1+IEKyq1iCEw7MI
	1SgyT6OKVGV6YQrDagYBNBegQ8ZAa3ZCvXt4gWSYaQpON6ZVq2bt4CV94wB6fkRiqSjeVzuytPn
	rXcpL+Tdgwm+pj+NbmC9CfguAp+jwIHW1o5/KPX+TdagruL/zdKOagpoJNBmgmPrfudLzEdnUdA
	1l5WYPmjC5OqtcP8Ga0SAitQmBaWZAFcZ0GOGA2TLP7C4b6I1RSQp3vi9xiUUXTCvgPXMdsEYLr
	arOlDyUdxUCTstQLcTfR09EAegrUw9Qeb8JF9E6A1/BiJ4avoxGc4aKeVW3X/wtQbRmWLtaZRwQ
	8BHVpg2/vFmEnPZfjjlgcSyA+oMwa96yRHpSjFT0q6MkAX+CpqC9kLPI14KXwAI2VacyJl72Ik4
	NkQGAX8nj4Wt+A/aWqKaFWgf9WREqDc0TCs9WBahlyRM6v87AiLmntsm0p/rfcZcQvcVQykOZsa
	oo1izWWz8yVrtZcqidI92wIkYkS6iCov5WIflafIsgd9Pfx3D1CpVte6rQq/1gIT3WAkfr4JGuO
	1iJi0X+OEu/fVNadtHM3BIa6a6UpdpQW5ORkbPn4N85LT3Yblw4T5DLIUg970PMm5lss=
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr259331755e9.12.1795419229774;
        Sun, 22 Nov 2026 23:33:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm311285775e9.10.2026.11.22.23.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:33:48 -0800 (PST)
Date: Mon, 23 Nov 2026 10:33:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Use str_has_prefix instead of strncmp()
Message-ID: <awPsWXOo2MxJcX-g@stanley.mountain>
References: <20261121133843.127718-1-vaibhav.chahar26@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121133843.127718-1-vaibhav.chahar26@gmail.com>

On Sat, Nov 21, 2026 at 07:08:43PM +0530, Vaibhav Chahar wrote:
> Using str_has_prefix() is cleaner and more readable than using
> strncmp() with strlen(). Also avoiding the possibility of errors due to
> mismatched string lengths.
> 
> Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
> ---

Ah.  The str_has_prefix() has been there for 8 years and I'm only
learning about it now.  I like it!  Much more intentional than
strncmp().

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


