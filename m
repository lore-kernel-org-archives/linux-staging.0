Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D7C15CC
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 12:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00812C433C1;
	Thu, 17 Nov 2022 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668689696;
	bh=/W7ORfPPE7zeYmKBjDaQfbuKt0and2UyiFiMkLGVGuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzrURmewnPxmkdCaTET97qa0Ng3E/qd39BLCotcA/X5Iv+prRsgGh3rPb/PhvWIFe
	 A85x0qsXyN2mAkxDzSoNAGpVEplUhLatFkl+cfUsBo7srz53+fMpY8OTO6yDx9sQrs
	 +8BHb6CE/94z95xrtAWLgTDpc6mAZq7ZYWBnZGRY=
Date: Thu, 17 Nov 2022 13:54:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y3YvGdkyGm7azGg4@kroah.com>
References: <Y3YKhee8L+kAfHM4@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3YKhee8L+kAfHM4@qemulion>

On Thu, Nov 17, 2022 at 03:48:45PM +0530, Deepak R Varma wrote:
> The code currently uses C90 standard extension based zero length arrays.
> The zero length array member also happens to be the only member of the
> structs. Such zero length array declarations are deprecated and the
> new C99 standard extension of flexible array declarations are to be
> used instead.
> 
> The DECLARE_FLEX_ARRAY() helper allows for a flexible array member as
> the only member in a structure. Refer to these links [1], [2] for
> details.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://lkml.kernel.org/r/YxKY6O2hmdwNh8r8@work
> 
> Issue identified using Coccinelle.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Notes:
>    1. Proposed change is compile tested only.
>    2. Solution feedback from gustavoars@kernel.org
> 
> 
>  drivers/staging/wlan-ng/hfa384x.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
> index 0611e37df6ac..3a1edcb43e07 100644
> --- a/drivers/staging/wlan-ng/hfa384x.h
> +++ b/drivers/staging/wlan-ng/hfa384x.h
> @@ -960,15 +960,15 @@ struct hfa384x_pdr_nicid {
>  } __packed;
> 
>  struct hfa384x_pdr_refdac_measurements {
> -	u16 value[0];
> +	DECLARE_FLEX_ARRAY(u16, value);
>  } __packed;

Why?  This structure is never used anywhere, right?  So why is this
needed to be changed and not just removed entirely?  Same for the other
structures in this patch.

thanks,

greg k-h
