Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC007A
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=55zlIXYUbXtl7SzLvjogB+Y/GM8hMsZIeb8tJz2Oe34=; b=hXAMuF2mpiGaDpCI4b8UN/cMF
	o043XI0B1Kmt7pX/TbIu6T4bD0fi8IcZC1jepmJgb7j/5AgGKcniMkcuUf2oDnfHXmaCua51ojOJt
	w+7r+gc21aSH9je0r3tfij1Rx/vOi3EtXEPDnJbPAaoLTImJMCM1+uqjcJ1v3w7/bESnQ=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1o1WdQ-0005eO-Qg; Wed, 15 Jun 2022 10:16:52 -0700
Date: Wed, 15 Jun 2022 10:16:52 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] call rtw_IOL_append_*_cmd directly
Message-ID: <YqoUBIPfaW1lf4UK@challenge-bot.com>
References: <cover.1655249804.git.ozzloy@challenge-bot.com>
 <20220615083715.GM2146@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615083715.GM2146@kadam>

On Wed, Jun 15, 2022 at 11:37:15AM +0300, Dan Carpenter wrote:
> On Tue, Jun 14, 2022 at 05:49:24PM -0700, daniel watson wrote:
> > From: Daniel Watson <ozzloy@challenge-bot.com>
> > 
> > This patchset calls the rtw_IOL_append_*_cmd group of functions
> > directly and removes the #define wrappers.
> > 
> 
> Looks good, thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> regards,
> dan carpenter
>

Thanks!  I noticed a typo in the first commit message.
I'll send a v3 to fix it.
