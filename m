Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F9F3FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:37:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A44156108E;
	Thu, 26 Aug 2021 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629974231;
	bh=oP61BbnAXKACI6JbZ1kT6hbuKd4vxr/fnZYcvDNWbxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vYfhmlRNMLVbPtyB/P5pGpgFcsFwZlWswZh4GEn/yCKJuIPaGhsZzpzZeaKtByhoT
	 UdUvE9S0aAQcAw6763DHCs/g48d42z+/G7SIJjY/vsEi1UoPBtzR767S6U2wYs0TW8
	 i8uWo8NswbotTNfm7mbRlNQ7098apj+ZstfQV/Vg=
Date: Thu, 26 Aug 2021 12:37:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Message-ID: <YSdu00zpqfGkKc1e@kroah.com>
References: <20210819221241.31987-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819221241.31987-1-fmdefrancesco@gmail.com>

On Fri, Aug 20, 2021 at 12:12:41AM +0200, Fabio M. De Francesco wrote:
> Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> unnecessary wrappers, respectively to mutex_lock_interruptible() and
> to mutex_unlock(). They also have an odd interface that takes an unused
> argument named pirqL of type unsigned long.
> The original code enters the critical section if the mutex API is
> interrupted while waiting to acquire the lock; therefore it could lead
> to a race condition. Use mutex_lock() because it is uninterruptible and
> so avoid that above-mentioned potential race condition.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---

You have changed the behavior of the code here, how have you tested that
this still works properly?

thanks,

greg k-h
