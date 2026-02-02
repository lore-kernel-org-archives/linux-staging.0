Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30823D2B4;
	Mon,  2 Feb 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021415; cv=none; b=riQMLpVuVqFkY7PIogX3FHBMxVZwvPwDZIiSHzIvr7KAaeoTTiCcLmmAR7BrwgQwIGmFRAN5NbD1g/n+I4URcM8gZZ+zaDbK8JT1lo34ZoWdtUxvWsyi9bAo9bBVp4dtLcULRNtf/77h0WLI273V/WfoJ5rcbg7V1hbvp0JiV+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021415; c=relaxed/simple;
	bh=xDmJnlOo4s2/YL5US6F+G2cZfe3q9Pdy+QcQSHZeC9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgduTCNuIKb0LOEHVN3N+0KY6VI+A3ovvI2kTd6ca1l3Q5o5oFJrxjC/7VImHZ1a/rXXemkMztupfebnH87eSbta69A5m4fpoITjHn1PL4VsA1seKovrXD0t5QK68Q22Ato2+yHppuxOlWCUmiJDcfYPSUmZ4ftfGYAnoRzgRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VRevF6+E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VRevF6+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7785EC116C6;
	Mon,  2 Feb 2026 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770021414;
	bh=xDmJnlOo4s2/YL5US6F+G2cZfe3q9Pdy+QcQSHZeC9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRevF6+EOiItoXj5NrjP9nOa9URcSvnH8ydm27yhYUpIeg/TwV2AzT4pDmDYPpdw1
	 xthp0ii2fCLmttMOIVwkcn4bnV/QJeGjeKvgc6jzucUmxC4Q+mYaCNh4W3+wqS3amS
	 ouSXDNPoGbrN/EgIARyY+flMHJ8zZHcuWS32yrlc=
Date: Mon, 2 Feb 2026 09:36:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] staging: rtl8723bs: remove unused code for other
 Realtek chips
Message-ID: <2026020224-venomous-disfigure-4308@gregkh>
References: <20260202070752.3391-1-lukagejak5@gmail.com>
 <20260202070752.3391-2-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202070752.3391-2-lukagejak5@gmail.com>

On Mon, Feb 02, 2026 at 08:07:48AM +0100, Luka Gejak wrote:
> Remove unused definitions and function declarations that were left over
> from other Realtek chips:
> 
> - Remove rtl8192c_translate_rx_signal_stuff() and
>   rtl8192c_query_rx_desc_status() function declarations from
>   rtl8192c_recv.h. These functions are declared but never implemented
>   or used in the 8723bs driver.
> 
> - Remove unused RECV_BLK_SZ, RECV_BLK_CNT, and RECV_BLK_TH defines from
>   rtl8192c_recv.h. These are not referenced anywhere in the driver.
> 
> - Remove unused MAX_PATH_NUM_* definitions for other chips (92CS, 8188E,
>   8192E, 8812A, 8821A, 8814A, 8822B) from odm.h. Only MAX_PATH_NUM_8723B
>   is actually used by the driver.

When you have to list the different things a patch does, that's a huge
hint that the change needs to be broken up into smaller patches.

Remember, each change can only do "one logical thing".

thanks,

greg k-h
