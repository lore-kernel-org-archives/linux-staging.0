Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFBE2C80
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 17:00:01 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id g10so47861361edj.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Oct 2021 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/S4TbbqJ23OevpDNdzwilAgRc7Ey8vFjn4B+yO7I0Mw=;
        b=C5blQcDoRVGc7Qc2UZMBCbYfGNIZv8pfo+giJTKSvuxFodG3Bh2wK31THiF3WfLErY
         aqv3lYUkQV89b48xIqs45qS+oio7ltBpe77myIkrv+obSYV+LfKPQQOsA87POcAg7j8A
         wTTF0UbOXIB9t8DVGg6l+0oki7UJNnJTLMfdGrvKkBV3/wUBwVAPF0HtzIvxYYY+hf/I
         yptLeafL4yc5ru57Jgl2vrNSkNzg1bJcnndZqXgtp0RKlxEzI2TM/92sFSfZoc6H5gDN
         6hT/qQqC+eMzbznIeAzyJV53Cx6l4vCQgaaYmLW3GekWMUnmiL06ij8DvoMWoCvHRRxD
         59wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/S4TbbqJ23OevpDNdzwilAgRc7Ey8vFjn4B+yO7I0Mw=;
        b=7+7jjv43QS8gjMqDp5mHHHQd5Q2yI5sluQKZTCm8KFo51pm/0fRUnSZpodhEEMbnaW
         xCQ4DD4xjso9bHl7+a06cmZLuVWQQYRawHRtT/4Rpjas0PQlRFjNlzr0mmtlrvYk/xTH
         u4Ht4B/tHj3oqrhXebvYCE3SOE0oGyM01wtKWiMFNbe8bK1i4lr6ITygdE3ELlhSjNkJ
         ocQPhcxy6Zc7r5uJKgXmqY36oKiNiHklPHFmPClEFts/8xYFWtFvDXKplS09UL6WAhkp
         5kZosWCCH1YrneMkEdQ1llev9++3fobx0ChLnz93QdKaNYihCKilQ4mVtza61SrkB/Fo
         mmJg==
X-Gm-Message-State: AOAM5308041MMY1rXH/XzH/FI5hd7ciDDzgpr0jRmflF0RwFhGrii3cf
	x5jqhy8kzDJhINoxFZC8ano=
X-Google-Smtp-Source: ABdhPJwGim2sAuUJjOOzubQDgq0virRWDQidwhYrTcrDP2Ve43aANTc3khREkOgXW8xlGIEUyyCG+A==
X-Received: by 2002:a17:906:5cf:: with SMTP id t15mr12924046ejt.375.1633798799908;
        Sat, 09 Oct 2021 09:59:59 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-109-12.retail.telecomitalia.it. [79.43.109.12])
        by smtp.gmail.com with ESMTPSA id c11sm1482502edw.5.2021.10.09.09.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 09:59:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com, linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: simplify the return statement.
Date: Sat, 09 Oct 2021 18:59:57 +0200
Message-ID: <1661874.ovfstkzlfj@localhost.localdomain>
In-Reply-To: <YWG3oIchovDZnPl8@user>
References: <YWG3oIchovDZnPl8@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 9, 2021 5:39:12 PM CEST Saurav Girepunje wrote:
> Remove the unneeded and redundant check of variable on goto out.
> Simplify the return using multiple goto label to avoid
> unneeded check.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 29 ++++++++++---------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/
staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 0868f56e2979..574fdb6adce7 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2282,18 +2282,18 @@ static int rtw_cfg80211_add_monitor_if(struct 
adapter *padapter, char *name, str
> 
>  	if (!name) {
>  		ret = -EINVAL;
> -		goto out;
> +		goto err_out;
>  	}
> 
>  	if (pwdev_priv->pmon_ndev) {
>  		ret = -EBUSY;
> -		goto out;
> +		goto err_out;
>  	}
> 
>  	mon_ndev = alloc_etherdev(sizeof(struct 
rtw_netdev_priv_indicator));
>  	if (!mon_ndev) {
>  		ret = -ENOMEM;
> -		goto out;
> +		goto err_out;
>  	}
> 
>  	mon_ndev->type = ARPHRD_IEEE80211_RADIOTAP;
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
> @@ -2322,22 +2322,23 @@ static int rtw_cfg80211_add_monitor_if(struct 
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
> 
> -out:
> -	if (ret && mon_wdev) {
> -		kfree(mon_wdev);
> -		mon_wdev = NULL;
> -	}
> +err_register:
> 
> -	if (ret && mon_ndev) {
> -		free_netdev(mon_ndev);
> -		*ndev = mon_ndev = NULL;
> -	}
> +	kfree(mon_wdev);
> +	mon_wdev = NULL;
> +
> +err_zmalloc:
> +
> +	free_netdev(mon_ndev);
> +	*ndev = mon_ndev = NULL;
> +
> +err_out:
> 
>  	return ret;
>  }
> --
> 2.32.0
> 
At a quick look it seems that now you unconditionally free memory and free a 
network device immediately after the last memcpy(). 

Why are you doing this even if no errors are returned from device and memory 
allocations (i.e., while "ret" is still equal to zero)?

Thanks,

Fabio
 



