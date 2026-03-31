Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAF3DE454;
	Tue, 31 Mar 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947092; cv=none; b=jrRP7+VcXT/2YVJJ9R47V9zXwBjMb91eRklKOgi7reHtxn6/tZ0xfseW6rDynhH1d25lZh/ozZLmDRHLujYm6uhRFo9kl1aWfLdWg6PNsgI3+QhEeiKCVmC3gSRhlaAg7uCgipMemqlvZo3Np5/uBgnMFq4XFlMau4lNZuA39vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947092; c=relaxed/simple;
	bh=JfcKsPVnHnsBKZeBfw0suWy3vrfFdNL0CbDDr1dt8LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxcjK0k0oKQJeDFdn5HNMuWI5cb54Cb3MN0inKjPGev5AyeRQ48IFBx45zOiLAdidvGwAhfWBxCClGngj98ht9cUD/fRL3WvFkw50RSCkqVaw3EEGt4i26NS1t1SVEDHQGSFEBeGWVyHgyNOcEYjt2cw17eTBHHd2aJRgx2N/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=biS74hEw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="biS74hEw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393FCC19423;
	Tue, 31 Mar 2026 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774947091;
	bh=JfcKsPVnHnsBKZeBfw0suWy3vrfFdNL0CbDDr1dt8LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biS74hEwcH4J6+o12R5MRMy0Gs1O8kcPn2M2mEpQ+1MMY4rYHdVp6KcSEhh0jmky3
	 23KDBazRNQtiLzRx8A+Re4M5cxRLQt107o2tdweQmtAceEImwvGdHjx4JmWB2Ds4bs
	 uYUCW9ar3Q6HU40+Ps/PY2R4HNwNY9oVQtL7t4ro=
Date: Tue, 31 Mar 2026 10:51:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhavya Gupta <anim8tor.ing@gmail.com>
Cc: ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename camelCase variable
Message-ID: <2026033143-liable-referable-63d9@gregkh>
References: <acjdwatHpEkfBiXT@gamin8ing>
 <2026033119-dreadful-disdain-df66@gregkh>
 <CAGRbwOPK0Y6QAuB3wzm7L6mov0tu6-KMRorGPp9SWU3Z=iy5LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRbwOPK0Y6QAuB3wzm7L6mov0tu6-KMRorGPp9SWU3Z=iy5LA@mail.gmail.com>


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Tue, Mar 31, 2026 at 02:14:36PM +0530, Bhavya Gupta wrote:
> Hi Ethan,
> 
> Got the Reviewed-by tag, thanks!
> 
> Greg, I've submitted the patch against the staging tree which is maintained
> by you. Can you please correct me if I'm wrong?

Please do not use html responses, the mailing list rejects them :(

Yes, that is correct, but please use the correct branch.  Right now that
would be staging-next or staging-testing, which ever is "newer".

thanks,

greg k-h
