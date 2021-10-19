Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614FB2C81
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 11:12:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A37F60F22;
	Tue, 19 Oct 2021 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634641952;
	bh=xSLpVhIimaEc2GSO7dKWsRCb7cTgM+8to+JnNVQdntg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCbpwg9xv51+xHWAUCfvWWsXSXpbYzrRFL6ZKdfzd2rPw1739MSmPlPLMPjOdmeU4
	 Egb8kBFl0/KAZgLH1baQtMmuJvfSupUy2WSM01Y2UwE8T3sAsInjF1rN/6GcPrp5RB
	 rTZDprGImIIUMjTONnQgNcGHvfp674UgxbqGWTO8=
Date: Tue, 19 Oct 2021 13:12:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Karolina Drobnik <karolinadrobnik@gmail.com>
Cc: Joe Perches <joe@perches.com>, outreachy-kernel@googlegroups.com,
	forest@alittletooquiet.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Fix line wrapping in rf.c file
Message-ID: <YW6oHsli56urDry6@kroah.com>
References: <20211018150526.9718-1-karolinadrobnik@gmail.com>
 <YW2O3wC8wMEKS3Ub@kroah.com>
 <84f3c940fedb961e6e7e88d47c3d15e598bc32c3.camel@perches.com>
 <810a4e29b0c54520a30cae4d37fde0a59ea3d83b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <810a4e29b0c54520a30cae4d37fde0a59ea3d83b.camel@gmail.com>

On Tue, Oct 19, 2021 at 11:59:56AM +0100, Karolina Drobnik wrote:
> Hi,
> 
> Thank you very much for your comments.
> 
> On Mon, 2021-10-18 at 17:12 +0200, Greg KH wrote:
> > Also, these are all just fine as-is for now.  A better way to make
> > these lines smaller is to use better variable and function names 
> > that are shorter and make sense :)
> 
> I have v2 ready but I'm not sure, given the Joe's patch, if my solution
> is a satisfactory one. I didn't jump on such refactoring as I'm still
> learning about the codebase/process and didn't want to muddle the
> waters (...more than I do already).
> 
> Greg, what would you prefer? Should I back up with my patch, pick
> something else and let Joe's patch be merged?

Joe hasn't submitted it in a format that I can take it in, so that is up
to you, I can't tell you want to work on :)

good luck!

greg k-h
