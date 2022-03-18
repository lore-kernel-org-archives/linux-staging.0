Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927422F2D
	for <linux-staging@lists.linux.dev>; Fri, 18 Mar 2022 09:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24E3C340EC;
	Fri, 18 Mar 2022 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647594611;
	bh=sRBWaFWpJBtULuRujYkGmhpJV4O9z37g1bx4HWyvXoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9AJ1H53oH0/ly2Qas1KU14ZWyYwT57KMHC/QiJL3IpLCArjQor/IhZHVbymHGOPo
	 r5dn4t9uS1MLpW8G5+XVRYLW7fPZVatig9VR4CeX/gS3ELoesYf3zgdBA0zik69Aw+
	 s8h3mrGUu35ZcImkDU8lc+krhsKeGPAajoIHuwaI=
Date: Fri, 18 Mar 2022 10:10:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sathish Kumar <skumark1902@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix CamelCase warnings
Message-ID: <YjRMcEkM/L/nrC2N@kroah.com>
References: <20220318090358.13559-1-skumark1902@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318090358.13559-1-skumark1902@gmail.com>

On Fri, Mar 18, 2022 at 02:33:58PM +0530, Sathish Kumar wrote:
> This patch fixes the checkpatch.pl warnings like:
> CHECK: Avoid CamelCase: <blnEnableRxFF0Filter>
> +   u8 blnEnableRxFF0Filter;
> 
> Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
> ---
>  drivers/staging/rtl8712/drv_types.h   | 2 +-
>  drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
>  drivers/staging/rtl8712/xmit_linux.c  | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/drv_types.h b/drivers/staging/rtl8712/drv_types.h
> index a44d04effc8b..88845b46131f 100644
> --- a/drivers/staging/rtl8712/drv_types.h
> +++ b/drivers/staging/rtl8712/drv_types.h
> @@ -157,7 +157,7 @@ struct _adapter {
>  	struct iw_statistics iwstats;
>  	int pid; /*process id from UI*/
>  	struct work_struct wk_filter_rx_ff0;
> -	u8 blnEnableRxFF0Filter;
> +	u8 bln_enable_rx_ff0_filter;

Why are you keeping the "bln" prefix here?  Why is that still needed?

thanks,

greg k-h
