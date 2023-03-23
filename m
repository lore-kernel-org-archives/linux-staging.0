Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5420E6;
	Thu, 23 Mar 2023 05:56:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so390843wms.1;
        Wed, 22 Mar 2023 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679550994; x=1682142994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pY6n5J6nh7sc6BZPrtW1Af5iIpNiv08jLRK1EZDr/Y=;
        b=kYCf0RAszOEg9bkDgtsJ82BX5g8JwgtElM89s+ujOPDkz/jt1ucDniqxAcxTCRA3F7
         455ZTTlekoP/kHAcQMrgevEI8jDBTC/lN4zyiRyJCBpcbSzJ7Zq0KJ1hDYyqtRWzZ054
         8gWnbGwG5v1tlw5qeoyHQtQ/9KMCIxuS9QOcLQEWCysL0Uks0KO2EdKL30aFvXlcvltO
         QA/6dhghtNmrCd/fmtjjfcpqtg8NlOubBlKLTe4hUNSzFnb7JN5Umiu4fFzJH6o8L64c
         Qac1hWr1D5TDucHyTvOJ6dnnsYN1CQJ4baIUBxVH9i+aIR33n/jviJS7e2EZZpRnuKDd
         /5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679550994; x=1682142994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pY6n5J6nh7sc6BZPrtW1Af5iIpNiv08jLRK1EZDr/Y=;
        b=iNyCOQc11VnvjO5YTa1idajszAUM9dbR/6Y17XCl2GXBtwHqAZUZoAkxfYDLZa086/
         LL5nVm2+Clt9rsLCY1agWohiW/tuavYPzrXQavhewqP7gJ41LMsycaBnu/NF0+xo7Fk7
         QRw1Um1UE4DFRiOQMfnwMVekjkOfaACya5fEduaHR2Sz35oWrTUuO0y7kNs1jdUmORXz
         opV8XHuksxuydIYbke0fAZ28bwFvR6DSvATq17F4HEAuVXnrMAN1g33JgcZwhriFpcdK
         P3tPTd3xfwOv6JJEsa+A4abnUYBLCsi32AhMAgSFYGPQb6kcV9SYPWF5Zd9WwVBY/7NU
         ndhg==
X-Gm-Message-State: AO0yUKVQdkVCQhwSl7g7BdKN+ZJH5MSm7TTJLCizO/CzVdf5AYRJzK6d
	veHo9lgcmVV5uATMzBfls48=
X-Google-Smtp-Source: AK7set88g+PhzfJWEbM0eHlqrdsc/zQZK3vdrSgOPFrvQYoe6frpHYLB1SoXS21mb48QA3EysJGvVg==
X-Received: by 2002:a05:600c:3103:b0:3ed:d2ae:9adb with SMTP id g3-20020a05600c310300b003edd2ae9adbmr8230524wmo.0.1679550993976;
        Wed, 22 Mar 2023 22:56:33 -0700 (PDT)
Received: from [192.168.0.104] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id b13-20020a056000054d00b002da1261aa44sm3691623wrf.48.2023.03.22.22.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 22:56:33 -0700 (PDT)
Message-ID: <9cdfab96-ee7d-db11-4bde-71648a640385@gmail.com>
Date: Thu, 23 Mar 2023 06:56:32 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] staging: rtl8192e: code cleanup patches
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>,
 outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Khadija Kamran <kamrankhadijadj@gmail.com>
References: <cover.1679521517.git.kamrankhadijadj@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1679521517.git.kamrankhadijadj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/23 23:07, Khadija Kamran wrote:
> Fix several cleanup issues reported by checkpatch.pl in module
> staging/rtl8192e in file rtllib_rx.c
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

Checkpatch:
WARNING: From:/Signed-off-by: email address mismatch: 'From: Khadija 
Kamran <kkamran.bese16seecs@seecs.edu.pk>' != 'Signed-off-by: Khadija 
Kamran <kamrankhadijadj@gmail.com>'

Is this wanted?


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
