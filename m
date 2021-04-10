Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFC70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:29:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B997B610CB;
	Sat, 10 Apr 2021 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618039773;
	bh=6dqsCuwOxzPRtweC7qc1rnM65QPQJBohOG5bLmKsBEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KU0+ab193iyQWutIghoi3oevU1UUdLhuFJD/YpfGtH7iOYDcjG3CIfyQ3S5gKoqWV
	 RN3PtXLX9fMIH/VcN3pzz3FfjJZCfij79O3ykmDsx8EcuIrbVil2bsdzB0i7Bzml96
	 qowIuunenOgpRwNylXCeTkP8/sFlEF/m3psd6jDs=
Date: Sat, 10 Apr 2021 09:29:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [Patch 0/3]
Message-ID: <YHFT2S31kFy72DMv@kroah.com>
References: <6552860.D8CPca6BT0@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6552860.D8CPca6BT0@localhost.localdomain>

On Fri, Apr 09, 2021 at 06:29:59PM +0200, Fabio M. De Francesco wrote:
> This patch series removes camelcases, changes the type and use of a 
> variable, and correct misspelled words.
> 
> Patch 1/3: staging: rtl8723bs: Remove camelcase in several files
> 
> drivers/staging/rtl8723bs/core/rtw_cmd.c       |  2 +-
> drivers/staging/rtl8723bs/core/rtw_mlme.c      |  2 +-
> drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   | 18 +++++++++---------
> drivers/staging/rtl8723bs/hal/hal_intf.c       |  2 +-
> drivers/staging/rtl8723bs/hal/rtl8723b_dm.c    |  6 +++---
> .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  2 +-
> drivers/staging/rtl8723bs/hal/sdio_ops.c       | 14 +++++++-------
> .../staging/rtl8723bs/include/rtw_pwrctrl.h    |  2 +-
> 8 files changed, 24 insertions(+), 24 deletions(-)
> 
> Patch 2/3: staging: rtl8723bs: Change the type and use of a variable
> 
> drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Patch 3/3: staging: rtl8723bs: include: Fix misspelled words in comments
> 
> .../rtl8723bs/include/Hal8192CPhyReg.h        |  8 ++---
>  .../staging/rtl8723bs/include/basic_types.h   |  2 +-
>  drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
>  drivers/staging/rtl8723bs/include/hal_com.h   |  2 +-
>  .../staging/rtl8723bs/include/hal_com_reg.h   | 34 +++++++++----------
>  drivers/staging/rtl8723bs/include/hal_data.h  |  2 +-
>  .../staging/rtl8723bs/include/hal_pwr_seq.h   |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_cmd.h   |  6 ++--
>  drivers/staging/rtl8723bs/include/rtw_mlme.h  | 18 +++++-----
>  .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_mp.h    |  2 +-
>  .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_recv.h  |  4 +--
>  drivers/staging/rtl8723bs/include/rtw_xmit.h  |  2 +-
>  drivers/staging/rtl8723bs/include/sta_info.h  |  2 +-
>  drivers/staging/rtl8723bs/include/wifi.h      |  2 +-
>  16 files changed, 46 insertions(+), 46 deletions(-)
> 
> Fabio M. De Francesco

I have no idea how you created this patch series, but I do not think it
worked well :(

Please use our standard tools, that do this all for you automatically,
and send them out in a series of emails that have a proper subject line
(look at what you used here...) and are properly "threaded".

thanks,

greg k-h
