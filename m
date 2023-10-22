Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331A817E6
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pyu+qBCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F39C433C8;
	Sun, 22 Oct 2023 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697973575;
	bh=YmgDNED23ixJ3o/WNflKhXgCQTh55NXblC0T6yCsHYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyu+qBCPcvvAGFI/oGySCM6BdPCB23aZHzRIPMG/fYw7Esav0xmq2QIhub2a4Ku7t
	 Plvq4+mDFJL/MU7QkEkDdGftdqxg+tCSP1pZdQaoQwIzC+a3FN0VlNJCEwwBQhTmk6
	 d0JC9j+o4r4t2FYkVgAGQKTcZhDokxBNXjyLIgXM=
Date: Sun, 22 Oct 2023 13:19:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumaran.4353@gmail.com
Subject: Re: [PATCH 3/3] staging: greybus: fixed prefer using ftrace warning
Message-ID: <2023102219-boat-shaky-f491@gregkh>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
 <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>

On Sun, Oct 22, 2023 at 03:42:26AM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 2 --
>  1 file changed, 2 deletions(-)

Again, subject line should have "bootrom" in there somewhere, right?

thanks,

greg k-h
