Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BB70
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 16:31:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43E1861166;
	Mon,  3 May 2021 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620059482;
	bh=1fPJCR4+ZH8ePNHERcYZgNQvKEqZ1nRY9pSzh2KTnJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qbe8Am5l+ixtc+C3MF1ygCkEZ5ujn4HLGP0thqb9VBFrt7qkymu4N6zPSSzBc1Zr2
	 M0ZvpzSgGhbE9HLIZtmUNkjHwNe7dj8qXXWfyZNklaWKcXvPNWzBF/7ICbOerAMn9q
	 bqJ3iDMsZ+G61sGihrKeqsUMNUzWVne5B/2NEgwc=
Date: Mon, 3 May 2021 18:31:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	David Kershner <david.kershner@unisys.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [Outreachy kernel] [PATCH v5] staging: unisys: visorhba: Convert
 module from IDR to XArray
Message-ID: <YJAlWJXDnK9KLg2H@kroah.com>
References: <20210427150719.30841-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427150719.30841-1-fmdefrancesco@gmail.com>

On Tue, Apr 27, 2021 at 05:07:19PM +0200, Fabio M. De Francesco wrote:
> Converted visorhba from IDR to XArray. The abstract data type XArray is
> more memory-efficient, parallelisable and cache friendly. It takes
> advantage of RCU to perform lookups without locking.

And does any of that affect the runtime of this driver?

I would need this to be tested by the maintainer before I could do
anything, and a review from willy@ would be also appreciated as I'm
guessing he asked you to do this?

thanks,

greg k-h
