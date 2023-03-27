Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BAA33D0
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 20:34:22 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id j6so5277784ilr.7
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1679949261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaePAyDz2w86nDPVu8ko8gEeQEmQvefWooibL8cU7/M=;
        b=cBRSQ0NboIQu833svXwTdI1bXDAJHNRXztPlTf5B0zEaUumceNVjYyU/POtvqU7tNM
         WOh6QqDucfo/0SPZueviKzYA2a3oh8OI16MbGkKEWehM8OFZOEkcAWRBoTNF2s4/hGtk
         7xBpImWCWB/BQrKtV1egRT5K40J1dKhpVtEmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679949261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaePAyDz2w86nDPVu8ko8gEeQEmQvefWooibL8cU7/M=;
        b=vZNZL0Bme5+26kBFDpXEg/3DYGiM+AUNZGzl7sHle8BmImeACAkm0dR1jhSTdScz9e
         80lbM2si4K21ceE5V5HmhHgCuwsQZT4/71maqt/6SoWHFd2s8kiljAeZjOPEfZJ5LhJm
         lHDHKEc2UkiQGrFm336BrBQJ4k4DrrilISyKThpgP3C7pSpf6BFkDnnhZjlP+PzJNgV9
         Z9XgxjEa66Drg3KvoIiv89asA/pdzQRIcaMnziAder1fcqpHh0D6eh9SVuzwk9FBEvxT
         g5emGNh+XBdkpXO0YxLrHn4BGB+Ah4GMu0yTjuGxR6ouec14NSaGYfH36ix2WwPsomLF
         H1Dg==
X-Gm-Message-State: AAQBX9fT/ViJUiUT08Q9fTR6Qc8j4y/BQqvmXGMwu8JPBIv+fhm76yLb
	NzhgUbckFB+KiB+OR18rUqzQww==
X-Google-Smtp-Source: AKy350ZkYV9vty3O2CTGB8EoQNeAJarHBPdwy546ZGbZ39Z2XXxigHGLg+w0DT/Ndbp5TParI+FLnw==
X-Received: by 2002:a92:c501:0:b0:317:3f4:c06c with SMTP id r1-20020a92c501000000b0031703f4c06cmr9631918ilg.20.1679949261242;
        Mon, 27 Mar 2023 13:34:21 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id y16-20020a027310000000b004061d6abcd1sm9125305jab.162.2023.03.27.13.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 13:34:20 -0700 (PDT)
Message-ID: <37dc9fe2-cdc8-ea7b-c7b4-89415c3cda8f@ieee.org>
Date: Mon, 27 Mar 2023 15:34:19 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: refactor arche_platform_wd_irq()
 function
Content-Language: en-US
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/23 3:18 PM, Khadija Kamran wrote:
> Refactor function by adding goto statement. This reduces the
> indentation and fixes the issue reported by checkpatch.pl script.
> 
> "CHECK: line length of 101 exceeds 100 columns"

Looking at this entire function, it seems a great deal of it
has somewhat wide lines.  Part of the problem is that it
relies on arche_platform_set_wake_detect_state(), which is
36 characters long all by itself.

In any case, the line that is identified is the widest, of
course, by 10 or more characters.  But changing that one
line doesn't substantially improve things.

I'm reluctant to suggest this, because I don't want a lot
of "code churn" patches to follow based on this, but...

One could rename arche_platform_set_wake_detect_state()
to be just set_wake_detect_state().  It's private to
its source file (arche-platform.c) and therefore the
"arche_plaform_" prefix isn't really necessary.  And
perhaps the result would be code that is a little more
readable, because its lines aren't so long.

I'd be happy to hear others' thoughts on this.

					-Alex



> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>   drivers/staging/greybus/arche-platform.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..c7d3b6f7368f 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>   				 */
>   				if (arche_pdata->wake_detect_state !=
>   						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> -							       flags);
> -					return IRQ_WAKE_THREAD;
> +					goto out;
>   				}
>   			}
>   		}
> @@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>   	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
>   
>   	return IRQ_HANDLED;
> +
> +out:
> +	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> +	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> +	return IRQ_WAKE_THREAD;
>   }
>   
>   /*

