Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18E2C82
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 11:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3C0C340E5;
	Wed, 26 Jan 2022 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643195663;
	bh=iniSGw5ceUDMz++jSAmxPoQI73FaerNBpq0KCsIYRXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tezx2+KVPeuZ2TXi3cX+Wt8ttOBO+DhhTRU3E5GC8bgFYFIOZFtzdCmbOwItd1/kR
	 8GtDxGoh6kWLRZ97RB+HwfVklvpMtulCRQ3EvjDMp5RHUVD9/cj54UFrnxoluR/WuB
	 RQM69TonMxF1I3wjQjh4jYyIJwEkOHH6sWJEqWZw=
Date: Wed, 26 Jan 2022 12:14:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Phillip Potter <phil@philpotter.co.uk>, dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] staging: r8188eu: remove DBG_88E calls from
 os_dep/ioctl_linux.c
Message-ID: <YfEtDN6qiRci02Xe@kroah.com>
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-7-phil@philpotter.co.uk>
 <a681a562-eb41-9dc8-703a-5b235c15a3a1@gmail.com>
 <YfCgQbFxfVZXw9Fg@equinox>
 <b5bbe488-ac43-fd89-7c65-36bfa9c903a6@gmail.com>
 <YfEm4t+fhO4I2uDW@kroah.com>
 <b6da2cde-b489-0b9d-819f-c36cd64f9531@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6da2cde-b489-0b9d-819f-c36cd64f9531@gmail.com>

On Wed, Jan 26, 2022 at 01:58:52PM +0300, Pavel Skripkin wrote:
> Hi Greg,
> 
> On 1/26/22 13:48, Greg KH wrote:
> > > IMHO the best thing you can do is to leave these reads and leave a comment
> > > like "hey, please remove me and test". One day useless reads should be
> > > anyway removed, since ideally rtw_read family must get __must_check
> > > annotation + normal error handling.
> > 
> > No, if these were never getting called in normal operation, there's no
> > need to add them back.
> > 
> 
> I guess, I was not clear, sorry. I mean leave reads that were called during
> normal operations, but used only for printing debug info. (As Phillip has
> already done in v1)
> 
> Reads inside R88_DBG() and other debug macros of course should be removed,
> but other places seems dangerous without good testing. There is al least one
> place with following comment:
> 
> > 			/* Although lenc is only used in a debug statement,
> > 			 * do not remove it as the rtw_read16() call consumes
> > 			 * 2 bytes from the EEPROM source.
> > 			 */
> > 			u16 lenc = rtw_read16(adapter, REG_PKTBUF_DBG_DATA_L);
> 
> There is a chance that other places have same problem, but don't have a
> comment above it. That's why I suggested to leave all these "debug" reads
> and leave a comment for further work. It will help to easily spot them in
> future and remove or leave them with explanations why.

Yes, those are fine, thanks.
