Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE172
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:10:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C6B760F6F;
	Mon, 25 Oct 2021 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635145801;
	bh=ekVPHsWSQGUmC/hsU73qpMXP3NYnURrkjKH4BVQopEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1Ja7Q0u2YTThGPHH4sgxRIUWefxt0aZ5FzWAkA6NciMd1jlJoz9rm53QcHPZJtxQ5
	 Hgc6yZXSONkq9rnUCa7IEpiQBVY80Ly+e0dNXQsKLgC97wgcXdliA7MDWEe1QEAe7O
	 4l8jiHSxEXuMQ7/2c0V8VHcAS/BJCxpSs59ygEBs=
Date: Mon, 25 Oct 2021 09:09:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: r8188eu: remove struct sreset_priv
Message-ID: <YXZYR3FHnrPqB7hP@kroah.com>
References: <20211024180448.20624-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024180448.20624-1-martin@kaiser.cx>

On Sun, Oct 24, 2021 at 08:04:43PM +0200, Martin Kaiser wrote:
> The sreset_priv structure is not used by the r8188eu driver. This patchset
> removes sreset_priv step by step.

Nice cleanup, thanks!

greg k-h
