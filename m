Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E53420E2
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 07:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1669621549; bh=wYZlN96pJuQ8Qrp+PoOImcb4RGZJwH09T2Ok2nM5puc=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=OUNY7pg5SGi7uFe/7Nok53OSdDhJgUysatqxNvXXb9IfBI6PeRB4Z8B8V19SC2GdD
	 /6/5N7g4Hd9XxJJV3GO8wfm52gxBcX1mQJOQOcT3mdbNkGucdVr55Ra866R+EobSLw
	 CEMs8xS5OWel5m91NIjCbSRipwnbtD6kTsxnVrOU=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon, 28 Nov 2022 08:45:48 +0100 (CET)
X-EA-Auth: j8P34HFCLhZ7GZTTP7tVWbf4kJ0AtgmdBJOgHoKNeFxhwTeYFL+kIesUS7aPIzfcBoicB+Lc7fOxN+J1zvXsBm7I3VCnj8UU
Date: Mon, 28 Nov 2022 13:15:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y4RnJyiCDYavLAJq@qemulion>
References: <Y3YKhee8L+kAfHM4@qemulion>
 <Y3YvGdkyGm7azGg4@kroah.com>
 <Y3Y1N6AwWEXLpSrx@qemulion>
 <Y3Z3aatcaISvqURJ@kroah.com>
 <Y3jqUpNOygJ4+2jy@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3jqUpNOygJ4+2jy@qemulion>

On Sat, Nov 19, 2022 at 08:08:15PM +0530, Deepak R Varma wrote:
> On Thu, Nov 17, 2022 at 07:03:21PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Nov 17, 2022 at 06:50:55PM +0530, Deepak R Varma wrote:
> > > On Thu, Nov 17, 2022 at 01:54:49PM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Nov 17, 2022 at 03:48:45PM +0530, Deepak R Varma wrote:
> > > > >
> > > > >  struct hfa384x_pdr_refdac_measurements {
> > > > > -	u16 value[0];
> > > > > +	DECLARE_FLEX_ARRAY(u16, value);
> > > > >  } __packed;
> > > >
> > > > Why?  This structure is never used anywhere, right?  So why is this
> > > > needed to be changed and not just removed entirely?  Same for the other
> > > > structures in this patch.
> > >
> > > Hello Greg,
> > > I am unable to confirm that these structures are truly not needed in the absence
> > > if a real device based testing. I could only validate that using the compile
> > > build and driver loading.
> >
> > Think this through, if no one is actually using this structure, and it
> > is of 0 size, then do you think it is being used?
>
> Hello Greg,
> I did not find any memory allocation for these zero length array structures.
> Also, the union or its enclosing structure do not appear to access the members.
> Hence I am leaning towards concluding that these zero length array structures do
> not appear to be necessary.
>
> There are a few other structures that are part of the same union, however, they
> too do not appear to be used for accessing the memory assigned to the union [or
> its enclosing structure]. I think most of the members of these unions can be
> replaced by one max size structure of this union [e.g. struct
> hfa384x_pdr_mkk_measurements].
>
> Could you please comment if I am reading the code right?
>
> For your quick reference, the zero length structure declaration are online 963
> whereas the union is on line number 1080 of the file drivers/staging/wlan-ng/hfa384x.h

Hello Greg,
can you please suggest how should I approach this clean-up/correction?

Thank you,
./drv

>
>
> Thank you,
> ./drv
>
>
> >
> > > This change that I am proposing in the interim would enable the compiler to
> > > protect the structure from addition of a new member below the zero length array.
> >
> > Why would you want to add a new member below this?  That's not what is
> > happening here at all.
>
> I came across this one old commit where such an accident happened. This is from
> a recent LWN article:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e48f129c2f20
>
> I understand the C99 now protects from such an attempt at the compile time
> itself.
>
> Thank you,
> ./drv
>
>
> >
> > Please think this through a bit more.
> >
> > good luck!
> >
> > greg k-h
> >


