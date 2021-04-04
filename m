Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C4259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 09:55:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B34CB61380;
	Sun,  4 Apr 2021 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617530131;
	bh=FhEaW2cmEgSgSaC3SbBCxav57AyEtDTZ4e+3qBA+FkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWIkycwoXooVgqIedtlP6WI6HZ7u663QH3KqsMpIVBzKrAQQiC065kvQWoMRntHBJ
	 GSvAQPhs/tedheWCzJJrNctXHnoisBp4Nb3hTzTKyfMUeSpLOBm1lxoi02ag59gviR
	 iJGj3rRJMf53nfmHeAsjK7kIDtgvdxUzSXC0FMUo=
Date: Sun, 4 Apr 2021 11:55:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc: clabbe@baylibre.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [PATCH 0/7] staging: media: zoran: Eliminate camelcase
Message-ID: <YGmNDmT/aqU/+ygn@kroah.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>

On Sun, Apr 04, 2021 at 12:08:57AM +0600, Zhansaya Bagdauletkyzy wrote:
> This patchset fixes 'avoid camelcase' warning by converting local variables to lowercase and separating words using '_'.
> Renaming of each variable is implemented in separate patches.
> 
> Zhansaya Bagdauletkyzy (7):
>   Rename 'HEnd' to 'h_end'
>   Rename 'VEnd' to 'v_end'
>   Rename 'DispMode' to 'disp_mode'
>   Rename 'VidWinWid' to 'vid_win_wid'
>   Rename 'VidWinHt' to 'vid_win_ht'
>   Rename 'We' to 'we'
>   Rename 'He' to 'he'
> 
>  drivers/staging/media/zoran/zoran_device.c | 48 +++++++++++-----------
>  1 file changed, 24 insertions(+), 24 deletions(-)

You did not read the instructions for the outreachy work, sorry, but I
can not take these.

good luck!

greg k-h
