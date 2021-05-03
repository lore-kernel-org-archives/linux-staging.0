Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211970
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 16:42:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2346A61422;
	Mon,  3 May 2021 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620060134;
	bh=w1jmLRhVdFy5ZelzMGG2M3Zwq0ImzKCjeQDPvXQ4P2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQyYQje/pGbkQUgHTu0sn5ViLnaAkjken2UWLWsRRasqKe5f+kjifq2xTwchxMs+t
	 YUZg/F0n2GuwNAek5LQG/SRpciJX+hT7lXhIcZTC+ZDW9Hu4BbHOyvPaQja3WN98vU
	 JBNk8vBpkSJgdJSD11KS6J4iysfyzsMI+LWE6pLA=
Date: Mon, 3 May 2021 18:42:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Vorwerk <alec@vc-celle.de>
Cc: forest@alittletooquiet.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: vt6655: remove multiple assignments
Message-ID: <YJAn4zTAhDF1K4im@kroah.com>
References: <20210502210826.10323-1-alec@vc-celle.de>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210502210826.10323-1-alec@vc-celle.de>

On Sun, May 02, 2021 at 11:08:24PM +0200, Alexander Vorwerk wrote:
> These two patches fix two multiple assignments coding-style
> issues reported by checkpatch.pl.
> 
> Alexander Vorwerk (2):
>   staging: vt6655: remove multiple assignment
>   staging: vt6655: remove multiple assignment

You sent 2 patches that do different things yet have the same identical
subject line :(

Please fix up and resend.

thanks,

greg k-h
