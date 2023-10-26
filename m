Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505033994C
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="EzCVwoRg"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b2f4a5ccebso742562b6e.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 11:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1698344449; x=1698949249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zD9c3qk1zR7XohQX5ahXN11vQdLFMJ+dj+AbgUO48eE=;
        b=EzCVwoRglcKf53ma9fufEQoW/IUScDNSpKekKahYm5pK7dHHMbeevwU/u2gH7YCwQW
         4qZa7R9hT2VeMEiaZszPtNUyQBR4nxv7w9vYch4ZAecsHhTDC4R5VOiHZ7B1oHzx84pB
         9DIeeUpMuhlEEcgh/XityEBviV3KuUIutHqqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698344449; x=1698949249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zD9c3qk1zR7XohQX5ahXN11vQdLFMJ+dj+AbgUO48eE=;
        b=tveSEwj+K8XtTmpeg5R4KL+PLo5w5IehBjPlZKQ5uWY2eqrgzVHDa/igA+PGJtgNnh
         IvGUtdE6sbUo6z+XAhhrDy9UBo88PWKAUUySAuQTQeyhDUuhZAp787zRhfyeT80uRVF+
         CsW2kKzKLJ05FmpSOeOzaD8Jd5ZO2L1NR5MylcTVLMYU/SVUemqmxgZoNCNKwuN1WSsj
         /W2HOKvSYAk8mlcZ5h9TBWXOBndpmmaulJgbrJyTOi/3paT0VlcOP5knUYtpS5zA2XE5
         vag7aXfyjsTFnTAfQVH/OQQ7pjAoS79uxkVBGkpbsTcF5iF4HxD5Gct9wfLzV9idNfZq
         3LmA==
X-Gm-Message-State: AOJu0YxagEQIuWnjpgOKqsgksEhWVdqc+ZTQGBCMj4Dlbg6F0XPcPQEw
	V8dwzCtZHa/MWfACYarGGXMq+g==
X-Google-Smtp-Source: AGHT+IF81kqYKRpUAdo55BhO6rS7qI2l7xrzwZ9WNDOVB0ff4TIsIPfZ0l6kDz3LLIAX4RzIAJN5ig==
X-Received: by 2002:a05:6808:f8e:b0:3af:9fc4:26c6 with SMTP id o14-20020a0568080f8e00b003af9fc426c6mr171353oiw.20.1698344449334;
        Thu, 26 Oct 2023 11:20:49 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id u15-20020a056808150f00b003ae5cb55513sm2889138oiw.38.2023.10.26.11.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:20:48 -0700 (PDT)
Message-ID: <5d457162-d20a-43a5-989e-ef263fbd91b2@ieee.org>
Date: Thu, 26 Oct 2023 13:20:47 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] staging: greybus: bootrom: fixed prefer using
 ftrace warning
Content-Language: en-US
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/23 7:22 AM, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>

This change looks reasonable to me, though I don't think
ftrace provides device information.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/bootrom.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index a8efb86de140..79581457c4af 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -491,8 +491,6 @@ static void gb_bootrom_disconnect(struct gb_bundle *bundle)
>   {
>   	struct gb_bootrom *bootrom = greybus_get_drvdata(bundle);
>   
> -	dev_dbg(&bundle->dev, "%s\n", __func__);
> -
>   	gb_connection_disable(bootrom->connection);
>   
>   	/* Disable timeouts */

