Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31E2C81
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 08:54:20 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id y12so51874671eda.4
        for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bm3wXMJ4rfAFeHpv39wPQyGuIwFIJmid7Nqz8YDvf6o=;
        b=TVRxYTOg9IKOYxMjmO5BVUckr++KoEUEpL954fJ9Q7NgyJXNDkssAFnXWfqVFzgKYf
         DjxjEd7Ec6/4L395nQagHYjuFowEXREwc9rLmjwqvqgdMpPzuKUKu+cl+yRujtVoMXhb
         T3Jhz4g71lBjVk5PNpSzj4t7kvkZOjoajD2YHimdniVsBaqlm0rKqBOsRg1+pFFCM3mu
         IsrfY1bibm86Y8/XiDfxJnZXmwMl6iJnkvUlueUJZ8TOoxFnyqEevUDz9IPfscJ6gZi4
         WgUnDVxnCrU4bI3id8zPxLFn4GUiUDTIDwyLrzhIP7ncYTJQuXkarYbidsKGVdBx/Fqv
         LliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bm3wXMJ4rfAFeHpv39wPQyGuIwFIJmid7Nqz8YDvf6o=;
        b=FuVacmjbf0Xd33Xkq+3+UEViTFLQE0Ju7Ht91akMHlEoJdq5y3hD1SbAGz2Fpp8wil
         MWhsYdhhXL1D7N4q9w/g5bMQDVrlxCzoAzaEOXpIaHmSQsIGVApOr4rWxwCOGLi/2+T4
         o6PYwG060c8g1RpgK/gaqrclrGCtcTBH9cSmpuGU7frYY7A+XLFsUwRevDjm5sHrhEgu
         sn0UL7mdzFqGf0XCkAJSU1eMlafDLl4NEQs7IYqJ5Pg4BPez0VyWmoq8Y4/K89GrqxAV
         SSCa6hqurbBRwa0FmL2clyBFx5Z3D+c56Yl4F+7bpbJQ60x5/sEQAx592YW9FAE/SxsR
         d6uQ==
X-Gm-Message-State: AOAM532gHT8qwE3yBUNQbEHsTfUyB42yCgFhye3o6gmbKte702npIr+v
	xM/Xsm1q3stJ2CZqfIgiuPI=
X-Google-Smtp-Source: ABdhPJwoKQm0lAofAm+QORUkmLZV/tOjW5jc9AD61qOM7PvkhRw+HXESI56q0RrVqNH9qI8svNtOTg==
X-Received: by 2002:a17:907:7752:: with SMTP id kx18mr25119293ejc.276.1633942458632;
        Mon, 11 Oct 2021 01:54:18 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-109-12.retail.telecomitalia.it. [79.43.109.12])
        by smtp.gmail.com with ESMTPSA id h11sm3130942eji.96.2021.10.11.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 01:54:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com, saurav.girepunje@gmail.com, insafonov@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: saurav.girepunje@hotmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: simplify the return statement.
Date: Mon, 11 Oct 2021 10:54:11 +0200
Message-ID: <2482197.HNbSr4JpUv@localhost.localdomain>
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

Please write versions logs that reflect clearly and unequivocally what you 
changed between revisions and why. Subjects, Commit messages (Changelogs), 
and Versions logs are the "specifics" of your work. There must be no 
inconsistencies between these and the code or the history of the changes of 
the code.

You may think that I'm pedantic, but since I acked your patch, I don't want 
to be misunderstood to be a promoter of approximate or clearly incorrect 
messages.

"Free is not required on no error case" conveys the message that you have 
changed something that is not required but that is still potentially allowed.

This is not the case because the problem that you fix with v2 is _not_ 
something that is merely not required and unnecessary. You have fixed a bug 
that is introduced in v1. Introducing bugs is not allowed. If you do 
something that is not allowed you cannot simply say that it is not required. 

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

Probably you have already read a message by Greg Kroah-Hartman that confirms 
what I wrote in another message: "There is no need to set a local variable 
like this to NULL.".

So please submit a v3. With the two changes requested above, my "acked-by" 
tag is confirmed again.

Thanks,

Fabio

> 
> +err_zmalloc:
> +	free_netdev(mon_ndev);
> +	*ndev = mon_ndev = NULL;
> +out:
>  	return ret;
>  }
> 
> --
> 2.32.0
> 
> 
> 




