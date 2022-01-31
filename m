Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832729CA
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 13:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBADC340E8;
	Mon, 31 Jan 2022 13:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643634250;
	bh=TD6/WGLViFunmRccj4Esvf4Me5wXuWjEDYLePglBafw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHZCCUOWu2G3uXD82pFLev/bcqTxB4xy4sWogDOgLqnut+wu21hlSxO2QMsCn1r6Q
	 1aWT5cq8Ct2rv7jKeS85epjwJM5GWn7ay/9sPggGm/DCqUKHAF3iMFT+pgH352/PhF
	 aPz2l8hqjoPYNCsEPPDpo6K/5uJs+zHk5+4WmlTg=
Date: Mon, 31 Jan 2022 14:03:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/23] staging: r8188eu: remove unneeded ret variables
Message-ID: <YffeDdW5gPDIXR9f@kroah.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>

On Sat, Jan 29, 2022 at 09:34:06PM +0530, Abdun Nihaal wrote:
> This patchset does the following to functions in ioctl_linux.c:
> - Remove unneeded return variable in some functions.
>   These functions cannot be converted to void either because it is an
>   iw_handler function or the function does return error code.
> - Propagate error code in rtw_p2p_get2 function
> - Convert some functions that always return 0 to return void
> 
> v3 -> v4:
> - Split the changes into smaller patches to make it easier to review
> - Add a new patch to propagate error code in rtw_p2p_get2 function

Much nicer and easier to review, all now queued up, thanks!

greg k-h
