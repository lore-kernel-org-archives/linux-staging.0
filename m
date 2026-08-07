Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6418A396B98;
	Fri,  7 Aug 2026 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085186; cv=none; b=p/jzcrLPgCObXu03Sh5y7NM6DnbdB0+WwLdlUHn5xVYWmFi8eHyQpjWAjhbCNgBVuXEhZbZGOQNhP+qZdS1aCiZsjybirGwN4RJyIntxwiM5PQq4S6sj6M3hkhj2bVniWE1XglOYypsqIjDw2UcwuhIC8hHQhruPD/XnAI+ZYwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085186; c=relaxed/simple;
	bh=BtvL8K2oy6y0VP/F1YbLPYivF45zAyhvpeNUbgSQBU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHzaN25G3r4n90EzysaHQuMyFm0MgcmmtsRS5irY/qbnNlyLDCUeSWdszeFm26M8HZMFBnh7YFaGXFqU8g5rBMl/nTjuNIMa+u71YQyqmo6GxUlF0eWuJFhFOl89E+YWdBfmq57z9d9h6cSSp2GlyqheMrQI7lZNPLl/V4fE6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D3hVBo5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D3hVBo5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4006C1F000E9;
	Fri,  7 Aug 2026 06:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786085184;
	bh=ytSzc+2Yy/JRkvopRIUw5PprbcVIMW7psT0KPD+42Ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D3hVBo5cVGozYA4upxeD26Io2V68cTlnchwGRwWMUwgpn31mYLHhZs80hMi9dzZCx
	 X+T9ZgqKz/KN/ifLZhrQkKgjf1JUNY0Q9Z08NSr+DHXaOgGlDD459tsscjfyJScBFd
	 xlpLXHRGC57EXL0f3XU1vyPO65BR7I30liepBAbY=
Date: Fri, 7 Aug 2026 08:44:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Som Tripathi <tripathisom142004@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix bounds check when vme_get_size()
 returns zero
Message-ID: <2026080741-venomous-bony-318e@gregkh>
References: <20260807012506.579588-1-tripathisom142004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807012506.579588-1-tripathisom142004@gmail.com>

On Thu, Aug 06, 2026 at 08:25:06PM -0500, Som Tripathi wrote:
> vme_get_size() returns zero on failure, as its kerneldoc in vme.c
> states. vme_user_read() and vme_user_write() assign it to a size_t and
> check the file position with:
> 
> 	if ((*ppos < 0) || (*ppos > (image_size - 1)))
> 
> When image_size is zero, image_size - 1 wraps to SIZE_MAX. The test is
> then never true, so the check does nothing. The following statement,
> 
> 	count = image_size - *ppos;
> 
> wraps the same way whenever *ppos is greater than zero.
> 
> This is not an out-of-bounds access. resource_to_user() and
> resource_from_user() clamp count to size_buf, buffer_to_user() and
> buffer_from_user() clamp it to size_buf - *ppos, and vme_master_read()
> and vme_master_write() reject an offset greater than the window
> length. What happens instead is that read() and write() operate on a
> window whose size the driver failed to read, rather than returning at
> the check.
> 
> Compare *ppos against image_size directly. The two forms agree for a
> non-zero size, the new one is also correct for zero, and both wraps go
> away.
> 
> Found by reading the code after Dan Carpenter listed this as one of
> three outstanding bugs in this driver; see the Link below. Compile
> tested only. I have no VME hardware.

Please see:
	https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/T/#u
for why I can't take this.

thanks,

greg k-h
