Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE01C30
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 06:10:26 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id e40so5321297eda.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 23:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c9aRMVwYtfkfMlwkA5VyP9vLiqvlVljw+yPYyHTXtbE=;
        b=XNEYz0WpjDgjGstGMDxR+NmBd7nUrys9bGzgDKsIV45z11roggbhCKYBNhCNCtmIYC
         maqk6WGc7vXJdFP20NUQqic7e+FOrVELJrEhioTMp8zMgjufVu01xIn9rD5xNLd04YU5
         A3c4Ncp/uPx5z4obqA5v90No3fQsmTB1qX+h9PGo45ShuXhN5qHWep0IFHHtBRgOARJc
         t6yLh7/WSqya9XyY8QzxPYAEl1yTz3eyx4caDjdqDvATIqQTVnoLo+ozKD2Xfkd7nO6Q
         TV2WgtQcVBfvuHpXCOWdstIOg7n+UoQHCcLtZglA6XTwP6qiOzWofnOk5nWarXov5njM
         uhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c9aRMVwYtfkfMlwkA5VyP9vLiqvlVljw+yPYyHTXtbE=;
        b=HvhHYzJMks1CbhjADoDZ5ZqTcuSyQrxNSgo2kiZDGGRU5R9YX8t/uVRrcCMZroQo0D
         9NH/QgzMcW2MdHh/QfCpH8bmj0hWK2Tg/ivXI3r4C6PP3J4XUVGSvwIi+iK40Rwf9CfE
         XxufiHczZ6P8j74HXMK10oj2do09/JhVgQl0R0l8Dc0TjPocbPAgwbyDsbY6oWX5WY7N
         dEGGjJeJgnFt9AW2co6gUuuPgnXAneUrXM62bZvfsDHJBDRilHAmvwBGe4fVjZhSnygM
         bivryFmWGuWuWyd2eWqLatmCUBFVKUPXTnps1P6McrlUC/vQ2vCXyDNjKQZsOGgBFZKk
         mmYg==
X-Gm-Message-State: AJIora9F1swiCcGJbWuKouhhj+qk/r8sIfcgEknh/1fkwPfDSBE+UCz3
	bfdpX7jAMG7+19jGQmcZKQ0=
X-Google-Smtp-Source: AGRyM1sHU47hdgqgrbU8mfdIQmPvxLpnvEGtRtucKil8fW6N2BdEaIH7NXQajwpKwYiAzyaZku4QCA==
X-Received: by 2002:a05:6402:3591:b0:436:c109:1fa7 with SMTP id y17-20020a056402359100b00436c1091fa7mr23297705edc.208.1656742225416;
        Fri, 01 Jul 2022 23:10:25 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6912:39ab:4063:59d3:a7cd? (p200300c78f2e691239ab406359d3a7cd.dip0.t-ipconnect.de. [2003:c7:8f2e:6912:39ab:4063:59d3:a7cd])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00437d3e6c4c7sm6144249edb.53.2022.07.01.23.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 23:10:25 -0700 (PDT)
Message-ID: <7e78f88f-6957-2734-ddbc-5e6def80f106@gmail.com>
Date: Sat, 2 Jul 2022 08:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/6] Staging: rtl8192e: Added braces around else
Content-Language: en-US
To: Felix Schlepper <f3sch.git@outlook.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 wjsota@gmail.com
References: <cover.1656667089.git.f3sch.git@outlook.com>
 <651f51d9f92e8a445ceaf9f2073f16dd10458a74.1656667089.git.f3sch.git@outlook.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <651f51d9f92e8a445ceaf9f2073f16dd10458a74.1656667089.git.f3sch.git@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/22 11:24, Felix Schlepper wrote:
> This addresses two issues raised by checkpatch.pl:
> 
>       $ ./scripts/checkpatch.pl --terse -f drivers/staging/rtl8192e/rtllib_wx.c
>       CHECK: braces {} should be used on all arms of this statement
>       CHECK: Unbalanced braces around else statement
> 
> The coding style rule with not using unnecessary braces around if/else
> does not apply if only one branch is a single statement.
> 
> Signed-off-by: Felix Schlepper <f3sch.git@outlook.com>
> ---
>   drivers/staging/rtl8192e/rtllib_wx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index db076e819993..b949e7234150 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -304,8 +304,9 @@ int rtllib_wx_set_encode(struct rtllib_device *ieee,
>   			netdev_dbg(ieee->dev,
>   				   "Disabling encryption on key %d.\n", key);
>   			lib80211_crypt_delayed_deinit(&ieee->crypt_info, crypt);
> -		} else
> +		} else {
>   			netdev_dbg(ieee->dev, "Disabling encryption.\n");
> +		}
>   
>   		/* Check all the keys to see if any are still configured,
>   		 * and if no key index was provided, de-init them all
> @@ -724,8 +725,9 @@ int rtllib_wx_set_auth(struct rtllib_device *ieee,
>   		} else if (data->value & IW_AUTH_ALG_LEAP) {
>   			ieee->open_wep = 1;
>   			ieee->auth_mode = 2;
> -		} else
> +		} else {
>   			return -EINVAL;
> +		}
>   		break;
>   
>   	case IW_AUTH_WPA_ENABLED:

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
