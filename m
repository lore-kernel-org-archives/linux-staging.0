Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8852C80
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 10:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16E4C36AEA;
	Thu, 30 Dec 2021 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640861871;
	bh=iFlZ4wt7LI1+4h2aPKyiKIRISOvhlTY1S2WNqNp8KRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i45hnyK2GkEE2R6V3UILQW6XUWgov9qcEv/aeFC0psN2ifwxrfc8GqOZFM4LsqNM6
	 Wh1qEefpgxWfoaODe8xOMSdb+RjUxJqvwZEA4mPJVfpO5HeMxKa7PmlwIwrYmu5cmQ
	 uiO4cfCcWKixYt4WuEBB17c5BvrHNS6lZf7r1Byo=
Date: Thu, 30 Dec 2021 11:57:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: add docs to packet_format and
 tx_start_condition enum
Message-ID: <Yc2QrMecuVQFRcBZ@kroah.com>
References: <20211229094713.GA28795@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229094713.GA28795@localhost.localdomain>

On Wed, Dec 29, 2021 at 10:47:13PM +1300, Paulo Miguel Almeida wrote:
> While pi433 driver deals with the nuances of the different possible
> config combinations, it's hard (at first) to understand the rationale
> for some of the tx/rx-related source code unless you're fairly familiar
> with the rf69's inner workings.
> 
> This patch documents the expected behaviour and limits of both
> packet_format and tx_start_condition enum fields.
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>  drivers/staging/pi433/rf69_enum.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/staging/pi433/rf69_enum.h b/drivers/staging/pi433/rf69_enum.h
> index fbf56fcf5fe8..c902916a063d 100644
> --- a/drivers/staging/pi433/rf69_enum.h
> +++ b/drivers/staging/pi433/rf69_enum.h
> @@ -109,13 +109,32 @@ enum fifo_fill_condition {
>  	always
>  };
>  
> +/*
> + * Defines the packet format used.

What "Defines"?  This is an odd sentence.

> + *
> + * In both modes the length of the payload is limited to 255 bytes if AES
> + * is not enabled or 64 bytes otherwise.

What does this have to do with the format type?

> + */
>  enum packet_format {
> +    /*
> +     * Used when the size of payload is fixed in advance. This mode of
> +     * operation may be of interest to minimize RF overhead by 1 byte as
> +     * no length byte field is required
> +     */
>  	packet_length_fix,
> +    /*
> +     * Used when the size of payload isn't known in advance. It requires the
> +     * transmitter to send the length byte in each packet so the receiver
> +     * would know how to operate properly
> +     */
>  	packet_length_var
>  };
>  
> +/* Defines the condition to start packet transmission */
>  enum tx_start_condition {
> +    /* the number of bytes in the FIFO exceeds FIFO_THRESHOLD */
>  	fifo_level,
> +    /* at least one byte in the FIFO */
>  	fifo_not_empty
>  };

Also, always run your patches through scripts/checkpatch.pl before
sending them out.  I couldn't take this patch for that reason alone :(

thanks,

greg k-h
