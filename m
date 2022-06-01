Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D27E
	for <linux-staging@lists.linux.dev>; Wed,  1 Jun 2022 10:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C35C34119;
	Wed,  1 Jun 2022 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654078716;
	bh=LQC0N6hCla1p6RvYrBTedcFGJaeX6b92BTEoRrjN5CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wUB+n4zc2GtSTXVyRhQLgU6dnWEqXr9r4dqyZJk80YJHl5j5f6Wl6G+vF0bQI1r9/
	 BM1OulRtMkDS1XY0xXgLp3h619Y7deZDFbcuH42mvFrn5sRU2ID891Kl5JJyLATGrr
	 GZP2QBOb8AGtPyWIWqhz9nxcGaHU/5Y9tdzbQ6mA=
Date: Wed, 1 Jun 2022 12:18:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: larry.finger@lwfinger.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, phil@philpotter.co.uk
Subject: Re: [PATCH V2] staging: r8188eu: Drop redundant memset overwritten
 by memcpy
Message-ID: <Ypc89GXegCft+vEq@kroah.com>
References: <007ab767-b124-26fd-20f4-29fea899a573@lwfinger.net>
 <1654077926-9687-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654077926-9687-1-git-send-email-baihaowen@meizu.com>

On Wed, Jun 01, 2022 at 06:05:26PM +0800, Haowen Bai wrote:
> The region set by the call to memset is immediately overwritten by the
> subsequent call to memcpy. So we drop redundant memset.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
> V1->V2: change title for unique subjects.

That's not really unique, why is this just not 1 patch with both changes
in it as you are doing the same thing to the same driver source, just in
different locations in the files.

Please merge together.

thanks,

greg k-h
