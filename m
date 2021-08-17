Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA22FAD
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 06:55:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j12-20020a05600c1c0c00b002e6d80c902dso1431887wms.4
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 23:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AR7pc4AE2X9QocS3y7IAlhRBIiIOCoGNDxzVV9D+6Os=;
        b=BkMOYWOtMCIN3yujvpbGZn88HUevvRZbMYfDp2t7z6fyIy6FWuj4W/6mESxXk2nLyk
         MyGWD5JJ7qmU6ltT/+LRuUenOfk85r8BSMzDvgB4jYh73wOaiIOb1N9rYYRMQZjIr2vq
         BSnxjesVLJfXonkIaTPilQAzAvE0+mtz0oOn5FC1AtxfsedpbSEaCrOX4SBFm5ZxqjNO
         ylvTfDtjLlfQc9JCMJNz/4bMAu6f5XvsQZembls5tzdPIDV/4+oUAxebBXihtgg0c0qM
         +ZVKHBdAPrT8KfX2/ELaQ7EYcPrGr6eOtprJLbF1MfdA4H26LqplKyN7nhjHywUWiYpc
         IzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AR7pc4AE2X9QocS3y7IAlhRBIiIOCoGNDxzVV9D+6Os=;
        b=gxg944cfICwbjMvjr3WMk1RHJf/hyXRCu/XchRxBgGFz5pdEVm3I8zU5uc18QFeI9F
         W9GCnkY7ykTCmxUZK9y8CPZF1latjQV9WYEzfjb0zq/+DzcYUFu+ESfY4+Ofb7or4hJw
         uya0eRbvcIF6KymZ9Ut0iq0VVz9zDtb7iwC1msQsbpJTPTBVXRxCu7oi/eprw5RvOmZE
         z06omDisSBGhEAcoD5SYf/heuK7AwGKw1FeM8JFPKzWuoME/knKDYH9ZBBdDLM3Pkf0x
         2PWhadm7+leXqka8igSQGLtkKXyWKIqWSMLhC7Ai6DY3kHE0Ne688Ki6pxRxE8Sw6ZX+
         1onQ==
X-Gm-Message-State: AOAM532SOSinglm2ZqGgCReRLq1ZbeZ7bybRq5YCc+FNLftqxDowmOtl
	CndLH0ajvZQPFKRjNWUjDGs=
X-Google-Smtp-Source: ABdhPJxxJx9dmMiiaVxEreQVfXCMJO1ePRFVrDb26mI+viVc2P8jEg0A97tcuhlpKsWBAvjjl4q+PQ==
X-Received: by 2002:a05:600c:3b9c:: with SMTP id n28mr1686470wms.15.1629183302115;
        Mon, 16 Aug 2021 23:55:02 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::4058? ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id u16sm1138248wmc.41.2021.08.16.23.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 23:55:01 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: Add spaces before and after logical '&'
To: Abhishek Anand Kulkarni <kulkarniabhishekanand@gmail.com>,
 gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210817022628.GA6595@abhishek-Lenovo-ideapad-110-15AST>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <6957e465-7250-c5f4-759f-c802391268e0@gmail.com>
Date: Tue, 17 Aug 2021 08:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210817022628.GA6595@abhishek-Lenovo-ideapad-110-15AST>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/17/21 4:26 AM, Abhishek Anand Kulkarni wrote:
> Fix Checkpatch.pl warning to add space before and after logical '&'
> operator
> 
> Signed-off-by: Abhishek Anand Kulkarni <kulkaraniabhishekanand@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_ioctl_set.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> index a7f966a..570f25f 100644
> --- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> +++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
> @@ -630,7 +630,7 @@ u8 rtw_set_802_11_add_key(struct adapter *padapter, struct ndis_802_11_key *key)
>   		struct ndis_802_11_wep *wep = &padapter->securitypriv.ndiswep;
>   
>   		wep->Length = len;
> -		keyindex = key->KeyIndex&0x7fffffff;
> +		keyindex = key->KeyIndex & 0x7fffffff;
>   		wep->KeyIndex = keyindex ;
>   		wep->KeyLength = key->KeyLength;
>   
> 

Hi Abhishek,

there is already a pending patch that addresses this.

https://lore.kernel.org/linux-staging/20210816155818.24005-9-straube.linux@gmail.com/T/#u

Regards,
Michael
