Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CFA28F3;
	Sat, 22 Oct 2022 08:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DBDC433D6;
	Sat, 22 Oct 2022 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426675;
	bh=2IttxcLGWc+O47/1IG98GeNBi9r6TX1bfB4B0SGcXTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RlruUxNcbtrBLE2zQBq8xYdVF//NBksK5U/1O4Cfg/Cx+ZnPgqNai1PLgLP8tqzQx
	 usZ0yBwkKgB4ijE5sv5JwevUIDEBJfZN2XYz1mVoArWzgguuZfSGNzzFqc1DxMVTbY
	 8x75+/tOWVEb3rGgGf+DhxsgcM3XBM/+cpIdDb+0=
Date: Sat, 22 Oct 2022 10:14:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 4/6] staging: vt6655: refactor long lines of code in
 s_vGenerateTxParameter
Message-ID: <Y1OmXf0Zn2eTo8us@kroah.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-5-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022070612.13009-5-tanjubrunostar0@gmail.com>

On Sat, Oct 22, 2022 at 07:06:10AM +0000, Tanjuate Brunostar wrote:
> fix checkpatch errors by refactoring long lines of code in the function: s_vGenerateTxParameter
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 67 ++++++++++++++++++++++++-----------
>  1 file changed, 46 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index dc853b83459b..951d4172e9f2 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -839,7 +839,8 @@ s_vFillCTSHead(struct vnt_private *pDevice,
>  	}
>  
>  	if (byPktType == PK_TYPE_11GB || byPktType == PK_TYPE_11GA) {
> -		if (byFBOption != AUTO_FB_NONE && uDMAIdx != TYPE_ATIMDMA && uDMAIdx != TYPE_BEACONDMA) {
> +		if (byFBOption != AUTO_FB_NONE && uDMAIdx !=
> +		    TYPE_ATIMDMA && uDMAIdx != TYPE_BEACONDMA) {

Don't break lines like this, this is now much harder to read.

It should look like:
		if (byFBOption != AUTO_FB_NONE &&
		    uDMAIdx != TYPE_ATIMDMA &&
		    uDMAIdx != TYPE_BEACONDMA) {

If you want to make it more readable, right?

And that is the main point here, the coding style is to make it readable
to us humans, the compiler doesn't care.

Your change makes the logic harder to understand, not easier, which is a
step backwards.

We write code for developers first (as we have to maintain it), and the
compiler second.

thanks,

greg k-h
