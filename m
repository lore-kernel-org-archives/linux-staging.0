Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33031330668;
	Tue,  7 Jul 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414953; cv=none; b=RW9S7Bm5dapKtUF7PQSNbgExBxkPtlJORvtbvH5EK3ZMc89U5RwB2CNa52ynsOIVOA+pFiw4p7JBOVoaMCjxy+OCn5Jy8t4HuN24iZzJ/Dd5jj5opEkPrq9DUXTok2qFf0h0IOOQW/iCgTzWudzrer96RhYkHj4/HEzagNH87eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414953; c=relaxed/simple;
	bh=SxXC9SuSF2tAQoaHScGDzNheyAkuGUHV51tIWlVwYZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2kKio/aPjH4yD5EnNjz666UNIrF4OCfjRsHwTh2vfnQdKDhzQ5/HXcxEdy3W3ITIRQB2LmG4ecE/VBSrEjNW9rTpfyPCHAXuKPFO04pjoi9jeRM5sFKFRVbfw2TchxHoO6ywTdOEJHRP/77y3dyoZa8QW87ZleJn6zLsKzR1oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mw+DB3MT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mw+DB3MT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA201F000E9;
	Tue,  7 Jul 2026 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783414951;
	bh=iyzS887MStQRxqJO3VlrvtpEmCU5l1Z3IuKzwc+5k6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mw+DB3MTNW6eQH4jFsv6YdSN1F4PMRNbtPR9/f0LqyKo/IkTwHwi/O0Eo8BkMN/cC
	 V4v53jbRu7+cZ6qI4GgOaEb1xcJZSSUd10V0gGKfHOwPHjsncaxOD71aI1jv6WMMDI
	 qd5eEXRfHWvJBGE5g285q5I9XFB2/U3/PVsR3gO8=
Date: Tue, 7 Jul 2026 11:02:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] staging: greybus: arche still depends on missing USB3613
 provider
Message-ID: <2026070752-maggot-corrosive-265d@gregkh>
References: <20260625061208.30279-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625061208.30279-1-pengpeng@iscas.ac.cn>

On Thu, Jun 25, 2026 at 02:12:08PM +0800, Pengpeng Hou wrote:
> Hi,
> 
> while auditing conditional provider/header contracts, I noticed that Greybus
> Arche still appears to describe a USB3613 provider world that is absent from
> current mainline.
> 
> drivers/staging/greybus/Kconfig still has:
> 
> depends on USB_HSIC_USB3613 || COMPILE_TEST
> 
> and drivers/staging/greybus/arche-platform.c still conditionally includes
> the USB3613 header and calls usb3613_hub_mode_ctrl() when
> CONFIG_USB_HSIC_USB3613 is enabled.  However, the current tree does not appear
> to provide include/linux/usb/usb3613.h or a Kconfig provider for
> USB_HSIC_USB3613.
> 
> I am not sending a patch yet because this is staging/hardware policy sensitive.
> The possible directions seem to be:
> 
> 1. restore or move the USB3613 provider/header if the hardware path is still
>    intended;
> 2. remove the stale USB3613 integration path and rely on the local stub;
> 3. change the Kconfig dependency to describe only current supported worlds; or
> 4. keep the contract if an out-of-tree provider is intentionally expected.
> 
> Could you advise which direction is expected for Arche?

I would just leave it as-is for now.  Hopefully once the greybus code
for the beaglebone devices gets more integrated we can get all of this
code out of staging, which will delete the unused stuff properly.

thanks,

greg k-h
