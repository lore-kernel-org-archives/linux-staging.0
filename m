Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A92FB2
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 14:39:55 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsnLz-0086xp-Gz; Mon, 14 Jun 2021 14:14:15 +0000
Date: Mon, 14 Jun 2021 14:14:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jhih Ming Huang <fbihjmeric@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, maqianga@uniontech.com,
	marcocesati@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtw_security: fix cast to restricted __le32
Message-ID: <YMdkN9cft6KHcFn3@zeniv-ca.linux.org.uk>
References: <20210613122858.1433252-1-fbihjmeric@gmail.com>
 <YMX7SRSPgvMA/Pw1@kroah.com>
 <CAKgboZ8QUQpiinL0xCxUmcp6nEVU20jXkDXbrK_QisUMiLEo1A@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgboZ8QUQpiinL0xCxUmcp6nEVU20jXkDXbrK_QisUMiLEo1A@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jun 14, 2021 at 12:40:27AM +0800, Jhih Ming Huang wrote:
> On Sun, Jun 13, 2021 at 8:34 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Jun 13, 2021 at 08:28:58PM +0800, Jhih-Ming Huang wrote:
> > > This patch fixes the sparse warning of fix cast to restricted __le32.
> > >
> > > Last month, there was a change for replacing private CRC-32 routines with
> > > in-kernel ones.
> > > In that patch, we replaced getcrc32 with crc32_le in calling le32_to_cpu.
> > > le32_to_cpu accepts __le32 type as arg, but crc32_le returns unsigned int.
> > > That how it introduced the sparse warning.
> >
> > As crc32_le returns a u32 which is in native-endian format, how can you
> > cast it to le32?  Why do you cast it to le32?  Isn't that going to be
> > incorrect for big endian systems?
> >
> > thanks,
> >
> > greg k-h
> 
> Thanks for the fast reply.
> Yes, you are right. I did not notice that le32_to_cpu already handles
> both of the cases.
> 
> So it seems the warning from sparse is false positives, am I right?

In a sense that on all architectures we would be ever likely to support
le32_to_cpu and cpu_to_le32 do the same bit-shuffling - yes.  In a sense
of having those used correctly it's not a false positive, though - it's
much easier to follow "this variable always hold native-endian, this -
little-endian" and watch for conversions done correctly than to count
the byteswaps and try to prove that it's either even for all execution
histories or odd for all execution histories.

IOW, there's a good reason for keeping separate cpu_to_le32 and le32_to_cpu
and not mixing them with each other - it's easier to prove correctness that
way *and* easier to look for endianness bugs.
