Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5FC7262A;
	Sun, 11 Jan 2026 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768136534; cv=none; b=ctalbfCfJ9tgWywqnpV4I9SBcjVk1IrrlYV0uAm+IOooV9YwetNJWpN7zUKCt7aNAG3/on30x/kcFQsshZX30qKw9Ycqb4pOgdiHD5QKu6CkY2kkkRZrNmNukyBu3hpzX6SG6UU3+dFPrxvXUzmdg8LZKKSqnsnbTIRxS3QoMDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768136534; c=relaxed/simple;
	bh=FA8eN/hglfKrkvr8INFr//R1N/EzC0dp3qM/5zG4Zs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngV1IdNTY3Ivv6HAMlMEVREyN/8gSm6PhmCccv97/NoZfNWDJvMTnXTirsUVGIZcGamNCOCAh3UyS0gap+mT0iFvLM4LIj9jYuP+2DtavixG/ZZuxT/ExAUw7eiQliALD7nLgXyWHORzwc4EInPeU5WMJcyX/sxyGHXBjtHo8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vtKdqKck; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vtKdqKck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5589C4CEF7;
	Sun, 11 Jan 2026 13:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768136534;
	bh=FA8eN/hglfKrkvr8INFr//R1N/EzC0dp3qM/5zG4Zs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vtKdqKckWf6HamXwrz+8nazQB079yxxz7owNVgxEsrjn6NTYqSd6UvBu2FFd7L1Oa
	 SYN8DKBIds9xfLTIcu4VLzv5+kBqhNgQvOQIWw3yyHL7M41r+u4F/pWKQnuBVOkTAd
	 d+cGhMu20apylNyhSoe8dvCn+gCw2+eQNLKdd+uU=
Date: Sun, 11 Jan 2026 14:02:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: rtl8723bs: coding style fixes
Message-ID: <2026011142-stability-coping-e3bc@gregkh>
References: <20260109110417.16359-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109110417.16359-1-nayana.mariyappa@gmail.com>

On Fri, Jan 09, 2026 at 11:04:16AM +0000, Nayana Mariyappa wrote:
> This is a series of 4 small coding style fixes for rtl8723bs. Each patch is
> self-contained and focuses on a single logical change, as requested.
> 
> Changes since v1:
> - Split the original patch into 4 separate patches.
> - Each patch now fixes one coding style issue.
> 
> Patches in this series:
> 
> 1/4 staging: rtl8723bs: fix block comment style
> 2/4 staging: rtl8723bs: remove extra blank lines
> 3/4 staging: rtl8723bs: add blank lines after declarations
> 4/4 staging: rtl8723bs: expand multiple assignment into separate statements
> 
> Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
> 

Something went wrong with this submission, it seems to be broken up into
two "series".  Here's how it looks in my inbox:

      T Jan 09 Nayana Mariyapp (  16) [PATCH v2 0/4] staging: rtl8723bs: coding style fixes
      T Jan 09 Nayana Mariyapp (  31) └─>[PATCH v2 1/4] staging: rtl8723bs: fix block comment style
      T Jan 09 Nayana Mariyapp (  25) [PATCH v2 2/4] staging: rtl8723bs: remove extra blank lines
      T Jan 09 Nayana Mariyapp (  27) ├─>[PATCH v2 4/4] staging: rtl8723bs: expand multiple assignment into separate statements
      T Jan 09 Nayana Mariyapp (  25) └─>[PATCH v2 3/4] staging: rtl8723bs: add blank lines after declarations

And this also mirrors what shows up on lore.kernel.org:
	https://lore.kernel.org/r/20260109110417.16359-1-nayana.mariyappa@gmail.com

Can you fix up your git send-email settings to send these all out at once to
properly be linked together?

Thanks,

greg k-h

