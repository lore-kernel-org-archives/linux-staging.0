Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027D71
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 09:04:50 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94)
	(envelope-from <johannes@sipsolutions.net>)
	id 1lbJe7-000dG4-R7; Tue, 27 Apr 2021 11:04:44 +0200
Message-ID: <70eb55bc358d4539a8602eb0f0e7cda0757e3b3e.camel@sipsolutions.net>
Subject: Re: [PATCH] staging: rtl8723bs: fix monitor netdev
 register/unregister
From: Johannes Berg <johannes@sipsolutions.net>
To: Greg KH <greg@kroah.com>
Cc: linux-wireless@vger.kernel.org, linux-staging@lists.linux.dev, Harald
	Arnesen <harald@skogtun.org>
Date: Tue, 27 Apr 2021 11:04:42 +0200
In-Reply-To: <YIfTZKtMcMAB2e4k@kroah.com>
References: 
	<20210426212801.3d902cc9e6f4.Ie0b1e0c545920c61400a4b7d0f384ea61feb645a@changeid>
	 <YIeuW57v5/qPwlzY@kroah.com>
	 <aad26597fc709dd67bf010b60590120148bc16c6.camel@sipsolutions.net>
	 <YIfTZKtMcMAB2e4k@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned

On Tue, 2021-04-27 at 11:03 +0200, Greg KH wrote:
> > There's another call to register_netdevice() here but I don't think
> > that's affected, however, it's obviously utterly broken in the first
> > place:
> > 
> >         if (!rtnl_is_locked())
> >                 unregister_netdev(cur_pnetdev);
> >         else
> >                 unregister_netdevice(cur_pnetdev);
> > 
> > *sigh*.
> 
> Sorry, these staging wireless drivers are really getting annoying.
> Maybe I need to turn an intern onto them to just get them fixed up and
> out of here to be a 'real' driver.

:)

FWIW, in this case it looks like it's actually not even incorrect,
because it's guaranteed to already hold the RTNL *itself*. Just all that
code can be removed.

johannes

