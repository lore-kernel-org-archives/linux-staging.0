Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D5114A88
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 20:04:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f80cbc37c5so9052105e9.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687205061; x=1689797061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tcn+J35INb3hFuMDcDSiz8xDpOjqS6XsU0Ov32vheoY=;
        b=BkIDGp9FpReMXXMGkFcd26WoGyQiMHLBN7jA7QTTjk2ZDcG8/7Ju5rXn4YkYR3M5rf
         qiXwO8my894B8qybcvyBjmNCQ+2o7wwii19kFtHOYfPkxLB2gPDDfpTU8IasCThMBst8
         eBNR+BhGa2v/uykN67xqK9YANNoQN0LpNUpedGKg2Af6cyLpXs88iQ1R8B1KsDJCcJwy
         cL7fWSfAcMFELmurhRparFV8qk4t5KhKZ4UWCg9F+nbrXOWbmnyVsBneMj+TbThFArEh
         30fFs2MGj0X/1VMVE+FgG6xv+NeEdX5HDqlz/4mrc4k4WAwMok6DzZweLgLk76k2mrMZ
         JYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687205061; x=1689797061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tcn+J35INb3hFuMDcDSiz8xDpOjqS6XsU0Ov32vheoY=;
        b=iIDmDEEvpKNZxWmUAQshAm1mxVfP06dEtnyDPH/+8K+enmuL7tqg31e5rgWWt1C2Qm
         vzZztSL0TNLdNqRzBAyAaqtvHT7hmCePnQcAi2Dj3XkJcsrXtVtU05czDW3iyFtkBWDb
         e9r9DOdTWlVl/3MYTvnN4J1oRd8pljdvNczwmA/ft0I5EXkVDjJS5S6WBZJxl/sH6kGs
         C8a+SJW2BI85N4gW/Mfr2RH4HUMyA2mAZbuPLA07wysDVTU+igBqyF1zkvMkBMaIpW6X
         bG7FlRA3TOYIB6YDknj+gCBq90B7MJhij9RWeVbG7W9oKMitBAhezFGI+hWluSpKA6Qy
         MVXQ==
X-Gm-Message-State: AC+VfDxSyCLqagyP4505R9FfWd0mWASFhFoPG+dC1vtqg9lnwCLiobGK
	e9BUfc8a8okOPeJ6GiANGRM=
X-Google-Smtp-Source: ACHHUZ7qFZxrOdeG2jCPahv1uG7n7QLqg6igoWM0kmtf4YS2nFMqKdX2ruUDtr7gQvQ2B0rvGBwWzw==
X-Received: by 2002:a05:600c:4e10:b0:3f9:9a6:eb68 with SMTP id b16-20020a05600c4e1000b003f909a6eb68mr4470009wmq.3.1687205060501;
        Mon, 19 Jun 2023 13:04:20 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id x23-20020a05600c21d700b003f427687ba7sm543107wmj.41.2023.06.19.13.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 13:04:19 -0700 (PDT)
Message-ID: <d1030525-4b62-10dd-2b2e-1aedaf489324@gmail.com>
Date: Mon, 19 Jun 2023 22:04:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] staging: rtl8192e: some simple cleanups
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230619150953.22484-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230619150953.22484-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/23 17:09, Michael Straube wrote:
> Four patches with simple coding style cleanups.
> 
> Michael Straube (4):
>    staging: rtl8192e: clean up brace coding style issues
>    staging: rtl8192e: convert else if sequence to switch
>    staging: rtl8192e: remove return statement from void function
>    staging: rtl8192e: remove comparison to true
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  3 +-
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 11 +++---
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  3 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  3 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  6 +--
>   drivers/staging/rtl8192e/rtllib_softmac.c     | 39 +++++++++++--------
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  4 +-
>   7 files changed, 40 insertions(+), 29 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
