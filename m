Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D2A3E2770
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755080; cv=none; b=Zkivy955p6e2gmRrjZTZw97YQcsN9PaB1OWeUbTq/a+R3RdymbCcJaBadduMx5B+4pSTOpmbsI1aaw6I5L8yDNYiUAQ6JMM7K1WeySgBFBy8gZOSyDH9fehCI6CwQr/7nN+xFyfzrW84xIZPd2l06z5GfI/iMCNcin36t5PREsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755080; c=relaxed/simple;
	bh=j0xqAFcXy+y97lgyV3KGv9q3LpnMFE0VPGGc/x2XZ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS3dUHtXSV2BlVZ/R4jLlu2UpjcXMdUQp02Bhx7ZLHDefxEihqiNtBGFrzl/9cdVuI3wHwDKIhr+XlGbVJrXXIVeKZ37JhvHQQSsHuxoLezZYK8rOHKzHTEFumQe8OT1zjMzFOtXpB2KqHOJ4VDCjGsw3VsYvVNZZOxsw5ujubk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0g-0004hp-82; Thu, 09 Apr 2026 19:17:42 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0f-004YXC-2f;
	Thu, 09 Apr 2026 19:17:41 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0f-0000000H9Cg-2yeW;
	Thu, 09 Apr 2026 19:17:41 +0200
Date: Thu, 9 Apr 2026 19:17:41 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Message-ID: <adffNaI6hQbc1mAO@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
 <aXOoc0lvAtPt0fAL@pengutronix.de>
 <aco5Ei1B4vJWKMMj@pengutronix.de>
 <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

Hi Frank,

On Mon, 30 Mar 2026 10:38:44 -0400, Frank Li wrote:
> On Mon, Mar 30, 2026 at 10:49:22AM +0200, Michael Tretter wrote:
> > Hi Hans,
> >
> > On Fri, 23 Jan 2026 17:57:23 +0100, Michael Tretter wrote:
> > > On Thu, 18 Dec 2025 10:23:48 +0100, Michael Tretter wrote:
> > > > The imx media device currently assumes that there is only a single media
> > > > pipeline. However, the media graph has multiple imx capture devices.
> > > > These may be started separately on media pipelines if they don't cause
> > > > conflicts in the media graph.
> > > >
> > > > Move the media pipeline from the media device to the capture devices to
> > > > properly track and handle multiple media pipelines for the imx-csi.
> > > > Refactor the code to start the media pipeline from the driver to help
> > > > the reader.
> > >
> >
> > Could you take a look and apply this series for the imx-media driver,
> > too? The patches are already reviewed by Frank Li and Philipp Zabel.
> 
> Michael Tretter:
> 
> Sorry, I will take care imx's stage driver. I already sent pull-request,
> which included your other two patches.

Thanks for taking care! I found the other two patches in the
media-committers repository.

> 
> Do you have others patches, which need me take care. I am not sure if
> there are chance to send 2nd pull request for 7.1.

Currently, I have only the patches in this series.

Michael

> > >
> > > >
> > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > ---
> > > > Changes in v2:
> > > > - Improve code readability in Patch 2
> > > > - Update commit message of Patch 3 as suggested by Frank Li
> > > > - Link to v1: https://patch.msgid.link/20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de
> > > >
> > > > ---
> > > > Michael Tretter (3):
> > > >       media: imx-csi: move media_pipeline to video device
> > > >       media: imx-csi: explicitly start media pipeline on pad 0
> > > >       media: imx-csi: use media_pad_is_streaming helper
> > > >
> > > >  drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
> > > >  drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
> > > >  drivers/staging/media/imx/imx-media.h         |  7 ++++---
> > > >  3 files changed, 16 insertions(+), 11 deletions(-)
> > > > ---
> > > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > > change-id: 20251107-media-imx-cleanup-9022d941ae44
