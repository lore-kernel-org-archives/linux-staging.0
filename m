Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59162C81
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 15:11:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D86516120A;
	Fri, 15 Oct 2021 15:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634310661;
	bh=3jYoDtUPdFBEUryZYNHsyBzPurObUQOppTxdHPamp+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SifqW+tmi83vgBOT/JG7an3SFgEf3U28avuIKl5gdn4/f/gwrbRGm3iB33QKZMh2h
	 l/YFf6zbXWcmWmBz3JoYpQacXmxoGeDyp2fEr9h6qQ+iY5x6Y7R9Jxum9CMNImVdbE
	 Z9xC2Ny5MQVrzuUhc/r9+Pk5Rp1Nl1N+SSUMezPA=
Date: Fri, 15 Oct 2021 17:10:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Karolina Drobnik <karolinadrobnik@gmail.com>
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: Rename byPreambleType field
Message-ID: <YWmaAqf8pusZGoBd@kroah.com>
References: <20211015102444.90753-1-karolinadrobnik@gmail.com>
 <YWlj9x6kwYUT1jlQ@kroah.com>
 <85dfe2c18e7ec4bd5ae67f7a81ab6197a82e0d86.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85dfe2c18e7ec4bd5ae67f7a81ab6197a82e0d86.camel@gmail.com>

On Fri, Oct 15, 2021 at 03:47:46PM +0100, Karolina Drobnik wrote:
> Hi Greg,
> 
> On Fri, 2021-10-15 at 13:20 +0200, Greg KH wrote:
> > Do not do multiple different things in the same commit and especially
> > when you do not describe them in the changelog text.
> 
> I wasn't aware that changing this preamble-related variable would be
> counted as a different thing. It makes sense, my bad.
> 
> Would you like me to amend the message to say that I also changed
> `bb_get_frame_time` parameter or just drop this change completely?

I think I already answered this :)

