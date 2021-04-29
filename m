Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22222F80
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 07:26:24 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id l4so98328134ejc.10
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fKADZqVqSc0IQida3fCMkFkfc3lO4PjliPGIsHxxals=;
        b=AIjRR4E3nM59Xx7lq22qZifXk7zFyDH16ehnF8+kS+odSosc2HjT9yf6HLsME8yCZN
         3unezDVryQUxBu18wamkoKk96UfqcxfcLUhNgYeKbwhkhxtxokmrHBACYbg0YPmELa8H
         9icRo0oxhbE0Umgz9BWVN75nDycpXP0oF0lEIeZ/SGTHWeN/zOuYRTXwDS7ba9hm1LDo
         aqP4x6kk7eHJsA51LPiPvwNrNzGV/sOnaoNEQLDjPRf5V1IkJmGeZTKPdoH2ev4TbIrV
         pfC6oWgteX5fPnGT6SVvtLd38YPJjbFSq8mUO3pQ0MUwrWvUNgvncDU01gP4DozvxQps
         UjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fKADZqVqSc0IQida3fCMkFkfc3lO4PjliPGIsHxxals=;
        b=cmYhIp1TrCdtG/gHupshvyO7bKNJLKnzgzSj+62aPOb1Or6sfp5kdELMvwauItyXsL
         KbJeQ/VV7K84KDIHpBVAIjnXPYRK8iXOCC7O7IRsxgEeCq5Stl3/mbEsJkxLk39ym/BF
         J6Wmg8BMkLtAzg1lLES2S0VLHLcHI5ay0+RDJCux2mIC9CuMdMol+1jGNY7LWbm+26tn
         SUMDFF7Z1FldwGQLr9vwQ5/r59rKpTXAKOwYaPb5oKUGQWJEVXVNUR6jzHGyncBFbflu
         iUbSGo0M2p72iQhBAYVD3x6YKnULSDhkU3yy9ZkW3NXAX05co9G/0K4Fq0hORCCjkTk3
         eO1A==
X-Gm-Message-State: AOAM531tVNmnHneOq47UAYoDC3eKlMffsckIG9/5DUYPXI0dud7PowD4
	dL7Fr8FQvlYJqna7FUJkaMw=
X-Google-Smtp-Source: ABdhPJx36094XEd9oE9B0Pr9ryHSzM/l/3aZPDz4WPmIrlL0GbRn/4rlKygM5Br6EUQwTZyo68vcpA==
X-Received: by 2002:a17:906:7f97:: with SMTP id f23mr14673562ejr.74.1619681183343;
        Thu, 29 Apr 2021 00:26:23 -0700 (PDT)
Received: from agape.jhs ([5.171.81.14])
        by smtp.gmail.com with ESMTPSA id u11sm1688315edr.13.2021.04.29.00.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 00:26:23 -0700 (PDT)
Date: Thu, 29 Apr 2021 09:26:20 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: rtl8723bs: hal: Remove
 set but unused variables
Message-ID: <20210429072619.GB1409@agape.jhs>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com>
 <20210428113346.28305-2-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428113346.28305-2-fmdefrancesco@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Fabio,

On Wed, Apr 28, 2021 at 01:33:45PM +0200, Fabio M. De Francesco wrote:
> Removed four set but unused variables. Issue detected by gcc.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 082448557b53..96cb4426a0f4 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -3900,14 +3900,11 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
>  			u32 cmd;
>  			u32 ra_info1, ra_info2;
>  			u32 rate_mask1, rate_mask2;
> -			u8 curr_tx_rate, curr_tx_sgi, hight_rate, lowest_rate;
>  
>  			cmd = 0x40000100 | mac_id;
>  			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
>  			msleep(10);
>  			ra_info1 = rtw_read32(padapter, 0x2F0);
> -			curr_tx_rate = ra_info1&0x7F;
> -			curr_tx_sgi = (ra_info1>>7)&0x01;
>  
>  			cmd = 0x40000400 | mac_id;
>  			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
> @@ -3916,8 +3913,6 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
>  			ra_info2 = rtw_read32(padapter, 0x2F4);
>  			rate_mask1 = rtw_read32(padapter, 0x2F8);
>  			rate_mask2 = rtw_read32(padapter, 0x2FC);
> -			hight_rate = ra_info2&0xFF;
> -			lowest_rate = (ra_info2>>8)  & 0xFF;
>  
>  		}
>  		break;
> -- 
> 2.31.1
> 
>

rate_mask{1,2} and ra_info{1,2} seems to be unused as well.

thank you,

fabio 
