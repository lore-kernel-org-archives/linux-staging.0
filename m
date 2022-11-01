Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA930322B;
	Tue,  1 Nov 2022 18:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857CFC433C1;
	Tue,  1 Nov 2022 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667325792;
	bh=pxSo9hVqAhSTWjdj5bUbjVfB5nZy/0Gn4TlVQXlbfSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1TUGAXGLccW4U1c0GxDsN4qduMWTHoEtQBNoqYvdGcqeOzj6NZ5i92YzrLtq0NWZN
	 fbi3+uw8GZtkdROg0y9D/MEsw1sbL8ojsuHD0c5yP3XQ+1C/vlwZHCXXB26a+kqDLq
	 vtocC6gKXFJrAEi+PtDzw3o7CmQ8QYZwXPfdxUzk=
Date: Tue, 1 Nov 2022 19:04:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: UMWARI JOVIAL <umwarijovial@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [RESEND PATCH v3] staging: most: dim2: hal: aligning function
 parameters
Message-ID: <Y2FflTSQEdPFCh4H@kroah.com>
References: <20221101105727.GA162791@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101105727.GA162791@rdm>

On Tue, Nov 01, 2022 at 01:57:27PM +0300, UMWARI JOVIAL wrote:
> To improve readability, start the list of
> function parameters on the same line as the function name.

Odd line-wrapping, please fix.

> Issue reported by checkpatch.
> 
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> ---
> 
> Changes in v3:
>     1.Updated the commit message to well explain the  changes made 

What were the changes in v2?

Also, why do you have "RESEND" in the subject line?  This is not a
resend of the v3 patch, it is the first time we have seen it.

thanks,

greg k-h
