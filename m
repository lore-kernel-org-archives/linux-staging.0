Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3229D433E66
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 05:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833072; cv=none; b=UMj6+x/ACr1g7cBps7VXvhg22y+nBf2eR0cCM0YNcG6l7LYUaDRlHqBvogt5LxazLaGNn2wu7vjnVNakuFQad2+gt/W1Jbyr4CINibFfAHxL+PKRDWwhSSoRq8JDlBgMCk3bzGwCz++1XsCM2B8etrRisb9nunEM4SwLoyUW6UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833072; c=relaxed/simple;
	bh=X6qaG0zgev9d1YbzBcdiNlrN9j6KKbKxQhqNydrZ/9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgE01JKn1bvSYCxO+ywubtnYrR3IPv9rgHUICOC5EwYACKUDmZ0ZeobuyYZgc0cWXbDJJQMA10ll206px57uI2y5/tLTXKaV8ifWvuNK4L6G5wjz3cHA48U0RsaSIigV5bU/13brBiEKoSF/ZYX66czewVOffZ+ZnPk44Cn8eVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZmdBkdnn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZmdBkdnn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508121F000FF;
	Thu,  1 Oct 2026 05:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833070;
	bh=muqRK7mpFxL99EPVP5oVZ8BMNdZh1WC38/A+VWyF1wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZmdBkdnnxCKeKhlIXKrvvo3k3aC9ZrzL+yf+tKPFtSHuFbTH7+bWTlLQyxjbF+TdQ
	 yYTRkaSSpPU/tRG5lXYO5U1NBV+YL4cGiIT6ICVlF6syUAglFLpC97XV0Pn3vFPx/l
	 UNu1fSNIgI/8ujrItCvOUF6CuPivDJDwK9zJRQvA=
Date: Thu, 1 Oct 2026 07:37:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?WWnEn2l0?= <ymailnull@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: rtw_cmd.c: convert CamelCase structs
 and callbacks to snake_case
Message-ID: <2026100137-tumble-unpaid-7fc9@gregkh>
References: <CADEyfAnW9Up9sJR_tKw8aGUPZL_9KRrZ1MAwZih0Dgm0M25M4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADEyfAnW9Up9sJR_tKw8aGUPZL_9KRrZ1MAwZih0Dgm0M25M4A@mail.gmail.com>

On Tue, Sep 08, 2026 at 01:02:26PM +0300, Yiğit wrote:
> >From 9b93f99e0d16a43c33369a5f2515925ca265e6dd Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Yi=C4=9Fit?= <ymailnull@gmail.com>
> Date: Tue, 8 Sep 2026 12:42:56 +0300
> Subject: [PATCH] staging: rtl8723bs: rtw_cmd.c: convert CamelCase structs
> and
>  callbacks to snake_case
> 
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
