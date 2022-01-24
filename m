Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAD629CA
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 15:26:48 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id u6so18737670lfm.10
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 07:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jug9lEBvIpvhKb36nn9AJjqoXZkY6UiOgsYSXQqcDyQ=;
        b=oeY/6BGCLT4yM51sK7D2fsPCAsP1slgvwnwsSJbwwYYQtAUFAkTly0O2wlK7r6wUA9
         EvOtPMXhdGuXUeXSwZMA2Hfe6ZBPlicXymq6XzedFTn7xa+/7adr8c/GEzeooqFftLnh
         +ImPaCca7Cx31HKQV0ur6GJlnsF2pByScTKrTmKOlcY7D9uAwRm7X67mTWQsfSEwo37u
         M7Zc0sed2nGKTO3QYbQ6VXX3Jh2/XT/khOI/TWQv4mfd1SFwX8QV3JdTzxqzCFY4/PXY
         OVr7BGN2V+e+V2lS/ULX3O46CsB832ljTQI2Jk97ubOxv6MCGdg/7JFiz/EYbdajX5d6
         zZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jug9lEBvIpvhKb36nn9AJjqoXZkY6UiOgsYSXQqcDyQ=;
        b=WAvNlfQl7MOnVC5fHxH6jrZWj4/LsSb3hss7qCAR3ZchIJj2Q2x5cBTmWhqDOc2e/5
         OODlEqxVskN76/oTCN+4x0FUVvslzGvcoXt1zUjufmcCM8BCHzUV+p/pKW3qgSP+sNI5
         ix1PobYLtZUxYw2WEe9NaDY7WVIMGb8Zal8FQgL98lPTuhqmUv30ZMh5fB0/aDxUE+OM
         G3xRu0WEYqg0NesA3GXSuaKI/TRTRI3FXHytETyaHrtrK4izZPbTzKLfH8SEwkqC6sx9
         /C3kxtEw0x4DjBWUdDz+jmtOKcyE8OK2CPTN4bJpJx6JWMqmX+tW6wD753dn5zLyjgOu
         OBWQ==
X-Gm-Message-State: AOAM5312ipZmCVvP/vsd8jiEs9qfhzd+AkTJtfduTBSA3eeaSLkTNWnc
	irlC1EOOb4z7qBf9R629gx0=
X-Google-Smtp-Source: ABdhPJzyXhtwYDbecqW5MgJ/Z5LdYLsZbj5zs/AVP5cEOYqEocf5Bi/DkPqWWCn3jwrBhSxudtvwHw==
X-Received: by 2002:a2e:9d94:: with SMTP id c20mr10623720ljj.496.1643038006748;
        Mon, 24 Jan 2022 07:26:46 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id a2sm1201366lfg.76.2022.01.24.07.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 07:26:46 -0800 (PST)
Message-ID: <74c587ca-4ce9-68e6-8eb1-f956ca05cef3@gmail.com>
Date: Mon, 24 Jan 2022 18:26:45 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/18] staging: vchiq_core: simplify
 vchiq_add_service_internal
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@i2se.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com, Phil Elwell
 <phil@raspberrypi.com>, Gaston Gonzalez <gascoar@gmail.com>,
 linux-staging@lists.linux.dev
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
 <1642968143-19281-9-git-send-email-stefan.wahren@i2se.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <1642968143-19281-9-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

On 1/23/22 23:02, Stefan Wahren wrote:
> Better use kzalloc to properly init vchiq_service with zero. As a result
> this saves us all the zero assignments.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>   .../vc04_services/interface/vchiq_arm/vchiq_core.c | 23 +---------------------
>   1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 6fa9fee..a13a076 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -2097,16 +2097,6 @@ sync_func(void *v)
>   	return 0;
>   }
>   
> -static void
> -init_bulk_queue(struct vchiq_bulk_queue *queue)
> -{
> -	queue->local_insert = 0;
> -	queue->remote_insert = 0;
> -	queue->process = 0;
> -	queue->remote_notify = 0;
> -	queue->remove = 0;
> -}
> -
>   inline const char *
>   get_conn_state_name(enum vchiq_connstate conn_state)
>   {
> @@ -2371,7 +2361,7 @@ vchiq_add_service_internal(struct vchiq_state *state,
>   	if (ret)
>   		return NULL;
>   
> -	service = kmalloc(sizeof(*service), GFP_KERNEL);
> +	service = kzalloc(sizeof(*service), GFP_KERNEL);
>   	if (!service)
>   		return service;
>   
> @@ -2387,28 +2377,17 @@ vchiq_add_service_internal(struct vchiq_state *state,
>   
>   	service->public_fourcc = (srvstate == VCHIQ_SRVSTATE_OPENING) ?
>   		VCHIQ_FOURCC_INVALID : params->fourcc;
> -	service->client_id     = 0;
>   	service->auto_close    = 1;
> -	service->sync          = 0;
> -	service->closing       = 0;
> -	service->trace         = 0;
>   	atomic_set(&service->poll_flags, 0);

Nit: atomic_set(0) can be also removed



With regards,
Pavel Skripkin
