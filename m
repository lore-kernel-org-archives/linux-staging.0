Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03296631;
	Tue,  1 Nov 2022 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Od/uiMYSX3xApsTiRyOIA9wZRUzo3nbEDUya5/r31Rg=;
  b=eMffM7TbSdYwhftrA1QNx0mKcRQwJeBhb1bEDqGZyW9oDHCqklF7SEWS
   3aWqE2eeqFXdVBAMZGrpRM1JMVmpUWyyayIMPTB54OW381SZpmxrq4Y7Z
   bVbWgZqaxRtdgYHWe15pBlxDpoF++slB0mvZq9PNfzJKDP/cHgh0IV77n
   Y=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,230,1661810400"; 
   d="scan'208";a="36158278"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 09:39:54 +0100
Date: Tue, 1 Nov 2022 09:39:52 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: UMWARI JOVIAL <umwarijovial@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [RESEND PATCH v2] staging: most: dim2: hal: aligning function
 parameters
In-Reply-To: <20221101080006.GA63438@rdm>
Message-ID: <alpine.DEB.2.22.394.2211010938240.2834@hadrien>
References: <20221101080006.GA63438@rdm>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 1 Nov 2022, UMWARI JOVIAL wrote:

> According to Linux Kernel Coding Style, lines should not end with a '('
> Fix-issue reported by checkpatch.pl script.

How about something like "To improve readability, start the list of
function parameters on the same line as the function name.  Issue reported
by checkpatch."

That would more clearly explain the intent behind the change.

julia


>
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> ---
>
> Changes in v2:
>     1.Resending this patch because it was sent multiple times earlier.No
>       functional changes.
>
>  drivers/staging/most/dim2/hal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
> index a5d40b5b138a..6abe3ab2b2cf 100644
> --- a/drivers/staging/most/dim2/hal.c
> +++ b/drivers/staging/most/dim2/hal.c
> @@ -346,9 +346,8 @@ static void dim2_clear_ctram(void)
>  		dim2_clear_ctr(ctr_addr);
>  }
>
> -static void dim2_configure_channel(
> -	u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address, u16 hw_buffer_size,
> -	u16 packet_length)
> +static void dim2_configure_channel(u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address,
> +				   u16 hw_buffer_size, u16 packet_length)
>  {
>  	dim2_configure_cdt(ch_addr, dbr_address, hw_buffer_size, packet_length);
>  	dim2_configure_cat(MLB_CAT, ch_addr, type, is_tx ? 1 : 0);
> --
> 2.25.1
>
>
>
