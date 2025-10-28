Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE02EB857
	for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642374; cv=none; b=d6Uh4ohcQZwzMy057IOW6xQ5izjxr/bICw0O2JQkPabsT2TltwqcWcjNdFCJmpW4wvVWKUYojhmNHO54tMPNVKLJOprRxNDfI4EUu2+pLbCEZbjTKoo/N7ejPU+CpDQm2HDJ8S75AUy9PqtPNu1zEnLY+9VpafoxdrDJ3D4/qK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642374; c=relaxed/simple;
	bh=buTDxIMpNa3HS90n/aoiH0c0rKo1l7AXTp0+CMoXXBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhs/OvLh9wnzxwnw2HFxrUw5C/QFCz00tD4hsk7RA64KXXxkT+GyZL33rtdeQA2yamUiAuz5DyrIEKIpjyD8WMVcxYgrM+H18hqW02PK586Yt9cfNqxTaMTquShQryay6znNHB27/NqXtJS1B1UKoYCqrFlruzohIoYPoFAZvPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=duGklQZm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="duGklQZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE06C4CEE7;
	Tue, 28 Oct 2025 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761642373;
	bh=buTDxIMpNa3HS90n/aoiH0c0rKo1l7AXTp0+CMoXXBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duGklQZmBZm0txcNFmHnT39O730cdkpXUCgdJwHciiDgOrEhO/5B2CROYdsvY6j5O
	 C1W/BAffOJvifzcXVeqMRt/yJy1FKulzcK1l6/XhyfScvEoJPzbhtYOBlShdykEwod
	 CdOB+AJdtbw5l96y0LvnSQy/7jJopbQIvKcOXK2g=
Date: Tue, 28 Oct 2025 10:06:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] [PATCH v3] staging: rtl8723bs: remove unused rtw_sprintf
 macro
Message-ID: <2025102840-shivering-quartet-3b3e@gregkh>
References: <20251028085811.20831-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028085811.20831-1-rafiqul713@gmail.com>

On Tue, Oct 28, 2025 at 09:58:11AM +0100, rafiqul713 wrote:
> From: Rafiqul Islam <rafiqul713@gmail.com>
> 
> The rtw_sprintf macro is defined in osdep_service.h but has no callers in
> the driver. Remove the dead code.
> 
> Changes since v2:
> - Addressed review feedback to delete the macro instead of replacing it

As per the docs, this needs to go below the --- line.

Also, you have PATCH twice in the subject line :(

v4 perhaps?

thanks,

greg k-h
