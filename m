Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BAA71
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:36:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C72896120F;
	Mon, 12 Apr 2021 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618220198;
	bh=sGwqaz3CpeSUy1C5Wd/vFz8NkdWN9zpzlYSkj0cshD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xH7N4h6qhQJc8GnunUJp/WVObp/Xynp1va/lJ0USlrm2gFzU8lauLpv7qqY0lOOuD
	 UfxQzBbRY0WKUFdB1odnq65aJ1tUdArq3xI98iVJrglsmQe0VjavLCT0oOd9Ep6eOl
	 vGL+ylJd1f0a/vceA0Ia6TE8FDmYQODzfK6ekKKM=
Date: Mon, 12 Apr 2021 11:36:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v4 0/3] staging: rtl8192e: modified log message
Message-ID: <YHQUoz/eQ+By5Bd1@kroah.com>
References: <cover.1618139271.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618139271.git.mitaliborkar810@gmail.com>

On Sun, Apr 11, 2021 at 05:04:46PM +0530, Mitali Borkar wrote:
> This patch fixes style issues
> Changes from v3:-
> [PATCH v3 1/3]:- Modified log message.
> [PATCH V3 2/3]:- No changes.
> [PATCH v3 3/3]:- No changes

Your subject line here is odd :(

Please fix up.

thanks,

greg k-h
