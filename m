Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454032F80
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 18:26:12 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mRIYi-0006aw-Pz; Fri, 17 Sep 2021 20:26:00 +0200
Date: Fri, 17 Sep 2021 20:26:00 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev
Subject: Re: [bug report] staging: r8188eu: Fix smatch warnings in os_dep/*.c
Message-ID: <20210917182600.y2srjzadnkp3e7fc@viti.kaiser.cx>
References: <20210917131515.GA31208@kili>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917131515.GA31208@kili>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hello Dan,

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> Hello Larry and Martin,

> The patch 0d5e4bfe47ea: "staging: r8188eu: Fix smatch warnings in
> os_dep/*.c" from Aug 11, 2021, leads to the following
> Smatch static checker warning:

> 	drivers/staging/r8188eu/os_dep/usb_intf.c:286 rtw_hw_resume()
> 	warn: variable dereferenced before check 'padapter' (see line 284)

> drivers/staging/r8188eu/os_dep/usb_intf.c
>     281 int rtw_hw_resume(struct adapter *padapter)
>     282 {
>     283         struct pwrctrl_priv *pwrpriv;
>     284         struct net_device *pnetdev = padapter->pnetdev;
>                                              ^^^^^^^^^^^^^^^^^
> Dereferenced

>     285 
> --> 286         if (!padapter)
>                     ^^^^^^^^^

> Checked too late.

> This warning was silenced when Smatch could tell that "padapter" was
> non-NULL but Martin removed the last caller in commit c0a099b7341c
> ("staging: r8188eu: bHWPwrPindetect is always false").

> So the correct fix is to just delete this function?

yes, rtw_hw_resume is no longer used. I submitted a patch to remove the
function. I'll have to rebase and resend it.

Best regards,
Martin
