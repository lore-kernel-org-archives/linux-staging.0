Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB972AD37;
	Sun,  2 Aug 2026 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785655095; cv=none; b=LXFytSZcMkfVE6KrVM6YZEitli78cwLsHKQF6EkLVJhkJwRlazFqHSdfLPzMD1wOKUt89wae4B3TWlrUSl1pV0+3fIEOuA2BxYdr3yKHc+UBaQgY0Cnq240CfRzTpo9vGgP1vhRWJj6v7/BSFl4hjjCMIhrhynm1A8nzpv08AQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785655095; c=relaxed/simple;
	bh=updwr4bfAHuuS5jEtIoGh6uVAWH1X0CRNR6WRAOTY9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rd2VkPaDUAI0oCjx+wPXVqQtojc9cBOSXwS5mYFq3XbXJ1+9Q1XTxzunBYi7wMzwhgqHIv05bLngnfq+lTUFc//pYRt014RFpiuPk4DFMkkdCqRvTPyE/AGGvEY+KV844wBZ1M/Ar3dhZgON9QLDAwwCQNi5pPNOgjaSTmkv7as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dh44qGBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dh44qGBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972161F00AC4;
	Sun,  2 Aug 2026 07:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785655094;
	bh=KPjmZ1QqWDCNkh5Yj8leJeLQC8zw//DUy9QJjxJMQNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dh44qGBy3u8FRk3an+UWMSqe79fSpVOhLBYDVG8ej+qtTrRElF1BVHdUmd/Ek3P/e
	 VFHWs61r9PHDfwZvbLbu6EPnDXiwd6BCgfSUUUzZmLEjk1cFbonlE/flCjO20nHtFs
	 G2/evFhtAc0yMcLepEDxw/Wi5fz3RJf4jDpVGmGY=
Date: Sun, 2 Aug 2026 09:16:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: validate WPS attribute lengths
Message-ID: <2026080235-reverse-water-861f@gregkh>
References: <20260801174611.49470-1-acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801174611.49470-1-acharyalaxman8848@gmail.com>

On Sat, Aug 01, 2026 at 11:31:11PM +0545, Laxman Acharya Padhya wrote:
> rtw_get_wps_attr() checks that the four-byte attribute header fits in the
> WPS information element, but trusts the payload length from that header
> when copying the attribute and advancing to the next one. A malformed
> attribute can therefore make the driver read beyond a received management
> frame. Storing the total attribute length in u16 also allows the addition
> of the header size to wrap.
> 
> rtw_get_wps_attr_content() also copies the full payload without knowing
> the destination size. Its callers copy the Selected Registrar attribute
> into one-byte objects, so an oversized payload can overwrite the stack
> even when the payload itself fits inside the information element.
> 
> Store the total attribute length in u32 and reject attributes extending
> past the information element. Add destination lengths to the copy helpers
> and reject attributes that do not fit before copying them.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>

How was this found and tested?

thanks,

greg k-h
