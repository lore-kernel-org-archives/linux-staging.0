Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FFC1857
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 05:52:47 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id fd6so24164429edb.5
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 22:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qXZuzdMIsSYM+D0zF4cI4kdnqVrGeqluJlkjXVrbHUo=;
        b=br0BOd9JWtp3p8yPpF/OnoN29KXjf1tmUnKc4jHNFGjjLORcExuG2JlojRl7/L5GL8
         zF2cEZPR4ZOyUmukMngnnFr3+Q+uxoigPeTF4sA6nRbIBTPwU89208f3rUHltsE1LLUw
         Bw0L8AJfn9S7WntbgFmEjuzZxQLYX/k80b7xROQvwgIqk8y+pjz5LkbT2WkgAiwBYphR
         kmLA5kb2eT55+zxT6MXQv1XwLzvTkCwSbENx42gyZHZXMPNsGD4zwqz2qhT962h2+eW7
         omrx2hZof+scAN/42UuPX25pnZ5Sp5xBieX/yocickgoXzq28v1JFhuUDr3gFseFZpvu
         amgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qXZuzdMIsSYM+D0zF4cI4kdnqVrGeqluJlkjXVrbHUo=;
        b=xHgolZ9bljIDgwTUsbZdKNRaxwUFtTeBusIRcKqWa7thamHrwLJ3jkWUCM5EavQSWH
         tPbGt+KbsqWTDFaPjFIgi74dq6ehMdjFUHnCIm4Bc7r4VmLGm5tOtFko6t7ZppfEUwLM
         Td0UmnbMRY0mPKRnCKm9Pq+9VUrJNgURqcnwy0eU7oyrMNOjmaGO1mkb/De3PfPlVLpn
         4ymYQwKjzVJEriJWWR2XvHyUGRhHqoxaI5Hr5vzN9HUcYMGuBoRigfjydw3u4dMSGvBy
         5uIysxjhrUTDmRyd2+CYQVU/W65CZeJt2XcX6OYBPKgqKFBFI3p/ZMkKXzyTNu8qxqyf
         5NfQ==
X-Gm-Message-State: AJIora+p2xeTJ9r8ZlEjOEMIQq6wLv+jp01rDJ8v7bJWnRQUiB4fN01P
	iJvOpHhHTuYfLHpDFpct5DQ=
X-Google-Smtp-Source: AGRyM1sHYj272DJZDqR+/VB0RgZIX/8moaVQPYZZf836p/96v4eCGhQHTL8dA/m/Ps/q7gBqPtXw0A==
X-Received: by 2002:a05:6402:5255:b0:435:bec2:9e33 with SMTP id t21-20020a056402525500b00435bec29e33mr4739267edd.398.1655963565560;
        Wed, 22 Jun 2022 22:52:45 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id t11-20020a17090605cb00b0070d742804a5sm1243688ejt.150.2022.06.22.22.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 22:52:45 -0700 (PDT)
Message-ID: <378d9e97-e248-dbfa-94f6-216e2e8cc609@gmail.com>
Date: Thu, 23 Jun 2022 07:52:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] staging: r8188eu: Make rtw_signal_stat_timer_hdl a
 static function
Content-Language: en-US
To: Chang Yu <marcus.yu.56@gmail.com>, Larry.Finger@lwfinger.net
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220623043855.407208-1-marcus.yu.56@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220623043855.407208-1-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/22 06:38, Chang Yu wrote:
> Make rtw_signal_stat_timer_hdl a static function instead of a global
> function.
> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---
> Changes in v2:
> Added static for the definition as well
> 
>   drivers/staging/r8188eu/core/rtw_recv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index cc91638a085d..6564e82ddd66 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -24,7 +24,7 @@ static u8 rtw_rfc1042_header[] = {
>   	0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
>   };
>   
> -void rtw_signal_stat_timer_hdl(struct timer_list *t);
> +static void rtw_signal_stat_timer_hdl(struct timer_list *t);
>   
>   void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
>   {
> @@ -1794,7 +1794,7 @@ s32 rtw_recv_entry(struct recv_frame *precvframe)
>   	return ret;
>   }
>   
> -void rtw_signal_stat_timer_hdl(struct timer_list *t)
> +static void rtw_signal_stat_timer_hdl(struct timer_list *t)
>   {
>   	struct adapter *adapter = from_timer(adapter, t, recvpriv.signal_stat_timer);
>   	struct recv_priv *recvpriv = &adapter->recvpriv;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
