Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792884936;
	b=CC+zNFI0P9bmm57MkfwZZx9n7WzyuIkhmUenhI61k50znmIIGHufR3c9MaeKvL7CVPlL
	 KarzE6QjwwHzvw1Yjdii0RhN59F4KzMbWaF1lBI9teqBrV2IuvJbuK568j/FplO1ZF/jl
	 tscmA0WHuxMu+CP7Dk8n1kZLHvO8uiiJOjh0eKTagzMRg6LT0K1mflqCWlhOeDnP/ThKG
	 06OpCGEyPLp9GvpOc52rYZwW41wpsYzzdOndK4LK20zFwVzoZaoTihFVuITmyi46LH2jE
	 498LVvVhFilWSZD7FSyctkxwO215UrdlPgTiBuR0RH/GWGbR3xa01EFRs5G168PYAGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792884936;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=Ytrr+uxGRP24yFtKG2TutOCpu+EELEvRDLmQWlLM4K0=;
	b=ZnmXu7ZDW243kt93sDwZaIyG7GfQqMbrF30hzAkpCsZm7V75pbzlb4d182YcBBYmJxIG
	 mbD2FselYMTNMVA0jbLLAILoy/NEVNHXzG3oDjTpJfBeSB/Czdrx9M5hynQyALnmk/XuL
	 mOMzuYpjdZnL10IZz7aX9TqKqZHmJJ/8eVT1hAN1Af+NIN/rHvYZYQSI0oRagN26RmrmI
	 tHYsPQSFBWpsuqVHvrVkBSH0b1The7t3/HzizGg8tyk30Vh6LeSyQidg9V3U5kunwAUJ1
	 BW4F77mu8esxMvlBq0o8ujhQvDFVduIDG83ToYXWOrYF92mSTciCTTxizCHX2cK0zJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=fgQ762zB;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F89606A31A;
	Sat, 24 Oct 2026 23:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F89606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=fgQ762zB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ytrr+uxGRP24yFtKG2TutOCpu+EELEvRDLmQWlLM4K0=;
  b=fgQ762zB6RB8v3UH/r2RAKI9a001jYJ2pBpLbqDP9GoXXItMRHMIzHXo
   t80MS/E59edMUVDj0fRZwSIRlcS/DadLbYQ2eCUFS1+WSV5gbJcfztBxm
   Z7s/X5jTDIhXkATDyUt7K7LQqczGkV/kmsVtZW/B656jSzJ/xkuLhlMWF
   A=;
X-CSE-ConnectionGUID: IMYaHfwfSAOU1AxqeZ1RxA==
X-CSE-MsgGUID: HbsAwueeReOB2zJSIpkrvQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,177,1787004000"; 
   d="scan'208";a="160785023"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 01:35:25 +0200
Date: Sat, 24 Oct 2026 19:35:22 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
cc: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: staging: fbtft: fb_upd161704: Replace udelay() with
 usleep_range()
In-Reply-To: <CAHxSwT8=ZA2sFqXNjfX2=Bf369+gNRLfCO+VtVmmWiTzenLwWQ@mail.gmail.com>
Message-ID: <792c90f9-3eb0-eac3-72ab-94dda18322ff@inria.fr>
References: <CAHxSwT8=ZA2sFqXNjfX2=Bf369+gNRLfCO+VtVmmWiTzenLwWQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 24 Oct 2026, Abubakar Musa Samaila wrote:

> Hi Andy and Greg,
>
> Please find attached the patch that replaces non-atomic udelay()
> instances with appropriate usleep_range() bounds in
> drivers/staging/fbtft/fb_upd161704.c.

Hello,

Patches are not sent as attachments to the Linux kernel.  Please read the
first patch tutorial again in its entirety and then try again.  You can
also look at what others have done in the archives of the mailing list.

julia


>
> Thanks,
>
> Abubakar Musa Samaila
>
