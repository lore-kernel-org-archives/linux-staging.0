Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B652C81
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 14:11:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C153460F51;
	Sat, 13 Nov 2021 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636812676;
	bh=t9CShlrauEAsztx26mv4Lvg2o8CuZu2WW6wTb8AXz3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6coJK3qOSEpAJVLfCmIWRKcIws9pFpiWpIc46Kb16AnBUH7uUcyXodHlykJXvyJC
	 8T2egcJDjF+uPOzkQlLBgkv9yzw5dWN/JXW0pdNHNBhYL3Tmwkx1hJhOq30cDVaKs1
	 68Im7ohvYMj/h5aZ4wOrwjJbqdi2m4aQqNpOwWJ4=
Date: Sat, 13 Nov 2021 15:11:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: mt7621-dma: reindent to avoid '(' at the end
 of line
Message-ID: <YY/HgcL/iF09sNcQ@kroah.com>
References: <20211113135952.365607-1-liujunqi@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113135952.365607-1-liujunqi@pku.edu.cn>

On Sat, Nov 13, 2021 at 09:59:52PM +0800, Liu Junqi wrote:
> A change to make the code more like typical coding style.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
> I'm a kernel newbie and it's my first time to send a patch following the "Write and Submit your first Linux kernel Patch" video on youtube.
> The first version was rejected because of putting a '*' at the beginning of a line, and this version is exactly what Joe Perches advised in the reply to the original patch email.
> Please let me know if I got anything wrong ^_^

Take a look at the link that my patch-bot told youto read.  It will show
you how to write a "this changed in this version" type of text below the
--- line.

Please do that and try again.

thanks,

greg k-h
