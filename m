Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C2015D2
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 18:58:38 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id fw3so18071782ejc.10
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8OLL1jUVaQcGoXmQo2JjgriQ5VFjXz9Vc55lT99BIvI=;
        b=TgAY4HAHmFE1nSrA53O3flNQ3tgdijtGS7y26ZTXyHz+GfNTp+tqJMOh49IqHLY0Ug
         AP87D+lBKUZqG2/ekNJYcrJcmVuzTqCExtF6UT6qoZujcfIkDFccwOXgFpsAaM0e9Znb
         sKoW9ppKMIg+rB3PzHJ24nCYogtmYmRp/XadVzxwUeegbO+xMghj8G8HHvjY28w42xSA
         6ALo5TzBCoNRTDh/kmOFjK0/EmiuJa5qVbpRozpcMNjYcaeSWRqGX99IwzWIv0b2MfOr
         dVM20S0UVBWT5AvM539cb4ynw365B07srl7mTpP//lUDp5HHpmR7ZcvCItMPviPrSTPb
         2XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8OLL1jUVaQcGoXmQo2JjgriQ5VFjXz9Vc55lT99BIvI=;
        b=i8bYBqpdiRr7X48bZQ9Zvj9bomxTBZjOIKd8/xTBo5T81PXBBEg8pOTbXVySEBrZNz
         vvfuOKjOIDICfdgT6pwRIUk9NP68PKl7MbiQyn14ROgg2Ri60h8HnhiSguuuFHFC2FBj
         ZI8+r2rgxj4uPBnPIxkEc2asUmNk/cf6ANYcK6Q/5WZaI90pPsl+UDDnCzDbsTYzYPUp
         OvhQXqCtgkYFgi2vwz3mHtpQR13tgMT08SCcSAznqlms/u7+W8vY/0WnYpoG2fkq/VrP
         R1tmvCXYmUuwulE49cei5V9x3N48QTcDW1K+wBNfKH1YicEsgefYfIyo+Y3o7eLCSWL4
         4GVQ==
X-Gm-Message-State: AJIora/QZPvvVh34MgGGwdiDNT/Wk7mLuklQqLOJhZdMFa8KdTUzsVXx
	7EmwClsHSVomK+7t68Rscus=
X-Google-Smtp-Source: AGRyM1s8PYtZXuUD1BhG5j69FCmLcX4OMHH7nYgx7Qju2MLprfzyddftxsIyPLuygDD3gZuvit3EGg==
X-Received: by 2002:a17:907:778a:b0:70c:d67:578e with SMTP id ky10-20020a170907778a00b0070c0d67578emr29231722ejc.696.1656961117113;
        Mon, 04 Jul 2022 11:58:37 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id b21-20020aa7cd15000000b0043a6c538047sm1865356edw.70.2022.07.04.11.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 11:58:36 -0700 (PDT)
Message-ID: <a39f84f8-bde2-1a5a-f8ec-000dcabcea74@gmail.com>
Date: Mon, 4 Jul 2022 20:58:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/5] staging: r8188eu: power sequences cleanup
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220704145221.159949-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220704145221.159949-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/22 16:52, Martin Kaiser wrote:
> Simplify and clean up the power sequences. Remove some unused register
> definitions.
> 
> Martin Kaiser (5):
>    staging: r8188eu: move pwr seq defines to HalPwrSeqCmd.c
>    staging: r8188eu: support only us in PWR_CMD_DELAY
>    staging: r8188eu: read pwr seq length, remove PWR_CMD_END
>    staging: r8188eu: remove sdio definitions
>    staging: r8188eu: mac addr len is unused
> 
>   drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |  60 +++++---
>   .../staging/r8188eu/include/HalPwrSeqCmd.h    |  47 ------
>   .../staging/r8188eu/include/rtl8188e_spec.h   | 137 ------------------
>   3 files changed, 42 insertions(+), 202 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
