Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6113639
	for <linux-staging@lists.linux.dev>; Tue,  8 Aug 2023 04:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDCAC433C8;
	Tue,  8 Aug 2023 04:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691469190;
	bh=aVU8DNBygGUkAgJG5ohqB3i06dXOaJN6KaaWsGZkqqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/2DJAWXTNTx/vK1DWSGRVqp+svgeR1oHQKYIiqvLBGm0fa9jPwoitYvw13rK1TAQ
	 Umv38JjLMF/X+Aix0CUN9Xm7lMZBLHye7zyGCeP4Nqkgxaf6yeHvJbCjuydhZH32eu
	 J/xpVY977iqkq5WhB33aJS9+EOjg5wjPzNqOkfis=
Date: Tue, 8 Aug 2023 06:33:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vme_user: fix alignment of open parenthesis
 and deleted trailing spaces
Message-ID: <2023080840-passenger-sierra-55ef@gregkh>
References: <ZNFXMrtqSWvZv+rl@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNFXMrtqSWvZv+rl@alolivei-thinkpadt480s.gru.csb>

On Mon, Aug 07, 2023 at 05:42:26PM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Alignment should match open parenthesis
> and deleted the trailing whitespaces as reported by
> checkpatch to adhere to the Linux kernel coding-style
> guidelines.
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> ---
> 
> Changes in v2:
> - Fixed changelog, noted by Greg KH
> 
>  drivers/staging/vme_user/vme.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 977c81e2f3c7..741593d75a63 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -563,7 +563,7 @@ EXPORT_SYMBOL(vme_master_request);
>   *         returned.
>   */
>  int vme_master_set(struct vme_resource *resource, int enabled,
> -		   unsigned long long vme_base, unsigned long long size, 
> +		   unsigned long long vme_base, unsigned long long size,
>  		   u32 aspace, u32 cycle, u32 dwidth)

I think the confusion here is that my tree does NOT look like your tree
at all right now.  If I try to apply this patch, I get:

	checking file drivers/staging/vme_user/vme.c
	Hunk #1 FAILED at 563.
	Hunk #2 FAILED at 614.
	Hunk #3 FAILED at 1045.
	Hunk #4 FAILED at 1841.
	4 out of 4 hunks FAILED

So please, rebase your tree against my staging.git on git.kernel.org
tree, the staging-next branch, and then resend the patches from that.

thanks,

greg k-h
