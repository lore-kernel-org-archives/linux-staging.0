Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216A78F3A;
	Sun, 26 Apr 2026 04:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177229; cv=none; b=bEJq80gW8MLkT/QDD3HVmo1JH+g7JGdm4DoF8sTfndoypnvALh7FiFnv6G+L60Cj8ax12h0egeSZrMpyQ70mqzuamXWuM7T8KTaBM2X2p5upSXtDAjbFknXIVKgVhBtjieWPleizty4fYoGkHfiG8xBmbwZDsFehEm2HUXzcDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177229; c=relaxed/simple;
	bh=H+ykyU11RnlL+BaKyrN72OKJCYwo7GdSK6UCYokl0UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vt4Wt0RHi789cob0SvElOUpgubkZBboMu0kn/0SuqUzJd27S9jJUOk+xCDtFIFRbD1ZxPkKfjAPcbNARTQPpoUkPHC3WH7r2xfrTMmv+KqZtfISUgTstoQ5/RwxnyUYLHgVljpPlHYL9wKJXzzd2KuMGcpQO7vybuxEcMcFCRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=de4305b2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="de4305b2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3103C2BCAF;
	Sun, 26 Apr 2026 04:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777177229;
	bh=H+ykyU11RnlL+BaKyrN72OKJCYwo7GdSK6UCYokl0UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=de4305b2f5s1/BbcTBMJJPdMHkYY40DVnrXM9NQYgFG0IgUKrhLgclZvTCq2KVMLL
	 vhZ/1BBSoSFaQQ7We6FSnwHenLnJmr3INaAVxubqAIJ3/gH46wBMwU6ej6QF18HpsG
	 3dLUlgLEaEn3l5diart7voqfDs977fZRKTPuLFUs=
Date: Sun, 26 Apr 2026 06:19:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernelcoredev <sonionwhat@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix coding style issues in mmu_public.h
Message-ID: <2026042624-crawling-active-c4ef@gregkh>
References: <20260426031047.5525-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426031047.5525-1-sonionwhat@gmail.com>

On Sat, Apr 25, 2026 at 11:10:46PM -0400, kernelcoredev wrote:
> Fix several checkpatch.pl warnings:
> - remove leading spaces
> - fix block comment style
> - avoid open-ended lines
> - remove unnecessary return in void function
> 
> No functional changes.
> 
> Signed-off-by: kernelcoredev <sonionwhat@gmail.com>
> ---
>  .../hive_isp_css_include/host/mmu_public.h    | 94 +++++++++----------
>  1 file changed, 44 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
> index 1a435a348..58b1af384 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
> @@ -11,72 +11,66 @@
>  #include "device_access.h"
>  #include "assert_support.h"
>  
> -/*! Set the page table base index of MMU[ID]
> -
> - \param	ID[in]				MMU identifier
> - \param	base_index[in]		page table base index
> -
> - \return none, MMU[ID].page_table_base_index = base_index
> +/* Set the page table base index of MMU[ID]
> + *
> + * \param	ID[in]				MMU identifier
> + * \param	base_index[in]		page table base index
> + *
> + * \return none, MMU[ID].page_table_base_index = base_index
>   */
> -void mmu_set_page_table_base_index(
> -    const mmu_ID_t		ID,
> -    const hrt_data		base_index);
> -
> -/*! Get the page table base index of MMU[ID]
> -
> - \param	ID[in]				MMU identifier
> - \param	base_index[in]		page table base index
> -
> - \return MMU[ID].page_table_base_index
> +void mmu_set_page_table_base_index(const mmu_ID_t		ID,
> +				   const hrt_data	base_index);
> +
> +/* Get the page table base index of MMU[ID]
> + *
> + * \param	ID[in]				MMU identifier
> + * \param	base_index[in]		page table base index
> + *
> + * \return MMU[ID].page_table_base_index
>   */
> -hrt_data mmu_get_page_table_base_index(
> -    const mmu_ID_t		ID);
> -
> -/*! Invalidate the page table cache of MMU[ID]
> +hrt_data mmu_get_page_table_base_index(const mmu_ID_t		ID);
>  
> - \param	ID[in]				MMU identifier
> -
> - \return none
> +/* Invalidate the page table cache of MMU[ID]
> + *
> + * \param	ID[in]				MMU identifier
> + *
> + * \return none
>   */
> -void mmu_invalidate_cache(
> -    const mmu_ID_t		ID);
> -
> -/*! Invalidate the page table cache of all MMUs
> +void mmu_invalidate_cache(const mmu_ID_t		ID);
>  
> - \return none
> +/* Invalidate the page table cache of all MMUs
> + *
> + * \return none
>   */
>  void mmu_invalidate_cache_all(void);
>  
> -/*! Write to a control register of MMU[ID]
> -
> - \param	ID[in]				MMU identifier
> - \param	reg[in]				register index
> - \param value[in]			The data to be written
> -
> - \return none, MMU[ID].ctrl[reg] = value
> +/* Write to a control register of MMU[ID]
> + *
> + * \param	ID[in]				MMU identifier
> + * \param	reg[in]				register index
> + * \param value[in]			The data to be written
> + *
> + * \return none, MMU[ID].ctrl[reg] = value
>   */
> -static inline void mmu_reg_store(
> -    const mmu_ID_t		ID,
> -    const unsigned int	reg,
> -    const hrt_data		value)
> +static inline void mmu_reg_store(const mmu_ID_t		ID,
> +				 const unsigned int	reg,
> +				 const hrt_data		value)
>  {
>  	assert(ID < N_MMU_ID);
>  	assert(MMU_BASE[ID] != (hrt_address) - 1);
>  	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
> -	return;
>  }
>  
> -/*! Read from a control register of MMU[ID]
> -
> - \param	ID[in]				MMU identifier
> - \param	reg[in]				register index
> - \param value[in]			The data to be written
> -
> - \return MMU[ID].ctrl[reg]
> +/* Read from a control register of MMU[ID]
> + *
> + * \param	ID[in]				MMU identifier
> + * \param	reg[in]				register index
> + * \param value[in]			The data to be written
> + *
> + * \return MMU[ID].ctrl[reg]
>   */
> -static inline hrt_data mmu_reg_load(
> -    const mmu_ID_t		ID,
> -    const unsigned int	reg)
> +static inline hrt_data mmu_reg_load(const mmu_ID_t		ID,
> +				    const unsigned int	reg)
>  {
>  	assert(ID < N_MMU_ID);
>  	assert(MMU_BASE[ID] != (hrt_address) - 1);
> -- 
> 2.53.0
> 
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
