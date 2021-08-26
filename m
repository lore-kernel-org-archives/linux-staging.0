Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649E172
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:07:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C3FE610D1;
	Thu, 26 Aug 2021 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629972468;
	bh=x8NVmE1BdD+ZN1w2mIzfik5Ryle5HXnB166iXxfhU5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRDq68V/Z1MGrS0XStZqwlyZjkgSq8gWIW7aVijN9XhROYEXvkJ/9qvE6GRu3XbR9
	 D3cfJ/GreJmwT4KhEYL5Ka8jqCkbflBV+/7OHwms0Vymr6ke8/5hzHDGN7CeZGIQ5L
	 DXtSyMNOt2CR416I2/qnr9ijveu78Lfykrhhp7jg=
Date: Thu, 26 Aug 2021 12:07:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove sdio_osintf.h
Message-ID: <YSdn6vLOo/WG/9rS@kroah.com>
References: <20210823221156.3353972-1-hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823221156.3353972-1-hello@bryanbrattlof.com>

On Mon, Aug 23, 2021 at 10:12:21PM +0000, Bryan Brattlof wrote:
> All definitions inside sdio_osintf.h are unused. Remove it.
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  drivers/staging/rtl8723bs/include/drv_types.h   |  1 -
>  drivers/staging/rtl8723bs/include/sdio_osintf.h | 16 ----------------
>  2 files changed, 17 deletions(-)
>  delete mode 100644 drivers/staging/rtl8723bs/include/sdio_osintf.h
> 
> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> index 580028d28c42..0e6741db95bf 100644
> --- a/drivers/staging/rtl8723bs/include/drv_types.h
> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> @@ -489,7 +489,6 @@ static inline u8 *myid(struct eeprom_priv *peepriv)
>  }
> 
>  /*  HCI Related header file */
> -#include <sdio_osintf.h>
>  #include <sdio_ops.h>
>  #include <sdio_hal.h>
> 
> diff --git a/drivers/staging/rtl8723bs/include/sdio_osintf.h b/drivers/staging/rtl8723bs/include/sdio_osintf.h
> deleted file mode 100644
> index 146b44f95e29..000000000000
> --- a/drivers/staging/rtl8723bs/include/sdio_osintf.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/******************************************************************************
> - *
> - * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
> - *
> - ******************************************************************************/
> -#ifndef __SDIO_OSINTF_H__
> -#define __SDIO_OSINTF_H__
> -
> -
> -
> -u8 sd_hal_bus_init(struct adapter *padapter);
> -u8 sd_hal_bus_deinit(struct adapter *padapter);
> -void sd_c2h_hdl(struct adapter *padapter);

What about the instances in
drivers/staging/rtl8723bs/include/sdio_hal.h?  Please remove them at the
same time.

thanks,

greg k-h
