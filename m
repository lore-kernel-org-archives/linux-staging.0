Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D422C82
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 12:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC006C340E3;
	Wed, 26 Jan 2022 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643198586;
	bh=LQmTP+KmRWl3m9v2Km0Z/hWKneKL6Li6IlRAbvPpx+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJLFjewCXAqFsgPogVd2jlu7dDix1vaWVBQGwc0a4bs9gv52iF/MBeZNNJtNoBfVX
	 CxpGz66LHWTpxuByvLdyGquzN2hVR66mvSXeEsTaH4gFhbLOKy8Hlmj+TPA64B7L/B
	 BhK+X+09SgypH+kwqwnCTbQ2kRY47shqj6KDomfo=
Date: Wed, 26 Jan 2022 13:03:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: pi433: add debugfs interface
Message-ID: <YfE4d4UY1yIVvapC@kroah.com>
References: <20220124042506.GA7662@mail.google.com>
 <20220124042721.GA8078@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124042721.GA8078@mail.google.com>

On Mon, Jan 24, 2022 at 05:27:21PM +1300, Paulo Miguel Almeida wrote:
> This adds debugfs interface that can be used for debugging possible
> hardware/software issues.
> 
> It currently exposes the following debugfs entries for each SPI device
> probed:
> 
>   /sys/kernel/debug/pi433/<DEVICE>/regs
>   ...
> 
> The 'regs' file contains all rf69 uC registers values that are useful
> for troubleshooting misconfigurations between 2 devices. It contains one
> register per line so it should be easy to use normal filtering tools to
> find the registers of interest if needed.
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>  drivers/staging/pi433/pi433_if.c | 80 ++++++++++++++++++++++++++++++++
>  drivers/staging/pi433/rf69.c     |  2 +-
>  drivers/staging/pi433/rf69.h     |  1 +
>  3 files changed, 82 insertions(+), 1 deletion(-)

Breaks the build:

drivers/staging/pi433/pi433_if.c:1166:25: error: initialization of ‘int (*)(struct inode *, struct file *)’ from incompatible pointer type ‘ssize_t (*)(struct inode *, struct file *)’ {aka ‘long int (*)(struct inode *, struct file *)’} [-Werror=incompatible-pointer-types]
 1166 |         .open =         pi433_debugfs_regs_open,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~


