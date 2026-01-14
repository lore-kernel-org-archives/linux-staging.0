Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073D278E63;
	Wed, 14 Jan 2026 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403542; cv=none; b=dSmMjXIyZVEoOw+AdqHoMe3CkeQdy4GZqPhPbydKzoPb6dmJ8oJhV9Oe4VdRec4K/c9l06lYq9tIvaHc6jQV6KRnbsfT4+sPguwBoto5vlBlKn5o5wDtxSo8XJ35aeVsvPoaVNT5cnX2e/uxD7eU8Tm80tKd8lhzA1+fo1HEj2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403542; c=relaxed/simple;
	bh=1gTHE0dHRkD/826aCmq9SjaQnA+HJ/a2g5BGSjUc+P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P91f4CWc2mlNRPxPvrusSxeyXacpnkdLM8rT3JLas6sh4ZtuIv5LGjr7crM9G2/6inpuRUymu/D566wfDphk1g+KUm6CKESagfDU87wef/weS2sUnUfetX7Qi8WF/2aQFwfx6kPHH5WnROaCLuRwU7bhNACJOCk2z7x4FQHy9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f1xpCZ5r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f1xpCZ5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51432C19423;
	Wed, 14 Jan 2026 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768403542;
	bh=1gTHE0dHRkD/826aCmq9SjaQnA+HJ/a2g5BGSjUc+P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1xpCZ5rhwb6tI41ZeOzR2BGE7ua3ulxNp9Lp9Y+R2niSqg1mcMEwB9+aYZ/Pfiia
	 6sXunfDohah6/BJDNVDcFvhA45kQw310IXz9lPR0Llt5VUtn7mIHudF/sNAi6qWWiz
	 hUekH1EFPbYXMzu+SbV3vo13Dk3ecEinpqD2wl8g=
Date: Wed, 14 Jan 2026 16:12:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 1/2] staging: axis-fifo: introduce helper functions
 for register access
Message-ID: <2026011408-amaze-brewery-2dc3@gregkh>
References: <20260114132317.2901972-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114132317.2901972-1-s9430939@naver.com>

On Wed, Jan 14, 2026 at 10:23:16PM +0900, Minu Jin wrote:
> This patch introduces axis_fifo_read_reg(), axis_fifo_write_reg()
> to wrap raw ioread32, iowrite32 calls. Using these helper functions
> improves code readability and provides a cleaner abstraction for
> hardware register access.
> 
> All existing single register I/O calls updated to use these
> new helpers. This refactoring also ensures a consistent access
> pattern and makes future maintenance easier.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
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
> -		  XLLF_INT_TPOE_MASK | XLLF_INT_TSE_MASK,
> -		  fifo->base_addr + XLLF_IER_OFFSET);
> -	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);
> +		  XLLF_INT_TPOE_MASK | XLLF_INT_TSE_MASK);
> +	axis_fifo_write_reg(fifo, XLLF_ISR_OFFSET, XLLF_INT_CLEAR_ALL);
>  }
>  
>  /**
> @@ -192,7 +202,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		if (!mutex_trylock(&fifo->read_lock))
>  			return -EAGAIN;
>  
> -		if (!ioread32(fifo->base_addr + XLLF_RDFO_OFFSET)) {
> +		if (!axis_fifo_read_reg(fifo, XLLF_RDFO_OFFSET)) {
>  			ret = -EAGAIN;
>  			goto end_unlock;
>  		}
> @@ -203,7 +213,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		 */
>  		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> -						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> +						       axis_fifo_read_reg(fifo, XLLF_RDFO_OFFSET),
>  						       read_timeout);
>  
>  		if (ret <= 0) {
> @@ -218,7 +228,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		}
>  	}
>  
> -	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
> +	bytes_available = axis_fifo_read_reg(fifo, XLLF_RLR_OFFSET);
>  	words_available = bytes_available / sizeof(u32);
>  	if (!bytes_available) {
>  		dev_err(fifo->dt_device, "received a packet of length 0\n");
> @@ -334,8 +344,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		if (!mutex_trylock(&fifo->write_lock))
>  			return -EAGAIN;
>  
> -		if (words_to_write > ioread32(fifo->base_addr +
> -					      XLLF_TDFV_OFFSET)) {
> +		if (words_to_write > axis_fifo_read_reg(fifo, XLLF_TDFV_OFFSET)) {
>  			ret = -EAGAIN;
>  			goto end_unlock;
>  		}
> @@ -347,7 +356,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		 */
>  		mutex_lock(&fifo->write_lock);
>  		ret = wait_event_interruptible_timeout(fifo->write_queue,
> -						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> +						       axis_fifo_read_reg(fifo, XLLF_TDFV_OFFSET)
>  								>= words_to_write,
>  						       write_timeout);
>  
> @@ -373,7 +382,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
>  
>  	/* write packet size to fifo */
> -	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
> +	axis_fifo_write_reg(fifo, XLLF_TLR_OFFSET, len);
>  
>  	ret = len;
>  	kvfree(txbuf);
> @@ -388,8 +397,8 @@ static irqreturn_t axis_fifo_irq(int irq, void *dw)
>  	struct axis_fifo *fifo = dw;
>  	u32 isr, ier, intr;
>  
> -	ier = ioread32(fifo->base_addr + XLLF_IER_OFFSET);
> -	isr = ioread32(fifo->base_addr + XLLF_ISR_OFFSET);
> +	ier = axis_fifo_read_reg(fifo, XLLF_IER_OFFSET);
> +	isr = axis_fifo_read_reg(fifo, XLLF_ISR_OFFSET);
>  	intr = ier & isr;
>  
>  	if (intr & XLLF_INT_RC_MASK)
> @@ -414,7 +423,7 @@ static irqreturn_t axis_fifo_irq(int irq, void *dw)
>  		dev_err(fifo->dt_device,
>  			"transmit length mismatch error interrupt\n");
>  
> -	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);
> +	axis_fifo_write_reg(fifo, XLLF_ISR_OFFSET, XLLF_INT_CLEAR_ALL);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -464,7 +473,7 @@ static int axis_fifo_debugfs_regs_show(struct seq_file *m, void *p)
>  	struct axis_fifo *fifo = m->private;
>  
>  	for (reg = regs; reg->name; ++reg) {
> -		u32 val = ioread32(fifo->base_addr + reg->offset);
> +		u32 val = axis_fifo_read_reg(fifo, reg->offset);
>  
>  		seq_printf(m, "%*s: 0x%08x\n", AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN,
>  			   reg->name, val);
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
