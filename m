Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95813F54A4;
	Tue,  7 Jul 2026 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422948; cv=none; b=jbk7x8rD2PPdIjr17vGZD/XDkXV56/gckbYVn1tTwFHuUeHpPL2KX2fta4D/ceAM3I2QCyouTg3K3R+GS8pRKE0Omr3Ar0+IQ042jC7i3NSDYpM7Wy2WMu3GXOrWq3TZrmLDb3C/UwyXJbY3TGLFP38DjyK7oDZrO4yj2C62y34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422948; c=relaxed/simple;
	bh=uJQi0sczChTPEQYmefja2PSKSqMnfflu4v+Bzv0lVkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ey3mmrgfS2jx13c6qcqBO/jgX8+H7momQUKK3O8YM+it9NhUzv8pkQBcNJHmyHnsTpAdM3Xy7sLDuACRjpSS68dCKgC0VAoDamF/iS4D538EmcpnYY9nsx/AbI8302xwY2yZOmXKVD+MplWL7yfpwhDbSZSchzrtWTSn/BqRokE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d58g1ZKK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d58g1ZKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263B71F00A3D;
	Tue,  7 Jul 2026 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422947;
	bh=CducxYuW0Jm79zHyQGaGn/CWHbfe+ye7EhyINoj5FDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d58g1ZKKQURjP7612iyCqRuuyJaCKGfcxTXlH3kEHMx+7sghIWFiu4vwwtzjasMqU
	 NW7G2S2P2Vj0BH5RGo99eiHHqOdLgJHkv1aQV/bfXJUq/lwDbCdoNEv03EmqZ86/bF
	 rN/dUomhb6gUD788LoTu8dErlP6TDzeczT/tAAAM=
Date: Tue, 7 Jul 2026 13:15:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Guihot <daniel.guihot123@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces from
 single statement blocks
Message-ID: <2026070718-charging-outsource-81a1@gregkh>
References: <20260705193340.14684-3-daniel.guihot123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705193340.14684-3-daniel.guihot123@gmail.com>

On Mon, Jul 06, 2026 at 05:33:42AM +1000, Daniel Guihot wrote:
> Remove braces around single statement blocks in rtl8723b_hal_init.c to
> comply with the kernel code style, as reported by checkpatch.pl:
> 
>   WARNING: braces {} are not necessary for single statement blocks
>   WARNING: braces {} are not necessary for any arm of this statement
> 
> No functional change.
> 
> Signed-off-by: Daniel Guihot <daniel.guihot123@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++------------
>  1 file changed, 12 insertions(+), 20 deletions(-)

You sent this twice, from two different email addresses?  Which one is
correct?

Please resend a v2 from the correct one so we know what to do here.

thanks,

greg k-h
