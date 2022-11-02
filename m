Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259027C;
	Wed,  2 Nov 2022 07:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85B7C433C1;
	Wed,  2 Nov 2022 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667373487;
	bh=SfRKT+s1U0JAWcutw2ffQATmHJsVUpEc24ue7Xu2sRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPMzo/IuIvACXMYS/WFe3l7Zk2VDNHDIChNhJWcedKWRf2ALoZL8lvrAS+ka4faOj
	 5LYj819PpZmkhfdXdxkenOzUK3GO0BIVAhQgybhcbfZTxl7ebNKMghPg3cdXgxXb4g
	 rnGg4bEqnAIugupYLox8NzMnShGQDXOVydqgDPNc=
Date: Wed, 2 Nov 2022 08:19:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Tanjuate Brunostar <tanjubrunostar0@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 0/2] staging: vt6655: some checkpatch fixes in the
 file rxtx.c
Message-ID: <Y2IZ5NRxma00gCtD@kroah.com>
References: <cover.1667326000.git.tanjubrunostar0@gmail.com>
 <f67a1a02-addf-3197-e423-7c66ab97f6df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f67a1a02-addf-3197-e423-7c66ab97f6df@gmail.com>

On Tue, Nov 01, 2022 at 11:15:37PM +0100, Philipp Hortmann wrote:
> On 11/1/22 19:17, Tanjuate Brunostar wrote:
> > These fixes are focused on the function s_vFillRTSHead
> > 
> > v3: changed the function name from fill_rts_head to fill_rts_header as
> > head is conventionally used in lists
> > 
> > v2: changed confusing changelog messages
> > 
> > Tanjuate Brunostar (2):
> >    staging: vt6655: change the function name s_vFillRTSHead
> >    staging: vt6655: Join some lines of code to avoid code lines ending in
> >      (
> > 
> >   drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
> >   1 file changed, 22 insertions(+), 26 deletions(-)
> > 
> 
> Patch failed at 0001 staging: vt6655: change the function name
> s_vFillRTSHead
> 
> 
> WARNING: line length of 138 exceeds 100 columns
> #58: FILE: drivers/staging/vt6655/rxtx.c:915:
> +			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK,
> bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> 
> WARNING: line length of 138 exceeds 100 columns
> #67: FILE: drivers/staging/vt6655/rxtx.c:934:
> +			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK,
> bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> 
> WARNING: line length of 138 exceeds 100 columns
> #76: FILE: drivers/staging/vt6655/rxtx.c:948:
> +			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK,
> bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> 
> May be you need to consider to break this lines.

Not in this commit, just stick to doing one thing per patch.  This line
is already "too long" so it is not a new problem being introduced with
this change.  It is fine as-is.

thanks,

greg k-h
