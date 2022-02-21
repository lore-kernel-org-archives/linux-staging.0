Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A91E5EBB
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 17:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D68C340F1;
	Mon, 21 Feb 2022 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645463720;
	bh=3hVFByujHotYCnp1JQ7r1J0fFmKwYercGN1DL1gGxmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rk+dLpJwKxFOf6dAvit8EWf/5mZJvV4hJwnY8/9c3QFvmCISmqNSeEfVrD2Otp3DD
	 WdDK1+nTiBwQjEbAn+qX7AeLwzGwzvjOtbSP2lXsl2Cbe+T3TI6C9DMWPy0TW/TVSc
	 qK9mVWDdZbsIbpdIXBIUYGrVukFs41Y0ESY37xog=
Date: Mon, 21 Feb 2022 18:15:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: vt6656: Add comment and change macro to
 function
Message-ID: <YhPIpvz4X9BrR3J6@kroah.com>
References: <cover.1645386791.git.philipp.g.hortmann@gmail.com>
 <3eb14cfaa3f97695bd4db0dd75ac78408c557821.1645386791.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eb14cfaa3f97695bd4db0dd75ac78408c557821.1645386791.git.philipp.g.hortmann@gmail.com>

On Sun, Feb 20, 2022 at 09:30:36PM +0100, Philipp Hortmann wrote:
> This patch fixes the checkpatch.pl warnings like:
> - CHECK: spinlock_t definition without comment
> - CHECK: Avoid CamelCase: <uVar>
> - CHECK: Macro argument reuse 'uVar' - possible side-effects?

That is 3 different things and so, should be 3 different patches.
Please break patches up into "one patch per logical change".

thanks,

greg k-h
