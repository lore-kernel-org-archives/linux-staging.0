Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FB318FC7C
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 05:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730699218; cv=none; b=LSzIxOyrxwsHCAnhq8cYOlcKzSRPSW1TmJhSqI2I7smtJ0t8Uj8TrgRqfhfLoSu+dfSETfPXZ3ehqR6Vgyf2NPZzTbuuFMGmfsO7vGAmDXyG9PCdDYjTgEmI0umCgECoEdc18jlAd8HjPDUOWTu3rEjIKlsN8zYuMFlUE7kV2Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730699218; c=relaxed/simple;
	bh=6xvvjVL1hinQnmXHlSlLp/wtxeDomeRpoiF34rNf3U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o33KjV8QRApXroibaFXKxje/Ec5gY+GzOb7iMi/hqj1/W34m5zqK6ijzR0yshVmNePsjo7fovCX6H2RjzxPOf1gtbDP60FZHtjqs4IihMPJ+rrLC3G+wz0lerF0Zt5Cz0PL+tuYSCU8HzF24jJkfe36WKaax5CgEC/RvSv9LFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UlIpNjHi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UlIpNjHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE309C4CED0;
	Mon,  4 Nov 2024 05:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730699218;
	bh=6xvvjVL1hinQnmXHlSlLp/wtxeDomeRpoiF34rNf3U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UlIpNjHiBqM8LBrMtZssSatpUHXR/bczierETFJW2KBwo26MgMseFu3kwuNzV1YkM
	 tTpu0Z7vZgOAt0UBzHakkTB0JjlUD4mhT76VDR8YC7LbCqLRREpH+cZsorlcuxmhrE
	 UP85IBhrUBizYBTw+PHWiWWOvha+rc1eN61MhXjY=
Date: Mon, 4 Nov 2024 00:46:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: avoid unintended sign extension
Message-ID: <2024110403-humongous-overbook-f4a3@gregkh>
References: <20241019184550.C44F518D8CD@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019184550.C44F518D8CD@bout3.ijzerbout.nl>

On Thu, Oct 17, 2024 at 09:54:47PM +0200, Kees Bakker wrote:
> The code was basically like this (assuming size_t can be u64)
>     var_u64 |= var_u8 << 24
> var_u8 is first promoted to i32 and then the shift is done. Next, it is
> promoted to u64 by first signextending to 64 bits. This is very unlikely
> what was intended. So now it is first forced to u32.
>     var_u64 |= (u32)var_u8 << 24
> 
> This was detected by Coverity, CID 1600792.
> 
> Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  V1 -> V2: Changed commit message, added Fixes: tag and a reference to the Coverity CID

Again, no "v2" in the subject line :(
