Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24840711A;
	Wed, 18 Mar 2026 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849411; cv=none; b=M3uAjRYx1j7d9VveRJvCOzq301p4ihE5KN2DQlZAeiR/XmzMxeN6fpiuCwD3J8znWt2l9qK/K+Ta26G70zt/B2xhBHoj7bigYAmGcHwFsDvvEPFH1GvrZpBUPmK/HL9/uhSM/bcqfkCYaf5vRnWM0Tn0XVjxQpP3AzcXD8bpX6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849411; c=relaxed/simple;
	bh=zuO6K+t9TZpbKOjow0wlxKfV91lHx6M2ER4wF2TzLf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW+mMbFbznIXP4iqW1sx8SQfiCFCpU2xGFseqRdoYHKP7MzEv5qubvBQTdZoaIyGZAgPgnLzFsfNz9jQlS47h29GLpmtzuagaKM1UA3Wjs4pvHzInCI1ypk/1WtQEzJXsVc/FWuOlWtjzr/FAt9rS7C4N2+R94U8VCFeS6oHIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m6NfZjFa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m6NfZjFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E84C19421;
	Wed, 18 Mar 2026 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773849411;
	bh=zuO6K+t9TZpbKOjow0wlxKfV91lHx6M2ER4wF2TzLf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6NfZjFaiguJlTXkTUpHrgXAY2Fx15uROKwkttUH/2RrNcn+n+Md+caLB1JyPxxzF
	 rTLU6UhTM8LecVYWZWkBB9F0Oqkr6WTX3G5/0B+AJycWAcv5qZaAQxF1cI+5oKCrJA
	 NEceVeATp/EGk+y85ooIByh75hwoYBin4OFNGyc8=
Date: Wed, 18 Mar 2026 16:56:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor rtw_aes_decrypt() to reduce
 nesting
Message-ID: <2026031810-kitty-untamed-2812@gregkh>
References: <20260317165149.16751-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317165149.16751-1-starpt.official@gmail.com>

On Wed, Mar 18, 2026 at 12:51:49AM +0800, Lin YuChen wrote:
> Improve code readability by refactoring rtw_aes_decrypt() to use
> guard clauses and early exits. This reduces the maximum indentation
> level and flattens the logic flow for key assignment and decryption.
> 
> Signed-off-by: Lin YuChen <starpt.official@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 91 ++++++++++---------
>  1 file changed, 46 insertions(+), 45 deletions(-)

Please make this a patch series, moving the indentation in by one
"level" at a time, otherwise this is impossible to review to verify that
you have not changed the logic incorrectly here.

Would you want to review this as-is?  :)

thanks,

greg k-h
