Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E318B67F
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651625; cv=none; b=UKL7UrmI7KWWe3kO2SbwYSWC0PYUiGtiE3A5kFcQF3xascAoFafKSCYLo+Y61TkOU0iBEq5UAjMAVtbhj4vUwHPo+H1blwNe0qjQ/d5RXPH+7clyyH+Jr9PUrTY4ppGE9iTaDovjnINHY81kGCGW37x9XktarJmV929hhSXjjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651625; c=relaxed/simple;
	bh=1yPFQr+LQ7wcO8XPJ4Yn13eZFfHEKxgk28BiUOh/5mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RukcfQ7RtdD61NzeTfimYD/u1x+S7HPDhgrPiVsSVHMxnFPmvVX11dY7AQuf0yNZop7iI3+TtjvPpNxZ7T13mf51nux9PYdaNcFMuuejBGYBPtalfK/Tze/hYv4O4t0OaJLa2OSkKrr+9E4xIF6H7d6WR1QvTGvGgyh1uJDDRmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S4MeuuiR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S4MeuuiR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12EFC4CEF0;
	Wed, 16 Jul 2025 07:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752651625;
	bh=1yPFQr+LQ7wcO8XPJ4Yn13eZFfHEKxgk28BiUOh/5mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4MeuuiRJ1wXZ8qEoH3OY8k1n/lNYd55D7r/IDa3lXQ/RqCqSt9j7V08FQ1SLtA7+
	 hdCwsStMcZsVZqE5FEduso8f3GK2ShBTxUivdIpvSrD1B8aiSx44eV0tRfvmBCLIc+
	 l9f2VRQIl8ggDp6GjNgzJznuDkoSmepVXmtbBqnw=
Date: Wed, 16 Jul 2025 09:40:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev, dan.carpenter@linaro.org
Subject: Re: [PATCH v3 2/2] staging: sm750fb: fix CamelCase variable naming
Message-ID: <2025071650-plaza-doing-ce5d@gregkh>
References: <20250716053357.64711-1-ignacio.pena87@gmail.com>
 <20250716053357.64711-2-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716053357.64711-2-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 01:33:57AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Replace CamelCase variable 'Bpp' with lowercase 'bpp' to fix
> checkpatch warnings about improper variable naming convention.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
> 
> Changes in v3:
> - Removed the const declaration patch as g_fbmode is modified at runtime
> - Split only into alignment and naming fixes

This patch is somehow corrupted:

Hunk #1 succeeded at 160 (offset -1 lines).
patch: **** malformed patch at line 47: @@ -191,7 +191,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,

How did you create it?

thanks,

greg k-h
