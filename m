Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EF569D;
	Thu, 16 Mar 2023 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678983329; bh=dO+ZMH6qjgplEx6nSU5n6rmwyk4FtUwjUTO3YAmYrSA=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=czetI19z036f9xoHox+85+Sns5BVqVEzyRoOQTDHsTw/LJ9qWoyXJBd86kyFqVKAn
	 6D5RIFHg+KuQMfbPEWMoo5IXG9Nva0ZLSc46lf9KVKABEKysEbnNcnzVU+2IagKgZN
	 gnoG3BT+5HqHer8nIcIYOJgtyPdXo27vQEtpksQM=
Received: by b221-4.in.mailobj.net [192.168.90.24] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Thu, 16 Mar 2023 17:15:24 +0100 (CET)
X-EA-Auth: eRMUx2J/pwtZS8PYOuWWYXRGDO+tJA8apJU774lQkFdOLH758ShCUPWz7omWuQwUyvXilBYISUqp5dyavZ64mtV+N6K/AeKh
Date: Thu, 16 Mar 2023 21:45:13 +0530
From: Deepak R Varma <drv@mailo.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] Staging: octeon: Fix line ending with '('
Message-ID: <ZBNAkYSO3ARPbjKU@ubun2204.myguest.virtualbox.org>
References: <20230316155202.GA82100@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316155202.GA82100@sumitra.com>

On Thu, Mar 16, 2023 at 08:52:02AM -0700, Sumitra Sharma wrote:
> Adhere to coding-style.

Hi Sumitra,
Quick background: Linux Kernel coding style required developers to limit the
code within 80 columns per line. This resulted in splitting the long lines into
more than one lines. Some splits were unwillingly poor causing checkpatch error
[e.g. this one that you are attempting to address].
Recently, the 80 column limit was relaxed to 100 columns. This now will allow to
merge some poorly split lines resulting in improved readability and avoid
checkpath complaints.

Now, can you use this information to convert your live above a little more
descriptive. Remember a well written "why" explanation is almost always
necessary.

> 
> Checkpatch has reported code style warning:
> CHECK: Lines should not end with a '('.
> 
> Enhance the design of a function header:
> Align the function parameters immediately after '(' in a single line.

This is the "what" part and not so useful for such a simple change. You need not
write this. However for complex changes or tricky code optimization, the "what"
part will be very useful as well.

Hope this helps.

Deepak.

> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
> 
> v2: Change patch subject and description.
> 
>  drivers/staging/octeon/octeon-stubs.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 7a02e59e283f..3e7b92cd2e35 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -1372,9 +1372,7 @@ static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
>  						  int32_t value)
>  { }
>  
> -static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(
> -	int interface,
> -	int port)
> +static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
>  {
>  	union cvmx_gmxx_rxx_rx_inbnd r;
>  
> -- 
> 2.25.1
> 
> 


