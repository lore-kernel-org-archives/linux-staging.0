Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C981A3166;
	Sat, 14 Mar 2026 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475141; cv=none; b=tlpfTIDOgxNGyU9IPSHA773P0q7luLSHyBJRW5fWZXdKFG8VctVHUF3Lf9scffe4sGMMiUc+MsaccEDSUVk0AalHDZ+GXeVhUBoEMWFDm/cYqpoyuy7AOQ5YOfNhymUHBvC+t7ZcCJkzE7BrjJC66cnrIktrSapusgKJovIbhWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475141; c=relaxed/simple;
	bh=GEOXh1V4p0bCCJcA1g3HEwwYkSUKgGgveGDcvn2H15g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4CdrGYxGtLu0jIb/exP/qoE3QIJF2arkfIKhc4SzpY96DlnfpIeSYPz0trUneGmYs/+Ys5oFjCT9w4MDuArE2yETUQOB9Kw/gjgXkRYvnaj7vkP0n6jWlDtB5nNMv8yWb1prS0okckQNq3/RbyhtL8B2KKTwOhgm7zW8EElpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2n5X2aEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2n5X2aEy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CD4C116C6;
	Sat, 14 Mar 2026 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773475140;
	bh=GEOXh1V4p0bCCJcA1g3HEwwYkSUKgGgveGDcvn2H15g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2n5X2aEyzjIi2Ccrbr+dETZ5e0/kOy7uRVybQPtrHmnkymw546w29H1fci+5mlAxo
	 3LhyVwth9hpNufEgm5+oJzst3UYSuXRyqEBS4QisfNPmX7pIEibQWaJ6BCvrI8t2oE
	 Fan+Ntp1DwP07lvdnNDxTxjccU2P2ITLTU4j66wc=
Date: Sat, 14 Mar 2026 08:58:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary braces for
 single statement
Message-ID: <2026031435-rectified-congenial-275f@gregkh>
References: <20260314044558.86929-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314044558.86929-1-marcosandrade95963@gmail.com>

On Sat, Mar 14, 2026 at 01:45:58AM -0300, Marcos Andrade wrote:
> Remove unnecessary braces for a single statement block in an if
> condition to comply with the Linux kernel coding style.
> This resolves a checkpatch.pl warning.
> 
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---
> Changes in v2:
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

You didn't list the changes :(
