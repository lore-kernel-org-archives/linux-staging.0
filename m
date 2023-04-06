Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F68476
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 14:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948FDC433EF;
	Thu,  6 Apr 2023 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680793067;
	bh=X2TdDr4EBPsChITOsKBopced6tBmgsIA23enF7T+fns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTe6YRdQW38Al73wWDXivqX1gdptCxT4THjxOE/gyumvuh47lq2p9oG7ZkhOK8jtC
	 XGXfSrbDnmq7l07HV6LBDGy+GIWDtpJjWtuzrBKhoCVaTpRuO+JLpDR5tDzESU17H5
	 W4GHEB3IAkBYsshGMxI2dkYHVa0pAFNSScIKM3H8=
Date: Thu, 6 Apr 2023 16:57:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: Simon Horman <simon.horman@corigine.com>,
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Remove macro FILL_SEG
Message-ID: <2023040648-zeppelin-escapist-86d1@gregkh>
References: <20230405150627.GA227254@sumitra.com>
 <ZC2gJdUA6zGOjX4P@corigine.com>
 <20230406144644.GB231658@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406144644.GB231658@sumitra.com>

On Thu, Apr 06, 2023 at 07:46:44AM -0700, Sumitra Sharma wrote:
> On Wed, Apr 05, 2023 at 06:21:57PM +0200, Simon Horman wrote:
> > On Wed, Apr 05, 2023 at 08:06:27AM -0700, Sumitra Sharma wrote:
> > > Remove macro FILL_SEG to fix the checkpatch warning:
> > > 
> > > WARNING: Macros with flow control statements should be avoided
> > > 
> > > Macros with flow control statements must be avoided as they
> > > break the flow of the calling function and make it harder to
> > > test the code.
> > > 
> > > Replace all FILL_SEG() macro calls with:
> > > 
> > > err = err || qlge_fill_seg_(...);
> > 
> > Perhaps I'm missing the point here.
> > But won't this lead to err always either being true or false (1 or 0).
> > Rather than the current arrangement where err can be
> > either 0 or a negative error value, such as -EINVAL.
> >
> 
> Hi Simon
> 
> 
> Thank you for the point you mentioned which I missed while working on this
> patch. 
> 
> However, after thinking on it, I am still not able to get any fix to this
> except that we can possibly implement the Ira's solution here which is:
> 
> https://lore.kernel.org/outreachy/64154d438f0c8_28ae5229421@iweiny-mobl.notmuch/
> 
> Although we have to then deal with 40 lines of ifs.

Which implies that the current solution is the best one, so I would
recommend just leaving it as-is.

Remember, checkpatch.pl is a tool to provide hints, it does not have
much context, if any, to determine if it's hints actually make sense.

thanks,

greg k-h
