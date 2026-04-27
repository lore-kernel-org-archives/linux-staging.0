Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA56B30AD00;
	Mon, 27 Apr 2026 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295528; cv=none; b=uZ01jYRPBLq2GbOLPQpLui55XfaIQ1dajTrqbWB+jOyl1KuDEdZk3ZcIHDhDW3xynSeZjj4H7o7eY17pf/8Qjst2YaXuHM8ExsFnfsLUdj6quaNI2OcRFMBd6pSpNfQ7Q1ptg8ymvxho3X9WL9Nw1o6AniadhttFCkEMPKwhSV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295528; c=relaxed/simple;
	bh=d3lSd+GC2MS1fCuTj9wqSHlwGV4Xuc9+BRaTo8/WXMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OP9P6l3qYygJySTTg4RL/FE0N3So3o4EQJAEH7TxA+nqEArtsg7XpCkUOphyPgnnKMIHdPvLA9J9S6aQaeATN4AaAObZ+ahq6GDjAbgSALxRUq8TWHIqDSGJ7KwQCnIG/enrKffWXlx+pmdK5gdyA9icwYn14Bk7mVBTUL0HYG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iHVq74Kb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iHVq74Kb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBBEC19425;
	Mon, 27 Apr 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777295527;
	bh=d3lSd+GC2MS1fCuTj9wqSHlwGV4Xuc9+BRaTo8/WXMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHVq74KblTGBqk14OC5lECfQfwEC2SvcnnDGfR2rH6N/xFbXGmR4FRy3QWqlWYSZA
	 a3N1mzGYnOWjdmgZTQ1ycSrN6YUZhAy4Z73t/rqWpZYlEiPQclEzfRocoR6kCrDCa4
	 DDo8AOZKZZtpXPldjo7Aofl2X0OKzx6Ajom/w7do=
Date: Mon, 27 Apr 2026 07:11:28 -0600
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Alexandru Hossu <hossu.alexandru@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <2026042713-buffing-recite-c3d7@gregkh>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
 <20260427081748.3407939-2-hossu.alexandru@gmail.com>
 <ae8pq5YzEe2wTJmx@stanley.mountain>
 <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>
 <ae8w9tkpM8G2NWWM@stanley.mountain>
 <2026042737-riding-bunkhouse-f8e0@gregkh>
 <ae9db6KjYMsFOG3F@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae9db6KjYMsFOG3F@stanley.mountain>

On Mon, Apr 27, 2026 at 03:58:23PM +0300, Dan Carpenter wrote:
> On Mon, Apr 27, 2026 at 05:11:19AM -0600, Greg KH wrote:
> > On Mon, Apr 27, 2026 at 12:48:38PM +0300, Dan Carpenter wrote:
> > > On Mon, Apr 27, 2026 at 02:28:39AM -0700, Alexandru Hossu wrote:
> > > > On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
> > > > > We need a little change log here.  I was hoping you would provide
> > > > > a link to the AI review in the changelog.
> > > > 
> > > > Hi Dan,
> > > > 
> > > > Sorry about the missing changelog, will add it in v3.
> > > > 
> > > > For the AI review link, I don't have a direct link to the bot output.
> > > > What I know is from Greg's reply in the v1 thread on lore.kernel.org,
> > > 
> > > What about a link to the email on lore?
> > 
> > Sorry, I was on a plane with no connectivity to look it up, here's the
> > AI review for my patch:
> > 	https://sashiko.dev/#/patchset/2026041408-grill-mahogany-d1e3%40gregkh
> > 
> 
> Ah.  Very good.  That's fair enough then.  The AI is very convincing.

Yes, but is it correct?  That's the problem with these tools :)

