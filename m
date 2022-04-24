Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3D7C
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 19:00:14 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 16so285309lju.13
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ba1Aw9kjvnX8uBMGIJqvqtuzJCenFMSeGdyyYUkepxk=;
        b=NFnMcysY/M74wUOTLWsJ3sFRyqsdUE+AYkgczwqIpA6rDA3a+wfKXXF+YsKp6AWVNt
         jKC59xVvScndOiyOSQAqeq8AFPvwMod/EFfPZi6ZCg3L+JuGjbUM2Fu29yCzP5wDlWGH
         K0nMWgoxo1T+1cldA5F2+qyOG8X1RIldYE9q0yGmPa0qyoRbqcoNZHLoIjQ7dWZXeGeD
         D6U0pvddImO/Zwzm4YiDoyUh97jqszNsheMb/PJFNtBPBUGg6j8D7eyDj9cIwYVG+YFk
         kH3y4L9dWxKPMOhcNYnVt3lindfG+TazDXNmfvHxgyYNG6yTifwbxPL6WYaL3x1XqIbN
         2ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ba1Aw9kjvnX8uBMGIJqvqtuzJCenFMSeGdyyYUkepxk=;
        b=sBbi8OZROR62rxIKTf4l7KboD/+IPzSsh3JjSt0jDDpjt6RiG4Xrd2HuXqZVbpCu3s
         TSOEsMVfsnPaumTJizzwdP8oq7ciJzzE0qDsoV+c0k7mE7NBdOTFCHKxTR80KHTbkMZD
         ipapQe05cyegzOBxCsaimB9ygYS8X8lDlKEp1HK+jAaHcj2b9pwLskGbiJJQSzkuvXd4
         VkX23S+DcIVzrD6avs9tJR+OXcdaFQes1Pcq82IYgQVmSTGph4hjLDbuEH0Uk0ynam3h
         ZGB8UBSgD44AEQ9GKL8R4n8BrppwlzRIMWzUdoRwd/GoP3jSxOZZQ8b6IWltEXbaaJue
         +AoA==
X-Gm-Message-State: AOAM533buan6CudfqiN4bhJ2m96nHGQEW90VCXtxG7rW5PMcQHA26bPN
	nZXCPyLfeeDWZ4iid9qW+dE=
X-Google-Smtp-Source: ABdhPJzl1hVYcrCRpTkY9tsTwBZLAxRGlAQCUsllOHHecXAYYp9U31ke66oM5c4aKPk+1VzlO1zUmw==
X-Received: by 2002:a2e:83c9:0:b0:24d:a95d:7b7a with SMTP id s9-20020a2e83c9000000b0024da95d7b7amr9100632ljh.254.1650826812966;
        Sun, 24 Apr 2022 12:00:12 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id f9-20020ac24989000000b0046f5d523564sm1107014lfl.84.2022.04.24.12.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 12:00:11 -0700 (PDT)
Message-ID: <2e4fa41d-cd06-75e4-17ac-120127fe9b2a@gmail.com>
Date: Sun, 24 Apr 2022 22:00:10 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] staging: r8188eu: fix null check in
 _rtw_free_mlme_priv
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220424163132.37007-1-makvihas@gmail.com>
 <20220424163132.37007-4-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220424163132.37007-4-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 4/24/22 19:31, Vihas Makwana wrote:
> There's a NULL check on pmlmepriv in rtw_mlme.c:112 which makes no sense
> as rtw_free_mlme_priv_ie_data() dereferences it unconditionally and it
> would have already crashed at this point.
> Fix this by moving rtw_free_mlme_priv_ie_data() inside the check.
> 
> Signed-off-by: Vihas Makwana <makvihas@gmail.com>

That's good catch, but looks like the check is just redundant

This function is called only from it's wrapper called 
rtw_free_mlme_priv() and rtw_free_mlme_priv() is called from 2 places:

4 drivers/staging/r8188eu/os_dep/os_intfs.c|531 col 2| 
rtw_free_mlme_priv(&padapter->mlmepriv);
5 drivers/staging/r8188eu/os_dep/os_intfs.c|579 col 2| 
rtw_free_mlme_priv(&padapter->mlmepriv);

_Very_ unlikely that `&padapter->mlmepriv` expression will become NULL.


> ---
>   drivers/staging/r8188eu/core/rtw_mlme.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 081c02417..87c754462 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -109,12 +109,10 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
>   
>   void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
>   {
> -
> -	rtw_free_mlme_priv_ie_data(pmlmepriv);
> -
> -	if (pmlmepriv)
> +	if (pmlmepriv) {
> +		rtw_free_mlme_priv_ie_data(pmlmepriv);
>   		vfree(pmlmepriv->free_bss_buf);
> -
> +	}
>   }
>   
>   struct	wlan_network *_rtw_alloc_network(struct	mlme_priv *pmlmepriv)/* _queue *free_queue) */




With regards,
Pavel Skripkin
