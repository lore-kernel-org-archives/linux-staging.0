Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B3DB657
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:53:19 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ae3d4c136fso419697166b.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696168397; x=1696773197; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WuNs1fTx2E5mS1rvQvEyzQGp3aoI7mPY6rfOs6zQoc=;
        b=RVKX0vfNHAuEsGKy/G3RvWCs0IebJ1Swp6733MvrT21r4ilkAo0t88jU4LE3yHE6MO
         Qx+hWlZSwTs2OWOab7t0RHNLeAmEg5zI+tEOTeCfOdzK3C1vHk55X4PR+Gf8KT8kpf1o
         dWmhRQ6YGHutvI9yPpoX4POiQeU3zNsvX+FhF3lnIYcWnZI1DtvT7DC1AXRQITOBBKwv
         K+cUYNeGPi+Kg3U7rUK0sKTq1P1km250diu1kOj7oITlQI1qhh7DAQarxEtdCSoHZQAg
         rluEfLHgsQs6uZQQqXLX4B/bpxG+ngHaUAjJG/oPr1/hoGXQoVTM2JEwHX0PULVynVoV
         rIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696168397; x=1696773197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WuNs1fTx2E5mS1rvQvEyzQGp3aoI7mPY6rfOs6zQoc=;
        b=RoNO0CP87AowWd4g8ggSr/aQT1qR/3ALXyeviISps0Cni6ybbR7W66GP8052EZPtPo
         NvDhU5PcPeFg2WlWlr0iqfUcebGOzMB0QyR6HqdXASL5okl8ftRn6fJm0jrB2xkqwu+h
         WeFoomA2HQoNAU8fu8+gxVzg5s/S6C691KnyAM/67eAu+Fku1rneFjWgl0sEBqMfaVJO
         aHJmnAB+uCQ2Q1cYKwsh8Q5zbZsqG1S30pKeMr6S4eN/TxiIgGg35oYM1AKAbHmuEjmX
         vw/LnaDW7gdjzE8TVnszeVbx1DWRKEtDyLkXMyDxTZ4AMBSokLt4CRbXaCVLjVptplTG
         pSXg==
X-Gm-Message-State: AOJu0YwxqZRU3oeNFRKzxyHkkk4IYKcT4VE3H+h/9ImLRoljLmul7csc
	I8mh2RQq1jb9FhdN8A78Hs0=
X-Google-Smtp-Source: AGHT+IEc5ukey0Xg7SMaP+CP83lphjqcmHf48JoyV6boi6Pijm9hSYazdyW6GLkBoYcB3OvhVxZoaw==
X-Received: by 2002:a17:906:5185:b0:9ae:50de:1aaf with SMTP id y5-20020a170906518500b009ae50de1aafmr8099784ejk.4.1696168397395;
        Sun, 01 Oct 2023 06:53:17 -0700 (PDT)
Received: from [192.168.0.106] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id fi3-20020a170906da0300b009a1fef32ce6sm15622065ejb.177.2023.10.01.06.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 06:53:17 -0700 (PDT)
Message-ID: <e367844f-7990-0ac9-3898-04cacc863095@gmail.com>
Date: Sun, 1 Oct 2023 15:53:16 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/3] Type encoding info dropped from arrary name
 "abyBBVGA" and variable names "byBBVGACurrent", "byBBVGANew"
To: Pavan Bobba <opensource206@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1696141471.git.opensource206@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1696141471.git.opensource206@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/23 08:43, Pavan Bobba wrote:
> This patchset series consist of fixes to issues found by checkpatch
> 
> Pavan Bobba (3):
>    staging: vt6655: Type encoding info dropped from array name "abyBBVGA"
>    staging: vt6655: Type encoding info dropped from variable name
>      "byBBVGACurrent"
>    staging: vt6655: Type encoding info dropped from variable name
>      "byBBVGANew"
> 
>   drivers/staging/vt6655/baseband.c    | 40 ++++++++++++++--------------
>   drivers/staging/vt6655/channel.c     |  6 ++---
>   drivers/staging/vt6655/device.h      |  6 ++---
>   drivers/staging/vt6655/device_main.c | 24 ++++++++---------
>   4 files changed, 38 insertions(+), 38 deletions(-)
> 

Hi Pavan,

this is not correct. You need to send all patches as an own email.

It is also required that you include a version history in each patch.

Please have a look at the patches send in.
https://lore.kernel.org/linux-staging/

In the version history your next patch series is V3.
Please document in each patch what has changed.

A sample command I use for this is:
git format-patch -o ~/Documents/kernel/patches/ --subject-prefix="PATCH 
v3" --cover-letter -n --thread=shallow --to="Greg Kroah-Hartman 
<gregkh@linuxfoundation.org>,linux-staging@lists.linux.dev,linux-kernel@vger.kernel.org" 
f3c8deddac66d11c41ba720e4048aba37e41e885^..HEAD

Thanks for your support.

Bye Philipp

