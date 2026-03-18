Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82EE3BB9EF;
	Wed, 18 Mar 2026 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848920; cv=none; b=bL1V5+6fGwM2xNQZL4HLuXukwliiag7NyKMKE5UyE4PIOPk2G/9WSA7/rJH88WYScTHsMvnoVoyUBUcyrvW1n6MGwgXKwoSO49OEt7Vd7yNKm+WibLeK9/0+O92X7JU0IRk8UjKR4McBQ47UvODvyiiOkv7rUAUjHVfYBe92CHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848920; c=relaxed/simple;
	bh=OymBN00gD+0s6H4EtymEOEPVu/hZpmgIkhK28+9ney8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4o8xQQp6rnYQ3tYBAQu8DxLrQS88wgGsx1oVFDDA5duTaXHtMhAvumaMuuC7PQouH/yAFMVlc1KODzZkkvqT6pSoO5eoy57f/N/3WHWs0VpG0DNiE9/AS5y9r9uYYWHrofzLuLiuhxJCpXmqmz7Pc1E5suyWqKkYrzDmoaOfak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fsaQY+EM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fsaQY+EM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C01C19421;
	Wed, 18 Mar 2026 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773848920;
	bh=OymBN00gD+0s6H4EtymEOEPVu/hZpmgIkhK28+9ney8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsaQY+EMvDUY0tawcg54HKjpxA8D1BAU/SSqmtziFIIODlIYEgv5N3b8G/rrGM72F
	 18aZgPC7dsuNb7tfuHrAuWf1Au5wnprIMm9edDmPIi/dMeRYRIkOr4WMOF+ecVmKfO
	 YBtR8E1jC5yHbJdVpk25SeJBXVQ7HSO1FTDDrWZM=
Date: Wed, 18 Mar 2026 16:48:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayan Mahmood <ayanmahmood249@gmail.com>
Cc: ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix line length in rtw_pwrctrl.c
Message-ID: <2026031818-untainted-defraud-883d@gregkh>
References: <20260309233135.10964-1-ayanmahmood249@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309233135.10964-1-ayanmahmood249@gmail.com>

On Mon, Mar 09, 2026 at 11:31:35PM +0000, Ayan Mahmood wrote:
> Refactor lines exceeding 100 characters in rtw_pwrctrl.c to
> comply with kernel coding style as noted in the driver TODO.
> 
> Signed-off-by: Ayan Mahmood <ayanmahmood249@gmail.com>
> ---
> v3:
>  - Move closing ) { to end of the line instead of the next line as suggested by Ethan Tidmore
> v2:
>  - Rebase on staging-testing branch as requested
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
