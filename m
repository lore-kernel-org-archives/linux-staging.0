Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458F1878;
	Sun, 15 Oct 2023 05:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rhLyxXtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4639FC433C8;
	Sun, 15 Oct 2023 05:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697348252;
	bh=cYiN/rDOSxfdgPDehCPj0uNGMsIsA2nH4XQt//rThOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhLyxXtE2YBZQ/6TVBbyph8qQnh9EKQFvL4amq6L6wMvvedNvdj1VFhX2Q1Rw8k3u
	 dPGHtxvdcH6U4pT8iuhtYA1TUNAMclhlqexO9vKOYSHz2zVU/YuUH0WJmLkj3ePn7E
	 QCQhfdv6vB92+YmfhXcABwvLiMa4GXXWmz+hpk8I=
Date: Sun, 15 Oct 2023 07:37:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tty: gdm724x: Add blank line after declaration
Message-ID: <2023101551-placidly-garnish-3ee7@gregkh>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <3b24ca9976cf873dbaadb499e09d7b545e9db89c.1697184167.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b24ca9976cf873dbaadb499e09d7b545e9db89c.1697184167.git.soumya.negi97@gmail.com>

On Fri, Oct 13, 2023 at 01:26:35AM -0700, Soumya Negi wrote:
> Fix WARNING: Missing a blank line after declarations
> Issue found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 1 +
>  1 file changed, 1 insertion(+)

Why do you have "tty:" as the prefix for a staging driver?  Shouldn't it
be "staging: gdm724x: ...."?

thanks,

greg k-h
