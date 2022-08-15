Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8F10F5
	for <linux-staging@lists.linux.dev>; Mon, 15 Aug 2022 06:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB7CC433D6;
	Mon, 15 Aug 2022 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660544940;
	bh=msiJ57i3RqcfN26mM82wBD0lWh7NBADgC1IhxLozSbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkmSRmrGWmBg1v/nvxcseOia4EwffJWALIvgjZQWXxz8IQ6lc+KpgyxzKKR1CKCF+
	 +y9YlGQ34Zzrl0fZAIhDveNEcLNdedPyjSzcljRrzz+ooOW9mOPXp6xSsOcQo342XY
	 lUw94NwSBuVTYWVMaJVMTObfj+XIQc+vn/sRT9r8=
Date: Mon, 15 Aug 2022 08:28:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Prevent infinite loop
Message-ID: <YvnnqDwLUEiDVfs3@kroah.com>
References: <20220814174404.25923-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814174404.25923-1-Larry.Finger@lwfinger.net>

On Sun, Aug 14, 2022 at 12:44:04PM -0500, Larry Finger wrote:
> ---
>  drivers/staging/r8188eu/core/rtw_ieee80211.c | 3 +++
>  1 file changed, 3 insertions(+)

No changelog or signed-off-by?

:(
