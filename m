Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0905C92
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 17:58:41 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id lz22so5803862ejb.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Srs+1Vi4RvFdDPhBXtmUnH/GIvlrSvvrVz/Ri5d6Vsw=;
        b=IjHjg30W1/4+4nPBc9ElLosn7TuaI/MmuB2RBNBmaA5eRnvprGCC+dO6Kle57P/F5+
         vfrWkLL60P0/KRj+j6YNfeF1Z32MwH1X6K0BTHge6nZ/4opfxeudnTi9ArlQLC9fbp8/
         3Rq/SCOiXOr5/R1JVrLVEQH8WnpidIIs7J6ImhFRVvA7Ekzk3USEeIAlDDcfxuYRSTL8
         C7cyW26vZ6fUAjmfGDAcUPHcJFt06xd57+pJOV1s2iRmaPGW5uze43fERyD5s/grPwy1
         rYxzP1gnwzpeObWIsXGSXgVAZhjEsSQYA8YfmWV5rkfkIlts+48HKc/n+BPxObGO8WN+
         TzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Srs+1Vi4RvFdDPhBXtmUnH/GIvlrSvvrVz/Ri5d6Vsw=;
        b=nnABN+XsHFSliRuH0CPd4/9YGJgvh2p1TeeNzHz7ESCjXMRIwRaB+rwAtaVeGY0FPp
         lGr4f+/CJdrteSbCr0rejxpF1RaLqaTMqtsKzzhqWiPkpg9ipCL7Bh5EdP9H1IYYQ9NS
         TMqUOmIPLXgCC8kOZ8xAEPTYPpt50vx6EHb1xRGMMZEGH56Bhu5izZdddDVBQTOWOkRa
         h7HmlUvjPBanVMvLaVYwxcBcyQRrNqY9OzdzQeIWU6sxNumaVvGJpRQy8TZua733dUPZ
         n9pi5f55fsl0yE1rlZQkfGUDSzA0tNWUje3EvAj83yzvEIMEz8cPwZmHQIKKe6N8qmeW
         VS7g==
X-Gm-Message-State: ACgBeo2XW2UxzlEBiYrpcaQEcEJDhX2d2D/kkySNAfB5U4m5xaXbva4m
	vx/rdEcG8VLy8LKxK2fd20k=
X-Google-Smtp-Source: AA6agR7TaPPvNfsU2NfZNZFJSIqc6mYLalbQSr1rzrRdspSrZqkF7WXVD46+dKnewuhFIDS0be14IA==
X-Received: by 2002:a17:907:3e8b:b0:741:9c2e:1afb with SMTP id hs11-20020a1709073e8b00b007419c2e1afbmr10633629ejc.701.1662746319579;
        Fri, 09 Sep 2022 10:58:39 -0700 (PDT)
Received: from [192.168.1.103] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id t11-20020aa7d4cb000000b0044e8774914esm739666edr.35.2022.09.09.10.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:58:38 -0700 (PDT)
Message-ID: <2b19f1b0-0916-9fe7-99a4-33d0c626b7c3@gmail.com>
Date: Fri, 9 Sep 2022 19:58:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] use memset to make code clearer
Content-Language: en-US
To: Nam Cao <namcaov@gmail.com>, forest@alittletooquiet.net,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <cover.1662724786.git.namcaov@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1662724786.git.namcaov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/22 14:17, Nam Cao wrote:
> Re-write some code using memset to make it more obvious. Also remove an
> unnecessary volatile qualifier, because compiler complains about passing
> volatile pointer to memset.
> 
> V3: get rid of "volatile" entirely, instead of just casting it away.
> V2: re-write commit message because previous message describes a
> non-existent problem.
> 
> Nam Cao (2):
>    staging: vt6655: remove unnecessary volatile qualifier
>    staging: vt6655: use memset to make code clearer
> 
>   drivers/staging/vt6655/desc.h        | 2 +-
>   drivers/staging/vt6655/device_main.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
