Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC128E7
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 08:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5D5C433D6;
	Thu, 15 Sep 2022 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663231480;
	bh=R6Rl/OlvLJIZv5HR2mE5eYVhd7/iw8En0Km8/MsF17c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnKtqTjuYbMLQID9jKK84B6m8uVE2TN6PNBwzUVIx/kR1jahm5gUUh2EBhloDoxPg
	 3w6/bXToHADlvNNZzDDub8QY18UIOTI1cZmeNnJRim2bdGw8aDn9Jq4W7QVjN9B8m5
	 p+3kQ/9dYTX+hnpkSOPxWcRmqObedFhnDktiklrU=
Date: Thu, 15 Sep 2022 10:45:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: forest@alittletooquiet.net, philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655: replace spin_lock_irqsave with spin_lock
Message-ID: <YyLmEpJBG7fPZ8iN@kroah.com>
References: <20220914080016.67951-1-namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914080016.67951-1-namcaov@gmail.com>

On Wed, Sep 14, 2022 at 10:00:17AM +0200, Nam Cao wrote:
> In vt6655 driver, there is a single interrupt handler: vnt_interrupt(),
> and it does not take the spinlock. The interrupt handler only schedules
> a workqueue, and the spinlock is taken in this workqueue. Thus, there is
> no need to use spin_lock_irqsave, as the spinlock is never taken by an
> interrupt. Replace spin_lock_irqsave (and spin_unlock_irqsave) with
> spin_lock (and spin_unlock).

What is the speed difference before and after this change?  And how are
interrupts properly handled anymore in this driver if you took away the
lock that was being accessed in the irq?

thanks,

greg k-h
