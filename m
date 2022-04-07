Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705832570;
	Thu,  7 Apr 2022 17:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B19C385A0;
	Thu,  7 Apr 2022 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649353584;
	bh=Jkvw4HbUD+BJnLkGElMbJBIW0lO8m3RLntyqyhk1X6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnvq4cgiesiEk+CxUkH5lrwhvijZrGWqmipS+cWYZvnVo/Y5obLg9uWlLpO9garDW
	 fQUzdePrQCXQ2o1uh+FN7JU7S0Nu3lIfF3n3IdRlTwnoU0DgxkPBJQWVqjWhc0YzgB
	 s1bwgCOckxYLVk+zyMDQXxyCGYvS1zC7tGPL7aJE=
Date: Thu, 7 Apr 2022 19:46:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8712: remove unnecessary parentheses
Message-ID: <Yk8jbTSjvsHXpX2U@kroah.com>
References: <20220407125947.8525-1-eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407125947.8525-1-eng.alaamohamedsoliman.am@gmail.com>

On Thu, Apr 07, 2022 at 02:59:47PM +0200, Alaa Mohamed wrote:
> Reported by checkpatch:
> 
> Remove unnecessary parentheses around structure field references
> 
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
> Changes in v2:
> 	- Edit commit subject
> 	- Edit commit message
> 	- Fix the same check in more lines
> 	- Remove space before '.skey' in
> "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86.
> ---
> Changes in v3:
> 	return the space before '.skey' in
> "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86
> ---
> Changes in v4:
> 	edit commit message to be clearer.
> ---

Why did you send this patch twice?

