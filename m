Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6368C97E;
	Tue, 21 Mar 2023 16:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4C4C433D2;
	Tue, 21 Mar 2023 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679416003;
	bh=tKkWKaI2vB8Y3uT5D+N8CfXzL37wrUQjbZ1WKGqRlGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKFeVjHsPQS6dAl6zd96IZOCGHqrPcab2l3l9yTBLAqJICxz3pLG0ytby4K5Vu++u
	 EwENZ9OiiTSX31CXM/bCq5C0KstSrArKmAg3KSeKnlil+6+WUCIK6D0Mn3wlJgGzMs
	 e7Ln2zF7W0W/KZOpUHrs5W6OPI7kIcp4mM9yyiGM=
Date: Tue, 21 Mar 2023 17:26:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	johan@kernel.org, elder@kernel.org, vireshk@kernel.org,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/3] edits in greybus driver
Message-ID: <ZBnawJvBVkgyVh78@kroah.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
 <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>

On Tue, Mar 21, 2023 at 06:22:44PM +0200, Menna Mahmoud wrote:
> 
> On ٢١‏/٣‏/٢٠٢٣ ١٣:٤٦, Julia Lawall wrote:
> > 
> > On Tue, 21 Mar 2023, Menna Mahmoud wrote:
> > 
> > > This patchset includes change happened in greybus driver in three
> > > different files two of them patch one and three related to
> > > checkpatch issue and in second patch convert two
> > > `container_of` macros into inline functions.
> > > 
> > > Menna Mahmoud (3):
> > >    staging: greybus: remove unnecessary blank line
> > >    staging: greybus: use inline function for macros
> > >    staging: greybus: remove unnecessary blank line
> > Different patches should have different subject lines.
> But I have already the same edit in both file, so should I re-write the
> subject for one of them?
> >    You need to either
> > be more specific about the file affected or merge the two patches with the
> > same subject into one.
> 
> each patch related to different file. So, Can I to merge two commits for
> different files but have the same edit in one patch?

Yes, or make 2 different patches with 2 different subject lines as they
are obviously doing different things.

> but in this case no need to create patchset for all changes in `greybus`
> driver, right?
> 
> If okay with that, should I versioning the patches to resend them again, or
> should add "RESEND" subject prefix?
> 
> please tell me the best way to resend these patches, appreciate your help.

What would you want to see if you had to review and apply loads of
patches like this?

(hint, it's not a resend, but a new version...)

thanks,

greg k-h
