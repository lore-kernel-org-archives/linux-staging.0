Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13111374;
	Wed, 26 Oct 2022 13:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2562BC433D7;
	Wed, 26 Oct 2022 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666790050;
	bh=EKXNLice97kAr2uVDDpkZXUKKHoPsgT66AngNNyUu+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRitB/41lFj3EbBy6J0ZaAv8dloOHeDKi108ghtMuRG2Nf1d4HkoYW1kviVZV28xy
	 zjSViml/VG2WYNm8eMVMGLtkcs9Aq9cCoz4uBLy0a8mtgkXTguu9wYK8lZexIxcXCL
	 QoJ6KBm6NhBoJyBY20JMy2qdUlg03ivJKlWF5fCI=
Date: Wed, 26 Oct 2022 15:15:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: UMWARI JOVIAL <umwarijovial@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: most: dim2: hal: aligning function parameters
Message-ID: <Y1ky11EhAfgpqD4U@kroah.com>
References: <20221026110607.GA37960@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026110607.GA37960@rdm>

On Wed, Oct 26, 2022 at 02:06:07PM +0300, UMWARI JOVIAL wrote:
> According to Linux Kernel Coding Style, lines should not end with a '('
> Fix-issue reported by checkpatch.pl script.
> 
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> ---
>  drivers/staging/most/dim2/hal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

You sent 2 copies of this, but I have no way to determine which one was
correct :(

Please resend a v2 only once so that we know which one is the one to
review.

thanks,

greg k-h
