Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41F7A;
	Tue,  5 Apr 2022 15:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C52C385A1;
	Tue,  5 Apr 2022 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649174313;
	bh=Br6t58Tuy+glHqI224PUEoUg5nKIr3jjTEjx/ZsSSQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baoJ4dIFQGcser5FsYQ6mYTfHXqEb24i9lCM5didS7uQKIjna3gZD0DrE2WN2rwNb
	 2FIh7v0XPNSQ+35qsd6TlE2WCxQR/Kmb5ojXLApKoXUrIY+sdiqEVPgyzFUlRcRzha
	 E9OXeso53nAvZA23UsSqci3FjEhdh0FOufzrBEw4=
Date: Tue, 5 Apr 2022 17:58:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy linux kernel <outreachy@lists.linux.dev>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix indentation
Message-ID: <YkxnJvJyo75c/3yk@kroah.com>
References: <20220405150912.GA625670@euclid>
 <YkxdasBGZ3m2Yu66@kroah.com>
 <CAMWRUK7c-hqiz+KEFkqBuvu1syCwSnF4UZzbkPFw-VWABm9qOw@mail.gmail.com>
 <CAMWRUK7Jgs3evt3bC0pnRkbRw3CS1XCULPi8NzjgGh7aLTFKCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMWRUK7Jgs3evt3bC0pnRkbRw3CS1XCULPi8NzjgGh7aLTFKCQ@mail.gmail.com>

On Tue, Apr 05, 2022 at 11:45:29AM -0400, Sevinj Aghayeva wrote:
> On Tue, Apr 5, 2022 at 11:19 AM Sevinj Aghayeva
> <sevinj.aghayeva@gmail.com> wrote:
> >
> > On Tue, Apr 5, 2022 at 11:17 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Apr 05, 2022 at 11:09:12AM -0400, Sevinj Aghayeva wrote:
> > > > Adhere to Linux kernel coding style.
> > > >
> > > > Reported by checkpatch:
> > > >
> > > > WARNING: suspect code indent for conditional statements
> > >
> > > You are also removing unneeded comments, right?  Please explain that as
> > > the documentation link the bot pointed you to showed.
> >
> > I specified that under the --- line:
> >
> > v1 -> v2: Remove the comments that became irrelevant with proper indentation.
> 
> I think I misunderstood the bot's response. It looks like you
> triggered it because you wanted me to write a more complete
> description of what the commit is doing. I thought I received it
> because it was the second version of the patch from a previous
> patchset (the last bullet point in the bot response) that didn't
> include v2 in the subject and a v1 -> v2 after the --- line.

That is one reason, yes, but you also need to update the changelog text
to say everything you are doing in the commit.

> I can do a fresh patch with a complete description and no v2 stuff;
> please let me know.

It will be a v3 patch, right?

thanks,

greg k-h
