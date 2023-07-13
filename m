Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4620FB7
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 21:54:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbe35e028aso2383625e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 14:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689285282; x=1689890082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8Vq/YjU2+7KUXiY4AhyoCFj0jPM2WGiCCtNGuwnzcM=;
        b=d4nxYVrDzzkD7OoNM1KkCMHmJJTnNYUxKcWynlunLf1rRuU1C5GpGUJuEHDgNt05zH
         DqcQYmRPQqvQnpludttrGoxS1jcKViNKjQD/g98ZtKD7QE4WZyj+EucnrWb4h8klaqi3
         JiGHYEUxTS3wpCUYjSL3uFV/X2PTmAtcIJdMTM7giU4uRCshi0JK7hvnX9t7bKj0mm1j
         ccQLEUcmdzDDfje647vCDoM2mtBwxtthNi+zUsCCSy9cmQVpjnvUIr1UApFoM/I5Ngmh
         di60MUsykzG3oyepjCzICg3O6peoODsD/9YdybstoFk7JMOOvXBpDjCeA0MBriIAKyZk
         CQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689285282; x=1689890082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8Vq/YjU2+7KUXiY4AhyoCFj0jPM2WGiCCtNGuwnzcM=;
        b=KyVnK4qTLZgBZydFCj22IoX6k9gy91FwObqBPhGCBmYzc2i82KguLhtAOiYsImbcXi
         OraRPVu1jQVDFzkEDq/nU/p+SIwx3vl3V7u7VcS0q0vd3TuSnK9v7NSQYCmXDRRbSgyh
         AMnF2nys0wH5ybIcHlK0WYYf+TJseIgNx2YAlAZb7moC+BZK4J1j5WEB+QR9hWO+o3Ha
         vOPgUMSrFq6YDtyJsoDEWzSwIl1bGelNcsLX7m5dpPCIIluDHC29LySDY1B0LZzg8+GC
         n9zsmeOILloUdEdNm+4Y2zCcNym4WN1WrQG+aEoCxXVyaLdajwNAPQeVGR6jMroT+2Eg
         lvwA==
X-Gm-Message-State: ABy/qLYwQtfBAn+lVkd5ipTyAZ7B7LoV7F172P8sacyjW9DpdRo59mt8
	qUtOUR1Qj5Xovc34RAlxu9A=
X-Google-Smtp-Source: APBJJlFy9gw0RVV4xtKrJIUZJPAF3MKnoCeSrwrB3gei1w9ZwQZRtEE8huiJhjtLCtkFuY9kd87FNA==
X-Received: by 2002:a05:600c:8513:b0:3f7:e7c9:4039 with SMTP id gw19-20020a05600c851300b003f7e7c94039mr2465428wmb.4.1689285282229;
        Thu, 13 Jul 2023 14:54:42 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id x11-20020a1c7c0b000000b003fbcf032c55sm48649wmc.7.2023.07.13.14.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 14:54:41 -0700 (PDT)
Message-ID: <724b252e-0c72-6c77-4817-aee8d87a99cb@gmail.com>
Date: Thu, 13 Jul 2023 23:54:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 09/12] Staging: rtl8192e: Rename variable pBA
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca, error27@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZK84sYjc9uHIWZcr@basil>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZK84sYjc9uHIWZcr@basil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/23 01:35, Tree Davies wrote:
> Rename variable pBA to pba in order to Fix checkpatch
> warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies<tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 106 +++++++++++-----------
>   drivers/staging/rtl8192e/rtllib.h         |   2 +-
>   2 files changed, 54 insertions(+), 54 deletions(-)


Hi Tree,
the p is typically for pointer. This is not wanted when you change the 
name. But ba is is in use....

Bye Philipp
