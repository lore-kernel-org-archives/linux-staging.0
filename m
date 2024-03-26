Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD351292FD
	for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711441657; cv=none; b=Q9BCelY6PvCiJvMgodXRQt07bJyBvwoRzmxsO6afTJzc5Z7PGk3+UNTGNzyZlSB7oubmLL/VCMMBIs0nzIExdmZf798zynFbSgrFXLq0LXrOhrlzfUmOvwX+TwG0uYjgc72LwILf4gG/Le+o1y+AKNeOBBeK/KspfQKSg7HhmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711441657; c=relaxed/simple;
	bh=w3Ty/YsSsNO3tEjCDtWhwWTUWzygmh5DpLVUk+4giVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNVMm2xS7sAH9w1hYUFvpzsbGD1BlXzCr+h8odvl6Gbn5fyC6EHTySfz7tZvxPub9644eFD5fgJbcT0F5gr4jwCzHmy/UkgiYdE+SNx7vfyhHEqKZV96XWman9S2T60gbPaBU5Iy83N91+LQRFHXujsgO0n0aNS2WAD4WcebHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hpDkKnWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hpDkKnWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016F6C433F1;
	Tue, 26 Mar 2024 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711441656;
	bh=w3Ty/YsSsNO3tEjCDtWhwWTUWzygmh5DpLVUk+4giVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpDkKnWy8TKoFcQbbYbw88m3t/rILt1NmR+mX6Lw+Q9ok4Ik83Dxd38RE8D89E4RB
	 kMuxPatXYjrW9J6tSPJ4swR+ISqZAvKUBc0rDQ2Ob7ilmceqKxdAlbbBDrWv+yJ6QO
	 7tEHRcnzPk4DLYpQpRPqb3SkP/swvHEk3mb2E6YQ=
Date: Tue, 26 Mar 2024 09:27:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	linux-staging@lists.linux.dev, Alex Elder <elder@ieee.org>
Subject: Re: [PATCH v2] greybus: lights: check return of get_channel_from_mode
Message-ID: <2024032611-gallery-semicolon-2951@gregkh>
References: <20240325221549.2185265-1-rmfrfs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325221549.2185265-1-rmfrfs@gmail.com>

On Mon, Mar 25, 2024 at 10:09:55PM +0000, Rui Miguel Silva wrote:
> If channel for the given node is not found we return null from
> get_channel_from_mode. Make sure we validate the return pointer
> before using it in two of the missing places.
> 
> This was originally reported in [0]:
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Alex Elder <elder@ieee.org>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
> v1[1] -> v2:
> GregKh:
>     - remove overkill WARN_ON and replace it for a dev_err

Thanks for the quick change, now queued up.

greg k-h
