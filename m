Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A232CAB
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 20:39:08 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id bq30so5656008lfb.3
        for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fYQwf1MFEi2p+ImntMeAp4Bvczx3GAneP4+zjXqea58=;
        b=FNNt24W5RmK9/Smtd9HW3bxBLmVkJAW6x/7G0FEH0V/I0wWl9NG9yMKTtCC5X9qy7t
         8zpOaOHX+nxIpVNUCF5wAc8kmk1bIrEYIlqzxHh67BXcUTyazwsPtyERm0WSq3SskngE
         1scb/Ds4okAkGm9iTNRiVB5Mn8+0V9Bt/DDpG5jYGcAaOHpExQRZhyyVzXQfmg4QW44T
         czy5q5/XNbLZx1JiQbqeudvIPcUfbkVIdQfpC/QiplVh18yqjPZUlwVNRD342OxF7OT0
         eWHFAJxvcDs7Fj2Q4ny4EJmVKtVsvAwqnlctzRdfmYQsRwRdnSBg1LRsue/KmTv7xvsd
         N+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fYQwf1MFEi2p+ImntMeAp4Bvczx3GAneP4+zjXqea58=;
        b=agddJ/YS/DfeBbF4frnTbnOqvR1Jc8p6cZDV3IeKbhdZd27CC6aTuyzhHQbRpBeU5I
         6nYr9SAJBobPnFCk2YrmNiBfl1BtWN9YgWFDL5/lxIlKDHOppFgYQYZhxP0+VpkxvHCX
         yMv71xxBwea4MPD2LrVrRHwPJ4qWEd4S+J3CpzD3gPbd0FxCXRT8DVyPLxFAuhGkKPIX
         yGPaYMN0anV5VvANImz3mkhdObJeDsj4rGdcrOuW1joldsugGILQTZ7sU3XIvkUrDkVv
         Jc4ZEMEbHwhh6mWjxK0+ORPntKdHEb1VWits7r0LB2unWsNY1NCbZt9j82bmSVe7wWGv
         O82Q==
X-Gm-Message-State: AOAM533XtGt08u67JTtNUCO5AUWmzufGKZaBIrJzLUmi3j1u74tv5dZA
	r7szIb0r7q/s20/x96cQk6M=
X-Google-Smtp-Source: ABdhPJyY+QSeEyckG9WkEcu2jeIkFmNEQtFmAql1ifALgjaJjdhsi26Z3XCpdC8WieZJoX2/PFi1qw==
X-Received: by 2002:a05:6512:c18:b0:44a:9992:28bc with SMTP id z24-20020a0565120c1800b0044a999228bcmr30100438lfu.641.1649882346657;
        Wed, 13 Apr 2022 13:39:06 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id p20-20020a056512329400b0046ba6832cf6sm2861lfe.155.2022.04.13.13.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:39:06 -0700 (PDT)
Message-ID: <b028d269-4dd8-7165-6220-d42c1e0e588c@gmail.com>
Date: Wed, 13 Apr 2022 23:39:04 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] staging: r8188eu: merge _mgt_dispatcher into
 mgt_dispatcher
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220413200742.276806-1-martin@kaiser.cx>
 <20220413200742.276806-3-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220413200742.276806-3-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 4/13/22 23:07, Martin Kaiser wrote:
> All that the _mgt_dispatcher function does is to call a function from
> a function pointer. It's not worth having a separate function for this.
> 
> Merge _mgt_dispatcher into mgt_dispatcher.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---

[code snip]

> +
> +	if (ptable->func) {
> +	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
> +		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
> +		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
> +			return;
> +		ptable->func(padapter, precv_frame);
> +	}
>   }

Looks like each `mlme_sta_tbl` element has `func` member initialized. I 
think, we can remove this check.




With regards,
Pavel Skripkin
