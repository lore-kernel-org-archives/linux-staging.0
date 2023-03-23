Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00771C959;
	Thu, 23 Mar 2023 19:35:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso1917803wms.1;
        Thu, 23 Mar 2023 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679600152; x=1682192152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voH3eMjhhyaut+22MPGFHGPMcDal/7FwDZOTpsj04SI=;
        b=OUB2ED/FwjUpQ0e0blSs+/H7lKEKtqqbnLJ86iWyLHz86f5U0RSyENZMyncuKfDh+h
         ovzTvUI3T4g7FdwnEdKSceZ1sUYlUIzud4ehFNidstPI89Sghu+/1DD6zPiP68lSlJM+
         z1ctCQjtmFiPg7iA0KpG+IloiBWsyE2crvqIwWgKr4aR0+DFRWdfGxM4XuozquJQ7GFY
         UKM+8GLxj+b1ecKGC4kYbNKQ++x2Z/yEd1Q/GvdtPGfVDqeB77IC2AX8ycu5llTL7TeP
         yq60cxIf7VU2GWx9YTohmx9rQ4QUTfZc6Dc+9iZKvVGhV5rDpQH1SPFfWRZ7kZu+/1zJ
         ZNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679600152; x=1682192152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voH3eMjhhyaut+22MPGFHGPMcDal/7FwDZOTpsj04SI=;
        b=n6UAbdysx7+mnDMKCOFFl/PyvCYsxfel2p66w+i9lddFbATab0h+mTETpEMAiQrhEu
         Ez9QhuqrvDgd4dAaWGejm7RgPSfoD9ShSnb0DIdYIe8rNgBejfLQmQSp8MsR3iPhtpBi
         MyBi14Ah26nTFPw/NV/plZ3hOvmivrf1UeKjDtqZbb0Yet63GFSQT5neOIIVga26C7/S
         nmsRUMSKBc0p7gGz5NUgb0PPLejvU52WQQi0DkiqIsfNVhfczRUr3D1NuzKeAfFPOwqk
         DpZYOsOvaA619m1YS8J7Q2fslxJEzXKpj+l8s2IdPvyrm+LLn6iW3fZb/4SsEF5Z4YVy
         nYmg==
X-Gm-Message-State: AO0yUKWYWux0GQTrkpRaL5OrwShVJF96sR/4VGHBa9BUEo1rzO2lZrEU
	ZY8hmYCIHZAs34DQDVOT0xM=
X-Google-Smtp-Source: AK7set9sUQp9ktBvPWcuSNp0GfPFC5fxoLwxzfiIdqzt5xrlt9Gl/CH1kOJou/mwlbViWbzxd5lPYA==
X-Received: by 2002:a05:600c:1c18:b0:3ee:52fb:6dd9 with SMTP id j24-20020a05600c1c1800b003ee52fb6dd9mr687433wms.4.1679600151878;
        Thu, 23 Mar 2023 12:35:51 -0700 (PDT)
Received: from [192.168.0.104] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003eb2e33f327sm7633360wms.2.2023.03.23.12.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 12:35:51 -0700 (PDT)
Message-ID: <c8ada96d-a7da-f149-3fda-64abd7e21064@gmail.com>
Date: Thu, 23 Mar 2023 20:35:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/4] staging: rtl8192e: code cleanup patches
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1679598576.git.kamrankhadijadj@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1679598576.git.kamrankhadijadj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/23 20:19, Khadija Kamran wrote:
> Fix several cleanup issues reported by checkpatch.pl in module
> staging/rtl8192e in file rtllib_rx.c
> 
> Changes in v2:
>   - Resent patchset with the correct email address
> 
> Khadija Kamran (4):
>    staging: rtl8192e: remove extra blank lines
>    staging: rtl8192e: add blank lines after declarations
>    staging: rtl8192e: add spaces around binary operators
>    staging: rtl8192e: remove blank lines after '{'
> 
>   drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
>   1 file changed, 29 insertions(+), 44 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
