Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13CB3DCD98;
	Tue,  7 Jul 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419567; cv=none; b=eQ62MDrOFNzy3IgeLAi8hfCTrqBS3bRQ57CrAUfIXEhjqmDxfVvfPt9R9CyW4iWxpd4Iz7yTwZhOc55l+bMF9aCCjvLgjDBgCGCnX7pyW33zHh6CE4TuI1QtUGs7Myiusinny+LLr2nXgVKD9ZeTxGoHx98s1onA7w1T9w/4+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419567; c=relaxed/simple;
	bh=SDVQHTMTAjAZqnVSgH4couJk+Nd0qhY6AeD+5QAkAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnAguOZxPWckoDeBbtSHB07XrnEE6fHsssokvv30/F9u4Sln7vrxBlFxDdVNF1JFlGKA7pAjGNT858h2kkhr/xXhf211y0YP+2Y344NLKSSqJmgG7Xurjr1lSoWgN3+YYf4dbZ6tCfnWqtjx/BDXzF6/Vw68XdcP0xhWAHJ8ejc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q4XqtikD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q4XqtikD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3C91F000E9;
	Tue,  7 Jul 2026 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783419566;
	bh=Dr05wanIeOjsF9LfjoURkL6FIZyic5VUOcOKvWApYPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q4XqtikDUIPJ0dlC32qHDEkxPsBFW/3yU35l6zuNUcYWASxpp8ePfz94qXgNdlKjH
	 8ttSovmNjqxZsSdZNagca9eXg4NixVVMkqDvCSOxcNBHokQJ+ohEJAADP0YICJNL6I
	 yXsCzXHBJf8ANFfWav+SAQV1++iIT5MH7d/Yi1xA=
Date: Tue, 7 Jul 2026 12:19:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cong Nguyen <congnt264@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: use nl80211_iftype instead of
 custom NDIS enum
Message-ID: <2026070705-cement-flyover-bfaa@gregkh>
References: <20260601161051.1832080-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601161051.1832080-1-congnt264@gmail.com>

On Mon, Jun 01, 2026 at 11:10:51PM +0700, Cong Nguyen wrote:
> The driver defined its own enum ndis_802_11_network_infrastructure to
> represent the operating mode (STA/AP/IBSS) and translated nl80211 iftypes
> into it in cfg80211_rtw_change_iface(). The kernel already provides
> enum nl80211_iftype for this purpose, so use it directly and drop the
> redundant translation layer.
> 
> Map the removed values as follows:
>   Ndis802_11IBSS           -> NL80211_IFTYPE_ADHOC
>   Ndis802_11Infrastructure -> NL80211_IFTYPE_STATION
>   Ndis802_11APMode         -> NL80211_IFTYPE_AP
>   Ndis802_11AutoUnknown    -> NL80211_IFTYPE_UNSPECIFIED
> 
> Compile-tested only.
> 
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
> Changes in v2:
>   - Replace the custom enum ndis_802_11_network_infrastructure with the
>     standard enum nl80211_iftype and drop the translation layer, instead
>     of just renaming the enum values to uppercase (Greg Kroah-Hartman).
> 
> v1: https://lore.kernel.org/linux-staging/20260511134930.4086521-1-congnt264@gmail.com/

This doesn't apply anymore.  Can you rebase it against my
staging-testing branch and resend?

thanks,

greg k-h
