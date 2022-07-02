Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D21C32
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 07:14:34 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id dn9so2396537ejc.7
        for <linux-staging@lists.linux.dev>; Sat, 02 Jul 2022 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AsRE8YlofhEgLEGxhfUj7r3VBp8VwwZr4Xhnew/B2oY=;
        b=BIHlzh6ZT6m5fjL4lO0QUi9UDT+wWrBthw1L+2/zYQCYF4XxCtt84dkvBbNayGNGqY
         7Sg8xuJzSOIaan7ahw9xk0uk5VVAGBV5X5qLvRzS/unBgrvntXJPAKhCYEew4P7X9kjr
         lZ/fLM4sPNau3Ai2zmoGv8Rm11j/ePgnvw0PPNujm5L3RK2NOSovogU8ZGPMDJPFlEWG
         05YsYklI9FVheuTDCVD+Wf6l+5SLU/WjqeKCq4Mf7v4dAyRvSs1V9iNAaYrvyNlAEeAz
         hNKXUx9sJKo9ISKN+qnCNcA3xnI5v8gMmpOZldhXPHVcPQs1+yG7DJ0i6Srzze9mhMPB
         DmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AsRE8YlofhEgLEGxhfUj7r3VBp8VwwZr4Xhnew/B2oY=;
        b=C4YVt0WxaeLKDeB3Jf4kMM2nErxosxhuuLHPEErJ23zQfScNoOD7Oq6ajypzyLQwAO
         At5m0x6Vf89/xj7Y6Ni7aGvIP7zLXDiTfO9+DbWaioenpAMgDKPBhDvVZ8Gg4koJR97s
         gU3An5MgYZgo7+X79YH2bd7WseQmfTlk7StfCxeIaDETlXCBWOH1hgk9JwDZmhHucblo
         qO5YQuOxXh6f5fLBD4FMieROh+5g6dSLIkZ/Q4chZ5q8izN0H/hvhZJtlFN6fhwn/r+f
         xYMmbRPLotk2uRJUAIA+XiD93YTDUohFVx+lL+bopfxraRVeZkYBU0oCUA7WT1U3vkG/
         XUlw==
X-Gm-Message-State: AJIora85PPQGbg6cSss6K5FdOiADJYeQfHq1WYTl/XwsfjEqvyF7MBn4
	11v+ScDkvnjXUs8+icYhafE=
X-Google-Smtp-Source: AGRyM1tFfDDmdJhMtK6SVapbGXWqpGAqi8X1CfpJ4tIwqgtqUYWb6F+HjJpRN+t5LdLQhD/Y8qyrhA==
X-Received: by 2002:a17:907:2bdc:b0:72a:47b5:dbff with SMTP id gv28-20020a1709072bdc00b0072a47b5dbffmr15610811ejc.677.1656746074353;
        Sat, 02 Jul 2022 00:14:34 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id o7-20020a170906860700b00722d5f07864sm11179354ejx.225.2022.07.02.00.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jul 2022 00:14:34 -0700 (PDT)
Message-ID: <b3e6cf6e-9185-d9ea-9e2e-15c616e7c76c@gmail.com>
Date: Sat, 2 Jul 2022 09:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: r8188eu: make ffaddr2pipehdl() static
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220702064626.27506-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220702064626.27506-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/22 08:46, Michael Straube wrote:
> The function ffaddr2pipehdl() is only used in usb_ops_linux.c.
> Make it static.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/include/usb_ops_linux.h | 2 --
>   drivers/staging/r8188eu/os_dep/usb_ops_linux.c  | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
> index 641f059ffaf7..966688eedf66 100644
> --- a/drivers/staging/r8188eu/include/usb_ops_linux.h
> +++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
> @@ -26,6 +26,4 @@
>   #define usb_read_interrupt_complete(purb, regs)		\
>   	usb_read_interrupt_complete(purb)
>   
> -unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr);
> -
>   #endif
> diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> index 0269e602b217..220e592b757c 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> @@ -7,7 +7,7 @@
>   #include "../include/usb_ops_linux.h"
>   #include "../include/rtl8188e_recv.h"
>   
> -unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
> +static unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
>   {
>   	unsigned int pipe = 0, ep_num = 0;
>   	struct usb_device *pusbd = pdvobj->pusbdev;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
