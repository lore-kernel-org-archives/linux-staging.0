Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1940B11C;
	Mon,  3 Aug 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769804; cv=none; b=aniJPehoW7lxQASmEbkRIIkWtJbv99bADayNCV5ZrTdWxeDwzYmz9EmJl/J1uY74CiVLr4jbOozxeLuzRpS/qkz7Y/yqu15RIAILj9h0N76iTHCWZwepcICDNEtWsTel7Oeu89w55WvY4nd1r/Nzl7iQ01vR0ANzIphyLTl7nFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769804; c=relaxed/simple;
	bh=ssT0/iamXUYDHkLRNZsXLb/iqClDxwjg0Tu+i1qOwdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUTD6fddsjqjWexENXhoSOxP3gHKNAPPYvikKw/6t2QdFAbK2piUhPL0FeVJ1B+7fkiXKHx0jAMFs9zum/xr04QNb0RMmVkmRfftQ4afPOaRWV0FskC/JAOzNhKRYCD8RmgBy6gPBsPMOiqBJLjLQCQE6o85/I3DLgfLgNwBFsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pPaIZk9F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pPaIZk9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0111F000E9;
	Mon,  3 Aug 2026 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785769802;
	bh=yjRbAzDu1Co+z508UZn1OFsW8D5uBOHKzqgZPPvJw30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pPaIZk9FBBFYb7RzZqdELUFCK5vQ/vGTpHvPkSLxRa5ou8z1SOTP/BJTLFxDUoGqI
	 Lr+wUSWsFRRYqfymwl0HNKMFLCdC58b4nAmHYj6yLYrBi3a2j24AKyCV8OgQ2c5r2I
	 8iBRj4PN11U8/27JP08bGZdU01SIwmjL/0zYW24k=
Date: Mon, 3 Aug 2026 17:09:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mirza Ishan Beg <seedandsyntax@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: refactor traffic_stat access in
 collect_traffic_statistics
Message-ID: <2026080337-geologic-vertebrae-b68e@gregkh>
References: <20260803144826.15980-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803144826.15980-1-seedandsyntax@gmail.com>

On Mon, Aug 03, 2026 at 08:18:26PM +0530, Mirza Ishan Beg wrote:
> Replace repetitive `pdvobjpriv->traffic_stat.` dereferencing with a local
> pointer `ts` to improve readability and reduce line length. This resolves
> multiple checkpatch line-length warnings without manual wrapping.
> 
> Suggested-by: Nikolay Kulikov <nikolayof23@gmail.com>

Where was this suggested?

thanks,

greg k-h
