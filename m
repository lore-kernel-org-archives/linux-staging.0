Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C572
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 07:25:03 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id i20so37702640edj.10
        for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKfkGh414B/iRXkK8RbjxGaH4QllS+6UvmAmMf9vRl0=;
        b=lSOMmnyZ1kYF70+Uvy8gOq2A87O2XTg6onjugrMc6BKu51iDGFzKcPRqqgP1FtV4E+
         y5NW/Usep2TaGLRPGWQjcXLiL7aDU3dpJPF6XqWrCQOv6MdYt6Wfz+ntLhsKqcyeVrtv
         mLHdwI2PxPbgzLWMVVEFEvW7bikK/pb6mjlb+9qOD5YaSt3oyeDWrpGMRR5v9mddgf5U
         INVEaumXGAIbzZUTwvWvH7Byi3QZFz0xVY96c1MzXbqgHS6LIBZThn0ZJWJWLu/23pck
         y8nKXnEKxC+t9cwJr5IHP8cFpePoyLMZPPc5XPAUYf8hFQ3kaMRvEJig9NYYL+8m2zoU
         /jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKfkGh414B/iRXkK8RbjxGaH4QllS+6UvmAmMf9vRl0=;
        b=m1MPAWVMQuT4Ho+KGjB9IuVatCT24puDkwjNBMNHFd6X3blQSm0BWQc1Vr6CEwReP/
         jSXhyw5z+MzlILzQCkKjGIiBAEmUnrXkiUvJcgcc3oNRUduA9EQJIyOg/gxhJ1nFBFHE
         nMmZYS7ln0OUsNRj5r6N8P2B/S2v1THhBqCz4Hp0FgD7zS49JMcovtSkvYhMDQMW1ktM
         bsgtzeQ5dkH115dGt1xKWH4+3IY/Veb0/VkJ+kkYuRU3SiNyneRu4YMx0o3KeCD3j7NZ
         5buykEEoNt2UJCMAXgDkPwfiXj7jOKr/Xq3cM12OwDhY34MKryseC9hXUNsptk1KZZ0D
         AhKA==
X-Gm-Message-State: AOAM532EnRH874PKA0niLcNs6EirZldR/IRLEHfQc8BhxdDAvTBmo2kt
	YvwBfX+AjtNA2YJMjXhlWAY=
X-Google-Smtp-Source: ABdhPJwlWnqyUQH7uAsnYIo5cIkre1x/GmihkXFuZOqhpsHQyA1Mw4c0eBlB0ZWnMXHYXFpeAs1LAQ==
X-Received: by 2002:a17:906:318b:: with SMTP id 11mr17107979ejy.493.1633850701293;
        Sun, 10 Oct 2021 00:25:01 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-109-12.retail.telecomitalia.it. [79.43.109.12])
        by smtp.gmail.com with ESMTPSA id eg42sm2131384edb.61.2021.10.10.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 00:25:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, saurav.girepunje@gmail.com, Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: simplify the return statement.
Date: Sun, 10 Oct 2021 09:24:58 +0200
Message-ID: <5843476.m7FxXixzUK@localhost.localdomain>
In-Reply-To: <YWJ0vSrgsiKK7suE@user>
References: <YWJ0vSrgsiKK7suE@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, October 10, 2021 7:06:05 AM CEST Saurav Girepunje wrote:
> Remove the unneeded and redundant check of variable on goto out.
> Simplify the return using multiple goto label to avoid
> unneeded check.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
> 
> ChangeLog V2:
> 	-Add goto out after the memcpy for no error case return with
> 	 ret only. Free is not required on no error case.
> 
> ChangeLog V1:
> 	-Remove the unneeded and redundant check of variable on
> 	 goto out.
> 	-Simplify the return using multiple goto label to avoid
> 	 unneeded check.
> 
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 22 +++++++++----------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/
staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 0868f56e2979..ae9579dc0848 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter 
*padapter, char *name, str
>  	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
>  	if (!mon_wdev) {
>  		ret = -ENOMEM;
> -		goto out;
> +		goto err_zmalloc;
>  	}
> 
>  	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
> @@ -2322,23 +2322,21 @@ static int rtw_cfg80211_add_monitor_if(struct 
adapter *padapter, char *name, str
> 
>  	ret = cfg80211_register_netdevice(mon_ndev);
>  	if (ret) {
> -		goto out;
> +		goto err_register;
>  	}
> 
>  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
>  	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);
> +	goto out;

I think this is the right thing to do in order to remove the bug you 
introduced in v1. Well done.

> 
> -out:
> -	if (ret && mon_wdev) {
> -		kfree(mon_wdev);
> -		mon_wdev = NULL;
> -	}
> -
> -	if (ret && mon_ndev) {
> -		free_netdev(mon_ndev);
> -		*ndev = mon_ndev = NULL;
> -	}
> +err_register:
> +	kfree(mon_wdev);
> +	mon_wdev = NULL;
> 
> +err_zmalloc:
> +	free_netdev(mon_ndev);
> +	*ndev = mon_ndev = NULL;

Not sure about what the Linux coding guidelines say, but I think that 
assigning NULL to local (on stack) pointers (mon_wdev, mon_ndev) at this 
point is unnecessary. There is no risk of reusing them after the "out" 
labelled block, because at function exit they are destroyed when the stack is 
unwound.

If you decide to remove these assignments, take care to leave "*ndev = NULL;" 
as-is (why?).

Aside from this minor objection...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio

> +out:
>  	return ret;
>  }
> 
> --
> 2.32.0
> 
> 
> 




