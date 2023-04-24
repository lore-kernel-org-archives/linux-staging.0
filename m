Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340129A9
	for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 18:37:34 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-95227e5164dso140923466b.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682361453; x=1684953453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bK4MMoXKg4ULLWukLYcP4UXrLxtpZwZjuZPAMicfii8=;
        b=mvU9HFEhh369bW2OC9zsu7Te+7wYuxkW+0Yez6er5px0FYYusK0sxE//hdnPKXjOiK
         d0XFkZjSz+8/eahZLx3BJoeewemyHF9qFDGeYtITvrQj32gmMHt94IVKfmJqhTXzsMNt
         dpAP7Ww0cnmFTJhhi05Do/ZRA3/ZFVEArQ50HfGWGGCApyP6j9c+2X/bSbtfXzq78Kwa
         3b/H53gJFsxaaCU2xb5LERV3TFqSJFAN5fpqW9utandE6cUTIdiWBqxjZDsK+NheGejC
         X7kftoPR1y6d6Tbkk/beFVJuB1iwbvq2xYwD9yfK4dnqH+Mm65WccDCar+XMw7hp8Y57
         YuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682361453; x=1684953453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bK4MMoXKg4ULLWukLYcP4UXrLxtpZwZjuZPAMicfii8=;
        b=VrRN/XMVG5JujoEln0LarEtpMf8zAjDSpeJ4OidMyrQExwjbJ6X6Iaxh2wjRCLYSt/
         iWbNJDfNpVUty7MNukAUR9fVmjeBo8uJGnNLWIPzHPeGbzCOgC/t0skCbMM4IY1In8jV
         P/M+LBDEh2d4xgyZNQ5z4MKcKMFfaRlHmDXbROjMOJJmG4x24c5iM/O0L8cdFkhPEOXl
         nYaRoxkgUJmjGIaomDZS3Tx817+pJh2+weqFk8e8kD1wEPSBH9piFC1A5kbdXZBGV6xd
         pDtyw+zqtRDEwRBgoeDnNIqMNsiMbpWPmiQQAnB76avVhLQWKCzVOnTgm7HzHU94a2HR
         CnRg==
X-Gm-Message-State: AAQBX9f0dZFoWQls7rYfc+d6IY224oZEZ0C4e9+dHwKah20yvVBLBWpO
	qq86+NNjFlSlMTsM/AJ5Zks=
X-Google-Smtp-Source: AKy350brImQXUbFrBUSAHxEvyP2HKo9rOfKEQbvNEbyhiyLaRc4Y+bUAKMocgR22ATBRDE/NOtCD4g==
X-Received: by 2002:a17:906:4bc2:b0:94f:31ed:7543 with SMTP id x2-20020a1709064bc200b0094f31ed7543mr12035416ejv.7.1682361453064;
        Mon, 24 Apr 2023 11:37:33 -0700 (PDT)
Received: from [192.168.0.103] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id gz19-20020a170907a05300b0095076890fc1sm5820081ejc.1.2023.04.24.11.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 11:37:30 -0700 (PDT)
Message-ID: <695a4474-9a46-a9ee-2ec5-04dbcb68ca0c@gmail.com>
Date: Mon, 24 Apr 2023 20:37:29 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 0/4] Remove unused rf_set_sens variable
To: Yogesh Hegde <yogi.kernel@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1682358035.git.yogi.kernel@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1682358035.git.yogi.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/23 20:03, Yogesh Hegde wrote:
> The rf_set_sens variable is declared but never set, so it is always NULL.
> Cleanup the unused rf_set_sens variable. Remove functions
> _rtl92e_wx_get_sens and _rtl92e_wx_set_sens which always returned
> error code after removal of rf_set_sens variable.
> Cleanup unused max_sens and sens variable.
> The patches are required to be applied in sequence.
> 
> Changes in v5:
>      1. Rebased onto latest staging-testing branch per feedback from
>         philipp.g.hortmann@gmail.com
> 
> Changes in v4:
>      1. Split changes into patch series per feedback from
>         gregkh@linuxfoundation.org
> 
> Changes in v3:
>      1. Fixed description to fit within 75 chars
>      2. Added suggested tags
>      per feedback from philipp.g.hortmann@gmail.com
> 
> Changes in v2:
>      1. Removed function definition rf_set_sens
>      2. Removed usage of variable priv->rf_set_sens
>      3. Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
>      4. Cleaned up the variables sens and max_sens used in these functions
> 
> Changes in v1:
>      1. Fix comparison to NULL of variable rf_set_sens
> 
> Yogesh Hegde (4):
>    staging: rtl8192e: Remove unused rf_set_sens variable
>    staging: rtl8192e: Remove unused _rtl92e_wx_get_sens function
>    staging: rtl8192e: Remove unused _rtl92e_wx_set_sens function
>    staging: rtl8192e: Remove unused sens and max_sens from r8192_priv
>      struct
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 --
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 45 --------------------
>   2 files changed, 48 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

