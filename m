Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DF72
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 08:20:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0554613B1;
	Wed, 14 Apr 2021 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618388425;
	bh=riGWsoIxXItIjhgKXrwEti07y5iF8ReFcCz2X1qZ3ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+/pjhnt6FIJpq30LX7bTmVUzxMzX2Wn7Zez1wT0be/z7F54s+qLO7yGdSVi2J7cS
	 F+cJqyozSEMfdzIhqWtMbjWpW16LoSE5lBpbAay2pzKw3LieYieO1rtY+BoYcjwqBn
	 65hbgzNjjEACe5nNh+wK5XLvvYi2WfqtNWj+oTPg=
Date: Wed, 14 Apr 2021 10:20:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: Subject: [PATCH v2 0/5] staging: rtl8192e: CLeanup patchset for
 style issues in rtl819x_Y.c files
Message-ID: <YHalxnhnf0ZcVafz@kroah.com>
References: <cover.1618380932.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618380932.git.mitaliborkar810@gmail.com>

On Wed, Apr 14, 2021 at 12:24:44PM +0530, Mitali Borkar wrote:
> Changes from v1:- Dropped 6/6 from and made this as a patchset of 5 as
> alignment of code is done in following patches.

Why is "Subject:" listed in your subject line?  Do not manually add it
after git format-patch has created it...

thanks,

greg k-h
