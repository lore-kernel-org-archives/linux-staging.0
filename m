Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D8936EA84
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261886; cv=none; b=RUHWStlsa/4YvVxOzp4dKjVUSJ4U/Mf+Q88D//3Pgz+j6NDwMGVSlTcwqw0t0R/FKVpGelW12dBo9eYvXmn4ldppsG79xON3mrHw/FEob+3EWfg4ZmGXfLTL/eRXe5f8MfCSJvrOBDjgXM9nCz64JsZz7uQ2iSZ/8RHMZ8iq/T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261886; c=relaxed/simple;
	bh=oawvtfWjO/cRq/ZnLN+wOh8412ZMiDWaINcPLf39RhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCZlRR1J9MRTKad1nhaQ90bMVwVHcdUJtmIF+8sOa4hlOgzZQn2RDtZ8cZm+DsBoGhkp5tu3MgB7nMmdftJTJnBjA/6gwN23EXSupbsgf3sYLa6C7/Z/6olvNZ4QTnC9YfxPGWT9WJEWf69imMgTldkKoTZ9W2Ary6uLpsXRCyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kZ9nM5X7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kZ9nM5X7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A71C19425;
	Mon, 27 Apr 2026 03:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261885;
	bh=oawvtfWjO/cRq/ZnLN+wOh8412ZMiDWaINcPLf39RhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZ9nM5X77jPMJOZB3cRGMzEr7BmafTz/FExZ9mbF2aX7Bv7Bf4YqUS3wDk509I1Ea
	 +M7MH8ZDPVaLNC46ND/rabmL7v0pXTN6QnazTwN1bcPsM43HJGuPPC5z3PABUE0caO
	 y5OjlN8RDwrS+dwfD9u5wr7FWMS5dSLk3z3cAZ2I=
Date: Sun, 26 Apr 2026 22:07:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 08/11] staging: rtl8723bs: remove wrapper
 rtw_hal_disable_interrupt()
Message-ID: <2026042640-acorn-hula-01d2@gregkh>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
 <20260419072034.19824-9-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419072034.19824-9-nikolayof23@gmail.com>

On Sun, Apr 19, 2026 at 10:19:34AM +0300, Nikolay Kulikov wrote:
> Remove unnecessary wrapper and call DisableInterrupt8723BSdio() function
> directly to simplify the code.
> 
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 3 ---
>  drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 2 +-
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++---
>  5 files changed, 3 insertions(+), 14 deletions(-)

This patch did not apply for some reason, maybe due to other changes
from someone else?

thanks,

greg k-h
