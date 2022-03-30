Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6036C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 06:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90D4C340EC;
	Wed, 30 Mar 2022 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648622351;
	bh=jOA5DTcR4ysQBXgXzVRHkctJEYYohSxahVIcYzS0xY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODkquS471G0QSSZvRrexAs3p52GBDXyac5o5if+gzWhXA5rZTbFslEC0XG4milNZi
	 QhNpOExFcX+s1wMiLh6QziNjYjzGJaA8auysH3KpHIF95hI0e1V1qEAlbOsqbXhfJa
	 6i3Qi+XUK3ufvzn0CrYDEvBC0decfajTp9JSpdOQ=
Date: Wed, 30 Mar 2022 08:39:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Fix misspelling in comment
Message-ID: <YkP7DGP+nbo2VJ+Z@kroah.com>
References: <1648621413-1263-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648621413-1263-1-git-send-email-baihaowen@meizu.com>

On Wed, Mar 30, 2022 at 02:23:33PM +0800, Haowen Bai wrote:
> This patch fixes some spelling typo in error message reported by checkpatch.pl
> 
> WARNING: 'cacluated' may be misspelled - perhaps 'calculated'?
> WARNING: 'cacluated' may be misspelled - perhaps 'calculated'?
> WARNING: 'writting' may be misspelled - perhaps 'writing'?
> WARNING: 'defualt' may be misspelled - perhaps 'default'?
> WARNING: 'Caculate' may be misspelled - perhaps 'Calculate'?
> WARNING: 'accordign' may be misspelled - perhaps 'according'?
> WARNING: 'regster' may be misspelled - perhaps 'register'?
> WARNING: 'Wirte' may be misspelled - perhaps 'Write'?
> WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
> WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
> WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
> WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?

Please break this up into one-patch-per-misspelled-word.

thanks,

greg k-h
