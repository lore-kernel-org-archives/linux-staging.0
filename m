Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2DF17AB8
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 12:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD22C433C9;
	Wed,  9 Aug 2023 12:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691583868;
	bh=RWBM/7u/Y6B3ImXjjtu9fLXip7UdWbgFzjOKNj6psf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R077qVQ8N36/m2Uf60uAGnaCT7f70A8CaZ0QdA85SZCC9KMDRTaGgBxaS1MZGkbuL
	 p5HlSKUVxBVYfESLdPz5N29bNWI6LGkEdo4TNig/SlrahlIi0w78cl4DEGbGsG7VDI
	 rbuf2YJ510WXebJyQqJ4f5FvZLtgvMjE9akIa3Hw=
Date: Wed, 9 Aug 2023 14:24:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: fix alignment of open parenthesis
 and deleted trailing spaces
Message-ID: <2023080902-cattle-disparate-6b82@gregkh>
References: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>

On Tue, Aug 08, 2023 at 10:59:40AM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Alignment should match open parenthesis
> and deleted the trailing whitespaces as reported by
> checkpatch to adhere to the Linux kernel coding-style
> guidelines.
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> ---
> 
> Changes in v3:
> - Rebased against staging.git and staging-next branch, noted by Greg KH

I don't think you did this as it still fails to apply for me :(

Can you go through the exact steps and try again?

thanks,

greg k-h
