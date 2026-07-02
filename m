Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2066835D5E2;
	Thu,  2 Jul 2026 05:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782971685; cv=none; b=JoBw5UevzSndTI4b/ekfW0M9jP6oDhFC4lDJ1GEKG5T7z9TaYN4s1f4fCplm9AhdXkZWYG4mw9qi0cHXYL9qAOsTf9iaWCIPNBI+qaCV609lq6ZXiT+lg2e1ArZ7TlLTVgolzQht+jRzZfLOnYeNP5/5HR9iH3qpmo3zGR+wxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782971685; c=relaxed/simple;
	bh=n19fVKCuT8I09AE/Ju2i7xfXPTE1Jt+f6vnjMkXkAIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnhWAiwvB+aemgV8de9RcxHUhpYlQsTUVm+7a1Wyap9WR3lc6j/lQfae2TvqmDOtXM7FxePr5fJavogU+NBCgXXtEuLpcK3RkjmZWKqXDSq+w48YR+vvhS434I+btOw024kCsZaUJmcwChyqX8mCn+djpqMyndBoJlOfbziHhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h8/KGVjG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h8/KGVjG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F0F1F000E9;
	Thu,  2 Jul 2026 05:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782971683;
	bh=n19fVKCuT8I09AE/Ju2i7xfXPTE1Jt+f6vnjMkXkAIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h8/KGVjG8TorLChTV5C1zgnwoBHiQJb/RGe7GwTNh3e6ntH1DnaRIJAzraMwOTKLh
	 gOvZ0pBH2xNQUVqzpuFGoMfaIfMS2fVbEI/RFKqwWMP6EoK6KRdf9MdGIACKpeXLat
	 wP/EQ9ysbH13Ka0MtQfhdmA+4J030dkyxHEopmuE=
Date: Thu, 2 Jul 2026 07:54:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: pastraman <pastraman1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename bLinkInfoDump to snake_case
Message-ID: <2026070239-accent-astride-712c@gregkh>
References: <20260701152817.11273-1-pastraman1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701152817.11273-1-pastraman1@gmail.com>

On Wed, Jul 01, 2026 at 06:28:17PM +0300, pastraman wrote:
> Rename bLinkInfoDump to link_info_dump to follow the kernel coding
> style, which discourages CamelCase and Hungarian notation. Issue
> reported by checkpatch.pl.

This does not describe what you did in this patch :(

