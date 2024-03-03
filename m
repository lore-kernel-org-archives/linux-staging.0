Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167541EB37
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709494828; cv=none; b=PlI9A5vMDDUeGirL9R/8gmXu8OqFh0WY19M/YjtIqHdd5DYez1ejhg+zNl7zMhTb4PfvKtQCs/6QIUCUCLxORhUJMyZQKS2/7S18xxnWokttKCH4AwNX8WqFFKxpbSAXU/L4xJte1Xs3ufT7dpBS8X6+vpO7lYee9wjcmSdynlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709494828; c=relaxed/simple;
	bh=ZKOuv1Wsxa/uaXjRzbiLRsgxr4LXN6Gqa0hwAMCyAQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HW2TstSrHzOPU/KTKdyG45+1eubi16+gzfjMgJ934E0gBfFpXqbksNxdrWunZtG5/Z47XZ3v+pPQLZ3jZYiC9oX2fh5VXayeMZrDeAtl3/f9VUqC3i+LKug+nJLjjz/CCNa4EfoKiiYlJsxpyDkD6N+g0WeKdQ4X60MazejSqZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h704wwwi; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h704wwwi"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d2c8c1b76cso9927271fa.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 11:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709494825; x=1710099625; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKWThlVYkj3p7y+c1tkcfbD2BQWtxX85QtN+ZgyrvsU=;
        b=h704wwwi6Sn6NdUvID0RPyS/M9RsrNvnihIigfSzvGRBiiwYfw4+R9EG/c75Le/dNB
         dMpc4SK+FhZSYH7aRMG93v0W3R48kGYgMc+3HwAAMfSRq/9zEMXCJpqMLnIdhEGDn7lP
         NLAnWXDyGyVfWz3bbBkyRD3ZrFVF7aGDNYkpVpIPBnEJdz1MayZTjnqdgwhwg+rnvwMm
         v4Dqm80wG4iKlNu/fAVvw48bcPw9MVp7b7VLHBy3surpfxgtsCwSMgDGD4H1MWEAqCpL
         1KLRWWhTEBIvCjo3byXPdDhbLQ7XMv2got4eF9DupF54tzo/PYbAHLepiVtU+FIU03W3
         SpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709494825; x=1710099625;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKWThlVYkj3p7y+c1tkcfbD2BQWtxX85QtN+ZgyrvsU=;
        b=WfNHRk0hGRNeIiEsS/0hR+pNIj+EkijNxW9Em6x+4Vj9vr3nVbCH47XlMcFCuUDgml
         l7tYNidizpXOqM0Uu25fxEjm3puEifVI6vPOeQP5azjAvX6mt4XXTjZuofKsXM1zt3q5
         PvrPIvw+RkX4x/GLyqgXo0LR/iHnlyTw0sMQg2yf8mkVgwpDIt8EAU7ltFfbS2aAN2vs
         goQzpjMt3/1wHlTDGE49pyVFnJblBkfp8qcTfH0CGPpzubx4QQisq77/w1b26tNCpiV+
         RGhkNPdIZ1FjN6IpBoQxd+bm19gqsHlgnnwXpp6F/6jR0BC15BEjoZuWbDwVPrnv5BJ9
         TtMw==
X-Forwarded-Encrypted: i=1; AJvYcCVc8sRDa347nlDyO0EaRnXwiGxwKD0+jrQutbpr7D31V70aNpMTgoubg2YSHbiRDW2OivfgeX2vsdazWB1O56Clrs40C9aqq8WRoFE/Zg==
X-Gm-Message-State: AOJu0Yzi8faavtZweSf2vv+aB8P7ElxkbL6OXU80B3AQP159uVrwRpsj
	L/zRV+xEUX8mpU/01JMiOpBxB6ZUB//nM6m19cA6m04pSmQs/GIURjCebhsXg6c=
X-Google-Smtp-Source: AGHT+IGNpwVz2yvdoN679O9Bv6XmHepi0wi6BipHsSdpD3rq/0YZLvJa4N+MWxq7GiZien9c87B08Q==
X-Received: by 2002:a05:6512:31d2:b0:513:46b4:4ead with SMTP id j18-20020a05651231d200b0051346b44eadmr655083lfe.3.1709494824946;
        Sun, 03 Mar 2024 11:40:24 -0800 (PST)
Received: from [192.168.0.101] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id os26-20020a170906af7a00b00a450b817705sm1104339ejb.154.2024.03.03.11.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 11:40:24 -0800 (PST)
Message-ID: <e96bee24-dedd-47e3-aafa-82e176ff8aab@gmail.com>
Date: Sun, 3 Mar 2024 20:40:24 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vt6655: Match parenthesis alignment
Content-Language: en-US
To: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 forest@alittletooquiet.net, linux-staging@lists.linux.dev
References: <20240303075936.16296-1-dorine.a.tipo@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240303075936.16296-1-dorine.a.tipo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/24 08:59, Dorine Tipo wrote:
> Correct parameter alignment in bool card_set_beacon_period().
> 
> This patch aligns the beacon_interval parameter with the opening parenthesis.
> This change improves code readability and maintains consistency with coding
> style guidelines.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>   drivers/staging/vt6655/card.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index 94784b5c0402..3f807d898607 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
>    * Return Value: true if succeed; otherwise false
>    */
>   bool card_set_beacon_period(struct vnt_private *priv,
> -			  unsigned short beacon_interval)
> +			    unsigned short beacon_interval)
>   {
>   	u64 next_tbtt;
>   

Hi Dorine,

in addition: Please include a version history on the next series. It 
needs to have a v2 in the subject. Fix the following checkpatch warning 
as well. Did you run checkpatch on your patches?

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)
#9:
This patch aligns the beacon_interval parameter with the opening 
parenthesis.

Thanks for your support.

Bye Philipp
