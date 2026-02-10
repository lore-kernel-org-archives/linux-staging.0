Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B759481DD;
	Tue, 10 Feb 2026 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770699530; cv=none; b=sYnGso/bHX8LjQKSlW/n2rUGoicrNp7dMyi0ymIjIXgkxu84KCru4iOniciw4YzAnLSkC6G+Ae7Zsi226q1yjyCguWMCZrmds2Mt0kpmqynOjDrd929HYrcY2xSr24icBlOZ+dyvC4MnYHUW4HGQM/8rIlQTCDkD2K9NkFpVKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770699530; c=relaxed/simple;
	bh=0tjkNnDtUNwV51VvxbVrICiOQ12qsBkZNQF5cLVToQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLkNrrVEM9s0sqdxuuPgoEJFolOKnBIAwPJoLNRuLqrIPHrqaL8TmQzLTAb9v94zoXSiIXfDbed0BfihHz0jdlpvfruSlfLePigDo4VGH34qu3vDbIdsKxaSMUIk7NOpmiedM6IKlcgcKTn5P3mYOjMVvEIe0sWvVB8r6AeSTjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X+nPhSDK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X+nPhSDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADBEC116C6;
	Tue, 10 Feb 2026 04:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770699530;
	bh=0tjkNnDtUNwV51VvxbVrICiOQ12qsBkZNQF5cLVToQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+nPhSDKexAfoez+u3OujBbl64Q7ao+7U3cGRIocnQ1Kb1Zit874Rp9RJQTEYZgPw
	 aiWzeWNsVXTcR9YIuA5KQuLnZoGLanBoWT1OFzVohgumTvqMA6urryijkcgODSzY7M
	 C1Lv7s1X2yV9yMTSlxptaelmgjEdF524QYN+r9dQ=
Date: Tue, 10 Feb 2026 05:58:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yoelvis Oliveros <yoelvisoliveros@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: type change from uint<bits>_t to u<bits>
Message-ID: <2026021020-thievish-bath-1c2e@gregkh>
References: <aYq028TNyXQWZ_v5@home-pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYq028TNyXQWZ_v5@home-pc>

On Tue, Feb 10, 2026 at 12:36:31AM -0400, Yoelvis Oliveros wrote:
> Runing the ckeckpatch.pl on the staging/octeon driver they where using
> uint<8/16/32/64>_T as type declaration and the checkpatch.pl was
> putting a [CHECK] flag on those and that they should be change to
> u<8/16/32/64>
> 
> Signed-off-by: Yoelvis Oliveros <yoelvisoliveros@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 1922 +++++++++++++------------
>  1 file changed, 972 insertions(+), 950 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 35b5078ba51e..aea3dad37cfe 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -1,188 +1,190 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#define CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE	512
> +#define CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE 512
>  
>  #ifndef XKPHYS_TO_PHYS
> -# define XKPHYS_TO_PHYS(p)			(p)
> +#define XKPHYS_TO_PHYS(p) (p)

<snip>

Why change all of these #define formats at the same time?  Please do not
do that.

thanks,

greg k-h
