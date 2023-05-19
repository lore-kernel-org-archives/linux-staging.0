Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07566AA0
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34E6C433EF;
	Fri, 19 May 2023 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1684490810;
	bh=iZQbgI4b1euzepcqqOQZ7Jmmbp+GXtXltd1nebvWE8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJbda/jMh+bmgx9kyhoTnTAn5X0jX0jDhE7Von5bL97Dhac6S3skxKetG3pk5uw1S
	 +/TnEBOc9PSalgtgkIWSvcIphb5t2PY/59loQtDP36tcK1+ldQpfDkeLDkCxCJn6YO
	 n+O/Yf46XcMoNipxajlhUYzj8nrwni+SOWwtYDdU=
Date: Fri, 19 May 2023 11:06:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] [PATCH v2] Staging: rts5208: rtsx: Moved else statement
 to same line with else if
Message-ID: <2023051905-riverside-harmless-177a@gregkh>
References: <20230519100119.25482-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519100119.25482-1-kartikey406@gmail.com>

On Fri, May 19, 2023 at 03:31:19PM +0530, Deepanshu Kartikey wrote:
> Moved else statement to same line with else if,
> this warning was given by checkpatch.pl
> 
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> 
> ...
> Changes in V2:
>     - Moved else to the same line with else if
>     - Moved comment on else statement to inside of it

This needs to go below:

> ---

That line, so that these comments do not end up in the changelog.

thanks,

greg k-h
