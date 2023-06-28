Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56CD532
	for <linux-staging@lists.linux.dev>; Wed, 28 Jun 2023 20:47:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-991f9148334so5675066b.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jun 2023 13:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687985232; x=1690577232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvhvp++Fmkno+9Wkxssy9/RZIvwRvbSrouh/UrjrNS0=;
        b=Q+wWNqK1i8blrA2COVOU9mkWoZXQ8R39jB3tiQ/ojlnaVE1lHg11CJgiYqSvppEjFi
         W6bFHpqarB8kSdofMJpg/Yd0+vWnShUGlss3SIOMyN6QE2HERPpE2j25zfLxmW1VijML
         tufK8uCem+HSNxkOvboxHGQDYPNm/6WnVPv9VaWZ0V6zOWYH14ILU7Rpl3BN1VxuYprW
         8RKzqK2R8Ipt3ocXC7zG7wnZhcwG0tRCQCw+GUoQXX1FYugYK+ocDENvWPB2ri44Uw1c
         dlad2ZmVloulVUrnDLudzjVTTm/PBvF93jmFqp6Y6B80sNAyW0x9KrA1wTFjXgi2HefX
         oo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985232; x=1690577232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvhvp++Fmkno+9Wkxssy9/RZIvwRvbSrouh/UrjrNS0=;
        b=WtksB6Q4ZyokXG28AUY3nA5u4HkOdrJCGw1plSE/PW6O27BHFLt1p+TfHVZAQzX/NH
         xg3RR4o8M+bl+gusV1xv/7rtcC0viacu3s2J5dTL5GA29lxKmQvl+x2wMVfVH8unSIhq
         mC2Wt/zBYt6gJI44jCTcJ3IFSyU3AjxcPwJ0kMbh3VTWX74DCSJ2wIvmlocZ9pXT/7Nw
         l2TmTm1fukLPoxKg6NrS0KvTUZMeSTfscC2NuYG73hr0CUz4oxaKtgeszguPbq8Aa2Yq
         4U3l80thISK3BnEBEyOu+B4r5xq/0jKXVcuzo5wGId9sy0Iv4d5w429+RWXgztHM+DiA
         bwEw==
X-Gm-Message-State: AC+VfDxxXJdCOsAjV+ikgh5OBvRkKWZShfVc2qJGYQ9OTsqQN0TOLH0k
	2uYDVR0IW4NLFoniECWiuJA=
X-Google-Smtp-Source: ACHHUZ5H/7pjTQI3ejfHhGJqIbm+0QAe0YmuknMuDAvqDeFeKsFYxqQcqGAseUMHnHn58q7PxEa0OA==
X-Received: by 2002:a17:906:729e:b0:988:c8bb:e3ac with SMTP id b30-20020a170906729e00b00988c8bbe3acmr21097955ejl.7.1687985232347;
        Wed, 28 Jun 2023 13:47:12 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id b6-20020a1709064d4600b00988c6ac6b86sm6030668ejv.186.2023.06.28.13.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 13:47:11 -0700 (PDT)
Message-ID: <e6e3f64e-9df8-cafe-9a83-42f3bbb14962@gmail.com>
Date: Wed, 28 Jun 2023 22:47:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] staging: rtl8192e: Rename function IsHTHalfNmodeAPs to
 is_ht_half_nmode_aps
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 dan.carpenter@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <ZJp93mCd9ogrGZbx@tacos.darkphysics>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZJp93mCd9ogrGZbx@tacos.darkphysics>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/23 08:12, Tree Davies wrote:
> Rename function IsHTHalfNmodeAPs to is_ht_half_nmode_aps in order to
> fix checkpatch warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
> v3: Fix email parch as v2 info was placed above the ---
> v2: Rename is_ht_half_nmode_a_ps -> is_ht_half_nmode_aps
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>   drivers/staging/rtl8192e/rtllib.h         | 2 +-
>   drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
