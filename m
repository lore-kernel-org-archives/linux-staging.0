Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09FEA2D;
	Sun, 22 Dec 2024 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734860179; cv=none; b=Fepo/+Z2RbEGs4C226R9YGT1n9pqL0AyZBAglYEunA3gdaH7D340RGNxNk37FoSJpxAHsuMWs8B5VoQ033txm6Iny2039ftZR/f2hyxW0q/aa65dWIR4tKdEq1GrucgzOjh1+ih7BofZjSsc0LP/Mh+8LLVEyNAktddkX6LJ/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734860179; c=relaxed/simple;
	bh=y4xj1fFtYQDSs6zdwoT3ck3BGw3RpCQbOppuC2J6xtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/m/RNd4GmL1W2FmwFLQYWO+w5c/O8u/PEDoC9jzCqHB86BPFrwGhuHQHD/VEiWOxa55M2omNymybBNlCwb9UvNcceG9OI1tN8e2RZ/cQX3qPA4RV8ip3+VS4O1OQVAlfqVWw83q5AiHyj5TEKH9nBDXuXVwrkBC8KooAfJZ5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YtE7SWtv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YtE7SWtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE56CC4CECD;
	Sun, 22 Dec 2024 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734860177;
	bh=y4xj1fFtYQDSs6zdwoT3ck3BGw3RpCQbOppuC2J6xtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtE7SWtvr8Gv/CKpZLM4RJLVUHokSHHfbupXuYT0RgSwqjjGuRYKGOYKxQrJFrckh
	 RupmwqINP2M9Jc/4lhOByL1Aoc8wUGfHz32o4WL3VYGEkexjPd5LdUAKXTNN9PC4Qk
	 NqsZYwjaJY2VRAqKej2s8cXSeucz0rAe/c4kWduI=
Date: Sun, 22 Dec 2024 10:35:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Antonio Riccio <linux@ariccio.me>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Rename variable ValidAll
Message-ID: <2024122209-detract-unwitting-83ee@gregkh>
References: <Z2cekOavt5rTukZY@stream-circuit>
 <2024122201-uncivil-footnote-f584@gregkh>
 <Z2fZoGCf6WGUunGI@egonzo>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2fZoGCf6WGUunGI@egonzo>

On Sun, Dec 22, 2024 at 10:19:28AM +0100, Dave Penkler wrote:
> On Sun, Dec 22, 2024 at 07:11:40AM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Dec 21, 2024 at 08:01:23PM +0000, Antonio Riccio wrote:
> > > --- a/drivers/staging/gpib/uapi/gpib_user.h
> > > +++ b/drivers/staging/gpib/uapi/gpib_user.h
> > > @@ -114,7 +114,7 @@ enum bus_control_line {
> > >  	ValidSRQ = 0x20,
> > >  	ValidATN = 0x40,
> > >  	ValidEOI = 0x80,
> > > -	ValidALL = 0xff,
> > > +	VALIDALL = 0xff,
> > 
> > Why are you only changing one of these?  And are you sure that these
> > values aren't coming from a specification with this type of naming?
> > 
> > thanks,
> > 
> > greg k-h
> I prefer that we keep the camel case definitions in the uapi includes
> as they are for now so that they remain compatible with the current
> user space includes. Over time I will release a version of the user
> space includes that provide compatability definitions for the
> checkpatch clean version of the uapi includes. This includes the camel
> case definitions and the typedefs. I will submit a patches for this in
> the new year.

Ah, this is uapi, we really can't change them all that easily anyway :)

thanks for the quick review.

greg k-h
