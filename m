Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4282FA58
	for <linux-staging@lists.linux.dev>; Thu, 20 Jul 2023 19:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A2AC433C8;
	Thu, 20 Jul 2023 19:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689881650;
	bh=x9POu8nwpWCKsGKV4M4myOjDZLVHqsNlbAI0nik7MCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMTrufQ7wxYDKV4rmIASHji8yUu38DYaDuCIMA/01Xuhj74f3ZtP4EbafcszbxHLB
	 wgqSSpFL3YmuDyDhtkZAwLhXe6FxCBL1zvNMBjX/GqsNizTak74niDlOWzgdc3NdRF
	 m1Bn6pcaxcb/lZMUbijy9YMdR7+23dFKgRvOsxh4=
Date: Thu, 20 Jul 2023 21:34:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Rename variable bCurrentHTSupport
Message-ID: <2023072048-skewed-demise-a536@gregkh>
References: <ZKYgH/BvkE9bdcPm@kimchi.darkphysics>
 <6dee04ae-4129-cd7c-0d31-70d29b86c8ff@gmail.com>
 <ZLL+Q0tcW5S8Xjmj@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLL+Q0tcW5S8Xjmj@basil>

On Sat, Jul 15, 2023 at 01:14:59PM -0700, Tree Davies wrote:
> On Thu, Jul 06, 2023 at 10:48:56PM +0200, Philipp Hortmann wrote:
> > On 7/6/23 03:59, Tree Davies wrote:
> > > This patch renames variable bCurrentHTSupport to bcurrent_ht_support
> > > to fix checkpatch warning Avoid CamelCase.
> > > 
> > > Signed-off-by: Tree Davies<tdavies@darkphysics.net>
> > > ---
> > >   drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 +-
> > >   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   |  2 +-
> > >   drivers/staging/rtl8192e/rtl819x_BAProc.c    | 12 ++++++------
> > >   drivers/staging/rtl8192e/rtl819x_HT.h        |  2 +-
> > >   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 16 ++++++++--------
> > >   drivers/staging/rtl8192e/rtllib_softmac.c    | 16 ++++++++--------
> > >   drivers/staging/rtl8192e/rtllib_softmac_wx.c |  2 +-
> > >   drivers/staging/rtl8192e/rtllib_tx.c         |  8 ++++----
> > >   8 files changed, 30 insertions(+), 30 deletions(-)
> > 
> > 
> > Hi Tree,
> > 
> > when I try to apply your patch on the top of all the other patches I get the
> > following error message:
> > 
> > kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply -v
> > ~/Downloads/20230706-\[PATCH\]\ staging_\ rtl8192e_\ Rename\ variable\
> > bCurrentHTSupport-10002.txt
> > Checking patch drivers/staging/rtl8192e/rtl8192e/rtl_core.c...
> > Checking patch drivers/staging/rtl8192e/rtl8192e/rtl_wx.c...
> > Checking patch drivers/staging/rtl8192e/rtl819x_BAProc.c...
> > Checking patch drivers/staging/rtl8192e/rtl819x_HT.h...
> > Checking patch drivers/staging/rtl8192e/rtl819x_HTProc.c...
> > Checking patch drivers/staging/rtl8192e/rtllib_softmac.c...
> > error: while searching for:
> > 	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
> > 	encrypt = ieee->host_encrypt && crypt && crypt->ops &&
> > 		((strcmp(crypt->ops->name, "R-WEP") == 0 || wpa_ie_len));
> > 	if (ieee->ht_info->bCurrentHTSupport) {
> > 		tmp_ht_cap_buf = (u8 *)&(ieee->ht_info->SelfHTCap);
> > 		tmp_ht_cap_len = sizeof(ieee->ht_info->SelfHTCap);
> > 		tmp_ht_info_buf = (u8 *)&(ieee->ht_info->SelfHTInfo);
> > 
> > error: patch failed: drivers/staging/rtl8192e/rtllib_softmac.c:816
> > error: drivers/staging/rtl8192e/rtllib_softmac.c: patch does not apply
> > Checking patch drivers/staging/rtl8192e/rtllib_softmac_wx.c...
> > Checking patch drivers/staging/rtl8192e/rtllib_tx.c...
> > 
> > 
> > My be the previous send patches are not taken then your chance is better
> > that this one will fit. Will see what happens.
> > 
> > 
> > You need to put your patches into a patch series.
> > This reduces email traffic as the reviewer can just send one email and does
> > not need to send four.
> > 
> > A possible command for a patch series is looking like this:
> > git format-patch -o ~/Documents/kernel/patches/ --cover-letter -n
> > --thread=shallow --to="Greg Kroah-Hartman <gregkh@linuxfoundation.org>,linux-staging@lists.linux.dev,linux-kernel@vger.kernel.org"
> > 4bbbd60d84e15fdb7bffde98a687ed168a4dfbbd^..HEAD
> > 
> > Use the git commit id of your first patch.
> > 
> > Bye Philipp
> > 
> > 
> 
> Philipp,
> 
> I think I understand what I did wrong. Each of these original patches were 
> created/based from the same commit hash. So it makes sense that only the
> first one applied would apply cleanly and the others would fail. 

Please redo them all and send them as a proper patch series.

thanks,

greg k-h
