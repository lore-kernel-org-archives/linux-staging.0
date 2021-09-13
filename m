Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F33FD0
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 16:24:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3764960187;
	Mon, 13 Sep 2021 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631550259;
	bh=ZloGfUPXytANvlaKt3xSoVJdmW8KkuOWTrFZ8tSaPrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWE3eDe04xw3JgAI9uSGK5QBQ9nU8MlumTnbKJUffkUxLxaqHt+Q1bh8gb3tS4oUE
	 exJVS7zh+lvwdUnm/F/XukCZeFPxJDZ6bqslfrnhwcKMGlvOObRtScEL/Qg/PMYP6E
	 o/abTCmrBnzZ2l7k5Me5NKa3bhCSA2HiGZ7U0/Cc=
Date: Mon, 13 Sep 2021 18:24:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove unused function
 rtw_android_priv_cmd
Message-ID: <YT97MRziXoUFhvXh@kroah.com>
References: <YT413EaBXqIqMttS@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT413EaBXqIqMttS@user>

On Sun, Sep 12, 2021 at 10:46:12PM +0530, Saurav Girepunje wrote:
> Remove unused function rtw_android_priv_cmd.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/include/rtw_android.h |   1 -
>  drivers/staging/r8188eu/os_dep/rtw_android.c  | 138 ------------------
>  2 files changed, 139 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/rtw_android.h b/drivers/staging/r8188eu/include/rtw_android.h
> index f60cf1c82984..86e3ac5f7955 100644
> --- a/drivers/staging/r8188eu/include/rtw_android.h
> +++ b/drivers/staging/r8188eu/include/rtw_android.h
> @@ -42,6 +42,5 @@ enum ANDROID_WIFI_CMD {
>  };
> 
>  int rtw_android_cmdstr_to_num(char *cmdstr);
> -int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd);
> 
>  #endif /* __RTW_ANDROID_H__ */
> diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
> index 010d529c8982..bd76177d60f9 100644
> --- a/drivers/staging/r8188eu/os_dep/rtw_android.c
> +++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
> @@ -133,141 +133,3 @@ static int rtw_android_set_block(struct net_device *net, char *command,
>  	return 0;
>  }
> 
> -int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
> -{
> -	int ret = 0;
> -	char *command = NULL;
> -	int cmd_num;
> -	int bytes_written = 0;
> -	struct android_wifi_priv_cmd priv_cmd;
> -
> -	if (!ifr->ifr_data) {
> -		ret = -EINVAL;
> -		goto exit;
> -	}
> -	if (copy_from_user(&priv_cmd, ifr->ifr_data,
> -			   sizeof(struct android_wifi_priv_cmd))) {
> -		ret = -EFAULT;
> -		goto exit;
> -	}
> -	command = kmalloc(priv_cmd.total_len, GFP_KERNEL);
> -	if (!command) {
> -		DBG_88E("%s: failed to allocate memory\n", __func__);
> -		ret = -ENOMEM;
> -		goto exit;
> -	}
> -	if (!access_ok(priv_cmd.buf, priv_cmd.total_len)) {
> -		DBG_88E("%s: failed to access memory\n", __func__);
> -		ret = -EFAULT;
> -		goto exit;
> -	}
> -	if (copy_from_user(command, (char __user *)priv_cmd.buf,
> -			   priv_cmd.total_len)) {
> -		ret = -EFAULT;
> -		goto exit;
> -	}
> -	DBG_88E("%s: Android private cmd \"%s\" on %s\n",
> -		__func__, command, ifr->ifr_name);
> -	cmd_num = rtw_android_cmdstr_to_num(command);
> -	switch (cmd_num) {
> -	case ANDROID_WIFI_CMD_START:
> -		goto response;
> -	case ANDROID_WIFI_CMD_SETFWPATH:
> -		goto response;
> -	}
> -	if (!g_wifi_on) {
> -		DBG_88E("%s: Ignore private cmd \"%s\" - iface %s is down\n",
> -			__func__, command, ifr->ifr_name);
> -		ret = 0;
> -		goto exit;
> -	}
> -	switch (cmd_num) {
> -	case ANDROID_WIFI_CMD_STOP:
> -		break;
> -	case ANDROID_WIFI_CMD_SCAN_ACTIVE:
> -		break;
> -	case ANDROID_WIFI_CMD_SCAN_PASSIVE:
> -		break;
> -	case ANDROID_WIFI_CMD_RSSI:
> -		bytes_written = rtw_android_get_rssi(net, command,
> -						     priv_cmd.total_len);
> -		break;
> -	case ANDROID_WIFI_CMD_LINKSPEED:
> -		bytes_written = rtw_android_get_link_speed(net, command,
> -							   priv_cmd.total_len);
> -		break;
> -	case ANDROID_WIFI_CMD_MACADDR:
> -		bytes_written = rtw_android_get_macaddr(net, command,
> -							priv_cmd.total_len);
> -		break;
> -	case ANDROID_WIFI_CMD_BLOCK:
> -		bytes_written = rtw_android_set_block(net, command,
> -						      priv_cmd.total_len);
> -		break;
> -	case ANDROID_WIFI_CMD_RXFILTER_START:
> -		break;
> -	case ANDROID_WIFI_CMD_RXFILTER_STOP:
> -		break;
> -	case ANDROID_WIFI_CMD_RXFILTER_ADD:
> -		break;
> -	case ANDROID_WIFI_CMD_RXFILTER_REMOVE:
> -		break;
> -	case ANDROID_WIFI_CMD_BTCOEXSCAN_START:
> -		/* TBD: BTCOEXSCAN-START */
> -		break;
> -	case ANDROID_WIFI_CMD_BTCOEXSCAN_STOP:
> -		/* TBD: BTCOEXSCAN-STOP */
> -		break;
> -	case ANDROID_WIFI_CMD_BTCOEXMODE:
> -		break;
> -	case ANDROID_WIFI_CMD_SETSUSPENDOPT:
> -		break;
> -	case ANDROID_WIFI_CMD_SETBAND:
> -		break;
> -	case ANDROID_WIFI_CMD_GETBAND:
> -		break;
> -	case ANDROID_WIFI_CMD_COUNTRY:
> -		bytes_written = android_set_cntry(net, command,
> -						  priv_cmd.total_len);
> -		break;
> -	case ANDROID_WIFI_CMD_P2P_DEV_ADDR:
> -		bytes_written = android_get_p2p_addr(net, command,
> -						     priv_cmd.total_len);
> -		break;
> -	case ANDROID_WIFI_CMD_P2P_SET_NOA:
> -		break;
> -	case ANDROID_WIFI_CMD_P2P_GET_NOA:
> -		break;
> -	case ANDROID_WIFI_CMD_P2P_SET_PS:
> -		break;
> -	default:
> -		DBG_88E("Unknown PRIVATE command %s - ignored\n", command);
> -		snprintf(command, 3, "OK");
> -		bytes_written = strlen("OK");
> -	}
> -
> -response:
> -	if (bytes_written >= 0) {
> -		if ((bytes_written == 0) && (priv_cmd.total_len > 0))
> -			command[0] = '\0';
> -		if (bytes_written >= priv_cmd.total_len) {
> -			DBG_88E("%s: bytes_written = %d\n", __func__,
> -				bytes_written);
> -			bytes_written = priv_cmd.total_len;
> -		} else {
> -			bytes_written++;
> -		}
> -		priv_cmd.used_len = bytes_written;
> -		if (copy_to_user((char __user *)priv_cmd.buf, command,
> -				 bytes_written)) {
> -			DBG_88E("%s: failed to copy data to user buffer\n",
> -				__func__);
> -			ret = -EFAULT;
> -		}
> -	} else {
> -		ret = bytes_written;
> -	}
> -exit:
> -	kfree(command);
> -	return ret;
> -}
> --
> 2.32.0
> 
> 

Does not apply to my tree :(
