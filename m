Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB84154A9
	for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 16:56:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3078cc99232so4488891f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683737797; x=1686329797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Gc42bzaewvbzuVY4XS1BAUy3IQI/qYsbZWzsf3GfP0=;
        b=cVqT1ib9QJ9/kzKSOTrNRKUbrjFXsGdqeYhc+sl3GIaaiQoSSiWjaiKpzzyY7nVDul
         b7EiokHUG3Gt+0er8OBdwhd9EfIySBdyvkXcbFe07PpYc17OSHvGFkksgsmZpa8sdxre
         jNADZnOp0yzjwZqfnJrO9mWcPtNlUdF51ebwYeeury3NNZqR8Zp87b8Y9ixIJMPq2TJN
         0xdVoNAvjTK59i8wYlIDb2FZoKUII5pTdx5egOrA4n4SQ4I/EcTP189nw1o3FYYGkbwj
         eaHvBihLqCUKVZBGXFPokDC8Hvrm91tXUoANiG7GRwYINzuFxC0KjDzZ2X063f4rwrjx
         oEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683737797; x=1686329797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Gc42bzaewvbzuVY4XS1BAUy3IQI/qYsbZWzsf3GfP0=;
        b=i7R0nw1nGnQbEdxgzmULCUywRBucgEXZeZrOcNTl4eXdDHnwqJHMppNx4Nt9cDgXZo
         IIbXcCXQ2EK4XR0sYaA2JFF1/rhVjzQ6OD6wrsJwJL5pgkWbaUkFExygFTn8/+nhHlY7
         M6erZOULQ8zwRLEysI15uzGy5AiWy6mx7bxvL//tFz9Ffe/QbbbDrST7FFxvWCCQzExX
         wtTBqcFc7HRpLH/2TB2y16AtgTFUOgPjQ4/jJfcw08TyEjhZNkNJ8bR+vydQRuCGinGf
         7Z3CBz7kQHl0w8LD+hwplkQ+Gi2DOO+1cF6is9Koq3DXO7anUIvkTWNvw03m9z2atwDU
         LFYQ==
X-Gm-Message-State: AC+VfDz9a1O12BVlPmFMKBANhPukXFt1gEdRxfSTedUCfYrACbtqbSJR
	7p0WwslKAElwHILD5OSqIdhvcQ==
X-Google-Smtp-Source: ACHHUZ6qVCedZJaUlxkTnZAmvQ1PaaZpHadEIgUXazjoLAIMDpp9IpqCHyYK3Ho/Q75x73mF1RUMGA==
X-Received: by 2002:adf:ecc4:0:b0:306:2c5b:9da6 with SMTP id s4-20020adfecc4000000b003062c5b9da6mr13711866wro.56.1683737797002;
        Wed, 10 May 2023 09:56:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d62c2000000b003062c609115sm17818387wrv.21.2023.05.10.09.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 09:56:35 -0700 (PDT)
Date: Wed, 10 May 2023 19:56:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8192e: Rename tmpRegA and TempCCk
Message-ID: <290473de-5946-49d4-9309-6bebf7cc9873@kili.mountain>
References: <cover.1683730854.git.yogi.kernel@gmail.com>
 <c9c67f832db3a776c04f26e0afb083ae3ba99c07.1683730854.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9c67f832db3a776c04f26e0afb083ae3ba99c07.1683730854.git.yogi.kernel@gmail.com>

On Wed, May 10, 2023 at 08:39:07PM +0530, Yogesh Hegde wrote:
> @@ -680,17 +680,17 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
>  		return;
>  	}
>  
> -	tmpRegA = rtl92e_get_rf_reg(dev, RF90_PATH_A, 0x12, 0x078);
> -	if (tmpRegA < 3 || tmpRegA > 13)
> +	tmp_reg = rtl92e_get_rf_reg(dev, RF90_PATH_A, 0x12, 0x078);
> +	if (tmp_reg < 3 || tmp_reg > 13)
>  		return;
> -	if (tmpRegA >= 12)
> -		tmpRegA = 12;
> +	if (tmp_reg >= 12)
> +		tmp_reg = 12;

Not related to your patch (which is fine) but this if statement can be
deleted.

>  	priv->thermal_meter[0] = ThermalMeterVal;
>  	priv->thermal_meter[1] = ThermalMeterVal;
>  
> -	if (priv->thermal_meter[0] >= (u8)tmpRegA) {
> +	if (priv->thermal_meter[0] >= (u8)tmp_reg) {

And casting tmp_reg to u8 is nonsense so that casting can be deleted too.
2 separate patches:
patch 1: delete unecessary if statement
patch 2: delete unecessary casting

regards,
dan carpenter

