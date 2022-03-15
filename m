Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFA623A0
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 14:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D40C340EE;
	Tue, 15 Mar 2022 14:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647353955;
	bh=XG3mqAvP/dgv8ZgDBZ/3Z9nNgKycZZez7LoUFfJqTpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF8hNNxypPS+AW1Eada7SmDukRd+tldbByT4OYCtDObqIMBInADoSmsC+qDXq/rWL
	 O6If94P6zqzTcIoqmlzAj7kC9y8uj+2dmBFaz85/bWwJg64VVcs+7eiEJZbyw8giCz
	 gML2D+C5D2VqARmcEzNh1tsvo2Zf1oGxfyeMrToo=
Date: Tue, 15 Mar 2022 15:19:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vihas Makwana <makvihas@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: r8188eu: proper error handling in
 rtw_init_drv_sw
Message-ID: <YjCgXS990UNB/oQG@kroah.com>
References: <20220309205047.45981-1-makvihas@gmail.com>
 <20220309205047.45981-3-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309205047.45981-3-makvihas@gmail.com>

On Thu, Mar 10, 2022 at 02:20:47AM +0530, Vihas Makwana wrote:
> The code inside rtw_init_drv_sw() calls various init functions to
> populate the padapter structure and checks for their return values
> respectively.
> But if one of the functions in middle fails then it simply returns
> _FAIL instead of proper logging and calling freeing counterparts
> of previous init functions.
> This leads to various memory leaks and can be found in
> /sys/kernel/debug/kmemleak if kernel is compiled with DEBUG_KMEMLEAK=y.
> 
> Fix this and keep the success and error separate.
> 
> Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for
> RTL8188eu driver")

Nit, that needed to be on one line, and no blank line before the next
ones.

I've fixed it up now.

thanks,

greg k-h
