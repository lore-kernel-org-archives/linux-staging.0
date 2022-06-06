Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACA23A0
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 06:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EF6C34119;
	Mon,  6 Jun 2022 06:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654495918;
	bh=QakzZq9lRiGOvpErXkgEihE7W8tXwKnrBeRHAk/2sZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTAdJEhOVB7hQx+MzknmbvbQiHDBPb0MRvMypEEr3EU/Qy+HBrJwipqF8mcZLTaws
	 LFkx2cBVvQ35hzC6UOEatyKPzMIIdAheuDLUfCwIAz5fy8AIYapdptMuglD/DujVwY
	 x7jqzBWfOaS3kbITuLr1efS6FdUQTxitiG9Dkud0=
Date: Mon, 6 Jun 2022 08:11:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] staging: some memory-related patches
Message-ID: <Yp2arAcg3DlgNT5t@kroah.com>
References: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>

On Tue, May 03, 2022 at 02:56:47PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> This is a collection about some memory-related bugs fixing.
> In brief, there are two types about them.
> First is some memory allocation functions are called without proper
> checking, which may result in wrong memory access in the subsequent
> running or some else.
> Second is lacking proper error handling that does not release some
> allocated resources, which may result in memory leak problems.
> 
> These issuses are similar, so they are put in this series together.
> Note that most of them are sent as each separate patch before, this series
> rebased them to the lasted version. While there are some inherent logical
> relationships between 03~05/11~12.

Can you please look at Documentation/process/researcher-guidelines.rst
and update the changelog texts of these commits to provide the extra
information that this document requires of changes like this?

thanks,

greg k-h
