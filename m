Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AED72
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 12:59:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 269AB60EE2;
	Sun, 10 Oct 2021 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633870786;
	bh=y5o3VL+L2WCSJzi+THrtiLwwL5wOwfs4P9ZJzLqt3BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8BTJbAir/a/OOMRttLa9+1bctVcuwkKJ6h98SLiEx1EPD0T4zCSTlBk8IVR3RkcL
	 bCZKmyu1InBtHmYcW/xCD9QJVJFiI1izrjqZp1Qp57fdogix3oXuV3mlApaclCg/Qz
	 neLwBqDn+TFwVuOz0v7Q/5gR+tVfBYhEgAwhhXTk=
Date: Sun, 10 Oct 2021 14:59:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com,
	insafonov@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: simplify the return
 statement.
Message-ID: <YWLjv3zaSGBoGh3q@kroah.com>
References: <YWJ0vSrgsiKK7suE@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWJ0vSrgsiKK7suE@user>

On Sun, Oct 10, 2021 at 10:36:05AM +0530, Saurav Girepunje wrote:
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
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 0868f56e2979..ae9579dc0848 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
>  	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
>  	if (!mon_wdev) {
>  		ret = -ENOMEM;
> -		goto out;
> +		goto err_zmalloc;
>  	}
> 
>  	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
> @@ -2322,23 +2322,21 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
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

There is no need to set a local variable like this to NULL.

thanks,

greg k-h
