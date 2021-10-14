Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF662C85
	for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 14:49:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BED29606A5;
	Thu, 14 Oct 2021 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634222962;
	bh=8qehXygtz+uMQbMsOlGXOq4amdYCvB24FnMrOuWFdGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES2SPPOyBr+obO6gXcobl2iQRBJjIUgMedvY/1H5OnDGtsGfxuGFI4k/moWjvNG6X
	 EISO1nlgOBpOypRGZHQMa4YGv5BLvxQ9kod0qAIckrMUH4T7K9Os8K0y1MTwRDzi6/
	 IuF3mU5DVtRwaXZZUvBcD+09vGXLwS9mYz3hZozk=
Date: Thu, 14 Oct 2021 16:49:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com,
	insafonov@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: simplify the return
 statement
Message-ID: <YWhDb5/ZDUUs9gb7@kroah.com>
References: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>

On Thu, Oct 14, 2021 at 08:10:00PM +0530, Saurav Girepunje wrote:
> Remove goto statement where function simply return value without doing
> any cleanup action.
> 
> Simplify the return using goto label to avoid unneeded 'if' condition
> check.
> 
> Remove the unneeded and redundant check of variable on goto.
> 
> Remove the assignment of NULL on local variable.

You are saying _what_ you are doing here, but not _why_ you are doing
this.  For example, this last sentance does not make sense, why would
you want to do such a thing (hint, I know, but you need to explain it in
the changelog...)

It's getting better, but the changelog still needs work.  Often times
that's the hardest part of writing a kernel patch.

thanks,

greg k-h
