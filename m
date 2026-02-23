Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A25155757;
	Mon, 23 Feb 2026 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856384; cv=none; b=F4sd5TCowTaaFCLT/p0u4NLoB2nfwsS1pHSgxKsUhPAdDO45anngr851IOkVVNdxCVag4YOk1+1qD7YSFySdj2OiQLpevK22t94oG+1/9pf4bQQsHUGMwlsSYqX3it2aICijjr2MkeEQi7OSjIat3kImjLHC588e0e8fPVtKa+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856384; c=relaxed/simple;
	bh=+FWXa0tJn3HZmH0vuZ3D0gYVTPVqOfX6DexcZ21dnGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFmXxfa4cCKz+hOdbV6MYmH7Q1L4zFi5kPvuOOJP+5SKDiuSgyPrOqDDZtNBjNT6TC+3mbVSCFf9T8LjUyWOurx2fEAF+ePwwoGEqVjc7FwY1tmK6sIUMkIS4rcAH08Qf4uyrApcdv4PQupxA9AaG07mCaD2PDAJd0v8mJa1074=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yzgCme/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yzgCme/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0635C19423;
	Mon, 23 Feb 2026 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771856384;
	bh=+FWXa0tJn3HZmH0vuZ3D0gYVTPVqOfX6DexcZ21dnGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yzgCme/8+B3BdU/BTrUU/m4wAki0ZSyOQ9Q0toRMgfNelTfChoB953e3kGW9V//79
	 SolAjydiypAM5A9nRtN4TUdwZcNxEzM36VT2sR2Dv4xsxDc97HQeHHH93cmLnOuE29
	 QtzLRlKtfBYG7OEpWdC87wFyG1sXgmPDkVGjr8TE=
Date: Mon, 23 Feb 2026 15:18:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: luka.gejak@linux.dev
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 01/22] staging: rtl8723bs: fix potential out-of-bounds
 read in rtw_restruct_wmm_ie
Message-ID: <2026022332-reemerge-gestate-5760@gregkh>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
 <20260208110111.46642-2-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208110111.46642-2-luka.gejak@linux.dev>

On Sun, Feb 08, 2026 at 12:00:50PM +0100, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> The current code checks 'i + 5 < in_len' at the end of the if statement.
> However, it accesses 'in_ie[i + 5]' before that check, which can lead
> to an out-of-bounds read. Move the length check to the beginning of the
> conditional to ensure the index is within bounds before accessing the
> array.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

You have mixed bugfixes that should go into 7.0-final with cleanups in
the same series, makeing it a mess for me to try to apply this.  Can you
resend this as two different series, one with just bugfixes for
7.0-final and the rest being the normal coding style cleanups?  That way
I can apply them properly.

thanks,

greg k-h
