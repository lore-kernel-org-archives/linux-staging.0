Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919362D
	for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 08:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18BAC341C7;
	Mon, 25 Jul 2022 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658739143;
	bh=dk4dxGJLEJyeKq9FFm0ufVN4qajcM88UqvIcq9q1f+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqeCDrEiSmCNFcu7LfFKRW5AAcdr/sUXlG5b6/loMvdyK+zB3L4HQsDY9wUgKXI4C
	 Pkgt9yM8MWpxEhNfMo8JE6JN58kEowdlShOv+YTBkEZBtSyklJKaeAQKbontq7JMNt
	 XTtJvPUnttJDNsMdGa2M+tvKLfFFyRwUT06AAvdo=
Date: Mon, 25 Jul 2022 10:52:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Felipe Balbi <balbi@kernel.org>,
	Yan Xinyu <sdlyyxy@bupt.edu.cn>, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] USB: cdc: add control and state defines
Message-ID: <Yt5ZwYAI/jy4XW2n@kroah.com>
References: <20220725075841.1187-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725075841.1187-1-johan@kernel.org>

On Mon, Jul 25, 2022 at 09:58:34AM +0200, Johan Hovold wrote:
> Several drivers use the control-line and serial-state bitmap values from
> the CDC spec, but there were no matching defines in the global CDC
> (UAPI) header.
> 
> This series adds the missing defines and converts cdc-acm and f_acm to
> use them.
> 
> One staging driver also had an unused set of CDC defines which are
> removed.
> 
> The final patch by Yan Xinyu, which triggered this work, converts the
> usb_wwan driver to use CDC defines instead of hardcoded values in its
> line-control handling.
> 
> Greg, are you ok with me taking these through USB serial (where there
> are a few more drivers that could potentially use them) or do you want
> to take the lot through your tree directly?

Many thanks for this, I'll just take this now and you can send future
patches for usb-serial that can rely on these being present.

greg k-h
