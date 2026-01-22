Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129430595B;
	Thu, 22 Jan 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092517; cv=none; b=IloD3Sq9VidVHxqJIwlp23Q0Bds+G24yz7Fj/AL4WMQYuuTZHps6qJF+GbMSuwYheUhs1L7SjV9Dyl7yTqSPe+Ybzz0xfMpFxWXl35FrbCNZZ17PkEmwczEEDpZQbyMMI8QI3TMYlDS8/NzTR5KzIrAjVZSzcDWYDSvSY4vzfOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092517; c=relaxed/simple;
	bh=Q+oHGtIwdieezM1G/pq4pEdKvJDpSx/Ft43cTrb6PVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iylfvqIGjzXHvZ5icHxo5NuwnYVZOD2DkTZAXdvtMKq3leuYiUBuO7kWVRzFbGBIeB4D8ktlMjsP5OxLjYwmkmmP3yhqU8LFBAO9Ow+eIkEvekqRsxOqLIr/kK2eEPwxSYeYUh1oJga0mmeKk+PoqF8ADYDhDYqr7GTg+JftN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XpBTz6kk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XpBTz6kk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BC1C116C6;
	Thu, 22 Jan 2026 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769092515;
	bh=Q+oHGtIwdieezM1G/pq4pEdKvJDpSx/Ft43cTrb6PVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpBTz6kkwCOjwhNfia4bW2tgv5MdlMgZWZGoM5AFCSUZhZTLMAgScRhb0ydw+24BK
	 vkWJw75ondcGRpI7ssf1cPGxzenZT1fsaDxITc5LlR0JNs9K4BM2bPm0tuwtPn4KGr
	 5knQ2haSwiFlhauzT8BUyStYmqqk1q3bntJaW/Ns=
Date: Thu, 22 Jan 2026 15:35:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: dan.carpenter@linaro.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, karanja99erick@gmail.com,
	weibu@redadmin.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: change return type of
 _rtw_pktfile_read to int
Message-ID: <2026012239-pluck-freebee-851f@gregkh>
References: <aXIyypnq7LhdNHys@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXIyypnq7LhdNHys@JMW-Ubuntu>

On Thu, Jan 22, 2026 at 11:23:06PM +0900, Minu Jin wrote:
> Hi Dan,
> 
> Sorry, I just realized what you meant.
> 
> You were suggesting to keep the 'Fix' (including the necessary type 
> change for error codes) and 'Cleanup' (formatting and style) separate 
> to make the fix easier to backport.
> 
> I misunderstood "leave the type alone" as "never change the type." 
> I'll reorganize the series into the two patches 
> you suggested and send v6 shortly.
> 
> Thanks for the clarification!

Please always keep the context of an email, otherwise the reader has no
idea what is going on.

Remember, some of us get over 1000 emails a day to deal with, context
matters.

thanks,

greg k-h
