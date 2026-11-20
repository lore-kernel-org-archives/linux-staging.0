Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203614;
	b=sIgdzqIjSg3xTf1ww5NssmaePWzHmJhRPczoRETPugo5+7NI9Lb+6i9ilRoSHp8oRDOf
	 +F0jBzPPGAxK8Ncl7sStub4tXL+LlMrxuni6NvkgyJRnI/GMCWcvdX2Oj4i6RL+rxmi6U
	 flF1nirJkCkGrxVIUvkra/t8ifR8P7rV/k42WlFjDUPv47H19UXuTZOfXEXBgif2ZBqhB
	 URQgPjNads/vqsMdRAfNtuFWoyDPJC57O16HiKmmx5BFNqMBZiSP5xrJQ6b4Cy+n5z11Y
	 ZX1QBtgWWkYclUvDtyrrUX2j35CWx9XX5vbm+VJP0m9aTMJBaNhWatiNUV6LSUJbRHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
	b=q6BrwAR2h3nt05zHWoRRygNsHfRyWvP/e/jV5UkhP96nAGNNJ28rznxPtuqAUkuBCs4z
	 lechERMhxJJqRCEWqIQ/QO3Z82gYz7a/Qb6pZTUCiBlvAh8i1a4Gqq+LbrS0QKwBkDotI
	 bAW/hH9nkAtBHTeXAShOCdev38qCe1x+lZgy4b5z6WaNuaNe+156yDnspxORelntp5ttB
	 crU7DmUDvWG3Bgup4EbgHS4hGA0bh5ghPLlncGsZVojNQN/IH9zKDg9oI2ZYdtbEhaI/q
	 YpulP6tm5yUjv0Hi1Ei++TCXrvNhmpSChcMwD17GF2Wpjoz9HiooKkPjv6TdEheje/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUP6JrrA;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39607606A6FF
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 19:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39607606A6FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUP6JrrA
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2db6408cfso785246137.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 11:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203611; x=1795808411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=gUP6JrrAPdQdCx52cjkPgEj+tbStKjI5JEUwr44On9eUDDmsO11MSjVq6djCHMUP7a
         6t4RSbbMJS7uyo8w2TbYfkf1b/+DrGl+h3N+AzPcQIw8GLPsoVG8l1A79WZiRWFCGCuD
         x/WruntcyK4Ymlt40hHqbDInToNdQBiyTvfI8ee4p/7RiC+0mklcIo4JHWfaTE0j3JgG
         Q6TbK4LQTLzgfrlPdiGKhFa5L9UL3mqGL1ZMBWzcQx6hWewUfNZgdAf3+mKOU2g4lEyb
         QzRGMqcjUduGmYdLsBT0hWYEq98QkQMdOMozZBMQM/aBOhxDnRpWyekC0FKUFpZsyqKR
         geBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203611; x=1795808411;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=1ZeixW3CfZeP0mP+0y+hvVcdPMNFt32hwoFLt85tVcl8thXxZvmOIM0lAFEHwOIS4r
         Qfq9HdRO4fM6gk8Ap0bNn8uPBZD9D4nUWDoJ8Nf2vvm47+DzUPjBO62RJozeBa1SkQub
         z2YwU3H7HpATAeC5jhg+g3uDx+OclLiIiic16gutAdQ8Zop52yAlKJ4ylTV1jFolG/21
         iqUA7eTDbdqng+o7le6kNwfjVC0QpnYhlVM/6m5gydt1LhKhwoRhXK9HJMoDLBPbEu0T
         YCMbjkjxLyKozJKvHuoVpwIgYAgRxcymGGDPibGPl19uoG4DcdiExhBw6jGMaR0jc1GU
         jP/g==
X-Forwarded-Encrypted: i=1; AL+hErHzQ302HLNGdeMadVcDb6z3UHFXf7WvN3ZCDjlvU4wIBgvRyKOGUa2qcsC+Ze2tnV/ccfPQCVERTV9wMu/1@lists.linux.dev
X-Gm-Message-State: APuU4Z8ub9nFGdZqWXL1oloChwsp6/Cu31a3fNHv4vECvBaBP9QUggH7
	0nm1vkFdWGBhM/azEnbOtlTEi3kHpcupDF3gjchmvCC03S4yooG0Worq
