Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075E2F80
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 16:09:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A91446113D;
	Tue, 27 Apr 2021 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619539796;
	bh=37hH6Rz86qxtU96vdEiaHVP25zIDIraai92kl1VJv+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ely7iI8RrigdHzjHrsk2RcAcs5Dmcpuo+2/zDOq7vIlmSKauCMJ5OBcfNsE4LiLPh
	 em85pDuYEu7tTTVnjjus0v1qw9Y+IwLww9KTC1Bq2H3I3LP7D1mcz9WA/Eba3/yc//
	 D2hwMdIBcmrgocezqyQftAq9aUZU/6hwu+7S2IHE=
Date: Tue, 27 Apr 2021 18:09:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ashish Kalra <eashishkalra@gmail.com>
Cc: Joe Perches <joe@perches.com>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Romain Perier <romain.perier@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: silence incorrect type in argument
 1 (different address spaces) warningJoe Perches <joe@perches.com>,
Message-ID: <YIg3UcWgwElAsUnI@kroah.com>
References: <20210427144556.GA19024@ashish>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427144556.GA19024@ashish>

On Tue, Apr 27, 2021 at 02:45:56PM +0000, Ashish Kalra wrote:
> Abheek Dhawan <adawesomeguy222@gmail.com>,
> Johannes Weiner <hannes@cmpxchg.org>,
> Romain Perier <romain.perier@gmail.com>,
> Waiman Long <longman@redhat.com>,
> Allen Pais <apais@linux.microsoft.com>,
> Ivan Safonov <insafonov@gmail.com>,
> linux-staging@lists.linux.dev,
> linux-kernel@vger.kernel.org

Why is this here in the email body?

> Upon running sparse, "warning: incorrect type in argument 1 (different
> address spaces) is brought to notice for this file.let's correct data type for
> variable data adding __user to make it cleaner and silence the Sparse
> warning. This is version 2 of the patch, version 1 can be found at
> https://lkml.org/lkml/2021/4/20/203

Always use lore.kernel.org links, not a random other site that we have
no idea who runs it.

And no need to say this in that form, please list below the --- line
what changed from v1.

thanks,

greg k-h
