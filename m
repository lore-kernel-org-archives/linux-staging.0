Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF7B3CA49D;
	Wed, 18 Mar 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848627; cv=none; b=lpXWa5kq0ZvQpTxNyMFehRM4YUB2rlCNyhIPO7g/ImA6d2NMBycp8oyizyhbq2GqaX1Rrdk2rSi6ACf/JF62F1VsyJviq2oTzB+KKxJQLnbs8uFezSzAT3tjhfBSL8RJmToqj1ZEfnSGuGuckkDuQ9jCA6R1QRytoM0XMbfHqoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848627; c=relaxed/simple;
	bh=pNo7wmhmdw8drISaFW30FdJhazr4mIB/ppWGQ3c5iog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXUxw6KtnSbOi9K42/j8Doaj/eZfu6roIpgVIZ0Iw53AMFqJX4RY5OpJPOViWOCZaca3/B69qcSw3f1PF5Ast/v7pyKjO5KwFkbYD6sNjHu3Ij/FL96eB1gXsd+x0/VEbJIWods9ysPdtaFR++GRIrgegPNbL0lzZB/cnXCA0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DADY7CYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DADY7CYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A39C19421;
	Wed, 18 Mar 2026 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773848626;
	bh=pNo7wmhmdw8drISaFW30FdJhazr4mIB/ppWGQ3c5iog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DADY7CYYb3H/QTm8qjoSFLAbQxD9BlnWZFaYvIA7dvJGRVT5UpSii3DZdCuhkVK/z
	 17x1hppGK9wkZxEB9zesrutsQnOk/0qdafNJeY7rhTveWZw2L7gV3HAXCi1JGesmbW
	 ZufjKQjq4Q7qAzemEcoOB6JPlPGSPQSSe0+ikF7Y=
Date: Wed, 18 Mar 2026 16:43:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joshua Gu <joshuagu789@gmail.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary spaces in
 rtw_security.c
Message-ID: <2026031826-cuddly-unmarked-7532@gregkh>
References: <abcVPgxQfTykOvlQ@ubuntuarm64>
 <DH3OX3CFT586.2HUDPSK7M65AS@gmail.com>
 <abdg69QDD_fwv3Sv@ubuntuarm64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abdg69QDD_fwv3Sv@ubuntuarm64>

On Mon, Mar 16, 2026 at 01:46:19AM +0000, Joshua Gu wrote:

> >From 319ab64bc60820beedaabcd951cc9eb8f8c9bad4 Mon Sep 17 00:00:00 2001
> From: Joshua Gu <joshuagu789@gmail.com>
> Date: Sun, 15 Mar 2026 20:10:48 +0000
> Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary spaces in
>  rtw_security.c
> 
> Fix checkpatch.pl warnings about spaces after casts,
> along with other double spaces.
> 
> Signed-off-by: Joshua Gu <joshuagu789@gmail.com>
> ---
> Changes in v2:
>   - Removed double spaces after assignment operator in rtw_security.c

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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
