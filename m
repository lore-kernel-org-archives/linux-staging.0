Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E2221DB5;
	Tue, 27 Jan 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524545; cv=none; b=AjzaZeGQjkDrTMOnM/zXl/q+v3rO4HyBRk9VOl2HLvbWbS7nKi5iQvEd7t3zKSQNC9sM4zSCkMbpExaXvfqTigbsZx92H0bcQbKNzWaa3swB93XhFP/PwPRlj23cII0FAVz3P7Ma+vluV6pVzWz48boAcY+irX0xXdDcKq/7ETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524545; c=relaxed/simple;
	bh=+fiS/CvcrOT3p3V6uv4UMOZrvz1sM/YiyHjZ+OzmcJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC1JhkXnYxtSF3QJzn3ix5ghYi7BShzma01e1gnZGvRJ2+az1xq0qZ+dIuZTXg9ZxR4mwpbkeEqAKOBqCLfZcSTfI41t/sVcAQHlSNHgvWIP11qIcH9wsH9hZTQWSxLKBkHuoAFw+v60SXSJpbCf0IblYjdBsYTl4wdjqKcoCIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ErxnMoA4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ErxnMoA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A99C116C6;
	Tue, 27 Jan 2026 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769524545;
	bh=+fiS/CvcrOT3p3V6uv4UMOZrvz1sM/YiyHjZ+OzmcJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErxnMoA4pO/s7fOQysi16ZU8sdkWW0kIl2KJiFSwCUx07mFniQ+KTYXefdLwB1NcM
	 xaIoFmDmpyv+5GDZIiKapIdXguYRsJWS3kEs03lZpW/6emV9p6Ni+gR0ZJ0KKLoa2j
	 bDEVXjxXXxRVVZMrB7s/WL1ebXYX8cT3XfEA56TY=
Date: Tue, 27 Jan 2026 15:35:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: andriy.shevchenko@linux.intel.com, abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com, milospuric856@gmail.com,
	karanja99erick@gmail.com, weibu@redadmin.org,
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: update _rtw_pktfile_read() to
 return error codes
Message-ID: <2026012729-unsoiled-zap-0ffb@gregkh>
References: <20260122174125.2567008-1-s9430939@naver.com>
 <20260122174125.2567008-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122174125.2567008-2-s9430939@naver.com>

On Fri, Jan 23, 2026 at 02:41:24AM +0900, Minu Jin wrote:
> The function _rtw_pktfile_read() currently returns a uint and clamps
> the requested read length if it exceeds the remaining data. This
> behavior makes it impossible to propagate error codes from internal
> calls like skb_copy_bits() and leads to incomplete data processing.
> 
> This patch updates the function to:
>     1. Return -EINVAL if the remaining data is less than the requested length,
>        ensuring callers always get the full amount of data they expect.
> 
>     2. Propagate the negative error code from skb_copy_bits().
> 
>     3. Change the return type from uint to int to support these error codes.
> 
> To avoid breaking git bisect, this patch also updates all call sites
> (set_qos, update_attrib, and rtw_xmitframe_coalesce) in the same commit.
> By doing so, the error-producing function and its error-handling callers
> remain in sync, preventing runtime failures at this commit point.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 44 ++++++++++++++-----
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  6 +--
>  .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 21 +++++----
>  4 files changed, 50 insertions(+), 23 deletions(-)

Does not apply to my tree :(

Please rebase the series and resend.

thanks,

greg k-h
