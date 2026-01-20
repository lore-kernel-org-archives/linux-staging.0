Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D4453490;
	Tue, 20 Jan 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921079; cv=none; b=AWo5bKcY6om8z583MmDtXvkpjAXKsHuc4Zb1n8BBKVS/VckkLfjsrd9QAzV4eEjDCoarR1kstpy9JY0ynI6Pv1SyTmui27Gdt/hlFASSJpAOkdUeB01PnV4Cm81z1FWkU4wzKc4PMgu7WJfYVfT2C9TcXFhu79CVLbpVGnlOFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921079; c=relaxed/simple;
	bh=zqp9FXMvpdD3xnD1bf6tzYy633DjRGPW+MVTEQ2ykjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mmr6y+PBofvaDbhpdR3BNPtgDGGR8OrLU0qfVR6VnpiWCxh/onDbQeAxJpacofXlbFlPOjUeK1559VRkeZ0ApCjg3vBAsLKabt4/izUAHdsThZLJ1ovYIj76dkRXs8uSkUGZnTjFrrMSsiEdJS2KZMgZHJ2YbgOqGqkSuiycxBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2SI4ec8H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2SI4ec8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95848C19422;
	Tue, 20 Jan 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768921079;
	bh=zqp9FXMvpdD3xnD1bf6tzYy633DjRGPW+MVTEQ2ykjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2SI4ec8HSf8H/eAfrvaafPSpaAqh5xUayfxt0vQE40sTSEZGpz8/S9V2hMgkJM4T4
	 z5BA07ME8/L9D3gg43FjdSruRmQHDCHtx+o+mlujn7203WXJCHJjnRlMGxdGLMwc49
	 DY5mmHL8yLj8ZCQyoVXEV+0dcyEPHLVhBl0+zS+g=
Date: Tue, 20 Jan 2026 15:57:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Minu Jin <s9430939@naver.com>, abrahamadekunle50@gmail.com,
	milospuric856@gmail.com, zxcv2569763104@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <2026012001-freehand-clang-d758@gregkh>
References: <20260120132241.2119454-1-s9430939@naver.com>
 <aW-KQbHblIy-MTIu@stanley.mountain>
 <aW-LOZdXo6zLhT_x@smile.fi.intel.com>
 <aW-REdQ9BAKA-GC9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-REdQ9BAKA-GC9@stanley.mountain>

On Tue, Jan 20, 2026 at 05:28:33PM +0300, Dan Carpenter wrote:
> On Tue, Jan 20, 2026 at 04:03:37PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 20, 2026 at 04:59:29PM +0300, Dan Carpenter wrote:
> > > On Tue, Jan 20, 2026 at 10:22:41PM +0900, Minu Jin wrote:
> > 
> > ...
> > 
> > > > +	signed int ret;
> > > 
> > > Don't put a blank line in the middle of the declaration block.  Just do
> > > "int ret;".  Everyone knows "int" is signed.  Don't follow the local
> > > style when the local style is wrong.  Also only use s32 when it's part
> > > of a networking or hardware spec.  Just use int.  Do people imagine that
> > > we'll change int to be unsigned?
> > 
> > Not in a far past we changed char to be unsigned :-)
> > 
> > *Yes I know that it's a bit different case.
> 
> Heh.
> 
> char was always unsigned on s390 and the s390 devs were really militant
> about avoiding declaring variables as "unsigned char" so they'd write
> all their arch/s390/ code to look like:
> 
> 	if (char_variable == 255) {
> 
> I guess they were annoyed at the rest of the world who declared their
> variables as "char" when it should have been "signed char".  They stuck
> to their guns and defeated the rest of us in the end.  It's some kind of
> life lesson or potentially a message of hope?  :P

s390 always is 5-10 years ahead of where everyone else will eventually
get to.  It's fun to watch people slowly realize this :)
