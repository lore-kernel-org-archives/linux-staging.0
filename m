Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9741A6806;
	Fri, 31 Jul 2026 05:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475287; cv=none; b=NV45YzQl2mpVNKi8spFXoUL0fFOIhXFKJGIjFnLkrSDPX0sHsyzBxCK+KTeb+ZJary1zKeYqTmTEAB2QevBPHFR0otbf4vNFB5aLJfAaifV/np/IVHNr+pNMqW3yQ9AcXP6NUUbCxe1OSaq3To21LE1tCGfPG95X7F+GslkYO3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475287; c=relaxed/simple;
	bh=RPsg4CEUbyxZdj3A6W3tlxBUjHz/IM4sXzhf0pqMKFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQv/tIPlYu6flFjA6yOlOsnqAWJEm+XARFh4GrOHfSX2J2nKnEWopkzaFbVe4k6F/i/OXtBHdiF1uch1DyplaueQYOrMSX4kTPL+xkbQGlX7OeVF05VpBcZZVU42Z0hDfHtU06LQH++jxkOQkeDQtjf59OncUvIj4tx31/KsASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gR2lJ7ra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gR2lJ7ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F4E1F000E9;
	Fri, 31 Jul 2026 05:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785475285;
	bh=RPsg4CEUbyxZdj3A6W3tlxBUjHz/IM4sXzhf0pqMKFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gR2lJ7rafcAPPyYS6zBIo/HGvteKsxNWSMoJizCBg1L0BIst7wzbiSYOCN2L6Y/tT
	 NOK00xGbcKvek7+bQFNnCWAC0kxr76cyRdmt3VFLVo6/LjH9BnHC8I5WTS6XmsojJu
	 sn4t/hee0TNOLQSyq6jE+qCPQflt4F8QdbjPuiYY=
Date: Fri, 31 Jul 2026 07:19:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use guard(mutex) in ips_enter()
Message-ID: <2026073127-unicorn-supervise-165a@gregkh>
References: <20260730231714.81977-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730231714.81977-1-skunkolee@gmail.com>

On Thu, Jul 30, 2026 at 05:17:13PM -0600, Ivy Lopez wrote:
> Replace manual mutex_lock()/mutex_unlock() in ips_enter() with
> guard(mutex) from linux/cleanup.h. This is a single-exit function
> so the conversion is a direct drop-in and removes the need to
> manually balance the unlock.

Yes, but as stated before, that's great for new code, but for existing
code that is not broken, you should just leave it alone and not convert
to using guard().

thanks,

greg k-h
