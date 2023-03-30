Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404F79C6;
	Thu, 30 Mar 2023 15:27:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v1so19508597wrv.1;
        Thu, 30 Mar 2023 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680190078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=joCip0hgL7xwcz+Q/IuuPNmM7IZjW2wMJ1D/KD8FBM0=;
        b=XG5T7gYrQqnnoZ6a7ie67subhNP3NBDLbOnqq4gAt3xMuOrUggu3eNyGIoS0+k++7D
         KUL990rertiK5NROjffUp6UE9h9/5APy1PxLijrtQp7B0ZCWleyRJLnxOMD7DO6fDAsg
         VZGeEOonocrBNs5OH61vuOgfjVk1O9f2oZN+uo1AI/UEMSY9s0snZrblN22Wix5Js4no
         ymCU3lWDdBC9X1iu2ttDjyYxH310+8rE5KuZ5ifSDrLhhJmG5hXSeucFNR3Ncaqw7Dvo
         hhscCDzX03MQBZa2zPBtNE5ud+WJgEiLOVBG3sOblP4gAyzCuJfgOT8gHZmhDJBWIkyH
         hzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680190078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joCip0hgL7xwcz+Q/IuuPNmM7IZjW2wMJ1D/KD8FBM0=;
        b=WMXVo+J/MNauqNJEIWo3cfOAzQH+dc6ijClzXueYrbFltATMz+pxPreqYkAeQGuWTr
         bdolffO5oyf+aQkC6ls3TF4CSz1NjAokzqo5Mo96eNwIU5pLinbDvLTO35plasun0fNn
         l8Om92pYfP1R4ALyXV7GesImLhFGebsNmiArpW3e1fRe5lW+vhMJd7FXvjq+bPIWppjQ
         wKSGVeE1MbgSBM062PtkEmiPvsAh3hfdSf8+XhmCoNxo3pQPspKSPMP/uS7M2s4NrI51
         ry8YBSv0e46rPguxrpYjwce2rS4fQxrm57uoNW7nNMu+o8FLVQmo3Sl7Zmnir11usOHj
         HoWQ==
X-Gm-Message-State: AAQBX9ePpCd9tKEQ1lFLpdvUBLusk05TmmHT5OhD1NDZDG5izA4hsjEf
	W0iP2KvXE0uVqAsZkcy2KkQ=
X-Google-Smtp-Source: AKy350ZaFyyyVCzmsQ+2q2PRy65fh3V8kfaKnSsDy0pCnxxiCi+rX7kC+5asDy/aNlXMF1OrZTGtcg==
X-Received: by 2002:a05:6000:c:b0:2c7:ae57:5acc with SMTP id h12-20020a056000000c00b002c7ae575accmr18052849wrx.26.1680190077878;
        Thu, 30 Mar 2023 08:27:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b003ebff290a52sm6566254wmb.28.2023.03.30.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:27:57 -0700 (PDT)
Date: Thu, 30 Mar 2023 18:23:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
Message-ID: <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>

On Thu, Mar 30, 2023 at 07:11:25PM +0500, Khadija Kamran wrote:
> Linux kernel coding-style suggests to fix your program if it needs more
> than 3 levels of indentation. Due to indentation, line length also
> exceeds 100 columns, resulting in issues reported by checkpatch.
> 
> Refactor the arche_platform_wd_irq() function and reduce the indentation
> with the help of goto statement.
> 
> Suggested-by: Alison Schofield <alison.schofield@intel.com>
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
>  1 file changed, 41 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index a64c1af091b0..dde30c8da1a1 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  
>  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
>  
> -	if (gpiod_get_value(arche_pdata->wake_detect)) {
> -		/* wake/detect rising */
> +	if (!gpiod_get_value(arche_pdata->wake_detect))
> +		goto falling;
>  
> +	/* wake/detect rising */
> +
> +	/*
> +	 * If wake/detect line goes high after low, within less than
> +	 * 30msec, then standby boot sequence is initiated, which is not
> +	 * supported/implemented as of now. So ignore it.
> +	 */
> +	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> +		goto out;

This checks that we are in WD_STATE_BOOT_INIT state.

> +
> +	if (time_before(jiffies,
> +			arche_pdata->wake_detect_start +
> +			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> +		arche_platform_set_wake_detect_state(arche_pdata,
> +						     WD_STATE_IDLE);
> +		got out;
> +	}
> +
> +	/* Check we are not in middle of irq thread already */
> +	if (arche_pdata->wake_detect_state !=
> +			WD_STATE_COLDBOOT_START) {

This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
we going to be in COLDBOOT if we are in INIT?  Is this changing in the
background?  Can this check be removed?  This might be took tricky to
answer but it's important that we understand this before we continue.


> +		arche_platform_set_wake_detect_state(arche_pdata,
> +						     WD_STATE_COLDBOOT_TRIG);
> +		rc = IRQ_WAKE_THREAD;
> +		goto out;
> +	}

Let's assume the above check cannot be removed.

In the original code if gpiod_get_value(arche_pdata->wake_detect)
returned true and arche_pdata->wake_detect_state == WD_STATE_IDLE then
it just returned without doing anything, but now we fall through to the
falling: label below.

So this patch seems like it introduces a bug, but actually it might just
have a dead code problem.

regards,
dan carpenter

> +
> +falling:
> +	/* wake/detect falling */
> +	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> +		arche_pdata->wake_detect_start = jiffies;
>  		/*
> -		 * If wake/detect line goes high after low, within less than
> -		 * 30msec, then standby boot sequence is initiated, which is not
> -		 * supported/implemented as of now. So ignore it.
> +		 * In the beginning, when wake/detect goes low
> +		 * (first time), we assume it is meant for coldboot
> +		 * and set the flag. If wake/detect line stays low
> +		 * beyond 30msec, then it is coldboot else fallback
> +		 * to standby boot.
>  		 */
> -		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
> -			if (time_before(jiffies,
> -					arche_pdata->wake_detect_start +
> -					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> -				arche_platform_set_wake_detect_state(arche_pdata,
> -								     WD_STATE_IDLE);
> -			} else {
> -				/*
> -				 * Check we are not in middle of irq thread
> -				 * already
> -				 */
> -				if (arche_pdata->wake_detect_state !=
> -						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> -					rc = IRQ_WAKE_THREAD;
> -				}
> -			}
> -		}
> -	} else {
> -		/* wake/detect falling */
> -		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> -			arche_pdata->wake_detect_start = jiffies;
> -			/*
> -			 * In the beginning, when wake/detect goes low
> -			 * (first time), we assume it is meant for coldboot
> -			 * and set the flag. If wake/detect line stays low
> -			 * beyond 30msec, then it is coldboot else fallback
> -			 * to standby boot.
> -			 */
> -			arche_platform_set_wake_detect_state(arche_pdata,
> -							     WD_STATE_BOOT_INIT);
> -		}
> +		arche_platform_set_wake_detect_state(arche_pdata,
> +						     WD_STATE_BOOT_INIT);
>  	}
>  
> +out:
>  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
>  
>  	return rc;
> -- 
> 2.34.1
> 
