Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8D770
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 14:13:18 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mBHdx-0000E0-VE; Wed, 04 Aug 2021 16:13:13 +0200
Date: Wed, 4 Aug 2021 16:13:13 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: r8188eu: remove RT_TRACE and DBG_88E prints
 from usb_intf.c
Message-ID: <20210804141313.enaysxjdmspfgy4i@viti.kaiser.cx>
References: <20210801173023.1370-1-martin@kaiser.cx>
 <20210804113234.GG1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804113234.GG1931@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Sun, Aug 01, 2021 at 07:30:22PM +0200, Martin Kaiser wrote:
> >  #endif

> > -	/* 2012-07-11 Move here to prevent the 8723AS-VAU BT auto
> > -	 * suspend influence */
> > -	if (usb_autopm_get_interface(pusb_intf) < 0)
> > -			DBG_88E("can't get autopm:\n");
> > -
> >  	/*  alloc dev name after read efuse. */
> >  	rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname);
> >  	rtw_macaddr_cfg(padapter->eeprompriv.mac_addr);

> This patch accidentally removes the usb_autopm_get_interface() call.

Thanks, I didn't notice this. Just sent out v2.
