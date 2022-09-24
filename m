Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF03517D0
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 11:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DF2C433D7;
	Sat, 24 Sep 2022 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664017466;
	bh=K1M63ZijK7n6s+j8gLCK6ccRw+ZB2x0DEJ7b0gINja4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1U7MaH78VrWsfTqmqLxnrknGtLuuPjp/VB6SGM6HdwdNEh2phnRyPqY7UiAkRKoEn
	 yGokMTqTfP5PBx1SMZNLK5QjNLmTPIf1SoJnd753n8YqJH5OyEA1ziPPEFokdjF85G
	 XY9TaOw+w+3ynonpR0Crqi23oXDbmTaON4w9IvKk=
Date: Sat, 24 Sep 2022 13:04:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joash Naidoo <joash.n09@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	dan.carpenter@oracle.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: r8188eu: fix too many leading tabs
Message-ID: <Yy7kON0jNecPXN/k@kroah.com>
References: <20220919132310.1494-1-joash.n09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919132310.1494-1-joash.n09@gmail.com>

On Mon, Sep 19, 2022 at 03:23:10PM +0200, Joash Naidoo wrote:
> Coding style fix. Fix too many leading tabs and line length.
> 
> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
> ---
> Changes in v3:
>     - Fix flipped condition mistake
>     - move skb NULL check before dereferencing it
> Changes in v2:
>     - Flip additional nested if conditions and don't reverse the last if statement
>     - Move declarations to start of function
>     - Separate converting __constant_htons to htons to another patch

Always test-build your changes before sending them out so you do not get
grumpy emails from maintainers asking why you didn't test-build your
changes...

thanks,

greg k-h
