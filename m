Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0C1FAE
	for <linux-staging@lists.linux.dev>; Sat,  5 Aug 2023 06:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FF8C433C7;
	Sat,  5 Aug 2023 06:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691216076;
	bh=W99doICB6Cl6UeOwEEeN2r3DGMhBmFMk1bg+59AQZXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJjptcteEVsxO8e8EcIXKoNcEhCj7qFkq0f7RG4+WK4BnFgH1m9sXzkJ+0tgKXq4G
	 WuV1xU7qufoEvf6g8G8/3TX+hwiG8HUFpBYmEQyM0xcDlL3zOyma6OA5rE/+uRPBcP
	 /0VjU6cJd6baBWcw1cMGIYqZl4NOXpcv7EVrOHss=
Date: Sat, 5 Aug 2023 08:14:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <2023080510-vacation-support-7afe@gregkh>
References: <ZM1rsu0M22HHtjfl@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZM1rsu0M22HHtjfl@alolivei-thinkpadt480s.gru.csb>

On Fri, Aug 04, 2023 at 06:20:50PM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Alignment should match open parenthesis
> as reported by checkpatch to adhere to the Linux kernel
> coding-style guidelines.

This does not describe the changes you actually made in this patch :(

