Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01CD70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:48:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D32FC610A7;
	Sat, 10 Apr 2021 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618062508;
	bh=BV9vwcodbAKeTvV83HkpyUEzg0GvejpCEcxYAY2s9/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqL5by2vI075Osno2/+I6lG7twNASIjNQ4RIfekAGdZ0tvRKa+V295U4rYRgZeuwk
	 0HVEI/2TuTUF1+yYPLz/Xnu2cv3jQpabdjzNlwZBWm5Sy/G1eMCaAqlHxE+eSpu8qq
	 0Lt6dBQTf605WufbqtpFntSGI42aL/5z7ujEfiyk=
Date: Sat, 10 Apr 2021 15:48:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2] staging: rtl8192e: fixed pointer error by adding '*'
Message-ID: <YHGsqpNPPw+yZN12@kroah.com>
References: <YHGhdtldqAlRsPHT@kali>
 <YHGksKltkkmaUeAk@kroah.com>
 <YHGqBLS+IcHdkI6r@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHGqBLS+IcHdkI6r@kali>

On Sat, Apr 10, 2021 at 07:07:08PM +0530, Mitali Borkar wrote:
> On Sat, Apr 10, 2021 at 03:14:24PM +0200, Greg KH wrote:
> > On Sat, Apr 10, 2021 at 06:30:38PM +0530, Mitali Borkar wrote:
> > > Fixed Comparison to NULL can be written as '!...' by replacing it with
> > > simpler form i.e. boolean expression. This makes code more readable
> > > alternative.
> > > Reported by checkpatch.
> > 
> > Checkpatch did not report this specific problem, Julia did :)
> > 
> > And this changelog text does not reflect the commit you made here.
> > 
> Making the changes now.
> 
> > > 
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > 
> > We need a "Reported-by:" line here to reflect that someone reported the
> > problem as well.
> >
> I am resending this as patch v3. I have to add reprted by Julia, right?

Yes please.
