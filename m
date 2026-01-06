Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A61431ED6E
	for <linux-staging@lists.linux.dev>; Tue,  6 Jan 2026 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767694832; cv=none; b=MhNI9WaIa42Fn+XPRy+6N74by2uEW3E/rcKe4AUT28TxFFd1gV5W/ghtaI6ETtai9Y74CAWQvx5hpB0/9yOwF77d0kvY4l8ukA/Njm6pNMSfbQlVTFtinSJpCIJhnVpREP58CaLRr9ljFOZfVzyVg/2yXxSlpvs+6B0IDa2TqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767694832; c=relaxed/simple;
	bh=wtaej4ShWrzd5fPl106kxs/kaXocm7BIU/s7qpKDE6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIJp5u3VD5IvH4c4X4mdc7CzTHCF5UHQJwEBWqiv+oYN8OueGTSChyH1y5FtkcixWAxzmrp+PKRgiDTxq7HH0r9BTD+LUZKR7cSCiHSxbHDeNL+ej3FlQ4oPZMLECYoHbhPB+SX0Wk9pvRvEM29l5woN0CQmkJqAZbGOsbdrE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aOVKb7Ze; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aOVKb7Ze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E6EC16AAE;
	Tue,  6 Jan 2026 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767694831;
	bh=wtaej4ShWrzd5fPl106kxs/kaXocm7BIU/s7qpKDE6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOVKb7ZejjeFEMcnmEU182GaDfE80thLWKj8bzhcSI3HHVqd3WuiQLnWqzVktzNw/
	 TlBJ6fw+Ml43uafqeftjd0Xe3NNa14V1hGynYSTrArWInPlB0Hq+H1INGCxeJ6zGLD
	 labWOk0lppstdArnoVQB6YxFbLVOC0fsNXnG3U6c=
Date: Tue, 6 Jan 2026 11:20:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: MottiKumar <mottikumarbabu@gmail.com>
Cc: linux-staging@lists.linux.dev, lkp@intel.com
Subject: Re: [PATCH v2] staging: sm750fb: fix const array warning for fix_id
Message-ID: <2026010610-thesaurus-reoccur-ee6c@gregkh>
References: <202512311146.XB8ZVrTY-lkp@intel.com>
 <20251231084130.364502-1-mottikumarbabu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231084130.364502-1-mottikumarbabu@gmail.com>

On Wed, Dec 31, 2025 at 02:11:30PM +0530, MottiKumar wrote:
> This is version 2 of the patch. The previous version incorrectly
> modified the g_fbmode array, which caused a build failure because
> that array is modified at runtime.
> 
> This version leaves g_fbmode alone and instead applies the const
> fix to the fix_id array, which is a read-only lookup table.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512311146.XB8ZVrTY-lkp@intel.com/
> 
> Signed-off-by: MottiKumar <mottikumarbabu@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
