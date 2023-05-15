Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12350539C
	for <linux-staging@lists.linux.dev>; Mon, 15 May 2023 06:44:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so64283975e9.3
        for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684133046; x=1686725046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mINZbq2wMQRhpwFl+Y59OPBXfOB4g1POM+virNwffyI=;
        b=zXstS5FJk3Y6WhtfGZna+TX3lPy37HQZUSK7ZyQ5+Dkso6lAY9z9tfFBb3Kc6GUlqV
         KubQ9hhk7rDy9Xjjq0UURvLgUhAiD+uEMONYkPMEoY468E5QJHSfJ2g2c/ouR4okf8VA
         LPd0jMbC+pLmOS5qQ6YhZiZfDWFfszfi2ev3S74W3GXyU/hB7VKmu+erCew2zOqg3Fv9
         Q9ysLgZa2VXIPDdcAXf04cvGfSAgdT23UPyp4Kl3lUrBBGco+g1jFMC2zL7e1cy0rGKD
         Z9+b8+6G+tpa5kWa7N/+6mGMCLKtoL5BQ1fOu+9uhtmvHF76ANxv7iGcJzR7Jnikheem
         IDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684133046; x=1686725046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mINZbq2wMQRhpwFl+Y59OPBXfOB4g1POM+virNwffyI=;
        b=HWf3XlFa7qZ1yVuGZm93uuwYyT50/ovGXv+O9+dVWS9B+9RHD9cfMk5YCI0U4vIWaK
         Pk81R0QsHschMXPF4tYVX/jyv2u+WLcV021I2xbKF5zYWE43dHB+gzQPSu/ye5YpPoJa
         6aiiNzuFlOMxHp+XfKTXpUpuK90U0g9erHU7lAFBjf8aFgt5MOE7i/SP9hUxEYwFGu6M
         /5qyJJlxhXQqxQ3C2m/N5btyThjsd9neDYOH6VIMqzA3Lr+APFMhHvdGHuFx6CJ9dJVM
         qYUkC2wy+o5HRKy30s7t76HYujc7BTnhITP8ghtBkFcQDYOCamgsToLXmRw5nUx+ElJ/
         99YA==
X-Gm-Message-State: AC+VfDyodCKbdPnu3YX/2BxqYufuSS1RwTNFx84XpSiVBrFv+b8FD3Ef
	x5M5yMCOMQW/fAGCsaNikpQR0w==
X-Google-Smtp-Source: ACHHUZ5QpvRjC+7tACbyjNlhLvZ7v/GvXWKRLRirZNp7JRIWNwTwe7UKRj7ZDI5u9mb86MQc52txUw==
X-Received: by 2002:a05:600c:2210:b0:3f4:2174:b285 with SMTP id z16-20020a05600c221000b003f42174b285mr18145388wml.9.1684133046331;
        Sun, 14 May 2023 23:44:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c3-20020a7bc843000000b003f42314832fsm24028570wml.18.2023.05.14.23.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 23:44:05 -0700 (PDT)
Date: Mon, 15 May 2023 09:43:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rts5208: rtsx: fixed unbalanced braces around
 else statement
Message-ID: <fd255e48-e1e0-43ff-b9af-cd1b188875a4@kili.mountain>
References: <20230514064936.7895-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230514064936.7895-1-kartikey406@gmail.com>

On Sun, May 14, 2023 at 12:19:36PM +0530, Deepanshu Kartikey wrote:
> Fixed unbalanced braces around else statement
> 
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/staging/rts5208/rtsx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
> index 2284a96abcff..0ab9355873f7 100644
> --- a/drivers/staging/rts5208/rtsx.c
> +++ b/drivers/staging/rts5208/rtsx.c
> @@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
>  				chip->srb->device->id,
>  				(u8)chip->srb->device->lun);
>  			chip->srb->result = DID_BAD_TARGET << 16;
> -		}
> -
> -		/* we've got a command, let's do it! */
> -		else {
> +		} else {
> +			//we've got a command, let's do it!

This is v2 of a patch.  Here is my guide how to send a v2 patch.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

