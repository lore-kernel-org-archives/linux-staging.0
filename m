Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB0E70
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=miloN6DGw1sq8TwRfQqBfE3nU1vq3X8oB+icH0CHsp8=; b=ih5mRSpb3Oj6LJUx+Ph6Z6FA+B
	VMfYDwEsuVumiZWxiEz7wgQAlhLEGqEsDVz7leYoL9HqW94qxnvzAi8pzK3zNxCZ27faXCsIAE4Io
	lCI6eiYrHkkWanKTjaNUbEuXRE14U4i+KLJLX1RtUnbBtHARwh0fMmDCFOfm/GJ+7FTaZCOdw/a2h
	C24cvu70+OFvDA3OiGBgV/apvynx3MdNmBLMNkK3w7womxDmjxwwUlRlLYUHMbL3FixGSAdvhuTF3
	+8DJSuphaZHfc5zUktTD8SJM8AV9/GfPSt3epB7J9HlhZBy9CYU4acRqL+YRdhD+MJSxOxbGpokm2
	8mCmwhvA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lRzGX-006IJe-F0; Thu, 01 Apr 2021 15:29:51 +0000
Date: Thu, 1 Apr 2021 16:29:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH 2/2] staging: media: omap4iss: align
 arguments with open parenthesis
Message-ID: <20210401152949.GG351017@casper.infradead.org>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <475dbbe5774cbfed2d924807d8a3cfeb84b3d845.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <475dbbe5774cbfed2d924807d8a3cfeb84b3d845.1617287509.git.martinsdecarvalhobeatriz@gmail.com>

On Thu, Apr 01, 2021 at 04:07:39PM +0100, Beatriz Martins de Carvalho wrote:
>  		subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev, adapter,
> -				board_info->board_info, NULL);
> +						   board_info->board_info, NULL);

Also not a readability improvement.  This checkpatch warning should
be disregarded.
