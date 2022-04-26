Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70C7E
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 14:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30C4C385AC;
	Tue, 26 Apr 2022 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650982291;
	bh=Nhzvp7jJarf28aGArWk3ZMIorlcsYtKlCn/06+G8pzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccdRPcUyI3PrRNcy1FhPbtsXi98ekMgWwajj8epoi2WsmTfkLSAYGrSW9ocLqQsDq
	 Bbpf/M44EvPwiNPAjp0jEG3swNNLdKDsBwZkjo7qNGxlWve0L6uqKrg39fZnY8q829
	 qn6mVWz+MxAX2jPQ7ljPaPATVB+dO9nQ4FZU6Q/Q=
Date: Tue, 26 Apr 2022 16:11:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Noah Tschirner <noahtschirner@gmail.com>
Cc: jerome.pouiller@silabs.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: wfx: Fixed a space coding style issue.
Message-ID: <Ymf9j8CQhSX8HNRT@kroah.com>
References: <20220426135148.29785-1-noahtschirner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426135148.29785-1-noahtschirner@gmail.com>

On Tue, Apr 26, 2022 at 03:51:48PM +0200, Noah Tschirner wrote:
> Fixed a space coding style issue.
> 
> Signed-off-by: Noah Tschirner <noahtschirner@gmail.com>
> ---
>  drivers/staging/wfx/main.c | 2 +-

This is not a file in the linux-next tree.

Always work off of either linux-next, or the subsystem-specific git tree
so you do not duplicate work that others have done.

thanks,

greg k-h
