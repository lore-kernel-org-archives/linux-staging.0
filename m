Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C382119;
	Sun, 15 Oct 2023 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="io6+Y4+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1697361883;
	bh=urG4oh7ObZeYy796+eJBTOzvZ+QqH/SVTyJ2zZ6fxs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=io6+Y4+TXg3IBuIBwLGU1ltfzSdN84NFAuELISXW/8mT9o2gIBOYM8Hp1tkCIIQ+E
	 LulG1P+6C1jSP4VujEK9FgLKe2FpmwE8akAJOR0LGH9hKqXIQYCGeuD3HMXtPsHhqz
	 44+TRGTS6Q4NgqOsup8JHaztxUDQViGTVQ29i7Vs=
Date: Sun, 15 Oct 2023 11:24:43 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Calvince Otieno <calvncce@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, outreachy@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Luke Koch <lu.ale.koch@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: remove unused functions
Message-ID: <5dd59334-428b-4e27-8d19-7b8514bb5ef5@t-8ch.de>
References: <ZSjpQlUcyOoYv4Yh@lab-ubuntu>
 <62778e4d-cc2e-4310-b334-52b54cfe7e79@kadam.mountain>
 <CADFX3OSqnjGrxRazmmcBuGUOyv4TuXGEJ8fqbAhR4X9j0rn6sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADFX3OSqnjGrxRazmmcBuGUOyv4TuXGEJ8fqbAhR4X9j0rn6sA@mail.gmail.com>

Hi Calvince,

On 2023-10-15 10:39:20+0300, Calvince Otieno wrote:
> On Sun, Oct 15, 2023 at 10:38 AM Calvince Otieno <calvncce@gmail.com> wrote:
> > On Fri, Oct 13, 2023 at 12:02 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Fri, Oct 13, 2023 at 09:52:50AM +0300, Calvince Otieno wrote:
> > > The following functions were defined in the prism2mgmt.h file but neither
> > > declared nor used anywhere. It is recommended that they be removed.
> > >
> > >       - void prism2mgmt_get_grpaddr(u32 did, struct p80211pstrd *pstr,
> > >                                     struct hfa384x *priv);
> > >       - int prism2mgmt_set_grpaddr(u32 did,
> > >                                  u8 *prism2buf, struct p80211pstrd *pstr,
> > >                                  struct hfa384x *priv);
> > >       - int prism2mgmt_get_grpaddr_index(u32 did);
> > >
> >
> > Could you look up when the functions were deleted and add that
> > information to the commit message?
> >
> >     These functions were removed five years ago in commit 123412341234
> >     ("delete functions").
> >
> > regards,
> > dan carpenter
> 
> I am  not able to locate exactly when these functions were deleted.
> I have checked the commit history of these files prism2mgmt.h and prism2mgmt.c,
> but, I can't find any commit relating to the removal of the above functions.

you can use the "-S" argument to "git log" for this quite nicely:

$ git log --pretty=oneline  -Sprism2mgmt_set_grpaddr drivers/staging/wlan-ng
1e7201836c576883d5bd708810cc72ab1392756f Staging: wlan-ng: Delete a pile of unused mibs. And fix WEXT SET_TXPOWER.
cbec30c4c00c9f5a7357f5c5dacb63ae2378afb4 Staging: wlan-ng: Delete a large pile of now-unused code.
00b3ed1685089ff52169a715de11106ed37df087 Staging: add wlan-ng prism2 usb driver

This shows all the commits that touched the drivers/staging/wlan-ng
directory and added or removed the string "prism2mgmt_set_grpadd".

You can check which of these three commits dropped the function and then
repeat the procedure for the other two functions.

Thomas
