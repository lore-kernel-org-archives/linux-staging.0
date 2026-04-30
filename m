Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE0478E23;
	Thu, 30 Apr 2026 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574518; cv=none; b=Aoku2XlwIdoAJSb+Vugf2Oqsc3q6H0jEv4mPVe+H0IEJ99R+++xuSBGTvUdKBVRoWSzRd4n9DR/VkQmRzZ7NMQ6MDurfP8lmi5lqrgdRAeIaGCHQNOVD7NJeNu3+PQ34maGZDcmq614/6O47kIB58YSOHHapElfjOrhEOrMaei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574518; c=relaxed/simple;
	bh=WETrAJcIlSah2EiDy6oPZovzHDtpZ/7lP0HjAqaIPHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lURUylSZKIs+o5wCc5i2FoZ/LQw+JGU1Uvj+H6mmpMq4i9dZ8vayQomRC05HGQMg6W5S/jcIkO/iCGn/C8pB5PSd4Nj+6D9XKqgPiY+hqQaPQyZS+opBTc7q6ujGyof5Wj2kCta0kJspZquEhn0q7pmHvxoyNavRw097GIy03Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YYn4aLkg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YYn4aLkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC174C2BCB3;
	Thu, 30 Apr 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777574518;
	bh=WETrAJcIlSah2EiDy6oPZovzHDtpZ/7lP0HjAqaIPHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYn4aLkgWfwwtPEWd37SY3GpIGjhYHeuKq7g8sHmqBzAzXrHv+DDa7ikwvWqErMwl
	 CtOp7yNpRhTNZHdHQM71rCEaIjvMvFmtgneNz8V9dbxVieWGm4t+gSJhBn2kcOnav8
	 yoy0Sdjij4PEIMc/GM+B8q3j4fSz/+dBAnHYg71o=
Date: Thu, 30 Apr 2026 20:41:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bentley Blacketer <sonionwhat@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: greybus: bootrom: replace dev_info with
 dev_dbg for firmware name
Message-ID: <2026043015-carried-snub-a7c6@gregkh>
References: <20260430175437.3699-1-sonionwhat@gmail.com>
 <2026043050-kinetic-unquote-f6b5@gregkh>
 <CAD3iFGNtqoGUUybvM2kU-hz5vRstukmCY1x9TywF8BairgUypA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD3iFGNtqoGUUybvM2kU-hz5vRstukmCY1x9TywF8BairgUypA@mail.gmail.com>

On Thu, Apr 30, 2026 at 02:08:35PM -0400, Bentley Blacketer wrote:
> >
> > Hi Greg,

<snip>

For some reason this was oddly quoted and in html format which is
rejected by the lists.  Please fix up your email client settings to
properly quote the emails (see the documentation in the kernel for how
to do that), and resend it, and I'll be glad to respond.

thanks,

greg k-h
