Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1853FD0
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 16:18:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7241960EE5;
	Mon, 13 Sep 2021 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631549911;
	bh=1QYduAjqko44zZ/U4MXISA30+hpgDfQVIK7iDh1pJFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTezS0NaO1PiYWPqLJuTEBs+5L0sJu+mAaHcj91lCRVC1Tnau9L7q0b9Prh2g3HPB
	 yfdSlUyemyuWufbysMg+L8KHLgWIUVmwE+hvorrvFD24wOWbd8JxpYNseyGl3SllEO
	 kSB9Mb2mMcbjTfFB/kpklR0JEXYvrJfjHmFx0wNI=
Date: Mon, 13 Sep 2021 18:18:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: core: remove the function
 power_saving_wk_hdl
Message-ID: <YT951VyaUEX8uFpz@kroah.com>
References: <YTub30ZRG3oLbxQW@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTub30ZRG3oLbxQW@user>

On Fri, Sep 10, 2021 at 11:24:39PM +0530, Saurav Girepunje wrote:
> Remove the function power_saving_wk_hdl() as it just calling
> the rtw_ps_processor().Instead of power_saving_wk_hdl() call directly
> rtw_ps_processor().
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index ce73ac7cf973..35e6a943c556 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1669,11 +1669,6 @@ u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
>  	return res;
>  }
> 
> -static void power_saving_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
> -{
> -	 rtw_ps_processor(padapter);
> -}
> -
>  #ifdef CONFIG_88EU_P2P
>  u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
>  {
> @@ -1941,7 +1936,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
>  		dynamic_chk_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
>  		break;
>  	case POWER_SAVING_CTRL_WK_CID:
> -		power_saving_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
> +		rtw_ps_processor(padapter);
>  		break;
>  	case LPS_CTRL_WK_CID:
>  		lps_ctrl_wk_hdl(padapter, (u8)pdrvextra_cmd->type_size);
> --
> 2.32.0
> 
> 

Also does not apply to my tree.  Please rebase against my staging-next
branch and resend.

thanks,

greg k-h
