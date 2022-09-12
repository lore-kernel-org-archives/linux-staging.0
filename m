Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813D11C29
	for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 19:01:58 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id go34so22417388ejc.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 12:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QL2G+Z3yBqHl6Q9wDdG1B1IyQZxcQ2fd6sZYS00IKk8=;
        b=KaDcDv2IbsCh9YwvPaaVG2U/f2fp5o46Sqr+Q/9I765Q4UsVSbkx+NgVnIyMCfA5r8
         GM7n/rFotCqjc02mww8Aa8SImJcEARjkDvIOA/DdFfAoqeQ1zjiZp7vX2J6XJyanJrf8
         Wxpz18fue/J+0g1Q8ur+rQF78OnrSVaZeu/KcvJcGeal02KLbzFZeb22NA9kTih1GJ6m
         qzxGzjYHINkQFywYI57mUNWEJRghsmq8qOHtCxW3rsBATM1NyMn7J0vrZfSx/mXWeHB8
         XZw7XibiMrrJpofw7+leylJreHtaj1hWgsCuoLJRxFbXw5coGiuXcbCZGiXo0ISKyI5r
         nuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QL2G+Z3yBqHl6Q9wDdG1B1IyQZxcQ2fd6sZYS00IKk8=;
        b=oLZzEN06xVORaBZewg8bxBcNs1urLP6Kdp7F09HYzmQjZ9LneLedPcJ5q5nHCAkpC5
         YehFcOzLns0pOJcmF8sHf8fKnfxV0bgD+gHDj1vem1q2AA7yBfJOZivHOFoUmiREV/Pe
         NN8r53K3lVkOkLt0OHnLO/q7b/v0B9cPTXR1AkzVtJ21CkMKrTqBrRiUU8RllfDf9/XA
         DK+GzAerDteloJz9QrAYlnitF87aT8ElA+5MYKPtgKUzcCoktuCxhY8Ve2Iu5sDqJdPg
         pgxEDC8mbkPTtE761Q+aYhBYMmaTbHXeR9hZGx+AxKY3FHE75i4lKE/gkmyOi5MboCbs
         S7nw==
X-Gm-Message-State: ACgBeo2N6UrW8/AdTupOcHZHMD06Bv157lIinSQfekHVcYHySIylVyZU
	rQvm/Dn85YLAYn2k+OvlAyw=
X-Google-Smtp-Source: AA6agR503aOnMXLayIX0kaimdhtgCuqRgd3iWelN2bHrjINufBj8J+VIwrRT/SFXmt7/J2NhwxrVhQ==
X-Received: by 2002:a17:907:c23:b0:779:237a:4218 with SMTP id ga35-20020a1709070c2300b00779237a4218mr13716539ejc.277.1663009316669;
        Mon, 12 Sep 2022 12:01:56 -0700 (PDT)
Received: from [192.168.1.101] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id l18-20020a170907915200b00722e50dab2csm4843880ejs.109.2022.09.12.12.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 12:01:55 -0700 (PDT)
Message-ID: <2b11e266-2266-b0da-3fb1-3df26236e012@gmail.com>
Date: Mon, 12 Sep 2022 21:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: vt6655: fix some erroneous memory clean-up loops
Content-Language: en-US
To: Nam Cao <namcaov@gmail.com>, forest@alittletooquiet.net,
 gregkh@linuxfoundation.org
Cc: ji_hun.kim@samsung.com, dan.carpenter@oracle.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220912170429.29852-1-namcaov@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220912170429.29852-1-namcaov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/22 19:04, Nam Cao wrote:
> In some initialization functions of this driver, memory is allocated with
> 'i' acting as an index variable and increasing from 0. The commit in
> "Fixes" introduces some clean-up codes in case of allocation failure,
> which free memory in reverse order with 'i' decreasing to 0. However,
> there are some problems:
>    - The case i=0 is left out. Thus memory is leaked.
>    - In case memory allocation fails right from the start, the memory
>      freeing loops will start with i=-1 and invalid memory locations will
>      be accessed.
> 
> One of these loops has been fixed in commit c8ff91535880 ("staging:
> vt6655: fix potential memory leak"). Fix the remaining erroneous loops.
> 
> Link: https://lore.kernel.org/linux-staging/Yx9H1zSpxmNqx6Xc@kadam/
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 5341ee0adb17 ("staging: vt6655: check for memory allocation failures")
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>   drivers/staging/vt6655/device_main.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index 04d737012cef..56c3cf3ba53d 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -631,7 +631,7 @@ static int device_init_rd0_ring(struct vnt_private *priv)
>   	kfree(desc->rd_info);
>   
>   err_free_desc:
> -	while (--i) {
> +	while (i--) {
>   		desc = &priv->aRD0Ring[i];
>   		device_free_rx_buf(priv, desc);
>   		kfree(desc->rd_info);
> @@ -677,7 +677,7 @@ static int device_init_rd1_ring(struct vnt_private *priv)
>   	kfree(desc->rd_info);
>   
>   err_free_desc:
> -	while (--i) {
> +	while (i--) {
>   		desc = &priv->aRD1Ring[i];
>   		device_free_rx_buf(priv, desc);
>   		kfree(desc->rd_info);
> @@ -782,7 +782,7 @@ static int device_init_td1_ring(struct vnt_private *priv)
>   	return 0;
>   
>   err_free_desc:
> -	while (--i) {
> +	while (i--) {
>   		desc = &priv->apTD1Rings[i];
>   		kfree(desc->td_info);
>   	}

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
