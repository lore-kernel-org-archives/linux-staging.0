Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A9397682;
	Thu, 12 Mar 2026 05:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773292326; cv=none; b=KhiaQXMWHdE/i6V3nqxcu/SgmTXk+31j/G2tJrxfixXGB4o9/vuq7gQbhBBAT9lUMVyo5zqCpNmxokKjw4LZ7MFbiDhB2e6UyoaM948PYl/gGPIW2J9ni4EbhJ4Sx4sOmXEqU/MFYTNda0g9CO7j1XxJLCkc27AW9oCvgiHLZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773292326; c=relaxed/simple;
	bh=dW9duK55rgDBx6V+uGrlHG9hUaHZ6G2aUfoCBYcJ5m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTgKFM14Yhezna7eABR0kkOBuBpIaJ3gBEKysoYOa93SlXvEpCJG/yD9NtxYlXZm2L1jKvdrd4u/iQH9Jb9GudelXol3qase6i8RzlKDT52sVZRuqh8h7DIKIadMeNd4r8t4m+hqQzhhgaeJWnvYshzvObWSBpPVbZ9+jtMKoE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0uLIQsxq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0uLIQsxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F561C4CEF7;
	Thu, 12 Mar 2026 05:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773292326;
	bh=dW9duK55rgDBx6V+uGrlHG9hUaHZ6G2aUfoCBYcJ5m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0uLIQsxq/DQrWU3MvN5i1x6G3wvMjurD6JQM4/w3t/zb863mBcEHG0k7Y4SOzyU6u
	 FNpbZ8/seiKTXWydMMiCAKyG7qvUkNV0PL3x9dopZ2JCjuQ4NUT76aTWqKeMr0U+RS
	 Hc+QDXPXMMkzzL6G2+Ojh/E6dqR7PWIXjBVh9Kno=
Date: Thu, 12 Mar 2026 06:12:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rahul Joshi <rj5547884@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: add comments to locks and fix
 alignment
Message-ID: <2026031211-romp-angling-1795@gregkh>
References: <20260311184104.499201-1-rj5547884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311184104.499201-1-rj5547884@gmail.com>

On Thu, Mar 12, 2026 at 12:11:04AM +0530, Rahul Joshi wrote:
> The spinlock_t and struct mutex members in struct gb_tty lack
> comments describing what they protect, which is required by the
> kernel coding style.
> 
> Also fix the alignment of the wait_for_completion_timeout() call
> in gb_uart_wait_for_all_credits() to match the open parenthesis.

Each patch can only do 1 thing, when you say "Also" that's a huge hint
that something should be split up.

But, in this case, all of these changes have been rejected previously,
see the mailing list archives for details.

thanks,

greg k-h
