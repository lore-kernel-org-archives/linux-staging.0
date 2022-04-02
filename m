Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5F7C;
	Sat,  2 Apr 2022 11:45:52 +0000 (UTC)
Received: from dslb-094-219-034-140.094.219.pools.vodafone-ip.de ([94.219.34.140] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <postmaster@kaiser.cx>)
	id 1nacCE-00019f-8u; Sat, 02 Apr 2022 13:45:34 +0200
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.94.2)
	(envelope-from <martin@martin-debian-2.paytec.ch>)
	id 1nacCD-001Fxh-K1; Sat, 02 Apr 2022 13:45:33 +0200
Date: Sat, 2 Apr 2022 13:45:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: Remove goto to no-op exit label
Message-ID: <Ykg3Xfb4vjjGSyKc@martin-debian-2.paytec.ch>
References: <20220401183513.26222-1-fmdefrancesco@gmail.com>
 <YkdjhGtMwnbJcz+P@iweiny-desk3>
 <1724388.VLH7GnMWUR@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1724388.VLH7GnMWUR@leap>
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>

Thus wrote Fabio M. De Francesco (fmdefrancesco@gmail.com):

> > >  	pnpi = netdev_priv(netdev);

> > >  	if (!pnpi->priv)
> > > -		goto RETURN;
> > > +		return;

> I cannot see how pnpi->priv might ever be NULL.

Even if pnpi->priv was NULL, we wouldn't need the check. It's ok to call
vfree(NULL).

> After the two removals I've talked about above, the code will always call 
> vfree(pnpi->priv) and then free_netdev(netdev).

That makes sense.

Best regards,
Martin
