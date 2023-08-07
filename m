Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3DFC15
	for <linux-staging@lists.linux.dev>; Mon,  7 Aug 2023 15:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB24C433C7;
	Mon,  7 Aug 2023 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691421972;
	bh=fqUuoBJCLCaWtjsfkRUPNSG8YF8xLnqGYw03JAiy+g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmcfMmf8om5sN6Swzz80F5I8nqef8JzZIhk7oza6Rbpq29OBYP8doQu7TaQXkwtj/
	 8CBrfW4hmlc7igg3N05EBz4Ghhfp8phBMClogYqwceDXdv/pIKU8qx2wd0yVWc1AGG
	 y4KTOHAV/DCSFBWsVDZlNgbOMAY7ZwoJqDLaodbk=
Date: Mon, 7 Aug 2023 17:26:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <2023080746-consonant-employed-030d@gregkh>
References: <ZM1rsu0M22HHtjfl@alolivei-thinkpadt480s.gru.csb>
 <2023080510-vacation-support-7afe@gregkh>
 <ZNEKJH3mEoOwV6eF@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNEKJH3mEoOwV6eF@alolivei-thinkpadt480s.gru.csb>

On Mon, Aug 07, 2023 at 12:13:40PM -0300, Alexon Oliveira wrote:
> On Sat, Aug 05, 2023 at 08:14:33AM +0200, Greg KH wrote:
> > On Fri, Aug 04, 2023 at 06:20:50PM -0300, Alexon Oliveira wrote:
> > > Fixed all CHECK: Alignment should match open parenthesis
> > > as reported by checkpatch to adhere to the Linux kernel
> > > coding-style guidelines.
> > 
> > This does not describe the changes you actually made in this patch :(
> > 
> Hi Greg,
> 
> Thank you for your feedback. Don't get me wrong, please, I'm just trying
> to understand it now, but honestly I don't know what is wrong with
> it this time. I described exactly what I did in the code: ran the
> checkpatch, which identified a lot of "CHECK: Alignment should match
> open parenthesis" messages, fixed them all according to the coding-style
> guidelines and comitted it.

But you did not change the alignment of the open parenthesis, right?
You deleted the trailing whitespace.

> 
> This is the same thing I did previously for the file
> drivers/staging/vme_user/vme_bridge.h in the commit
> 7d5ce25fb4c3cc91d16e27163dc141de0eba213b, but now is the file
> drivers/staging/vme_user/vme.c and commit
> a1f0b0a8ba9a496504c2e3d4b37cee388e78f0ea. Different files,
> different commits, similar fixes for the same warnings,
> and same description.
> 
> The only thing I found strange is because instead of starting a new
> email thread it ended up in the same email thread as the previous
> patch. Would that be the problem?

That would be a problem, and it seems you used the same subject line as
previous patches that were different?

Anyway, my comment was about the trailing whitespace change.

thanks,

greg k-h
