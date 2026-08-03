Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BE335BBB;
	Mon,  3 Aug 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772034; cv=none; b=le7WKP+csq5cPzOV9D52Xfr+WDVAQoQ8eUCpy8diIC9Vui7rvEb7Cx7j686aiHKQIMEz9tKp3CAWpcBln720d75xqmXVtcesATgfIFdmr+hAXSqwyJ1pD4Rj3QrVvEfS0KMamjR4VJ0YJFzTHICWCODTfk98TVPL0Y3ZNJ0znho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772034; c=relaxed/simple;
	bh=0Kt9cKwUsejBrWVW7hcM3tRapcpiBtRJr+gcjxEw3oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGLenYvSPRZV3rIBOGIgj8xcpi69HalFKRgDlzO/yax4iNgdZYWMMivJ3S+tE4o4HB2+F6h+vPGgiNvSWEfHNzoDn6fB1XjuGl1/yxpSXj/zOOLqrDnNmt05YpTw4gbIqhSanOS19MWuhahy3IG/FHxYCS+zXa77YAWq0h4elRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w80V7o5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w80V7o5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB451F000E9;
	Mon,  3 Aug 2026 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785772030;
	bh=Dsd3WXePMYkOsSYuhiE0dWGzcjJeC7XJsmaEJhl9n40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=w80V7o5DU+IfS0lpXnvQevYTfB7MLmIZPn/mG/Ojw2eQ+19rqzZgPfbTYhkLKqQmb
	 p6eG6dGcDuP4npeS3J/nfnxMqT+oF47jWFXSiaMVQ2QM0XY1jLlhGZKveVC0qeQNOo
	 ZQhPHJNWrezcnftfHFyWxHjErd2sB0qsA7tfbY+E=
Date: Mon, 3 Aug 2026 17:46:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mirza Ishan Beg <seedandsyntax@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: refactor traffic_stat access in
 collect_traffic_statistics
Message-ID: <2026080331-jailhouse-pamphlet-7763@gregkh>
References: <2026080337-geologic-vertebrae-b68e@gregkh>
 <20260803154336.17636-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803154336.17636-1-seedandsyntax@gmail.com>

On Mon, Aug 03, 2026 at 09:13:36PM +0530, Mirza Ishan Beg wrote:
> On Mon, Aug 03, 2026 at 05:09:46PM +0200, Greg KH wrote:
> > Where was this suggested?
> 
> Hi Greg,
> 
> Nikolay suggested adding an intermediate pointer in this thread:
> https://lore.kernel.org/linux-staging/agDaGJ5UKndFUNPY@archlinux/

Cool, then can you provide this link in the signed-off-by area so that
people can refer to it?

thanks,

greg k-h
