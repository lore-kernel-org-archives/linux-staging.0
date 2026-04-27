Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108233A8733;
	Mon, 27 Apr 2026 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288316; cv=none; b=FrW4L24s+hIfhcd07r+vz5mU5OrN7TVQl8BLDEYs2SInGOdY+tyDpvW8i25Vbhp+dJigxhErWyQPNw8cu/LvRgf7zbglYvdukjFnOPaKVn4sx7AY4sGYx62Fn71YXElIbcRujOFD9FdiHo6ewJuClwhMfn2/+R3c0BpZwXnLkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288316; c=relaxed/simple;
	bh=n5KODy3k2dMAcTMYsBT01wy+ObyVNMha9hq5fW7MCYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mApBeVN784AM2SWUsVdUIO22zJQr1lWOTXuU4H13bg40/wbQEj0b9tFvBQLA1nGtdu49Mq+I+BxC2EP2+Rzz8LjYGmPq9TH67BqSm1M5B6JoQTy5cXqlZNsylyTOJCcN0+TrmeRUFpv9hZgr1LQZDuuCmbUcIN2P9vFUPy4Va4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gHf3MUmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gHf3MUmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67682C19425;
	Mon, 27 Apr 2026 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777288315;
	bh=n5KODy3k2dMAcTMYsBT01wy+ObyVNMha9hq5fW7MCYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHf3MUmB0B7Zun9/jN1B1U2S3Lr1eZpgLoe/NmNKZqWa/csEsMmVjj2OqWU5CkUMY
	 A7nj35h5EkHrS0LoOvtWc2VT6U64ha5GXZyLK2tUkWyqN/77eSAoeXM1JsmAJmf3tw
	 8oWiX1W5L+NnFOPVJ1LePB4MmLVZoyz89EYq0WR8=
Date: Mon, 27 Apr 2026 05:11:19 -0600
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Alexandru Hossu <hossu.alexandru@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <2026042737-riding-bunkhouse-f8e0@gregkh>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
 <20260427081748.3407939-2-hossu.alexandru@gmail.com>
 <ae8pq5YzEe2wTJmx@stanley.mountain>
 <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>
 <ae8w9tkpM8G2NWWM@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae8w9tkpM8G2NWWM@stanley.mountain>

On Mon, Apr 27, 2026 at 12:48:38PM +0300, Dan Carpenter wrote:
> On Mon, Apr 27, 2026 at 02:28:39AM -0700, Alexandru Hossu wrote:
> > On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
> > > We need a little change log here.  I was hoping you would provide
> > > a link to the AI review in the changelog.
> > 
> > Hi Dan,
> > 
> > Sorry about the missing changelog, will add it in v3.
> > 
> > For the AI review link, I don't have a direct link to the bot output.
> > What I know is from Greg's reply in the v1 thread on lore.kernel.org,
> 
> What about a link to the email on lore?

Sorry, I was on a plane with no connectivity to look it up, here's the
AI review for my patch:
	https://sashiko.dev/#/patchset/2026041408-grill-mahogany-d1e3%40gregkh

> > where he said both his fix and mine would break things on some systems
> > according to the review bot and asked me to use truncation instead.
> > I went with min_t() specifically because he asked for it.
> > 
> > You're right that technically early return would have been strictly
> > better than the original, the original was already writing out of
> > bounds so it wasn't working to begin with. But since Greg asked for
> > truncation I kept it that way.
> 
> This is the path of least resistance, but it's better to push back
> on bad advice from AI.  Greg won't be offended.  And if he still
> doesn't like after you push back then you can still do the min_t()
> version.  Both versions are fine really, but I generally go with
> the stricter one when it doesn't break anything that wasn't already
> very broken.

Agreed, it takes a lot to offend me these days :)

thanks,

greg k-h
