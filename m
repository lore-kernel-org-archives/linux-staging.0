Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312F62D
	for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 08:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D44C341CF;
	Mon, 25 Jul 2022 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658739264;
	bh=vmglcOJClf0/A72Hg+512O5HtnFUTgtTxRtt2NfR754=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pg9VAtsqzV+rIf3YeK4RNTiHnuKIahOCyuBxsvpPj8UNLwaY2mlxWcT+LfBt8ZJLd
	 LqJI0jUPzZQrxT9o17WHlYFVYQHUMv8n+BVzvS5KnIwzE4LXxj7mgfUD5o6EZmfkuW
	 JscuQKRWYnWnJzDYgZKw+1fegkI8u3PsllWlWtywLZ7iY60m+NhMiZDv8CFz+poi3q
	 5vqfGolRURUYORA15di6VJLzJkMVb/fGLG6iNWJ7CFJtabrdba7e0qvobqzQcBEKyj
	 mJp69JcBhYRxcjFRw4zduRAr3riu2028AWaesBePcDDEO0dKnfVGJvjd9qRjEC5ZG7
	 E6yXetrKkkIcg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oFtrH-0000vr-D9; Mon, 25 Jul 2022 10:54:35 +0200
Date: Mon, 25 Jul 2022 10:54:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>, Felipe Balbi <balbi@kernel.org>,
	Yan Xinyu <sdlyyxy@bupt.edu.cn>, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] USB: cdc: add control and state defines
Message-ID: <Yt5aSzd9/5HCj2xv@hovoldconsulting.com>
References: <20220725075841.1187-1-johan@kernel.org>
 <Yt5ZwYAI/jy4XW2n@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yt5ZwYAI/jy4XW2n@kroah.com>

On Mon, Jul 25, 2022 at 10:52:17AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 25, 2022 at 09:58:34AM +0200, Johan Hovold wrote:
> > Several drivers use the control-line and serial-state bitmap values from
> > the CDC spec, but there were no matching defines in the global CDC
> > (UAPI) header.
> > 
> > This series adds the missing defines and converts cdc-acm and f_acm to
> > use them.
> > 
> > One staging driver also had an unused set of CDC defines which are
> > removed.
> > 
> > The final patch by Yan Xinyu, which triggered this work, converts the
> > usb_wwan driver to use CDC defines instead of hardcoded values in its
> > line-control handling.
> > 
> > Greg, are you ok with me taking these through USB serial (where there
> > are a few more drivers that could potentially use them) or do you want
> > to take the lot through your tree directly?
> 
> Many thanks for this, I'll just take this now and you can send future
> patches for usb-serial that can rely on these being present.

Sounds good. That probably won't happen before the merge window anyway.

Thanks.

Johan
