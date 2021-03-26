Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2470
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 14:04:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F37C0619CB;
	Fri, 26 Mar 2021 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616767491;
	bh=BnbCi2Z8WpiV1j9RhamsYBECcCS4x819QEv3yRpRHL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPT9N4i7HZrH7rwCvmvF7VoDkGrdgajriASnv5y/1+Cdg1LN4EQsktjFkL9Uri1WW
	 ldZKxXAsN5qj6PnR2wk2yEPUMa76hS4d2LMM6jtFrHdPU4EleVjoJp1pIibfJ9JdPL
	 QTl0uZ9zNtQcOQFIsL131Q+ZyRLGW+wsiSoiusQs=
Date: Fri, 26 Mar 2021 15:04:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: rtl8723bs: remove useless macro and obsolete
 comment
Message-ID: <YF3qAfF0GstW4aOw@kroah.com>
References: <20210324193924.12536-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324193924.12536-1-marcocesati@gmail.com>

On Wed, Mar 24, 2021 at 08:39:24PM +0100, Marco Cesati wrote:
> Remove two no-op macros, two related helper macrors, and one related
> comment in the staging/rtl8723bs driver.
> 
> Signed-off-by: Marco Cesati <marcocesati@gmail.com>

Does not apply to my tree :(
