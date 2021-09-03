Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BEF3FC9
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 06:24:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D828C6101A;
	Fri,  3 Sep 2021 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630650257;
	bh=3caTw8aErAHDvCqqOUO8/LF2QbqXz8L5l8hVy/Mn2j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzjGFuQfVJ5FvlhKoTpDUQMi0e34fNZoGTPNI6NtazFf2tIxtWzq/Vj81lcHXJ6k0
	 XSL5ohB+wb6WuBPnSjQVl/Bz+iKKAilRP7oxyOMoK/QWalhBeYTVAfmtEL5lDuRoou
	 1l24AlwmLrltyyQPPEgdjNt37sBCnSAFTXAghA10=
Date: Fri, 3 Sep 2021 08:24:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
Message-ID: <YTG/jv1bZUpDOrh4@kroah.com>
References: <20210902111339.GA577108@panther>
 <YTCU3SpFgyFbxXs3@kroah.com>
 <CAPGkw+z5b52n7rjHH3_LtH5tmt66ZBvqpbiGTj430Ncqv2ZcBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGkw+z5b52n7rjHH3_LtH5tmt66ZBvqpbiGTj430Ncqv2ZcBw@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Sep 02, 2021 at 10:24:47PM +0200, Krish Jain wrote:
> Hi, I use nano. I don't see my editor asking me to wrap the changelog
> text? What exactly can I do to get it properly line wrapped properly?

If you have an editor that is not set up to wrap your lines at 72
columns, then you need to do it "by hand".

thanks,

greg k-h
