Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EA670
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 10:52:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0D4F6105A;
	Thu,  5 Aug 2021 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628160748;
	bh=yDdn+JEA7rhe1M69nNJK+OwE84MCKMWIuH3ZOaLKkA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JaW5mwJi3b8CSDYUTP35LKaVsnCOmEVz2D7f8/MV5s6kNbBZmkj1tJbIPxOQS5ZJP
	 AuI5RHOnDPVLPD9GhHliNpQYmFO0yQhbGggT/C6x0cUCAOu+Tr1cue05duMXphI809
	 A2KcX2RPR1lRqSdX31G6nOzKf8DATQJiJMbYvVXw=
Date: Thu, 5 Aug 2021 12:52:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] staging: r8188eu: Remove wrappers for kalloc()
 and kzalloc()
Message-ID: <YQvC6YgU9Xa1hyI4@kroah.com>
References: <20210802192721.23110-1-Larry.Finger@lwfinger.net>
 <20210802192721.23110-2-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802192721.23110-2-Larry.Finger@lwfinger.net>

On Mon, Aug 02, 2021 at 02:27:16PM -0500, Larry Finger wrote:
> These wrappers involve an in_interrupt() call, which is not frowned on

"which _IS_ frowned" :)

I'll take it as is...
