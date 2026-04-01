Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4F53E0226;
	Wed,  1 Apr 2026 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037962; cv=none; b=hngphpOEkBCWWJYhnD1uTZJdXw1bQBzwPQveuGUC1lNP04W7DpsHvwbStOuzyFi89jy12i1oPQkM8FmX3gMTvk0od591bq1aG7+cD0vxlWYgSws49GH5SRg60BzSh8+05h2YEU2w3Hd/12HIjMoS7SI7rT0eYPSCge4CPC1SAi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037962; c=relaxed/simple;
	bh=nGZIgVk3j3rsANG3Gh/gtcWHTXPpaZwhvocdwpGTxzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcxVSU+ZlfdVZj5PIM7wBAm+0Jl7fTJ72jdpr7Yk6fY49vAnh691tYMjy/3XPQwhSO58LR3Ey94lULy3dR9JqF6zOAr8PWkpFzh1/Dq4Gmi4HYv2vd7/9TlgUETcqHs0JAokd/MwHStANlFtb7yE1Rc1AN75e0OTDz1N6DBF9dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GypCpKrm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GypCpKrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D2BC2BC9E;
	Wed,  1 Apr 2026 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775037962;
	bh=nGZIgVk3j3rsANG3Gh/gtcWHTXPpaZwhvocdwpGTxzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GypCpKrmiSgkbvpsdO7AJRtQZN+heJ7uiKvu0BjJyI9mNfv1kfa7MJgzNjvUuTNSa
	 1ZZFIkWQSx+ZStkXtsBu1YcA1uYZZVej2Ds6UdHn1tnfm0/vcLwrQJcqSdDIxD0ADr
	 B28NWjLbf9aEeZk2jfIp05dNfykTUsTHS893JD0U=
Date: Wed, 1 Apr 2026 12:05:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Probert <linus.probert@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] rename/remove functions and code style cleanup
Message-ID: <2026040120-hangover-disarray-5981@gregkh>
References: <20260331155318.185117-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>

On Tue, Mar 31, 2026 at 05:53:11PM +0200, Linus Probert wrote:
> Thanks for the feedback on my last patch. I have adapted the following:
> 
> - Split each global function rename into their own patch. (1 - 5)
> - Placed the removed functions in their own patch. (6)
> - Created one additional patch for removal of a "space before tab"
>   warning. (7)
> 
> Br,
> Linus
> 
> Linus Probert (7):
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case
>   staging: rtl8723bs: rename global function to snake_case

You have 5 different patches here with the same subject line, yet they
do different things.  Please make these unique, otherwise this looks
very odd, don't you think?

And the changelog is the hardest part of writing a patch, as you are
finding out :)

thanks,

greg k-h
