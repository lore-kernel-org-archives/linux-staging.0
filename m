Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965EA2DF134;
	Fri, 13 Mar 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410523; cv=none; b=joGeg3xpcuuMns6UjanLUjnYMNSyoiAzyKTeupfyPds/uF0C2hHeGEmokukmudY9UFsOMTx1HHbEYT3uNwpF+Q49+VqAbpxLo7L83wE8XnG5qbb11tnEmRlBoNxLT0CFP2iM9O9ARaWzrN3PfE31gwlXSRkV38oJCXbAprYFHLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410523; c=relaxed/simple;
	bh=lLbp/zSb6HHPH9OXV7i5/viX0/E/vezZZH+7LexwtEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+l4Yjl0EvSenzLSCBFFkxiF3gO3rvoXx1Bnz3ETV7QCcJR7UxuGwgnehyl2jhX6EwBCyHWZiJRR1WnUTnPY1Jx5PhXzEypb5pjOSMZWo40PcvABY1ccwDgiZtBzF3O7Arw7p4UUyNWGPlq59YWH/y21Dzenl4Q5GIrZiFSVAvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BzshmJgw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BzshmJgw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD00C19421;
	Fri, 13 Mar 2026 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773410523;
	bh=lLbp/zSb6HHPH9OXV7i5/viX0/E/vezZZH+7LexwtEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzshmJgwOwrZksmWoWuA6TD/A5YMftnyrC5BcwENrrpTxOnMh+ZQe6MLWhk7kXfZM
	 yz2EKyQsBeOws6yAXlRvpCixyfCouoyI6bnYa8mLEiCeemB0es4caES4E5x4QsHG42
	 PdAictVurJGm+0XrPmPzV9HX4QVdekVxFsmxlGEI=
Date: Fri, 13 Mar 2026 15:01:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Improve error handling
Message-ID: <2026031326-undercut-curled-c9b3@gregkh>
References: <20260313124908.579-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313124908.579-2-b9788213@gmail.com>

On Fri, Mar 13, 2026 at 03:49:08PM +0300, Bera Yüzlü wrote:
> Remove unnecessary ret variable and goto exit pattern. The function now
> returns immediately when an error occurs. Additionally, ensure that
> intf_free_irq() is called when pm_netdev_open() fails to avoid leaving
> the allocated IRQ uncleared.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
> V2: Used int_free_irq() in error condition.

No "v2" in the [PATCH] area?  It should look like:
	[PATCH v2] staging: rtl8723bs: Improve error handling

so, v3?

thanks,

greg k-h
