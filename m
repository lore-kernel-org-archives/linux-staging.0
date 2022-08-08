Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F47A
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 21:40:55 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id z20so11027206edb.9
        for <linux-staging@lists.linux.dev>; Mon, 08 Aug 2022 14:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gkFvTJ+lMEAnmpJeB3TZKbAbGAultpKGgkndxtQgwnU=;
        b=PGF12FrKfQc8uLPYrpkrJL/G8CFXZQsXCrJCtRmMGovlq2aaxGywhxxwjH2ondvzpb
         dvp8x6hM6vOTPMbDv6o5Uk7e624rHMBsHSOaOyajzjzKcy5vwtVY8+DYUcqd3qR+SaX9
         f1nrl5lgYhaI0UtHEqglEgxoBHuesGV8JSv/4a4nb0rNxpKoKctMprtF4rqG8IQmtb9/
         /A1pvPrZwLsv4P2m3VpYWpY8jPZebmdKZpFIQ4BmPGXN2XZGT8FpQUwtw5t/MoFxD8w+
         4Gj1PJ9KJ1ePs1YDjnZyN5S9Cs+QXI1PmJVJCFfbQ0dWGfUy5ORbURStuJ9xbea48+cv
         9+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gkFvTJ+lMEAnmpJeB3TZKbAbGAultpKGgkndxtQgwnU=;
        b=pJ4v73PELebTUdKWDS7cRWZqqjHpxu1z0d8dsZ6cmy8wYirFo6WvLY29akfFMrLH1G
         aXf+QHC6/TAhNB93hJQxNyM7L2Hr6+/Z6iHSeItgU0UXaGsr4HkjgX6QJrIbsd3lp+7D
         1tEOKfuVjP1j4kqYG3f6fxdxjR9nANaUpo+d8tiCnJOJmUETjrrYfYecAwTc8+txANjb
         MlsrWMrHz6GS8JGgzJhtl8OuktJnJkJEUH7+jVwDL6zt09UBipHRGbHsDFSPiwnDMU24
         IVUq6AXqMD5zJKOJutm4FDhPqoE1xtuQhtK05ToR+6K7Qovc1C3hwWO2/UtohAzMJg8s
         Jq9A==
X-Gm-Message-State: ACgBeo0TUyGx3CtsG7eMgknL3nlcHIkC0yCc+6eEfnKkcDifNZQsmczK
	hVz1gGro6Cd8u/iS5JG4Mdc=
X-Google-Smtp-Source: AA6agR4nKPcmWadEOFeDp+tkJIwTtHVKgfyB9VaRZMUXB264prfV+TwmvsIgDSjtVNv5wTkK/bJqTw==
X-Received: by 2002:a05:6402:1d54:b0:43d:280c:f25b with SMTP id dz20-20020a0564021d5400b0043d280cf25bmr19705130edb.379.1659994853960;
        Mon, 08 Aug 2022 14:40:53 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id u25-20020aa7d999000000b0043bc19efc15sm5082775eds.28.2022.08.08.14.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 14:40:53 -0700 (PDT)
Message-ID: <db7b4ace-d8e7-a8c9-12c8-66049043ea32@gmail.com>
Date: Mon, 8 Aug 2022 23:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: do not spam the kernel log
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220808065023.3175-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220808065023.3175-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/22 08:50, Michael Straube wrote:
> Drivers should not spam the kernel log if they work properly. Convert
> the functions Hal_EfuseParseIDCode88E() and _netdev_open() to use
> netdev_dbg() instead of pr_info() so that developers can still enable
> it if they want to see this information.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ++-
>   drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index 5b8f1a912bbb..58a193334b91 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -688,6 +688,7 @@ Hal_EfuseParseIDCode88E(
>   	)
>   {
>   	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
> +	struct net_device *netdev = padapter->pnetdev;
>   	u16			EEPROMId;
>   
>   	/*  Check 0x8129 again for making sure autoload status!! */
> @@ -699,7 +700,7 @@ Hal_EfuseParseIDCode88E(
>   		pEEPROM->bautoload_fail_flag = false;
>   	}
>   
> -	pr_info("EEPROM ID = 0x%04x\n", EEPROMId);
> +	netdev_dbg(netdev, "EEPROM ID = 0x%04x\n", EEPROMId);
>   }
>   
>   static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G, u8 *PROMContent, bool AutoLoadFail)
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index cac9553666e6..22e91657f3fb 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -635,7 +635,7 @@ int _netdev_open(struct net_device *pnetdev)
>   		if (status == _FAIL)
>   			goto netdev_open_error;
>   
> -		pr_info("MAC Address = %pM\n", pnetdev->dev_addr);
> +		netdev_dbg(pnetdev, "MAC Address = %pM\n", pnetdev->dev_addr);
>   
>   		status = rtw_start_drv_threads(padapter);
>   		if (status == _FAIL) {

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
