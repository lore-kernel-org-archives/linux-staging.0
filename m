Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C2317166;
	Tue, 28 Jul 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222942; cv=none; b=qlEacKxGgw9CXmMdBBKov1TidU64p84+RCHpTZph0aQQzgYMYTcm5V8DhHvYjoBWTi/m7fEXeyVik/BO7iS4lJ4vQrGEGNUXUsFLyo5DN5wWRRnjkyijjzGShkA+vFph4/q0yerLFHYN+CVbnDnSXK5T1KnH8XLwRHzPB4HeTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222942; c=relaxed/simple;
	bh=z4wUUjUrQ96jB4SLwW8ZKTVWaNiNDAn/Crr2yp4W2e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUd02Qst2tiRdDQgWTXsAFesf0298SgOd22qj5frYBoRLG0MmgGthWtYEV6IypfEN0WM8tZ7nCdyxzjnEYe+WXIb2mHZNoISZyx3sxnMY3EK5hHAwSwv+P81CS6IINR6kppd1R3FVYiWywONT1O9OIuNswBpCMU/t/qr1RAetVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jtb7MhXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jtb7MhXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0161F000E9;
	Tue, 28 Jul 2026 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785222941;
	bh=ZEkmzU/xeqzGob3O6nq50bgEy+i26kUh0assl40IUww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jtb7MhXlNO7UqJGNzPeAo7vPpmj2JXHlAaJdYvwoPvPsGGIrQFOnBkRj2wP/wTgpo
	 16u0j6iXqnxvfnMbIJIOAFd8y4lxZqu0JwFYOjaOWb27tAvSd7j9Pr5s1Hg4b5r9TR
	 y9WS/fnrzgYtaibXbVdzDoUCL23SUEf8WsvYEaUc=
Date: Tue, 28 Jul 2026 09:15:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shivesh <chanelshivesh@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: audio_manager: fix sysfs_emit newline and const
 warnings
Message-ID: <2026072857-moody-twelve-33e4@gregkh>
References: <6a64be09.c4d3d80a.348a49.42e7@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a64be09.c4d3d80a.348a49.42e7@mx.google.com>

On Sat, Jul 25, 2026 at 06:45:45AM -0700, Shivesh wrote:
> >From 5e0bcb4920bcb9e0ef6c03a91730fe45f643f3a4 Mon Sep 17 00:00:00 2001
> From: Shivesh <shivesh@example.com>
> Date: Sat, 25 Jul 2026 13:44:36 +0000
> Subject: [PATCH] greybus: audio_manager: fix sysfs_emit newline and const
>  warnings
> 
> Add terminating newlines to sysfs_emit() format strings as required
> by the kernel sysfs convention. Also make envp[] array const to fix
> checkpatch warning about char* array declaration.
> 
> Signed-off-by: Shivesh <chanelshivesh@gmail.com>
> Signed-off-by: Shivesh <shivesh@example.com>

Something went really wrong here, why sign off on this twice with
different email addresses?

Also, look in the archives for all the times that this same change has
been rejected.

thanks,

greg k-h
