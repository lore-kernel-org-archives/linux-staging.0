Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1B98F75
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1cKRZ/dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BD8C433C7;
	Fri, 27 Oct 2023 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698390461;
	bh=wJS+QNrJXp1MsR3/ZUU86Cl8sI9OcARWlPbkBdr/bKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1cKRZ/dqG1UPyK7jGIKlc7d4qyLaGMVNalQpqY5YHNuJmLJssUWMCh6+DxStZzOCx
	 ycijrCqRKHCwG3bBlKXxj6ROCUqVDwp9sptIHEiJoXAY5OMP9E1PBCQQoH3nnqTxU/
	 IxMV/TmCRUpp4AVho4hqjROmuArhRVLTI/EHMcDk=
Date: Fri, 27 Oct 2023 09:07:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Witold Baryluk <witold.baryluk@gmail.com>, arnd@kernel.org,
	Larry.Finger@lwfinger.net, alexandre.belloni@bootlin.com,
	arnd@arndb.de, claudiu.beznea@tuxon.dev, davem@davemloft.net,
	geert@linux-m68k.org, geoff@infradead.org,
	gregory.greenman@intel.com, ilw@linux.intel.com,
	johannes@sipsolutions.net, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, nicolas.ferre@microchip.com,
	pavel@ucw.cz, quic_jjohnson@quicinc.com, stas.yakovlev@gmail.com,
	stf_xl@wp.pl
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
Message-ID: <2023102709-purse-repressed-d8b9@gregkh>
References: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
 <87o7gld8l4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7gld8l4.fsf@kernel.org>

On Thu, Oct 26, 2023 at 12:41:27PM +0300, Kalle Valo wrote:
> For example, I see lots of dead code under '#ifdef NOT_YET' and '#if 0',
> removing those is a good a start. Also converting the ugly debug_level
> procfs file to something more modern would be nice, maybe using just
> dev_dbg() throught the driver is a good option? Or maybe use a module
> parameter instead?

Ick, no new module parameters, this isn't the 1990's, please just use
the netdev debug lines instead :)

thanks,

greg k-h
