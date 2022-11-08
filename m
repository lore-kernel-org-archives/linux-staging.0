Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5988BE7
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 15:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385FAC433C1;
	Tue,  8 Nov 2022 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667920873;
	bh=Ig3E3BtNkG1UvTcoImrclXzJXrA+uPW4+Ymp9OZw0Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFLiQsEWJ4mjLLdRMdJmUxZIxwD3v+96jSt4qs5sR+YeWVU22ahr7TFVv/MWcb5Tu
	 D4STTxO2gr8LxHsarvCqKE9YY6W553yTWtNbBxQcdZsGP9+b/6bk/Gx/TUtvvFL+RW
	 eidBAfoPNxslsOXISQowailiu9JlJq9znA78/Z7M=
Date: Tue, 8 Nov 2022 16:21:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jerom van der Sar <jerom.vandersar@gmail.com>
Cc: philipp.g.hortmann@gmail.com, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8192e: space formatting fixes in rtl_cam.c
Message-ID: <Y2pz5twhWN2eJT24@kroah.com>
References: <Y2IbI8ib5+k+bVRo@kroah.com>
 <20221102200057.397-1-jerom.vandersar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102200057.397-1-jerom.vandersar@gmail.com>

On Wed, Nov 02, 2022 at 09:00:58PM +0100, Jerom van der Sar wrote:
> Fixed a few coding style issues in rtl_cam.c: two times lack of
> spaces around binary operators. Some other warnings still remain.
> These issues were found by scripts/checkpatch.pl.
> 
> This patch helps clean up the rtl8192e driver in staging, making it
> easier to read and maintain.
> 
> Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>
> ---
> Changes in v4:
>  - Reverted more double blank line formatting fixes to make the patch
>    even smaller.

Does not apply to my tree :(
