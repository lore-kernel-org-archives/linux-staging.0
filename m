Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E144B190686
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 05:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730699216; cv=none; b=QkuySiwbCffA59uxsesCZayXl/AQ807y8YjbYq8cslcBDpHqCOI+ptWJi5T8pkuFLyRi39OdUiqO3zuWNWRX1RTrI5VO5YzkUqKBWbHmbP6lV4rxon/OGQmZmxfI8/e2D4RmEhqOlolUf1qMqrYplbpRUyyt0it5yLL2ukQzcOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730699216; c=relaxed/simple;
	bh=TPXcj2FskJgYqY71/0hQwjg8hx4OoVqfRJGiBxmPclY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzqIxASXTV+9YJIPDnD/7H8dNwi8yX2wNnBs2zb07NtEmg76x+TjZqdyiDWNzGGsn6Tac3TDjNRQkkoknppG9shiFkDCC1Ce0tgFAYnYBo43YcjKVJwTQ4fskX+WfsY7QOcg5Jcwpzr5l2KR2XCMN4J/uQPQP1q0UyfU9Zi+ZdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DYQyupig; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DYQyupig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343F9C4CED2;
	Mon,  4 Nov 2024 05:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730699215;
	bh=TPXcj2FskJgYqY71/0hQwjg8hx4OoVqfRJGiBxmPclY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYQyupigT5Pa0uBOlblwAf62YDcyIva9I2CwZeTnvqBu0VxPtt2bbC6vGOKPrUhr0
	 YPd1aEzv01J6qMzv5nlZ3s2PKXC61Qf5BHiOU+wzPyqXWuhmNAUl9LGmWIsz8VuVdt
	 CqKH14YQudKBXsMpP2gEdnMJt0OtYIyBySvvCeqE=
Date: Mon, 4 Nov 2024 00:45:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: Change return type of
 fluke_get_dma_residue
Message-ID: <2024110442-citadel-papyrus-f8c5@gregkh>
References: <20241020153948.B607818CC05@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020153948.B607818CC05@bout3.ijzerbout.nl>

On Tue, Oct 15, 2024 at 10:33:30PM +0200, Kees Bakker wrote:
> The function fluke_get_dma_residue returns an error as a negative value.
> So the return type must not be unsigned.
> 
> This was detected by Coverity, CID 1600782
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  v1 -> v2: change type of `residue` var; add note about Coverity CID in commit message

There is no "v2" in the subject line :(

Please fix and send a v3.

thanks,

greg k-h
