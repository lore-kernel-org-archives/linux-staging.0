Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AB471
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:31:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33D0861221;
	Mon, 12 Apr 2021 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618219913;
	bh=5M5LmScUSUW/JdezR/30mJvpyYQpsWjQ22ChxNtxucA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nritx9li/UY686NVEvRCWuBRT0weWimJ57A7D0kf89mIZ7K5pSxrE47d4Y/7o3ArL
	 u9EHl/hlYxa6fFVC4gkZyS/WEoWeX74wBzN1pVH2l+JM9nUv1Vy6HL6aVOaPKUrcYb
	 sfqJqWcm+pb0afG2CwGvPTlE8Fo65+4qMsORLgbA=
Date: Mon, 12 Apr 2021 11:31:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: nsaenzjulienne@suse.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 0/2] remove whitespace and rectify spelling error
Message-ID: <YHQThxlpcCGSO2QY@kroah.com>
References: <cover.1618169920.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618169920.git.mitaliborkar810@gmail.com>

On Mon, Apr 12, 2021 at 01:15:52AM +0530, Mitali Borkar wrote:
> This patch fixes whitespace and spelling mistake issue.

"this" is not a patch, it is a 0/X email.

Also your subject line does not match the prefix on the patches, please
fix up.

thanks,

greg k-h
