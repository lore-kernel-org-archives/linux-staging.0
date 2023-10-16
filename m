Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF328692;
	Mon, 16 Oct 2023 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rS2G571H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C2CC433C7;
	Mon, 16 Oct 2023 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697468453;
	bh=0GLvmKMndiyVt2ULVPwCbqdYlF8TzgXDxAHUw0Tml34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rS2G571HfKSELOJ65cQHDl05C83C7XrPtjD2iGcnZJQiCCAXXmXVv4RLjJ3Dj2XV/
	 FHHkasnnjelj+h0Muc4UED112XsdR8cbC7dOdmur6L4smOq8s3WK1+g5o3qn8o5aX0
	 XfP59iKl99MUMv/3XQmvYIBLxwSu80CphnkBzbUY=
Date: Mon, 16 Oct 2023 16:57:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: emxx_udc: Remove unnecessary parentheses around
 condition tests
Message-ID: <2023101658-unmoral-survival-25cf@gregkh>
References: <ZS0f+xaaLmLpKv2a@gilbert-PC>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS0f+xaaLmLpKv2a@gilbert-PC>

On Mon, Oct 16, 2023 at 12:35:23PM +0100, Gilbert Adikankwu wrote:
> Fix 47 warnings detected by checkpatch.pl about unnecessary parenthesis
> around condition tests.

And as I have stated numerous times in the past, they are not
"unnecessary" at all, and provide a valuable hint to the developer as to
what is the ordering involved.

So you can ignore this checkpatch warning please, it's not valid as far
as I'm concerned for the subsystems that I maintain in the kernel.

sorry,

greg k-h
