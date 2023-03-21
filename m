Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD4D505
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 18:50:21 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id o12so7381243iow.6
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1679424621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDr70Nnl1VATn+QsQLIB3bXV6I1lenwh+WDqNDOsA0Q=;
        b=DcTJTnyhiYLJeNioUDLmuSVg6UoVRxbbe5ZSgac+myOX2cLkzG9RbvRC5CNDWpB6uf
         v83+q2Ltq1PlTNMTJ2tbM2GtMfQdEJF/z1MDcE00HTKDACl9T2hI05OTuPXTwc4EhkSE
         btWd7/Cy/Vms+sGLosNbqH9xybP/DNMVyyGs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679424621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDr70Nnl1VATn+QsQLIB3bXV6I1lenwh+WDqNDOsA0Q=;
        b=Hsfvz/UuX8/z7mYnM1WCil+mxt698VfMPI+RHMPhJ2X3HV0ISUEHF+WyBq6ruvdJXd
         G4TxORAbEc4bDQhDYu8xZVqDDy+NyF4x5RiBwjwwJzfQx8GGoaXRzGPKrr6fNc6uosmm
         /Tmij+pplMY4osysfAZrFClBzKdijtzjmhCBW//UEHYso79GdFUsv4gg3THKtVMaak6d
         P/5P3taN8ypTtP4s/UQkwro1Z4zPWVu3MXbfrKV4e1ZyKozvwk4Avkn5dOkDYF00TSEi
         fyb/TEgJy+z7Q/4DTqtAhnvIHrAH6ybSwj7gf3Y6puiTDMToOlkh/8MFOWz6+NrMxFAC
         IGvA==
X-Gm-Message-State: AO0yUKXQsFvFsnWc3enF6KAnMc0mMF9nKuOwFPe0JOV2jWdU5WkaSIgV
	oQHaACwKBwJ29Q+hNJAnkvTVvg==
X-Google-Smtp-Source: AK7set/4kVSlvtI2ppfTio176h7OTJNhkCUm3QA9gCe292hvJ6C5sdw+51ybOK5/SJkFjQYInjN53Q==
X-Received: by 2002:a5e:de46:0:b0:752:ee32:322d with SMTP id e6-20020a5ede46000000b00752ee32322dmr2315828ioq.18.1679424620929;
        Tue, 21 Mar 2023 11:50:20 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id c25-20020a5d8b59000000b0071664d0a4d7sm3875903iot.49.2023.03.21.11.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 11:50:20 -0700 (PDT)
Message-ID: <2e869677-2693-6419-ea25-f0cc2efcf3dd@ieee.org>
Date: Tue, 21 Mar 2023 13:50:19 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: greybus: use inline function for macros
Content-Language: en-US
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Julia Lawall <julia.lawall@inria.fr>
References: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/23 1:34 PM, Menna Mahmoud wrote:
> Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> static inline function.
> 
> It is not great to have macros that use the `container_of` macro,
> because from looking at the definition one cannot tell what type
> it applies to.
> 
> One can get the same benefit from an efficiency point of view
> by making an inline function.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>

I'm sorry if this conflicts with what others have said.

But the use of a macro (with a container_of() right-hand
side) to get at the structure containing a field pointer
is a widely-used idiom throughout the kernel.

What you propose achieves the same result but I would
lean toward keeping it as a macro, mainly because it
is so common.

					-Alex
> ---
> changes in v2:
> 	-send patch as a single patch.
> 	-edit the name of struct object.
> 	-edit commit message.
> ---
>   drivers/staging/greybus/gbphy.h | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
> index d4a225b76338..e7ba232bada1 100644
> --- a/drivers/staging/greybus/gbphy.h
> +++ b/drivers/staging/greybus/gbphy.h
> @@ -15,7 +15,10 @@ struct gbphy_device {
>   	struct list_head list;
>   	struct device dev;
>   };
> -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> +static inline struct gbphy_device *to_gbphy_dev(const struct device *_dev)
> +{
> +	return container_of(_dev, struct gbphy_device, dev);
> +}
>   
>   static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
>   {
> @@ -43,7 +46,10 @@ struct gbphy_driver {
>   
>   	struct device_driver driver;
>   };
> -#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
> +static inline struct gbphy_driver *to_gbphy_driver(struct device_driver *drv)
> +{
> +	return container_of(drv, struct gbphy_driver, driver);
> +}
>   
>   int gb_gbphy_register_driver(struct gbphy_driver *driver,
>   			     struct module *owner, const char *mod_name);

