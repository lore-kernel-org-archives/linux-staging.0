Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711672572
	for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 06:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34F3C340E9;
	Sun, 20 Mar 2022 06:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647758656;
	bh=dusrF4VlCWfYYYamjBKQmqBPwlcj57b1Mbg7bVk1D1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzuyWQQv019Bx3WnDhsZi5gsyQEMYMu2jAAaiPD38Gq+msk8VlJK7UD4oKzwlTDgb
	 1A1X+o2A3Q7i8EEMTP/hhvD91tzsURPO1T/wBhLULaFZz4/SVgm4OqPgnakbt9Mjeq
	 TTYyNap2oevUM/fh+4GuHSKD/nA/mPs4E3VOjbHU=
Date: Sun, 20 Mar 2022 07:44:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Ryan C. England" <rcengland@gmail.com>
Cc: gregkh@linuxfoundation.com, lee.jones@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: axis-fifo: Fixed parenthesis styling issues
Message-ID: <YjbNO3VHGYbm6Si+@kroah.com>
References: <20220320042340.49222-1-rcengland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220320042340.49222-1-rcengland@gmail.com>

On Sun, Mar 20, 2022 at 04:23:40AM +0000, Ryan C. England wrote:
> Fixed open parenthesis alignment issues.
> 
> Signed-off-by: Ryan C. England <rcengland@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Where is patch 1/2 in this series?
