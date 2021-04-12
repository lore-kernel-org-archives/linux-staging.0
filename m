Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619E71
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 15:12:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67B923F0;
	Mon, 12 Apr 2021 17:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1618240367;
	bh=Vz+OMcuaVIUWh/1V5VDfgCmz0MaadcYAni8v3UeFzEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYBZ+xuOtRSZiVxFnDNer1U5JH1VoI2j3hrHgR3tSGsE8T2LCGLtA/ItGDhhig7/6
	 IV3PuSJuBTmY7hOqGK3pTsOYaJitbvRoB+W7Z9JQvYsd3vh84rltHc0yOEhyKWboIQ
	 iR/lYBOkwE8QUuvDHDznHxbLb2j9e95K/syDs0sw=
Date: Mon, 12 Apr 2021 18:11:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: ascordeiro <alinesantanacordeiro@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss:
 Replace macro function by static inline function in file iss.c
Message-ID: <YHRjPpMVVrhTF7Tc@pendragon.ideasonboard.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
 <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
 <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>
 <7457fd4eb5afbf66b3a6f2fed4dd1e440e6ed422.camel@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7457fd4eb5afbf66b3a6f2fed4dd1e440e6ed422.camel@gmail.com>

Hi Aline,

On Mon, Apr 12, 2021 at 10:58:45AM -0300, ascordeiro wrote:
> Em seg, 2021-04-12 às 16:40 +0300, Laurent Pinchart escreveu:
> > While testing on a device isn't a requirement as you can't be expected
> > to have the necessary hardware, changes are expected to be at least
> > compile-tested before being submitted.
> 
> Hi Laurent,
> 
> I thought recompiling the kernel would be enough in this case.
> I recompiled it in native Ubuntu 16.04 without errors.

Did it compile the driver you modified ?

-- 
Regards,

Laurent Pinchart
