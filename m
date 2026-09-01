Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A9377553
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256009; cv=none; b=Exq0H0U8eV4zglruHKFoHZbEmFPQV2g2gWwQ3pgtNXAtgUVfjLn415KSyHGo0iR1GA2z/F0zn1DtzE7DlnJHdjQWdjNrgVXSQSg+etyJGWCjz4k5Gohaf6XCEpILTFu72MKMVuCS/QcN+XzpRzZJWLAvEixRIpaexsNvM0fgojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256009; c=relaxed/simple;
	bh=gU2+NL8Z+nDchORsWRzyBHiWGjLHIWdskRkOv+Enwwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOKN2rltONhTXfRNI7hibOIm4U25r5Mm9pPY6ZJ2ByM5cy7MeNZImIBwT4o/am2u0nZG76wwKb+bbxQjkFaDPEKVhcV2aaf1YAj4wTwuRoTIlt0WpySy+EbhAiU90/xq+sHWlJ4aLb6ZgqGu/bnQe10Wcy8sBxs3LLw7kVsjEb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ao3HEpBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ao3HEpBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C26E1F000E9;
	Tue,  1 Sep 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256008;
	bh=l0DAbzdmo+sgSq6SrmoCELDhn5hTISueF+lNNNTbQV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ao3HEpByQWUZKkng/SYJzOjdpIQSTZIVye39MfRnS1YIUBArDP2ccVrsbAwlcVgzr
	 vV0yS/3If4OTeaNlvkmSGwHegaLjYKyFQoQT3JOUFM5yKJ3a/ABI+JJ13MWNiwQJo3
	 1joAFw1Sgfoh0Lwu9hc5VgRBaCLj1G7qgoVJ3PLk=
Date: Tue, 1 Sep 2026 11:46:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wu Yifan <nickwu13@yeah.net>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove extra blank lines
Message-ID: <2026090136-sprung-preoccupy-ca1d@gregkh>
References: <20260804064804.9205-1-nickwu13@yeah.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804064804.9205-1-nickwu13@yeah.net>

On Tue, Aug 04, 2026 at 06:48:04AM +0000, Wu Yifan wrote:
> Remove the redundant blank lines in os_intfs.c to comply with the
> kernel coding style. No functional changes.
> 
> Signed-off-by: Wu Yifan <nickwu13@yeah.net>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ----
>  1 file changed, 4 deletions(-)

Does not apply against the latest tree :(
