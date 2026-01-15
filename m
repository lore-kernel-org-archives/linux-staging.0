Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB937419E;
	Thu, 15 Jan 2026 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476245; cv=none; b=nn8FL2VDZ+5mw7GKgyRq0Y5io4GwdYPkr5AvO9SC9dKB5xKiebN9Er+O7HOz5Vnd+FmuZR1YWoF+Ej0plVXiIkMv3pjIh8N8YDuUjxvlVDgf/JJW/reeE5uLZjkM3hsMgknvj4uhYHYsyBdFm+AuqCcYWsj5QWsIH/+jy5yW61U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476245; c=relaxed/simple;
	bh=HKhcGg/5uj50Q0QRaMyaob9nzdcDvwjhf304AUGenqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQMXjREtnheND4R+s8eTwU1wd6ZIlMCeA3XCmm1/Ns+LIuAu+VLmiTU+F2RbXm0lvjf8HIKuXioq4u1yb1+8edPN10wA+RYwxF2IT6MYgzzEqGFWPGUccjtiF7Er62iQjevATHuVYwuQ5gcE61edhu9FIq+tYyjCs9Ufymp2iGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Oigf4mU0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Oigf4mU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78DFC116D0;
	Thu, 15 Jan 2026 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768476243;
	bh=HKhcGg/5uj50Q0QRaMyaob9nzdcDvwjhf304AUGenqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oigf4mU0ScU45tZmzovKG3avd1z8CHcmAZ2TXXUjjiEW5cyj5XvnU5lUrSMFG5QDY
	 ozf4lJcOR7oX/vnOmsg9NJCAQ8GHk+cVQ/x+Qk3WUl4DgH9tN4pifDRxybYixY2myt
	 42FoT7iubQbYHgWqMQWVkus8Uwj0kRVTJzSPUDJw=
Date: Thu, 15 Jan 2026 12:24:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 1/2] staging: axis-fifo: introduce helper functions
 for register access
Message-ID: <2026011507-sierra-armhole-95be@gregkh>
References: <20260115022509.3038062-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115022509.3038062-1-s9430939@naver.com>

On Thu, Jan 15, 2026 at 11:25:08AM +0900, Minu Jin wrote:
> This patch introduces axis_fifo_read_reg(), axis_fifo_write_reg()
> to wrap raw ioread32, iowrite32 calls. Using these helper functions
> improves code readability and provides a cleaner abstraction for
> hardware register access.

Not really.  Normally wrapper functions are not a good idea, why are
they needed here?  What is asking for this change?

> All existing single register I/O calls updated to use these
> new helpers. This refactoring also ensures a consistent access
> pattern and makes future maintenance easier.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> v2: No changes.
> 
>  drivers/staging/axis-fifo/axis-fifo.c | 45 ++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 509d620d6ce7..525156583c4a 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -145,16 +145,26 @@ struct axis_fifo_debug_reg {
>   * ----------------------------
>   */
>  
> +static inline u32 axis_fifo_read_reg(struct axis_fifo *fifo, int offset)
> +{
> +	return ioread32(fifo->base_addr + offset);
> +}
> +
> +static inline void axis_fifo_write_reg(struct axis_fifo *fifo, int offset, u32 val)
> +{
> +	iowrite32(val, fifo->base_addr + offset);
> +}
> +
>  static void reset_ip_core(struct axis_fifo *fifo)
>  {
> -	iowrite32(XLLF_SRR_RESET_MASK, fifo->base_addr + XLLF_SRR_OFFSET);
> -	iowrite32(XLLF_TDFR_RESET_MASK, fifo->base_addr + XLLF_TDFR_OFFSET);
> -	iowrite32(XLLF_RDFR_RESET_MASK, fifo->base_addr + XLLF_RDFR_OFFSET);
> -	iowrite32(XLLF_INT_TC_MASK | XLLF_INT_RC_MASK | XLLF_INT_RPURE_MASK |
> +	axis_fifo_write_reg(fifo, XLLF_SRR_OFFSET, XLLF_SRR_RESET_MASK);
> +	axis_fifo_write_reg(fifo, XLLF_TDFR_OFFSET, XLLF_TDFR_RESET_MASK);
> +	axis_fifo_write_reg(fifo, XLLF_RDFR_OFFSET, XLLF_RDFR_RESET_MASK);
> +	axis_fifo_write_reg(fifo, XLLF_IER_OFFSET, XLLF_INT_TC_MASK |
> +			XLLF_INT_RC_MASK | XLLF_INT_RPURE_MASK |
>  		  XLLF_INT_RPORE_MASK | XLLF_INT_RPUE_MASK |

Odd indentation :(

I don't really see the need for this change, sorry.  When reading code,
it's much simpler to see iowrite32() and know what is happening instead
of having to go look up axis_fifo_write_reg() and determine that "hey,
that's just a wrapper for iowrite32()".

thanks,

greg k-h
