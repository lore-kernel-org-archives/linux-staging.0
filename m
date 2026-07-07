Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF953E025F;
	Tue,  7 Jul 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420098; cv=none; b=tLdXxDZDuOE3AQal+8/9dPwOeD61lh94kY/aoVEDi7dQ02pMQPl+lWSAAYoVyh4vMMLg+mxmkHXBTdRsB4OXnZFg2w0GWBRZLdPR4MX4FASayVIsRhIOYs2+z6DOXYrd4f99V4Z859ImIhNr29sd3Op5r2LycERCXYJnQfWpE/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420098; c=relaxed/simple;
	bh=JDiUlGg2j5mxjD66QNeAQpbLipmKwjiaXdHQvKofHLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amTBLxmq0ueX3nkXgs7vEFRmbMz7548lMazQGQiqys2DqlIWIYzBabBL7rWMSARaGyt3ZXU3+5z92KT7eBjhrCAMBtaGjfyRw/xR78s/l61eHCrQmYTHoxGFUY2ZyU6uu80qkJQ7Eu9HCsgpZpk9MyTn+1ktYVTHUdsUMLEOmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C8xpgAeP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C8xpgAeP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26E91F00A3A;
	Tue,  7 Jul 2026 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783420094;
	bh=46+bYC6reCzQWstyWxUnJVrmpn+WdtR/wpyleQnUyqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8xpgAePgjjOWNsgJRLaBMomODcTlzj1KEfCJufjVCcFqBXgwFQLZ2PNzM5clDE6t
	 6KAoyQjdH9Oh0Vuc3O5o/oXVySCOJfFeGiAV8yABHmIKlySZun/x4AMwRHXgdNVejr
	 DQMM60FLDPQzCCUA/ZNHP80I3Dq1IUkLR2H+GSAE=
Date: Tue, 7 Jul 2026 12:28:11 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Saulo Henrique <saulohsdoroteio@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch style issues
Message-ID: <2026070745-spirits-arming-f24e@gregkh>
References: <CAM09=pU-wLaqvizTt-pu595nSx2PRw8W60rraArTWRo8VFemRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM09=pU-wLaqvizTt-pu595nSx2PRw8W60rraArTWRo8VFemRg@mail.gmail.com>

On Sat, Jun 20, 2026 at 08:41:12PM -0300, Saulo Henrique wrote:
> >From 66175877cefddce1a2ea5ee2cffec427c05b21d2 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Saulo=20Henrique=20Santos=20Dorot=C3=A9io?=
>  <doroteios@outlook.com>
> Date: Sat, 20 Jun 2026 19:29:24 -0300
> Subject: [PATCH] staging: rtl8723bs: fix checkpatch style issues
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Fix multiple coding styles issues reported by checkpatch.pl, including
> line wrapping and whitespace cleanup.
> 
> Signed-off-by: Saulo Henrique Santos Dorotéio <doroteios@outlook.com>

You sent this 5 times?  Also, the header shouldn't be in the body like
this, please use git send-email or b4 to send this type of thing out.

thanks,

greg k-h
