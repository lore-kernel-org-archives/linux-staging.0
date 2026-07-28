Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBB03B8105;
	Tue, 28 Jul 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223825; cv=none; b=VzyLE0hTJjTjf6yn1DomZf7JcwVS9JrlKVhAowWJjXljRPJchy2b+Nftxt43gnhAAtwKHhzvKjCHoHe82khLF3lyexDzXfU0d0RZzOGHfpUOd6HcBCKkgZlZgfaoHv2DZrMMdz07/QrnfsdGhIcjR0eW/RlYE+0YJE4+Y4MXLRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223825; c=relaxed/simple;
	bh=mi5hd+O3WnthaxQ88B8mw1fhrr42qP9et5SXwo/8LLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3pE7lOEwEpmRQc4BazFlJJJ0VpzVKUG+Kf/cAo7KFUPDorYb/4JAAS9sn+tp7N3l49erdr1F6w8e70xOlp/hxDdQDndzkEQa6zA1WjSfZtN9xivrOdW8mi3Ea7CVtb9rae1GzzFcEFp/KHtbU2FQF5lJ5oHAcv5G/GonEV4ENo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bEPCiAs1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bEPCiAs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16F51F000E9;
	Tue, 28 Jul 2026 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223824;
	bh=yn6X1P+d6Hs7cTLV635AKaVn6A0L238cSkpEOd1Nkok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bEPCiAs121Kl4TSd6o+GwiVIofIFPXxr5jo++WUhf2op5t/PiNA7WRLxvu9K+ixVB
	 ZL4BewIziWA4D88v0C4ERUFnAaIiswAv6DWuPwmT8FyA/WefQSZyXqZg0S60Q+AvwF
	 M6xXkSvPkwF+mp9hdhlaS5lWxqvE6ZFazE9jctGE=
Date: Tue, 28 Jul 2026 09:30:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Olivier Tanoh <olivier.tanoh19@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: rename mBratesOS to avoid
 CamelCase
Message-ID: <2026072851-foil-womanly-4837@gregkh>
References: <20260720124544.63457-1-olivier.tanoh19@gmail.com>
 <20260720124544.63457-2-olivier.tanoh19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720124544.63457-2-olivier.tanoh19@gmail.com>

On Mon, Jul 20, 2026 at 02:45:42PM +0200, Olivier Tanoh wrote:
> Fix checkpatch.pl warning regarding the use of CamelCase:
> CHECK: Avoid CamelCase: <mBratesOS>
> 
> Rename the struct member mBratesOS to comply with the
> Linux kernel coding style.

Why are you keeping the "m" and "b" here?  Does that match up with what
is really stored in this variable?

thanks,

greg k-h
