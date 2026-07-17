Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259ED394EA6;
	Fri, 17 Jul 2026 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290817; cv=none; b=vClP7VFb3izaOJRAkkIl/tFbOAkTzCEUtxqVEL9fDhq0yHbK4ns3TOl+WWFfUktsAxWts46dhMyeDpXprDFK1JBk5FoCC6kcFcu4KQYlyhMRZQ468JuHr76hF5p/Q7D0dKeweJ8m70+9qWgL1zalkkFWuCNayROXozvVryaLGhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290817; c=relaxed/simple;
	bh=AKD4hiJe+/Aeagn4vLKfwfDWzfBo2l+v/HeAoTkFRCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xf+Z9Q4VtM2d6np1degFBxr5t2/K2skNjja7i1NpcTsaIRzTXQ6PzFITocBu8LueqT5rW6ZSgiFk2wrbcWNPSL9ioA7M9cJX++drvR2G6pHOGLfA/ZhMEw1TPsya/Cg+M4CSEORM7s6444gKnd0HYRg+npBfoK+BikzQNax3Jno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wytA/l4a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wytA/l4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3229A1F000E9;
	Fri, 17 Jul 2026 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784290815;
	bh=hU2YnSYvpkwrjeh7CHFWbPNfAk329/nDunwUV24tssA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wytA/l4aYQ74HT9KmprfHct64P6TKVoPtyCcxboEZae7XwNwi0LiMeZViKU0i4Mfw
	 GFYkNHKhn35nkDvXuBlY3Te8EhwdIPEcOlt8VYvgIBDmC83eaVbjJOzhWURcYybr20
	 Y77j/0s7qo0Y1ph7DY9+igOXasLP1qh5GwxDqHRE=
Date: Fri, 17 Jul 2026 14:20:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: rtl8723bs: Changing two struct members
Message-ID: <2026071753-crusader-compacter-1e84@gregkh>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>

On Wed, Jul 15, 2026 at 05:16:30PM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> This patch changes two members of the struct adapter.
> Two additional patches ar made to fix some checkpatch warnings.
> 
> Regards,
> Dalvin
> 
> Dalvin-Ehinoma Noah Aiguobas (4):
>   staging: rtl8723bs: change struct member bDriverStopped
>   staging: rtl8723bs: wrap line over 100 characters
>   staging: rtl8723bs: change struct member bSurpriseRemoved
>   staging: rtl8723bs: fix Alignment should match open parenthesis in
>     rtw_mlme_ext.c
> 
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 12 +--
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 85 ++++++++++---------
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 16 ++--
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 16 ++--
>  drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 16 ++--
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 +--
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 14 +--
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
>  drivers/staging/rtl8723bs/include/drv_types.h | 14 +--
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 16 ++--
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  8 +-
>  .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 +++----
>  16 files changed, 132 insertions(+), 126 deletions(-)
> 
> -- 
> 2.54.0
> 
> 

Does not apply against my staging-testing branch anymore.  Can you
rebase and resend it?

thanks,

greg k-h
