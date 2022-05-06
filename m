Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200067E8
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 07:23:43 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id i10so11101229lfg.13
        for <linux-staging@lists.linux.dev>; Fri, 06 May 2022 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r6iyqv+O3BjR0LvvZ2kt+RAWyYOrOIyELEXvFaehkhY=;
        b=avNdgqvAmXphqerrnxxbZNWJ4iRsKj5bc4yQpGTdt/8TuoqzPIXVSZhiLr4LI0bTvP
         zn8r84hICJhVGtw8x94s3F6LNbBMkHpLwxuiHaIT5bcdF04TVYrh5sUOukguTSXUHGjz
         MwAmw0OfmLqizYo8yOxGtiUeLCmMkhs36YIkOT1JXl/YiWLdOFKIuvT7cMx9yIufLdtU
         BxtmFJYdljzsqXu5UPejTx0qPoTyhdb5gL6aM4iZw30/wgYe2WEz8ZwOCDPJglOQw2k3
         oRYsEaJvOnCQJKV1Oewre/WpN0mr88A1w/5GNhVn6LtOVn9Ya4Td44jBvxTR6RU0Qhzc
         2hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r6iyqv+O3BjR0LvvZ2kt+RAWyYOrOIyELEXvFaehkhY=;
        b=LIlQn13aU5WovepNURF0uwqBWdlsGdzeTlLUEAaxv+iiOgrOOVlOV3Z8HDF7z3hJF0
         8Qqau0FkeXj/cegzTLJRHYXki67NnxLaDDwJtroZzP0EqUA96w0W+bKqSi0ApwXGFJ8+
         m/sxjYWg5ZEG/9w6exYrsib39KOU38/0ZttRmeyhI/oURvjtuKgkk762PfFHfLh8HPYk
         yiV9WBB+4vvv+VYpiTV+cU7c1Clf0fWZHYSa2msQe2T0//RdkgXjnraSeUfQJs2DiHLC
         ESct17GbtthFjw2qAcoPB4IB4pJmPOZOItvNqIPAl60vF0JA7kydid9q0EMLasPoaWAh
         SgXA==
X-Gm-Message-State: AOAM533dlg5X1XIJdt7bDUUOtl9LvJXYSQoyz+RN3roiXOGeVhGOFA2I
	YV6C3lim0VwHOJlbNj5HW2c=
X-Google-Smtp-Source: ABdhPJwcESVaKWO2wnu9IRvlTmdKTIpQuIm3XGJanK0NWp68IunXwo+EYAUVloCDKeQgJugzRxhy4A==
X-Received: by 2002:ac2:5e86:0:b0:473:d044:60f5 with SMTP id b6-20020ac25e86000000b00473d04460f5mr1589063lfq.87.1651821820922;
        Fri, 06 May 2022 00:23:40 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.246.114])
        by smtp.gmail.com with ESMTPSA id u2-20020a197902000000b004725b9da82asm559848lfc.303.2022.05.06.00.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 00:23:40 -0700 (PDT)
Message-ID: <7dad295f-2ac4-d6ff-8d8a-17db8ef18c12@gmail.com>
Date: Fri, 6 May 2022 10:23:39 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] staging: rtl8712: fix uninit-value in usb_read8()
 and friends
Content-Language: en-US
To: Wang Cheng <wanngchenng@gmail.com>, dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1651760402.git.wanngchenng@gmail.com>
 <b9b7a6ee02c02aa28054f5cf16129977775f3cd9.1651760402.git.wanngchenng@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <b9b7a6ee02c02aa28054f5cf16129977775f3cd9.1651760402.git.wanngchenng@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wang,

On 5/6/22 06:15, Wang Cheng wrote:
> When r8712_usbctrl_vendorreq() returns negative, 'data' in
> usb_read{8,16,32} will not be initialized.

[code snip]

> +	status = r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index,
> +					 &data, len, requesttype);
> +	if (status < 0)
> +		return 0;
>   	return le32_to_cpu(data);
>   }
>   

Why do you believe that 0 is not valid register value? And if it's 
possible then how you can identify an error?




With regards,
Pavel Skripkin
