Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC13FD1
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 10:47:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v127so10926830wme.5
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vMMwa7IT7oG2iCb/XqivgT4lMgOipj0gblXHu4x8S0o=;
        b=HJmNX0T8RS4yKFMLsT1tR4IeTwBVq3AumWfS8MmVkYjUXjc1ATVjYFA4yY72iMhV7G
         b9JUEiwY7Znsiv49rdpMFDy3GwAK5g/361dokXdul/mW6oe4Wwpm6ei3IaR/XyuEGscR
         0lLnh9LwE8HNIvf4W8iR+4vbymjnFulXlJK58EmXgEF0R/K3Nhumvx45wVr/yd7KJJrw
         mDV41hgI5cWxMHmBVoU7kUkD40roTT61ISxveR2eAs4oteJCbf9yf13pb8js+6hecYKc
         wg7yqhd6SxJ12gvvh7JOjoOgOr3mou+V59OuXFWQDsA8Bm9jobicWkYDG4T4rcvZiIl4
         weiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vMMwa7IT7oG2iCb/XqivgT4lMgOipj0gblXHu4x8S0o=;
        b=I8M73xPzO32m+T4bnJ4zBb9MEdBTU1o+AOLUNIZq9tX2hNDLClGPplylY1AW13akHC
         ZkHHKZrfMwsgq0x5dwvmJOEP4iqC2VukOdp5ID7EIvOuyzoLuRnXRM7vcXETaRrUC6cQ
         FTlnET7/je/RJsIKvCWtK0uAkvw58vts3ZWmjTRnzen7J7SYNzTyy8VQVmz0Gw42BB2V
         tyoxKuUIu5tkIoLXR28J9M/3olv3jj4RcrgHoWmZb+IOG91UnyNOWm8+zt2idf9+uvcP
         bbDmkTt7dzTz6TOybxzHN98A/aEilDIVBGTb6N2zdIYp5Jb2Z2JXrxyBaQqyVZfS9Pyf
         HDFg==
X-Gm-Message-State: AOAM533UvDeJ3OXCpFEKaL95AS81unEl5jEJxGgAjgrCsaTykWyOxW4Y
	xxDEwkXbZWd61TM0X34n6uA=
X-Google-Smtp-Source: ABdhPJwqJzCvFH5QzdMir//AFtuNEuWDYX6hToiSOLLJMgdSeRO8JZQFjtj/Myl4NQ+iUo8ExOHhbw==
X-Received: by 2002:a1c:411:: with SMTP id 17mr394294wme.158.1633258034811;
        Sun, 03 Oct 2021 03:47:14 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::f816? ([2a02:8108:96c0:3b88::f816])
        by smtp.gmail.com with ESMTPSA id m5sm13078178wms.41.2021.10.03.03.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Oct 2021 03:47:14 -0700 (PDT)
Message-ID: <6b5c6c02-7c66-1315-fc60-d11804d40adb@gmail.com>
Date: Sun, 3 Oct 2021 12:47:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2] staging: r8188eu: core: remove unused variable
 pAdapter
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YViKDzqX5isFX+gv@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YViKDzqX5isFX+gv@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/21 18:34, Saurav Girepunje wrote:
> Remove unused variable pAdapter in Efuse_Read1ByteFromFakeContent.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
> 
> ChangeLog V2:
> 	-Remove unneeded line break on Efuse_Read1ByteFromFakeContenit().
> 
> ChangeLog V1:
> 	-Remove unused variable pAdapter in Efuse_Read1ByteFromFakeContent.
> 
>   drivers/staging/r8188eu/core/rtw_efuse.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 

Looks good to me now.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
