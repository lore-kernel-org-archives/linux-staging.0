Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257972BDC32
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025771; cv=none; b=qCXCQ7bd5+DI/xJXMt3unZVqDD/3B/bQkfPcWQKf80RTVhXDhH4NVBqAdeGugOq0seqIanCWksvfF/Q+hLfEuC4PNAawhYT1AmvpyOqaH0O+yf8DU1Rp3zeCipgucnFSxiynmYbZMLrEtPI3HpzSIpV3QUyUsFDYmRax8W3A7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025771; c=relaxed/simple;
	bh=RyEFoiwBZSb/MQqnOMf/iZHHnxTywuHJAMGbzaqgnM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij4BRck9USvM3THNEymh3PvZGCTnzG9Qk74YCKuBkyy8grDeXDaXDn5JkN6+SGNHiATzWwP4ARGz/UD026UbwUXNCQ31r7eRriGqaG8eH1Y2F+MrnmbzLO08UteRV/jyHvEclAWHxh3UkUOrex/BkdM/hmq9ZQS8txJtBQa+AXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m2Vt8KZs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m2Vt8KZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAC2C116C6;
	Mon,  2 Feb 2026 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770025770;
	bh=RyEFoiwBZSb/MQqnOMf/iZHHnxTywuHJAMGbzaqgnM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2Vt8KZszEQEDV1w/Bnlc4JlGD9Yn+Unz48PZ0fqSDZVgnThuYJ6RLwhuiJ40rDD5
	 r7vB4p6qxRNW5JXxpJsvopXgqZIDhiFEDPg7bFRvjx+DS0DzRhFWYWEi4V7fhUFNSR
	 hZTR9Vw9FlavQYGw2+fMPOuvle1cl34Y//+53CNs=
Date: Mon, 2 Feb 2026 10:49:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "M.samet Duman" <dumanmehmetsamet@icloud.com>,
	=?iso-8859-1?B?1i4gRWZlIEQu?= <skylinesytbe@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	=?iso-8859-1?B?1i4gRWZlIEQu?= <skyline@noreply.codeberg.org>,
	=?iso-8859-1?Q?=D6ner_Efe_Dasg=FCney?= <efedasguney@protonmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix whitespace issues in hal_com.c
Message-ID: <2026020205-crawlers-kosher-a94e@gregkh>
References: <20260202021845.265051-1-skyline@noreply.codeberg.org>
 <96821010-58B3-49FD-865F-E9F420E4699A@icloud.com>
 <aYBvso52Z_-83lQW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYBvso52Z_-83lQW@stanley.mountain>

On Mon, Feb 02, 2026 at 12:34:42PM +0300, Dan Carpenter wrote:
> On Mon, Feb 02, 2026 at 10:08:02AM +0300, M.samet Duman wrote:
> > Hello Ömer,
> > 
> > I wanted to share a brief observation regarding the patch titled:
> > 
> > “Remove spaces before tabs in comments to fix checkpatch warnings”
> > 
> 
> That's not the title.  Why would you mention the title and then get it
> wrong?  I'm so puzzled by this review.  Is it AI generated?  Please
> only use AI if there are bugs, don't use AI to comment on the commit
> message.
> 
> https://staticthinking.wordpress.com/2026/01/27/no-ai-slop/

Oh that's so good, mind if I add it to my bot responses for when it
detects this type of thing?

thanks,

greg k-h
