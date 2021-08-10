Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813AE70
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 10:19:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C6206108F;
	Tue, 10 Aug 2021 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628590745;
	bh=9CIYaoUk3OsY+BjiTGw8q0Huaalf7bY8/x0CBVVHlI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEcHyhYjtQz+a+HeSkTIh91M3Cso18O/SugDnEbx0canubN2xtecscTSm4r914SuY
	 faCtbl+EnNl3X/fhMHTSaPJeIYRaGPsIvzyBkARY2pb+37VY4GNTlva76lw4yxcwNr
	 uaty7syo7uVh4xMPAXdOsW4YjUI0xtjylZBmhOfs=
Date: Tue, 10 Aug 2021 12:19:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove some dead files
Message-ID: <YRJSlU9jquQkseXt@kroah.com>
References: <20210809210912.1022-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809210912.1022-1-Larry.Finger@lwfinger.net>

On Mon, Aug 09, 2021 at 04:09:12PM -0500, Larry Finger wrote:
> The porting of the new version included 3 source files that are
> only used for testing of the device. They are not needed here.
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>  drivers/staging/r8188eu/Makefile            |    3 -
>  drivers/staging/r8188eu/core/rtw_mp.c       |  974 ---------------
>  drivers/staging/r8188eu/core/rtw_mp_ioctl.c | 1170 -------------------
>  drivers/staging/r8188eu/hal/rtl8188e_mp.c   |  798 -------------
>  4 files changed, 2945 deletions(-)
>  delete mode 100644 drivers/staging/r8188eu/core/rtw_mp.c
>  delete mode 100644 drivers/staging/r8188eu/core/rtw_mp_ioctl.c
>  delete mode 100644 drivers/staging/r8188eu/hal/rtl8188e_mp.c

I get the following error with this patch applied:

ERROR: modpost: "rtl8188eu_oid_rt_pro_set_data_rate_hdl" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "rtl8188eu_oid_rt_pro_set_single_carrier_tx_hdl" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "rtl8188eu_oid_rt_pro_stop_test_hdl" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "mp_stop_test" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "MPT_InitializeAdapter" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "Hal_GetThermalMeter" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "Hal_SetThermalMeter" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "MP_PHY_SetRFPathSwitch" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "rtl8188eu_oid_rt_get_efuse_max_size_hdl" [drivers/staging/r8188eu/r8188eu.ko] undefined!
ERROR: modpost: "rtl8188eu_oid_rt_pro_trigger_gpio_hdl" [drivers/staging/r8188eu/r8188eu.ko] undefined!
WARNING: modpost: suppressed 46 unresolved symbol warnings because there were too many)

Are you sure those symbols are not used?

thanks,

greg k-h
