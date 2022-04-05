Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0652F3A
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 14:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2232DC385A0;
	Tue,  5 Apr 2022 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649168012;
	bh=J7HCJkshX2Pc5q0J6hzinjXyY0BZxW6N/Kloo4Faflw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q818vD8EN3d0ohROvuHYNbX5wg5mBo3+SNJYfrLXDUMPJEIsF8m6Z2zx0VRl3Ug5j
	 WYIHW8s6fVfSYDRGQ+ouV2E9HrcNo8IKE/fDexSNNURqfwv/qdrmSRFUr3CjPPXcHM
	 JOoN0gx17uUW/c8jel0J8DCfjezHp/IJnTb94ObA=
Date: Tue, 5 Apr 2022 16:13:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vihas Makwana <makvihas@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: r8188eu: drop redundant if check in
 check_fwstate
Message-ID: <YkxOitByai03u8Qc@kroah.com>
References: <20220405124239.3372-1-makvihas@gmail.com>
 <20220405124239.3372-3-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405124239.3372-3-makvihas@gmail.com>

On Tue, Apr 05, 2022 at 06:12:39PM +0530, Vihas Makwana wrote:
> The if check is redundant. Drop it and simplify the funciton.
> 
> Also, drop clr_fwstate(), clr_fwstate_ex(), up_scanned_network() and
> down_scanned_network() as they are not used anywhere.

When you write "also" in a changelog text, that's a huge hint that you
should break this up into multiple patches.

Remember, do only one logical thing per change.  This should be split up
into 2 patches.

thanks,

greg k-h
