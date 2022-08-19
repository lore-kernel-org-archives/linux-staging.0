Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2C5CA6
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B148C433C1;
	Fri, 19 Aug 2022 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660896813;
	bh=GIl6W2lxa8WtRY1EPibkIaCU0DHIioGipI0m1u+Nhss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFjZSaRfP2oTjxLw7WZApQg+Qk2v6LGfRSorRbmq6xt9jh2EDs7mluh+/D4FgPF6/
	 4Dt7b0zX7FYuxumxcE3P8YeUx4FoX1P1dqYHttu+Bk24rVC29eOjOHYapVS4xGcG9r
	 mqZsRzKL8gnYTlDIfosmQ/CQU1h58bjlhgqsq6gw=
Date: Fri, 19 Aug 2022 10:13:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	phil@philpotter.co.uk, Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Subject: Re: [PATCH] staging: r8188eu: remove unused function declarations
Message-ID: <Yv9GKm11nugjOAW0@kroah.com>
References: <20220819073725.8263-1-namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819073725.8263-1-namcaov@gmail.com>

On Fri, Aug 19, 2022 at 09:37:26AM +0200, Nam Cao wrote:
> Remove some function declarations because they are neither used nor
> have definitions.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>

One function removal at a time please, break this up into a patch series
to make it obvious what you are doing.

thanks,

greg k-h
