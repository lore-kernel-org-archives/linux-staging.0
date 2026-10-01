Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8935943B6D4
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 05:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832838; cv=none; b=NQyC4nedkvnSU4Q/lPAo2olain6MXHJv6eFixl5QW/kidJ+QsDudEdubVn+vxuxoOThvBDvZ2Yt0fpPfmiZYjKR36bzg8JutAUOBAU3Ws4jRV/ItJ59rZikswtAgOVGPfcNm7c7DFymOsE+8XcaJdzw3PHO3wk44sfBv0m9+Syo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832838; c=relaxed/simple;
	bh=JScvYSXmKMv17ToQxv97Iy2A0PREkf9zwa24Ywyp/5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQY8Xh/VbDTz89u2IFhPTIj3AwW+3dIifdmKKjiKQ98qV7b5j5nWXLS3E1y+1C+m3EQDsJwQz8qLlmjZ/ZGTcJa29wQ7mJW1M0+NBYRLAjBb5fiWK7Cd70a47DiguzCCNWu60503m9v+Jb0FAscnHl3ccODbKNdGxesg3bZDmyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O9N2aHuY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O9N2aHuY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1521F000FF;
	Thu,  1 Oct 2026 05:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790832837;
	bh=x3TCFUL2ygEJcd6SzkEQDUytLyAN7lgYdYf6EBeALIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O9N2aHuYblMNiCKA6Qbl0cNAMQYQiOE4wJWzVcGr0Mli7DvZlgQ7QwX0jap1mBaAr
	 4vAkC5EG6A5SHUlkXLePemRemK9XCSIfKBYWrKq0q+az6859M/Fsb5L7VXAMaRUdLM
	 upJZFfRiWPo2TJUWdTTUnRVdzjRW6ZjdDRH9l6t4=
Date: Thu, 1 Oct 2026 07:33:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Lavine <matt@matthewlavine.net>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: correct parameter alignment
Message-ID: <2026100129-acrobat-rudder-6bc3@gregkh>
References: <20260912145143.186527-1-matt@matthewlavine.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912145143.186527-1-matt@matthewlavine.net>

On Sat, Sep 12, 2026 at 10:51:26AM -0400, Matthew Lavine wrote:
> Correct parameter alignment in cvmx_pko_send_packet_finish() while
> abiding by the column limit
> 
> This addresses the "Alignment should match open parenthesis" check
> reported by checkpatch.pl
> 
> Signed-off-by: Matthew Lavine <matt@matthewlavine.net>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 9c1968b7e2d1..935ce6495f3b 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -1386,9 +1386,9 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
>  						enum cvmx_pko_lock use_locking)
>  { }
>  
> -static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
> -		u64 queue, union cvmx_pko_command_word0 pko_command,
> -		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
> +static inline enum cvmx_pko_status
> +cvmx_pko_send_packet_finish(u64 port, u64 queue, union cvmx_pko_command_word0 pko_command,
> +			    union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
>  {
>  	return 0;
>  }
> -- 
> 2.55.0
> 
> 

No, this warning can be igured as the function name and structures just
are "too big".

thanks,

greg k-h
