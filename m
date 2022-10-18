Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFA4C72;
	Tue, 18 Oct 2022 17:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FB7C433C1;
	Tue, 18 Oct 2022 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666115375;
	bh=rSSB9EzlH3hW6nEAiCKYzmvYhNoeyNCystI8hL3jnyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J33anJQltcC+MDubNmYbVj02VACOIsN5Ni9X/IZpz7BqbkXTd3KMuQ/5aN5EYPaTe
	 6JfWLFEQbW4Za2+S7VeZfd663aa9maq4rn3sxpuwh8izdlTqUHG2zQXN3fnm0OpNl2
	 kDtRhTFpjkHw4NT37WLAI7JrW6LO+BJTMrx76ghs=
Date: Tue, 18 Oct 2022 19:49:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rts5208: Replace instances of udelay by
 usleep_range
Message-ID: <Y07nLWIEKR1cCkIg@kroah.com>
References: <Y07OcqPNjSihOByt@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <Y07dExeWY5lXgKLr@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y07dExeWY5lXgKLr@kroah.com>

On Tue, Oct 18, 2022 at 07:06:27PM +0200, Greg KH wrote:

<snip>

For some reason you sent this only to me, which is a bit rude to
everyone else on the mailing list.  I'll be glad to respond if you
resend it to everyone.

thanks,

greg k-h
