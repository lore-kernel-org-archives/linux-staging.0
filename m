Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBFF7C;
	Wed,  2 Nov 2022 07:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD10C433C1;
	Wed,  2 Nov 2022 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667373639;
	bh=Xyiw85skuUx0yiiswhv6LWvXnuXoYLDwDkaesjrBs9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sw7mvzCiw8JK6yk4rTQukQALO1uiUbajCcnVONhcej6qfDYElr9Q5ltRAyI5duSKh
	 GVII+4HUh7agDbK/RJ55HMXSky6qNJIbOkT6NZqd8fyuscdSD7cw79jVN3tDpQpZr6
	 /sRpq1Y++t3eJiRiYm4VD1Zl0plHmX3jvRfw9F2w=
Date: Wed, 2 Nov 2022 08:21:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] change 2 variable names wFB_Opt0 and wFB_Opt1
Message-ID: <Y2IafEzFV4RtPBEE@kroah.com>
References: <Y2DrUw4uPfU1qpm3@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2DrUw4uPfU1qpm3@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Tue, Nov 01, 2022 at 09:48:03AM +0000, Tanjuate Brunostar wrote:
> These variables are named using Hungarian notation, which is not used
> in the Linux kernel.
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)

Please fix up the subject line to be correct and resend.

thanks,

greg k-h