X-Gm-Gg: AZFdTZf6kQL0Bh6Ex1CN1LkyjyzW0tE3CDDyjOe0C8tO41i7VnX8PjXrySMu9xn3Uiv
	Mnwj4sCLXY1YL6/zCtfs4l8/lOwCDjcYh97dsZaMrh6uQmrYS1hA9LAjxVIZHnyG053+qsZ4ljM
	mJ9BTlg/2ttR92t3nsrUr5s0n+/yZeavfI6+HK0pbTxptZrn4BdzZ2hJxkiW5csx3iNIMqCwQcP
	IQtGYfSMP5+LwlIZ+P3/KLGD8lRm6UcSvRDfAPTulSXhV9h6BedZVEkORpYGhV2Y4oi2iwYO2pF
	uTKb/NPsjuU0fNFRghot2EHBwenWtjc9GD4LhQ8Pdv1LajxnpuAdg9I9ikVmLGZsuWid2in3Wia
	tBo7YrAgP26RLZi1wozT6OV9K0QXwrv6wvGHTbZYtfWylm98IE7hwQZF2+NRkliNIvw9wIj8vUU
	Vp0wEJOOgd8aWOoTckdYhjLXVcSI/YLu59kDOu0r1YrI8m5vglWHp0ZjP5chJFr3YYCrlbrjZAp
	0TsB8+3iLjuOmJUgdOXO/9Kg8sR+z5ySTjP4onCXUOA3gUe22szcismfuZdEKyF3ee6H+hfeCyt
	RLAtkkUfI+efxvfk7dv6f8Kna0XuI46YeM4+9EnZQSXsomWeQdQeD3CPcK2LMSw73gaiDZ1GWU6
	sF6wVfoMgLjvkB5CPGROE/b2qkVWDtGe+HjnW
X-Received: by 2002:a05:6102:5091:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d7393ff1eemr1985327137.7.1795203611220;
        Fri, 20 Nov 2026 11:40:11 -0800 (PST)
Received: from ?IPV6:2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28? ([2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a29csm3845871241.5.2026.11.20.11.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:40:10 -0800 (PST)
Message-ID: <a848c700-f1b4-4975-8c80-27b8c81160ec@gmail.com>
Date: Fri, 20 Nov 2026 16:40:04 -0300
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
Subject: Re: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and
 drop redundant OOM messages
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Language: en-US
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/26 19:48, Rodrigo Gobbi wrote:
> Several allocations in the atomisp driver still size their buffers with
> open-coded multiplication, e.g. width * height * sizeof(*p). When the
> dimensions are large the product can silently wrap, causing kvmalloc()
> to allocate an undersized buffer.
> 
> Convert the remaining sites to kvmalloc_objs() with array_size(), which
> saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
> allocating too few bytes.
> 
> This continues the work started in commit [2], and picks up the stalled
> sites from [1], unifying with [3].
> 
> While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
> the touched allocation paths: the memory management core already emits a
> far more detailed warning on allocation failure as raised at [1].
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> [2] d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")
> [3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> ---
> Changelog:
> v4: 0002: use the full commit reference form for d178c7ca8fef (Media CI checkpatch); collect Andy's Reviewed-by;
> v3: https://lore.kernel.org/all/20260623221028.40238-1-rodrigo.gobbi.7@gmail.com/#t
> v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
> v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> 
> 
> Feng Ning (1):
>   staging: media: atomisp: use kvmalloc_objs() for overflow-safe
>     allocation
> 
> Rodrigo Gobbi (2):
>   staging: media: atomisp: use kvmalloc_objs() in make_histogram()
>   staging: media: atomisp: drop redundant out-of-memory messages
> 
>  .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
>  .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
>  .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
>  3 files changed, 41 insertions(+), 76 deletions(-)
> 

Hi all,

Gentle ping on this series. If there is anything else needed from my side,
please let me know.

Thanks,
Rodrigo.
