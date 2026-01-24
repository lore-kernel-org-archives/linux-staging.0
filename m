Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467DB11713;
	Sat, 24 Jan 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769237469; cv=none; b=ZrhaozaOa3dJIGmOMKuV4JuLZgYnjfafcB6Tw+ILdTEyMxSh29fB16RMHS+5XUs8tCy2VuP86auLRmZix1cPGP1NQlrK0qwG5uEYRigqXMueolhFsqhn6TtcXB6qKnImAdJX4WznYjHNTof252eNXERlsQiSw1+w67m23g2JCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769237469; c=relaxed/simple;
	bh=2Sz7htaqRJxwdqVMFGru65MNZI4mK572pwFH+gf8JQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYLxSNnmjJXEDv+DN2orHmzPkRoxfKyD8o7pg9LfCzEB9gvNUGGl4leV3OSB5MbimilgJk1Ifdc5wKKmlcSXBY0b8iHJmVgWIhhuPanIKLlnBYZWxnOUmXjdVaQ5ysWlNMHLSOu/VO2fUI1UFJKdQM3PiBhWGZH/H3QCBD8UFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MyXky3Lt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MyXky3Lt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E29C116D0;
	Sat, 24 Jan 2026 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769237468;
	bh=2Sz7htaqRJxwdqVMFGru65MNZI4mK572pwFH+gf8JQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyXky3LtqRgy4Y0j5PbI6cq16wYgikQfnZv44c9qX6h1lTknFkJbI9pvuPTHFl9dP
	 /OQFFx8T3+qFMCN9Wd9ThPUCl9hZ6JAsIiNAFrU38FUOyPms/CbYzLnXjqIjiG/Jek
	 TJgA8sF28zGJCqw1M2TMQvd2Pq11TS6Xb8qvVH3w=
Date: Sat, 24 Jan 2026 07:51:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: rtl8723bs: cleanup and indentation
 refactoring
Message-ID: <2026012454-perish-operable-aeba@gregkh>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123211904.64589-1-tehsiu.huang@gmail.com>

On Fri, Jan 23, 2026 at 01:19:02PM -0800, Michael Huang wrote:
> This series improves the code quality and readability of rtw_mlme_ext.c
> in the rtl8723bs driver.
> 
> The first patch refactors several deeply nested loops and if-statements
> by using guard clauses (continue statements). This flattens the logic
> and makes the code easier to follow.
> 
> The second patch addresses various style issues reported by
> checkpatch.pl, including line length exceeding 100 columns,
> unnecessary parentheses, and unnecessary braces.
> 
> Michael Huang (2):
>   staging: rtl8723bs: refactor nested loops to reduce indentation
>   staging: rtl8723bs: fix line length and coding style issues
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 142 ++++++++++--------
>  1 file changed, 80 insertions(+), 62 deletions(-)
> 
> --
> 2.43.0
> 
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
