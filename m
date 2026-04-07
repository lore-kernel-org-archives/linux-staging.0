Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F73B19D5;
	Tue,  7 Apr 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571957; cv=none; b=Q9kMvhPyQ1MFd1SIHS8WaZ/xCCqLGr9n729WKaOzzPDPeVrkv2g2os8qEEIXWeoYf8ifZGQ4hQ/j8aGmaWzGC8p98CrhaY1QlRkYDKRYooL3D4nEQ4V1+ftYZeK4RMM5zAK6AX+hc9c7OEnXKZdckbqgaKd3pRxet9unT1NMzY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571957; c=relaxed/simple;
	bh=V5Tr4FetXImRHZ7dgsi4QXJ2eMwhS7al1YFaWd6FsT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsJSsHowtNahoCOTTd88Ig9SUQXOc8mjbkfyVKGac/nSiEYLLtHvvIalPBXiGyUB6x295UDJ0eoVIQLuXHL4MEtEMxv4CQktSGyThF/ZHrNBl0mLj7qIS5R3SAVpCxLJlp60RRMgLma8TBRBAKzTG3cu8bZ6L9dg45DJbI+/grs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0QlGUg+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0QlGUg+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA52C116C6;
	Tue,  7 Apr 2026 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775571956;
	bh=V5Tr4FetXImRHZ7dgsi4QXJ2eMwhS7al1YFaWd6FsT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0QlGUg+v6d4FW58GVlVlK+46B+ABel0cHTAJ2Y1szjYzfO3TXKO2rEiWsi8+zMmDA
	 JO/K3nDgo/+G66S6BYuRIky4ERf7xLo438dtL+nqwN2DEBEecqdDaHD4Eg/Tk/KHOS
	 /9IQEDx/iWxq34dhNOKr32qPnDdf5i5qMfaNjvmk=
Date: Tue, 7 Apr 2026 16:25:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: ~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	a.nasrolahi01@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix unnamed parameters warning
 detected at checkpatch
Message-ID: <2026040718-relic-request-d245@gregkh>
References: <20260407133416.13983-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407133416.13983-1-rodrigo.gobbi.7@gmail.com>

On Tue, Apr 07, 2026 at 10:27:21AM -0300, Rodrigo Gobbi wrote:
> Detected the following WARNING: function definition argument
> 'struct adapter *' should also have an identifier name.
> Add explicit names on those definitions.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all,
> 
> Found a set of these warnings with checkpatch:
> 
> drivers/staging/rtl8723bs/include/hal_btcoex.h:25: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/hal_btcoex.h:49: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/hal_btcoex.h:50: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/hal_btcoex.h:51: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/hal_intf.h:255: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/rtw_btcoex.h:18: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/rtw_btcoex.h:19: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/rtw_btcoex.h:24: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/rtw_btcoex.h:25: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/rtw_btcoex.h:26: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:218: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:219: WARNING: function definition argument 'struct adapter *' should also have an identifier name
> 
> ...the ones from hal_btcoex.h is already ongoing at [1].
> Fixed the rest of them following the pattern of each file like:
> 
> struct adapter *padapter
> or 
> struct adapter *adapter
> 
> Tks and regards.
> 
> [1] https://lore.kernel.org/all/20250720145524.9733-4-A.Nasrolahi01@gmail.com/
> ---
>  drivers/staging/rtl8723bs/include/hal_intf.h    |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_btcoex.h  | 10 +++++-----
>  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
> index b193854bfe6e..10762ffbafb6 100644
> --- a/drivers/staging/rtl8723bs/include/hal_intf.h
> +++ b/drivers/staging/rtl8723bs/include/hal_intf.h
> @@ -252,7 +252,7 @@ c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
>  s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid);
>  s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
>  
> -s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
> +s32 rtw_hal_fill_h2c_cmd(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);

No need to give variable names you will have to later fix up, just call
it "adapter", not "padapter" as that's not the kernel coding style.

thanks,

greg k-h
