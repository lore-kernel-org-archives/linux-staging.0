Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E788EAE5
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710584031; cv=none; b=UIjjNm+7mv5rynLMsDBh9P3tI6S+mLNh7SdTVSymIbPUrTk5ayDM1Ax2t3FLLFNpwk9Wd/huWhKiwzs8ViKHRamOHsxNeVOcJmc1uuoWDvZ4ShR5svPu+uScX71lo3z/6x+j0K+Q4eMeElZpU4BQC3rq6XGrkzaqLzPF5fxQyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710584031; c=relaxed/simple;
	bh=QMhXHxG+1FPPO0AGhqeDU7qRzzek+Agn2F98qKbiq3Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CWWiIYl8EfVshalzPBCQbZYEC+gmY4YMQSirOJ6lAbewmlJ8/n2F/j8uOtdS5o5LYY0/wkRzQ4rD8FRVZ1pIFgZmiTsiyZ6F56FL/AESMlnq+GULgS6sHvoRWW9T+PkGT4mt8cuoFF4HCObohU9H2j18SGAJ/xQNudS2bBUY3QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W1VVTxqm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W1VVTxqm"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BF487E9;
	Sat, 16 Mar 2024 11:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710584001;
	bh=QMhXHxG+1FPPO0AGhqeDU7qRzzek+Agn2F98qKbiq3Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W1VVTxqml9aWbWtB//8It6z0CdMfsxdFAsOHSm5TMKoVODkoyjX6sCUFviFmjGDkn
	 lYYIBQQUl1D4n5Q6ODxl2KbdHU/8Ib1GOOFitsFAX++bPIVf9mORfNbzJWuoprHVZD
	 i+UlDSLVTWNcKwvD1uU8XLXisMtPSG5aN/fCRxqA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ea63d6ee-73bf-47de-a19c-6c83bcc0f374@moroto.mountain>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com> <20240314100607.336009-6-umang.jain@ideasonboard.com> <171042807436.252503.7131780241808072028@ping.linuxembedded.co.uk> <996c4012-4274-4bbc-8155-43ae76368f79@ideasonboard.com> <ea63d6ee-73bf-47de-a19c-6c83bcc0f374@moroto.mountain>
Subject: Re: [PATCH v2 5/6] staging: vc04_services: Drop global variables tracking allocated pages
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Umang Jain <umang.jain@ideasonboard.com>
Date: Sat, 16 Mar 2024 10:13:42 +0000
Message-ID: <171058402272.2556397.13398361772841752704@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Dan Carpenter (2024-03-16 08:41:50)
> On Fri, Mar 15, 2024 at 11:17:15AM +0530, Umang Jain wrote:
> > Hi,
> >=20
> > On 14/03/24 8:24 pm, Kieran Bingham wrote:
> > > Quoting Umang Jain (2024-03-14 10:06:06)
> > > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchi=
q_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > index 282f83b335d4..666ab73ce0d1 100644
> > > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > @@ -140,12 +140,6 @@ struct vchiq_pagelist_info {
> > > >   };
> > > >   static void __iomem *g_regs;
> > > What happens with this one ? Is it essential to be global? Can it be
> > > part of the device? Who's mapping it? or unmapping?
> > >=20
> > > If we're keeping it global, I'd add a comment...
> >=20
> > The keyword in the series in 'non-essential' and I feel this one is
> > essential one.
> >=20
> > It's on the irq request path so encapsulating it in the platform driver=
 data
> > and then again trying to get it from there, will make this affect
> > performance.
> >=20
> > See remote_event_signal() and vchiq_doorbell_irq()=C2=A0 in vchiq_arm.c
> >=20
>=20
> The fast path argument was convincing up to here
>=20
> > (For testing, a added a dev_info() in the vchiq_doorbell_irq() and it
> > brought down the consistent 30fps IMX219 streaming to (15-26)fps
> > inconsistent range)
> >=20
>=20
> but doing a dev_info() seems way way more expensive than dereferencing
> in some pointers in driver data...

Indeed, I think even in IRQ context here we should be fine to
dereference the pointers here, and can get rid of the last global.

> Anyway, adding a comment seems like a good idea.

If there's a reason this doesn't work, or if it does break the tests
then a comment should describe that for sure.

--
Kieran


>=20
> regards,
> dan carpenter
>
