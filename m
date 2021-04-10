Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F84270
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:30:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA7E761165;
	Sat, 10 Apr 2021 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618039832;
	bh=V2ahhYFun9G88NQxi3nZmo9sLQY6hlpOSG6Jx+hmFsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzO7xqgS1NfRhZiRS1IbnQLcjhMcw7kw4xrwa3qJbrSGXRrkFMqY6W7lRo35IFML/
	 py4srfSdjkBPjl9euQbrFv6wzMNg7wJIB3cZ7BNXpNnNiuJh+tiSLf35HD6gSQKUPT
	 tYQg5nIXBLvoW1vAOup968WyrrFcRTK+joWQaXZY=
Date: Sat, 10 Apr 2021 09:30:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [Resend Patch 0/3] staging: rtl8723bs:
 Patchset for rtl8723bs
Message-ID: <YHFUFJ9S1ezqwPe9@kroah.com>
References: <3311077.CXPNp9SFPB@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3311077.CXPNp9SFPB@localhost.localdomain>

On Fri, Apr 09, 2021 at 06:39:31PM +0200, Fabio M. De Francesco wrote:
> This patch series removes camelcase, changes the type and use of a 
> variable, and correct misspelled words.
> 
> Patch 1/3: staging: rtl8723bs: Remove camelcase in several files

<snip>

I've again, dropped all patches from you from my queue.  Please resend
everything in the proper format so that I can know what to review and
what order to apply them in.

thanks,

greg k-h
