Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BBF8C04
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 15:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90123C433D2;
	Tue, 31 Jan 2023 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675177754;
	bh=T51uegKuzukl3ZkjeIiLZP9VBhsaBt4W7GSHPwVxG9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyOknRSiZm0+nA3YMUt66CXZx9HirEFqUcaWgzflzztTO+EMI9+EuH6i0SONTpZyo
	 yA7nsHpLa5raKX2AxJmlT92m4ZtKraxwTuTMvLjoyJNm6PJYCw0Kkp5BnpLz7IuhEl
	 GGE0NPK1VQRF8/AIz7KEDt3a59Ou5dz+xtRn8EwM=
Date: Tue, 31 Jan 2023 16:09:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix NULL check for rcu pointer
Message-ID: <Y9kvF0C1kiDctEUw@kroah.com>
References: <20230131090057.241779-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131090057.241779-1-martin@kaiser.cx>

On Tue, Jan 31, 2023 at 10:00:57AM +0100, Martin Kaiser wrote:
> Fix the NULL check for padapter->pnetdev->rx_handler_data.
> 
> The current code calls rcu_dereference while it holds the rcu read lock
> and checks the pointer after releasing the lock. An rcu pointer may only be
> used between calls to rcu_read_lock and rcu_read_unlock.
> 
> Replace the check with rcu_access_pointer. My understanding is that this
> function returns the value of the pointer and needs no locking. We can
> then check the pointer but we must not dereference it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

What commit id does this fix?

thanks,

greg k-h
