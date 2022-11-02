Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30AE622
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 01:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC71C433D7;
	Wed,  2 Nov 2022 01:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667353847;
	bh=qGqh4q3o9BH6UWoao+yGfX/V7FPbcVQG7BCjeSFxnok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxNmSzPB2pEuSgzd0yub7bPxnB5xIDA00d75eNNM9lH9bIEMIHn5zsR8r5r+KpZD5
	 tjFeW2FcEQhPKsxSb6eR6Bydh26PHx7YZwl7l/yt6CCAw5xM545DyTLSYq5ybz6H/b
	 hUGjexGCvzKc8dnXEVszgsnQDS000SfrT/36pzYk=
Date: Wed, 2 Nov 2022 02:51:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: chen zhang <chenzhang@kylinos.cn>
Cc: error27@gmail.com, ztong0001@gmail.com, chenzhang_0901@163.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] staging: rtl8192u: Fix typo in comment
Message-ID: <Y2HNKwutTJh6kHXS@kroah.com>
References: <20221102014154.14344-1-chenzhang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102014154.14344-1-chenzhang@kylinos.cn>

On Wed, Nov 02, 2022 at 09:41:54AM +0800, chen zhang wrote:
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>

Please follow the documented rules for when you submit a change based on
a tool like a bot such as this.

> Signed-off-by: chen zhang <chenzhang@kylinos.cn>

This email address does not validate as actually being sent from this
domain, so I can't trust it, sorry.  Please work on fixing your email
system so that this can work properly.

thanks,

greg k-h
