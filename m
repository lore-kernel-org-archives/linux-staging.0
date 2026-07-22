Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE742D876F;
	Wed, 22 Jul 2026 05:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698839; cv=none; b=NnR3MRMK7l9mu3zwBLDt0YvBHNCRXj9qT4zrY3wD6Nj8CxtHu7R4iZj9U4ueHfL6BCa7Wy5hYZFNeiMUq3didGv63FoPdTSaQveSiby/Ndgdb+bzalLh29s2B5+J1ngyZN63VXYNiWp3UwVNJa91L7avtOa1pMN4mqmtD1qnRxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698839; c=relaxed/simple;
	bh=OhFfLmlgGo2lBM/5c5/5idbRjJ9TTikqZoPvzSCvKoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adt8HAiUxhnmIj2AA3HCn5tz90g37Yt/fRlHMf9ICUotehMsOtCUdCNtgsJPDeI3AR3zFxbUL6u2PEvfonl+IgctgiFVu8wxSGiP2vJqkcqwkJF5fouGC1iYvhtrB5tGBtWBtUChJd/XEQuHsTijJWZ4hMmtB8tkRYQf519Ym2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rMnZ0wcz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rMnZ0wcz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0351F000E9;
	Wed, 22 Jul 2026 05:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784698837;
	bh=PgPDlv4MgZpSL6aP+K9vEAykUaRvtWAWP4+hHAJHKDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rMnZ0wczTO1O+W2ZDboBe+2WufD+/hN0QrwZx3clmbB2bxqEpOGjr8kfJ3CFKup4c
	 PeKOL+Z5zI2N7HDta/m/lED5IPerSH+qga3G0vofkYkSqt4xhDsy+2xrAGpXrPHc09
	 4a4f3y6Ls/QlBb9unH9EBvHKte8oNR3mrD5DCvss=
Date: Wed, 22 Jul 2026 07:39:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: smart-bee-hub/beezled <smartbeemails@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove consecutive blank lines in
 rtw_security.c
Message-ID: <2026072233-canon-gurgling-0a74@gregkh>
References: <20260721220134.4077913-1-smartbeemails@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721220134.4077913-1-smartbeemails@gmail.com>

On Wed, Jul 22, 2026 at 12:01:34AM +0200, smart-bee-hub/beezled wrote:
> Signed-off-by: smart-bee-hub/beezled <smartbeemails@gmail.com>
> ---


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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

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
