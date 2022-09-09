Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D83622
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 05:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700B8C433D6;
	Fri,  9 Sep 2022 05:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662702474;
	bh=0vVGtD3bKh45RiCjRwMej10XDq4aP2ygUfgxljQEXXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0a77IeEQp1gjZsZC7UYBds9koxGkx+nhssvrM7AKhM6rYp27+K3SbfaFeiM3CfbPh
	 a7JeqkjVE1ULnxgCfirYeR527dCBL4wt3R8+ANWluA8wl7x4iwx3781AZHHZ0uH4SN
	 P0d7pInr3BFo0Nq3lGH8QX4sNkvZBQsVpphYVHfE=
Date: Fri, 9 Sep 2022 07:47:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655: fix potential memory conruption bug
Message-ID: <YxrTiN1OuJ2cbtrn@kroah.com>
References: <20220909053038.33188-1-namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909053038.33188-1-namcaov@gmail.com>

On Fri, Sep 09, 2022 at 07:30:39AM +0200, Nam Cao wrote:
> A line of code is attempting to set the entire struct vnt_rdes0 to
> zero by treating it as unsigned int. However, this only works if
> sizeof(unsigned int) is equal to sizeof(struct vnt_rdes0) (4 bytes),
> which is not guaranteed. This may cause memory conruption if
> sizeof(unsigned int) is 8 bytes for example. Fix the problem by using
> memset instead.

sizeof(unsigned int) is not going to be 8 bytes, so there's no memory
issue here.  But your fix is good, so can you please just rewrite this
to be "make it more obvious what is happening" type of patch?

thanks,

greg k-h
