Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D95221
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 21:24:26 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1pEzcr-0007gB-So; Mon, 09 Jan 2023 22:24:13 +0100
Date: Mon, 9 Jan 2023 22:24:13 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/13] staging: r8188eu: make rtl8188eu_inirp_init a void
 function
Message-ID: <20230109212413.mcypwhpmtsj3rgj3@viti.kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
 <20230108185738.597105-7-martin@kaiser.cx>
 <ab4727b9-69c1-ba8d-38d8-6a3c721ba2aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab4727b9-69c1-ba8d-38d8-6a3c721ba2aa@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Pavel,

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> Martin Kaiser <martin@kaiser.cx> says:

> > rtl8188eu_inirp_init's return value is not checked by its caller. Make
> > rtl8188eu_inirp_init a void function.

> Hm, shouldn't we actually check return value on caller side?

> This thing is called from netdev_open and issues urbs to read data from the
> device. So let's imagine that we fail on 1st iteration (for some reason):
> netdev_open() says all is OK, but driver does not communicate with the
> device.

your're right. It makes sense to relay the return value to _netdev_open.
We'd have to update/remove the intf_start pointer and usb_intf_start.

I'll resend the series without this patch and submit new patches for
relaying the error code.

Thanks & best regards,

   Martin
