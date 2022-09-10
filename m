Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AD1A40
	for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 05:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0919C433C1;
	Sat, 10 Sep 2022 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662788190;
	bh=MhHDDT4ENasb4odd4tIu3aDa2mJibAA7zIz/n+Uw8jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MjetwlTdcEyI5RXHv8u2aFGo8yYC3YdTOH0B7zHnAu4O6FYVgotJzICM7KrwwXHxV
	 WOcUW7xhSdsBDHW0gZE1e6mJkB4nnNccF/guIhdGAXqAYIWZn33e2PV9dib0SquTtw
	 pGrIgy3T/5oYBW2vaiyO7+Md2j65UacLf8/f9gxM=
Date: Sat, 10 Sep 2022 07:36:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Burak Ozdemir <bozdemir@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: Fix string form declaration
Message-ID: <YxwidHdwPz2yUAP4@kroah.com>
References: <631b5aa8.170a0220.9378b.124a@mx.google.com>
 <YxuASm/KA6iFrKu4@kroah.com>
 <CACAQkfXH4smoY2v28DOZ_0uf_2=e8iEDSFbEbTMhU0JPuteOPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACAQkfXH4smoY2v28DOZ_0uf_2=e8iEDSFbEbTMhU0JPuteOPw@mail.gmail.com>

On Fri, Sep 09, 2022 at 10:50:57PM +0000, Burak Ozdemir wrote:
> I have been  analyzing todo tasks from `Kernel Janitors Projects` and saw
> the following task
> 
> From: Jeff Garzik
> 
> 1) The string form
>         [const] char *foo = "blah";
> creates two variables in the final assembly output, a static string, and a
> char pointer to the static string. The alternate string form
>         [const] char foo[] = "blah";
> is better because it declares a single variable.
> 
> That's why I changed that char * to static const[].

I'm sorry, but I have no context here at all for what this is in
response to.

Remember, some of us get hundreds of changes each day to review, and we
have the short-term memory of a squirrel.  Always include proper context
in an email message so that we know what is going on.

thanks,

greg k-h
