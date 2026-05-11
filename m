Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04AF39E6F0;
	Mon, 11 May 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503339; cv=none; b=RKZprtIZpyzSyrx1F+eMOIXAxRoq0RkMc8YA8jsVv480VU+1mwZo7Mj3dPO00LLtTDd/fnb3AURJZ93Kvv9O0GLa8hvRf1Lic0XN5BKsTQ5KROX2pFyBHom7RZlVJ1ItD2r094YYOA8IGepXNsAGX51yxd/6KPxfcyJMgqOcecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503339; c=relaxed/simple;
	bh=RFGhCYUvJZL88tchva9CVGvhbW+QURAp3QrfH2pvdGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Awp0CmGNs5YXop4qLHdZ9PHp9RxkY1goMKRAc+1wLhaZ1fsCvCjVZAHjENV//rWd8xIhBImgvDU9seUd959HaGorehRrBC7DogbeLvdgq6BlFboajRe5XaVZVkFPodE11lmBp84SsOjReFbZnbGIxflrOWDeDXSRSkF9ykdYdWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fnJ7ilhB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fnJ7ilhB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAB5C2BCF7;
	Mon, 11 May 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778503339;
	bh=RFGhCYUvJZL88tchva9CVGvhbW+QURAp3QrfH2pvdGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnJ7ilhBNM/bghrndc42AZb97lnJXyIFun1NzO9w7/purYcI0CozwE+ZR2PxoyJOQ
	 iflRydUHwj5el3Age33T6uC+QD8AQEc8BOodHFLo1edQq+ab0ZRjqCrlS+ZaG3wYVV
	 Ufl6rPP+WX339MqnFHmiRFVtZS5Zza3GdKM8cs64=
Date: Mon, 11 May 2026 14:42:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/3] staging: rtl8723bs: fix OOB reads and heap
 overflow in IE parsing
Message-ID: <2026051126-clergyman-bright-9ffd@gregkh>
References: <2026050436-italics-clumsy-e83c@gregkh>
 <20260505173818.3674164-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505173818.3674164-1-hossu.alexandru@gmail.com>

On Tue, May 05, 2026 at 07:38:15PM +0200, Alexandru Hossu wrote:
> v4, addressing the sashiko review comments on v3.

There are still loads of new sashiko review comments on this series:
	https://sashiko.dev/#/patchset/20260505173818.3674164-1-hossu.alexandru@gmail.com

> Regarding hardware: I do not have rtl8723bs hardware available.  The
> patches in this series are derived from static analysis of the code,
> cross-checking against the 802.11 spec, and reviewing the patterns
> already in use elsewhere in the same driver.

I'll have to defer to the bot here, let's get it to agree that you are
making the needed changes, as you can't test the code.

thanks,

greg k-h
