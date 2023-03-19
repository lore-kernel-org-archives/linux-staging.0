Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B50E4C1;
	Sun, 19 Mar 2023 13:20:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id eh3so37099292edb.11;
        Sun, 19 Mar 2023 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679232033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ar1R9+4Me/VMurp1fLp3U5SpNwGcoPZ7zOElSyFmz2I=;
        b=Xb/7/NBknPzIHDY+6GhGmdeMMjxj50m4Hcw32K4k0OVbvddxRXTltldlzfN/XdqcrV
         VoJ2dWdjw+tiID3JvNXa4FWwIjXleUFsq7d3kz2fhCxXHadY3/JFSxag6B7EBiUVsthB
         E9KstruA4PjRAP1etyb3+VzEFcW45lMuKqcZkV80hgEMCdRcIX6GbkoXdPeL9hjkZSdm
         ObfNT/D9xYeLEEgqH3vJo8wOB2KJd3L85XBVZyUcMQo3utK0P7YmAgOvliRL3Qy1U5JP
         semc6dZFLOjepNESmhLb5oOO75BZW2gLcQTgpwxfdVrG/tqvyDjPByzAPPPwR0pCQFQf
         JgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679232033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ar1R9+4Me/VMurp1fLp3U5SpNwGcoPZ7zOElSyFmz2I=;
        b=5aI11GJwBzIdUI8lKkAzP5T1dYa7h1eSdQpB7nqlk1UenvOsFtiMZkfLc7z5AxCCVH
         +6jk3GhvDBEiwIyOzLnUuqct3JosZYDJzEjGoBabIoXT9i3CHHkNz5eixMysE+knWctE
         nsO5exnlBZjVoAzhRH8vGlYHpUbR+wK1edLIWub9I5w8XnQ5o97RqA7UYQiDVhRLK0N0
         hP1INITbWu4363osT3pG0f9oOgbJp8OGuLWVShDSffhEv2SGu2hkCiaZjU3b8x9NiFTl
         92cazM+OAWiOw8V1p+0dGAkaNdOHBIqRD0koQEcFBIDpCplr4NUl9RpnyulOOMaXsW5T
         3wqQ==
X-Gm-Message-State: AO0yUKWSzZYS21HyR4Qr/2DdebXNmWekwKYXwEW1/skykhnyIHwZQE5f
	xrOuJ9aoU3nuf6WTeW4VhxI=
X-Google-Smtp-Source: AK7set/NpR8kXxxtvmVOSZNu6X1LNczUB6SJCXh9Ek5Bw78cpzFWnYUhW6rq+Up7SECfdVjHljESag==
X-Received: by 2002:a17:906:bce1:b0:86f:b99c:ac8d with SMTP id op1-20020a170906bce100b0086fb99cac8dmr5568995ejb.44.1679232032649;
        Sun, 19 Mar 2023 06:20:32 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709060f0f00b009313da4e471sm3241110eji.41.2023.03.19.06.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 06:20:32 -0700 (PDT)
Message-ID: <7ec03abe-40e8-c56d-d178-20e57b859d0c@gmail.com>
Date: Sun, 19 Mar 2023 15:20:30 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: add blank line after struct
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I am sorry, I resend this patch by mistake. please drop it.

Menna

On ١٩‏/٣‏/٢٠٢٣ ١٣:٤١, Menna Mahmoud wrote:
> add blank line after struct for readability as
> reported by checkpatch script
>
> " CHECK: Please use a blank line after function/struct/union/enum
> declarations"
>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>   drivers/staging/greybus/gbphy.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
> index d4a225b76338..1de510499480 100644
> --- a/drivers/staging/greybus/gbphy.h
> +++ b/drivers/staging/greybus/gbphy.h
> @@ -15,6 +15,7 @@ struct gbphy_device {
>   	struct list_head list;
>   	struct device dev;
>   };
> +
>   #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>   
>   static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
> @@ -43,6 +44,7 @@ struct gbphy_driver {
>   
>   	struct device_driver driver;
>   };
> +
>   #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
>   
>   int gb_gbphy_register_driver(struct gbphy_driver *driver,
