Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5955D2568;
	Thu, 27 Oct 2022 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EDCC433C1;
	Thu, 27 Oct 2022 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666882229;
	bh=n1rJZlFMT8eg/kIkV0yjijV6324185bQ0NxuEcnFO58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5WR9aZymhyAVL6W+ByZudBrmFRBeFjLXgLF/5/EtKXkFjR8Gy/65qQgTCQnr6jgG
	 eV0d5dDeWq9jUho9jO5UdAprMJc/JP/AP0LObIGJE32N/Hkn1q7o8rBO2JqyBI2u0I
	 ZGY0+vz7MxX1o37LtvMIrWPBr7R+5HVq1Q9Gqd1I=
Date: Thu, 27 Oct 2022 16:50:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanju Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v5 2/6] staging: vt6655: refactor code in
 s_uGetRTSCTSDuration
Message-ID: <Y1qaskO7AN7nqc9R@kroah.com>
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
 <0e6a307052d3a354a850a502e509f46baccdbe1e.1666849707.git.tanjubrunostar0@gmail.com>
 <Y1pNJMvl89jgq9qz@kroah.com>
 <CAHJEyKVpK=BSkuM_RmJ+eUYApYJig8wfqDP4nM=cou_0mThHuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHJEyKVpK=BSkuM_RmJ+eUYApYJig8wfqDP4nM=cou_0mThHuw@mail.gmail.com>

On Thu, Oct 27, 2022 at 02:09:52PM +0100, Tanju Brunostar wrote:
> On Thu, Oct 27, 2022 at 10:19 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 27, 2022 at 08:59:04AM +0000, Tanjuate Brunostar wrote:
> > > refactor long lines of code in the function: s_uGetRTSCTSDuration
> >
> > Please write full sentences.
> >
> > Also please read the in-kernel documentation for how to write good
> > changelog text.  Specifically look at the section entitled "The
> > canonical patch format" in the kernel file,
> > Documentation/SubmittingPatches for a description of how to do this
> > properly.
> >
> > Do this for all of the patches in this series.
> >
> > thanks,
> >
> > greg k-h
> 
> Hello Greg
> the file does not exist in Documentations

$ cat Documentation/SubmittingPatches
This file has moved to process/submitting-patches.rst

> Also, I had to make the sentences shorter because you said changelog
> text was too long.

You had too long of a single line.  Wrap your lines.

Look at all of the changelogs for the driver itself as examples.

thanks,

greg k-h
