Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1F3E2750
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525968; cv=none; b=GFhrNlp6/boFW14CHmKxHi4xYtZGhP9eTv5Y7Vr9j805tnMxzSWxYMmMmNySCJ09sSfj0IoLVNAmnmnpTwwiH/aqfrXsC572UHzivxH20votSXfHLMwWOaHUdHTRTK6EzhB4YgMJSb7HvEeRtWtW512Lx84LtL217UwpYDyznew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525968; c=relaxed/simple;
	bh=fBO2hJf4+rPrkOp74SVXocT1M+hIBpxOon9pkP770BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bgas9IF4D0P48j99Bo7Ype59TLAOVNjSiEiuVPwpg8m/eeO1CwCAv9PVvQePjJnXhoZmD7wn35pdt1OK5nuOidmDcqArAXKan4Li6SqG//FekLDmM316yVIIQS1eJBDBel7UMlrCF7MB1r2ZaSxEh4TiYh+26GhOWshjd7MOWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0yA/mgZ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0yA/mgZ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517907feed0so43734851cf.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525966; x=1782130766; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ZBzvTGg5RXWxT981zetPvdIqY02XPOz3n0/R5VS1+w=;
        b=T0yA/mgZk6WpLIIbfHGYTrIEzR5zdWz7pr8geLYvBajVkTM6wEiJm9FR+a31QKZlzn
         YrYJ0hSNmpGf/N6XpYzolRdJYU6KyGzRCEYJ9zPH/7tB/jMw2cbG2E1pCD7hvSn5U1wQ
         t8UAAhzL6vT+yIhzgUWpE2JF7kfOhP1NmRWXIpfBr63fhC9uKGb0ucN4UUmR94XQfwMc
         Awejs4aCp7eiwSY3zrZ9Tq3oMCE5XkkctOjYkKeuKrYGOOGZb+wb4DMtHQeyWqaCL39T
         SOixA69rNIGsOLuDdqTKl2X10hSGgyDnC97xuIWJAuNxve0vPX2dWVrhDBLm++Dvlg0X
         lokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525966; x=1782130766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZBzvTGg5RXWxT981zetPvdIqY02XPOz3n0/R5VS1+w=;
        b=lZxs2wzLc9FYHP6Qr2LoT8Jm+fjrPVYeMnAZBRQMto/8d6J20ejhNGaEykpHGccT7f
         Qr0cQ1nuLpLoG9+DFs34QvvwekjV/45FIrXJb1si4nIz0orBzzGItsIA4JwvNb+oAR0I
         zvs4wCrmmrfj21F4i7PAcYMMpEVZlMoml6R3Yy/71f5Qqesx9eTAVeQpGc2ICXC7BCQv
         rMoGEVYZOaaZ4OufK9odjdY5XdzFET2ZEo28AcGngAt0VeXYgNb5MsgBub/QiGSrZCy2
         AGwsZ5JMMiIDkEat3F5K4C65ZPn9659Py92jRx/kIBQ/P6UYP3CqMaykL5/w2BFFvHB+
         7m9A==
X-Forwarded-Encrypted: i=1; AFNElJ/FhlWtW+pxBZ3E00Ri49necWWn2vW1Wvu/UzzC1TIdwfJUkAtAbvDAC0TjRoj93Ih++iPljw92Y65xErlP@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpfgmvuj540m1k+OfCsLMZ36Ah2IgSHcDKtew1zdVE9/XJ5BXj
	qZEHNcZy0Cyhvm9HS4CY68ojCRW47EYDuxL81XLrwD1B8pNAVEoPd6eU
X-Gm-Gg: Acq92OFRDoUtGlRoJJ1RaaslKf7X4yhbl5SFpF1w9zUuCf9V6nOZ+sK6CMLSKzkCCAi
	LbQA94Sjfsb7hpqUOwlVxHE1TSMgM4AQYLTM8/a2n360X1VDa9pS3YoMHO0uhYXystNjfl+YjxW
	faAOn9yg03f19IktgRj16+k8Gwx0FZ0yKgyrcb0E5pKtpxSeJaJKwL1QivgNJUXsZCYjkNmnO6S
	yaMZ7JFFx5L9wsXg3e81848cFmJPyME3l14Vlu83ambnulJRa6RZMcuWYRfVMRwlWwON+/RkvYG
	D2cTzIyKv3lrh8gG89wRny4Zh9t2U+jNkxbJXP/WbTvEH8RS9xhRGaAdh6U3shKAAxDmkWHVkeI
	5e2x74KOiO4T8053CBgLHz8vSS1Es8LjkjUXXey9sPs7s+CnrWPEcm0vTQ7mGHrwomV34D1t8S4
	IeNJvpAJAcG4ACSA4NtCEUXFS5KvM=
X-Received: by 2002:a05:622a:1819:b0:517:5bc6:b575 with SMTP id d75a77b69052e-517fbc898cfmr190512591cf.4.1781525965791;
        Mon, 15 Jun 2026 05:19:25 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm106505581cf.14.2026.06.15.05.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:19:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:19:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <ai_txjwLPHsSKsJI@stanley.mountain>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
 <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
 <20260610144242.GF2948@ragnatech.se>
 <ail9bHXL_NV2DZK5@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ail9bHXL_NV2DZK5@stanley.mountain>

On Wed, Jun 10, 2026 at 06:06:20PM +0300, Dan Carpenter wrote:
> On Wed, Jun 10, 2026 at 04:42:42PM +0200, Niklas Söderlund wrote:
> > Hi,
> > 
> > Thanks for your work.
> > 
> > This patch gives me new compiler warnings, can they be avoided?
> > 
> >   .../max96724.c:402 max96724_log_phy_status() warn: subtract is higher precedence than shift
> >   .../max96724.c:409 max96724_log_phy_status() warn: subtract is higher precedence than shift
> >   .../max96724.c:588 max96724_init_phy() warn: subtract is higher precedence than shift
> >   .../max96724.c:756 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
> >   .../max96724.c:796 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
> >   .../max96724.c:818 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
> >   .../max96724.c:830 max96724_set_pipe_link() warn: subtract is higher precedence than shift
> >   .../max96724.c:942 max96724_set_link_version() warn: subtract is higher precedence than shift
> > 
> 
> These are Smatch warnings.  I appologize for them.  I know about them
> but I haven't looked at them.  I'll fix them by the end of the week.

I've pushed a fix for these to the devel branch of Smatch.

regards,
dan carpenter

