Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B723C0;
	Sat, 29 Oct 2022 07:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83740C433C1;
	Sat, 29 Oct 2022 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667029091;
	bh=TXFmIk2R49R5R9V/eeK+lu3Gk0L3bKmdIfyZaChP0AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtB0GrVOEBcSfTbEtXj88dmf++U7/JBHu9iQPuWN0EwFH5uVX8vmIV+37H+B95VjS
	 IHWz+JxSQf3SV3b526seyopu4gfsB6ZL2gFw/8FXRScu67jzzKvuct7/S+8sYz0DNS
	 w4sI+VxVv+sxKnWRTjWX7c0fsxZ7CCwoik1EGlg4=
Date: Sat, 29 Oct 2022 09:39:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v9 0/6] Checkpatch cleanup in rxtx.c
Message-ID: <Y1zYmxKscLQsk9ZW@kroah.com>
References: <cover.1666995639.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666995639.git.tanjubrunostar0@gmail.com>

On Fri, Oct 28, 2022 at 11:23:21PM +0000, Tanjuate Brunostar wrote:
> v9: reorganized the changelog messages on this patch

You dropped the "staging: vt6655: " from this 0/X email, why?

Please take a day or two off, relax, and resubmit the series with _ALL_
review comments addressed.

thanks,

greg k-h
