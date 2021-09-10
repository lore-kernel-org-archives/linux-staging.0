Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFA63FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 21:06:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so2228511wms.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TLj/ONS/sld60sqpERNMaRNSbW3piuAZR1aelVesNnA=;
        b=oqt0cnUo8pv7evLVlDPWL3BXa3YP8fcn/cOCTgH8vK/bPCqsSpNX5Xh4U20UwQo8M7
         +ASBUrAHSx7h2DXlCsDS3XNFhYoR3mbl1vMqAc2bwGYrj2724OitCf8Ue9xHQrTY4yjX
         8OmZIBo4gxd836Zs/m3/HrL1VAYITLn+HwsEm+mKjCYGr1n0WLRMBJIBLKUJ69Irdbpi
         UgANyYYdt3TMjaON4V+XzJy+5l2JAFWB2RJHkqTzywYDLL6GzvN5mqu0NoKbCTfUoluK
         QGf1EWzl6PlTtt98g8sPqYhbJVCilGqZrg0u03JCKLSIrNxXdDn/YfIicRH4sBqLeg01
         iYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TLj/ONS/sld60sqpERNMaRNSbW3piuAZR1aelVesNnA=;
        b=mI3Tyzh6ypgITrHmlnyoLpDcrWAzc96ZkqabxkoIixEPVkM/7n8nSQX4M+RKFu7ScQ
         p5XHa0qUnN7LopL/qpCQ5KHZJuw4O2OkvSIV+ZxvJS07Od1KJzeRL//sot+LasE4hoG3
         K4AvWk/YxJW0ox0khL0hYLzKgSp+c2GU4nIrgffHuN1ZU7yRnlCf+AJVEjgwdL0zSnCw
         n3yNiL7lKPVvBghJVFqxbsASIB9XPGvYwrwCbORMOMVVZDZLwWisyWyVhUYJgmGWSYaX
         RY9YMAlfB75/pvAJZjCWKkJPWwD4opyIPdRbAjrjCfNv7iXlvTscHqDi3Iag8ZW8ubxX
         f0nw==
X-Gm-Message-State: AOAM530CQtWXRb02IUhGC8b8D/D5eoA5ZTPxggV6aQu14bc8CFeDEPKl
	zVBJHKT/3krFOyX8paU8Wlo=
X-Google-Smtp-Source: ABdhPJwSciMCagUQIW5NgDmk7rlPZNnNKEx4aYuocKIOMM/Xa+9+e9yPCBSsYmmvEvjGKxe2xfkTMw==
X-Received: by 2002:a05:600c:3514:: with SMTP id h20mr10302816wmq.98.1631307975545;
        Fri, 10 Sep 2021 14:06:15 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::8fe1? ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id m18sm3132448wrn.85.2021.09.10.14.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 14:06:15 -0700 (PDT)
Message-ID: <79d75d2f-c55f-eb4a-a03a-c54d00b50de5@gmail.com>
Date: Fri, 10 Sep 2021 23:06:12 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 0/4] remove unused usb endpoint functions
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210910202151.4007-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210910202151.4007-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/21 22:21, Martin Kaiser wrote:
> Remove driver-specific functions to detect the type and direction of a
> usb endpoint. Their callers have already been updated to use the helper
> functions from the usb core.
> 
> Martin Kaiser (4):
>    staging: r8188eu: remove unused function usb_endpoint_is_int
>    staging: r8188eu: remove unused function RT_usb_endpoint_is_bulk_in
>    staging: r8188eu: remove unused function RT_usb_endpoint_num
>    staging: r8188eu: remove the remaining usb endpoint functions
> 
>   drivers/staging/r8188eu/os_dep/usb_intf.c | 40 -----------------------
>   1 file changed, 40 deletions(-)
> 

Compiles and looks good to me.

For all 4 patches

Acked-by: Michael Straube <straube.linux@gmail.com>

