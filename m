Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F172
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:57:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 315106109E;
	Tue, 15 Jun 2021 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623758276;
	bh=F7VRG506VSAqPt0QZZ8uoIPs2NTUmg6piFbL228oHyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAxMPUkWUA5pbuuNRHb+UoQjEF2u+fJX1Ms5BTlU1xLqSLNSINLU6nMGYKRY6EJmF
	 B8heOcd/R/WnQfakk80xecjteAVJFkhmbL3NWvjgqeZ4JOwSO3IRGlU3XeSMwiHYns
	 k/1E2Hnzt3SYCNcTWProjx5cVvwzzgA2gQrLqo1E=
Date: Tue, 15 Jun 2021 13:57:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/28] staging: rtl8188eu: remove DBG_88E callers and
 macro
Message-ID: <YMiVtgVTGQSb+iC2@kroah.com>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>

On Tue, Jun 15, 2021 at 01:14:39AM +0100, Phillip Potter wrote:
> This patch series removes DBG_88E calls from all places in the driver,
> and then removes the DBG_88E macro definition itself. It also takes two
> prior patches where I convered DBG_88E calls into netdev_dbg calls, and
> removes these calls too.
> 
> It cleans up subsuently unused local variables along the way, removes an
> unused static function too, and also contains a reissue of my previous
> patch to remove core/rtw_debug.c which is entirely unused by the driver
> and thus is dead code.
> 
> Phillip Potter (28):
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_efuse.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_xmit.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_mlme_ext.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_wlan_util.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_ap.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_pwrctrl.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_ieee80211.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_security.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_ioctl_set.c
>   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_mlme.c
>   staging: rtl8188eu: remove all DBG_88E calls from os_dep/ioctl_linux.c
>   staging: rtl8188eu: remove all DBG_88E calls from os_dep/usb_intf.c
>   staging: rtl8188eu: remove all DBG_88E calls from os_dep/os_intfs.c
>   staging: rtl8188eu: remove all DBG_88E calls from os_dep/mlme_linux.c
>   staging: rtl8188eu: remove all DBG_88E calls from os_dep/xmit_linux.c
>   staging: rtl8188eu: remove all DBG_88E calls from os_dep/rtw_android.c
>   staging: rtl8188eu: remove all DBG_88E calls from hal/hal_intf.c
>   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188e_cmd.c
>   staging: rtl8188eu: remove all DBG_88E calls from hal/pwrseqcmd.c
>   staging: rtl8188eu: remove all DBG_88E calls from
>     hal/rtl8188e_hal_init.c
>   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188e_xmit.c
>   staging: rtl8188eu: remove all DBG_88E calls from hal/usb_halinit.c
>   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188eu_recv.c
>   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188eu_xmit.c
>   staging: rtl8188eu: remove converted netdev_dbg calls from
>     core/rtw_recv.c
>   staging: rtl8188eu: remove converted netdev_dbg calls from
>     core/rtw_sta_mgt.c
>   staging: rtl8188eu: remove core/rtw_debug.c
>   staging: rtl8188eu: remove DBG_88E macro definition
> 
>  drivers/staging/rtl8188eu/Makefile            |   1 -
>  drivers/staging/rtl8188eu/core/rtw_ap.c       |  78 +-----
>  drivers/staging/rtl8188eu/core/rtw_debug.c    | 187 -------------
>  drivers/staging/rtl8188eu/core/rtw_efuse.c    |  15 +-
>  .../staging/rtl8188eu/core/rtw_ieee80211.c    |  38 +--
>  .../staging/rtl8188eu/core/rtw_ioctl_set.c    |   8 -
>  drivers/staging/rtl8188eu/core/rtw_mlme.c     |  54 +---
>  drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 262 ++----------------
>  drivers/staging/rtl8188eu/core/rtw_pwrctrl.c  |  40 +--
>  drivers/staging/rtl8188eu/core/rtw_recv.c     |  66 +----
>  drivers/staging/rtl8188eu/core/rtw_security.c |   2 -
>  drivers/staging/rtl8188eu/core/rtw_sta_mgt.c  |   9 -
>  .../staging/rtl8188eu/core/rtw_wlan_util.c    |  80 ++----
>  drivers/staging/rtl8188eu/core/rtw_xmit.c     |  40 +--
>  drivers/staging/rtl8188eu/hal/hal_intf.c      |   3 -
>  drivers/staging/rtl8188eu/hal/pwrseqcmd.c     |   4 +-
>  drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c  |  42 +--
>  .../staging/rtl8188eu/hal/rtl8188e_hal_init.c |  45 +--
>  drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c |  15 -
>  .../staging/rtl8188eu/hal/rtl8188eu_recv.c    |   8 -
>  .../staging/rtl8188eu/hal/rtl8188eu_xmit.c    |   5 -
>  drivers/staging/rtl8188eu/hal/usb_halinit.c   |  51 +---
>  drivers/staging/rtl8188eu/include/rtw_debug.h |  31 ---
>  .../staging/rtl8188eu/os_dep/ioctl_linux.c    | 144 +---------
>  drivers/staging/rtl8188eu/os_dep/mlme_linux.c |   4 -
>  drivers/staging/rtl8188eu/os_dep/os_intfs.c   |  26 --
>  .../staging/rtl8188eu/os_dep/rtw_android.c    |  15 +-
>  drivers/staging/rtl8188eu/os_dep/usb_intf.c   |   1 -
>  drivers/staging/rtl8188eu/os_dep/xmit_linux.c |   8 +-
>  29 files changed, 86 insertions(+), 1196 deletions(-)
>  delete mode 100644 drivers/staging/rtl8188eu/core/rtw_debug.c

Deleting that many lines of code is always nice, thanks for doing this,
now all applied.

greg k-h
