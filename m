Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822179;
	b=wOOYrBZILfrbl5hjnwxw/m3fcIF6RYz59ZcCyQ75+1f16PTW9cQp9P2sXoJPeUUHI570
	 BUalNe4TVVvyp2qdZfLIkeap8b4ZvFSGolgmVUML3708bnKz6rqKV1qUZadwODvLt8vlD
	 ycpS2m+ADK4wIUJ8I/D3q1uDpq0jHqjflKBd5ZmiEfxOkxLZ1/kzTqcowQ1IWnQTdQh3/
	 3dXoG60mKQHOWGHi8mIJ1fqXCKj/5EKE9/QUhlTAEXAfg0AOi4nYpwJi+MhlLXUfbpOeq
	 KPooh63ssS8HPTYzV5tKqDw4G8WhnpMoAlU/vjtxR85367XVDQKoI8NP3obbJg66Ssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822179;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ntGd4/6HZdaPPq/L5OoqrEo/8o1hkTV4HrVpVknjtNQ=;
	b=rEBNLpH2mNvlUaGgt7YTA9zq+vSdHuccMJ2iaqLUtFiS4/Q/NYAW7QpFxPuC4YIqpjiE
	 PlFAoDOtHW4a6pGEyTOfXGAAyZybYwZ2hZoxjl8s0/+5bbRUexX+iWXqYyRo/3NWs5OoY
	 iZ7t/PskpfN9a6cjTXcIu7YHRAMRkHgqqDuYC7ixQ1O3Os92r+0WDEV1AL4qJZrqXLX8+
	 hU4HinXdV4hmw8ASArLpGCXOIeEPSl/ItnpOXj4EclegWMD74Np5knpTiigtIF61R0lzx
	 4owq+85PRStD8k1vzeOm6lzJY7fEmZdZc+2csjLGz9D0vMC05MLNuwPoN5PJWShgd8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ypiuRU3R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D539606A32A
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ypiuRU3R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49C11F000C4;
	Mon, 16 Nov 2026 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794822179;
	bh=ntGd4/6HZdaPPq/L5OoqrEo/8o1hkTV4HrVpVknjtNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ypiuRU3R9r4PG5q5np8/HgfIIPNYfSgVCG/e7jX4LYTWISbqWL81RFRi1+bCmCwM6
	 hTipNZiUyRSKZdLShKTRairaHSmOzjcjWiwVQcfzSVtsVE8W0xU/Y1FtRykBVGSjVm
	 ZVIJmDy9pv1ixsX9UL4Q5sySiWrMpwrierjob+i4=
Date: Mon, 16 Nov 2026 10:42:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Federico Franceschi <federico.franceschi@proton.me>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: r8723bs: NULL pointer dereference in GetDeltaSwingTable_8723B
 (RTW_CMD_THREAD) on kernel-7.3.3-300.fc45; 7.2.15-300.fc45 works
Message-ID: <2026111634-ultimate-pavestone-d050@gregkh>
References: <6f2IDzSi9tnsIOQ0MsZOYnwzRrvPFFF_SfiGiOHNKDS0PVRE_gipGPRetY13dtnuF-hQ3otcwgURI9iLKFV-XVP9r-yqvcrdDx7qIU9hM7Y=@proton.me>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f2IDzSi9tnsIOQ0MsZOYnwzRrvPFFF_SfiGiOHNKDS0PVRE_gipGPRetY13dtnuF-hQ3otcwgURI9iLKFV-XVP9r-yqvcrdDx7qIU9hM7Y=@proton.me>

On Sun, Nov 15, 2026 at 03:10:53PM +0000, Federico Franceschi wrote:
> Hardware: Lenovo MIIX 310-10ICR (80SG/Cavalli), BIOS 1HCN42WW 04/05/2017Wi-Fi: RTL8723BS on SDIO (mmc), driver r8723bs (staging)

This driver is now deleted, please do not use it anymore.

thanks,

greg k-h
