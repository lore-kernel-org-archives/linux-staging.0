Received: from relay2-q.mailbaby.net (relay2-q.mailbaby.net [68.168.211.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C711411693
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.168.211.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107314; cv=none; b=hPD98f6KOl0x/uEgqvhzbStrevKQzEzmuRVg+VIlCvYOc7OmaJ/fOsUZOCsj4cv0rjaiU/FwDh0/zCInKHb2kk+dJUvkUEkNYPqR6vaV81qU08OdXYJFFj0v99vuv7f8AhFUq1gs+kiC1fZYLVGv3DOWTKzDtTETcYrYHwnUBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107314; c=relaxed/simple;
	bh=gA61HLDHc1yrmRTfFyKQptqwlGMJwx28mjDugCGnILY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8l7y4tIgJJRLZHIKX3O1+DNBnzregUh8SLhcqJet42LR/rybHXGxt+f8TzqF5sBvBogZW/bJnn0/ovnY/A1NY0YpG8doVbS55UeWOl7jEq8QT7EbXiBxleYohBTq/EFi178KP1jRMSjQ0GIJEO8Fy8wl/1gFBf5+Saq5hpGPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev; spf=pass smtp.mailfrom=agatha.dev; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=dn2F55zj; dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b=Hf1U1R9r; arc=none smtp.client-ip=68.168.211.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agatha.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="dn2F55zj";
	dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b="Hf1U1R9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=dXkquXoLXVgBlIqba+dV3n+xr4jjmhx766YSiM2pFno=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=dn2F55zjZcgHw2lZBbgHQh8Ake0AXt8vJwHrcmFG9wGC1lmsFi/cROsOQqJMLsaiyWOP67PFF
 mH6Kkq+vTd/6SfbqTcd8AEfLpY+kLJe/8hwfw0yDTdLx+kl2iWLfFz6eGwzJbZcfPiZugx5A6QQ
 NISY7zUf9Jj1pfhgIjYGOBo=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb6724)
 by relay2-q.mailbaby.net (MailBabyMTA) with ESMTPSA id 19eb23fed6d000a02b.001
 for <linux-staging@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 10 Jun 2026 15:56:34 +0000
X-Zone-Loop: e5343e3ca01fccbae362d5250c5771c8672cc4dac673
X-MB-ID: mb6724|me@agatha.dev
X-SPF: pass
Feedback-ID: mb6724:19eb23:507c5a5c5e5d585f7d5a5951:mbaby
X-MAILBABY-ORIGIN: PASS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=agatha.dev;
	s=default; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dXkquXoLXVgBlIqba+dV3n+xr4jjmhx766YSiM2pFno=; b=Hf1U1R9rpAE/Fug0fQ6pDv9uil
	BgUXduQszjqV0n0T9g4YwAW1Z2iZA8nSjovIQ1++Ah6fzAWmBBOBDjSRnhYmVPMKrYzDBbPRdZx46
	EFsLoEclRx+awt8VbLHgzkpNMMTRR2vh+09fws3bPFDKGK/RYIyH2nt5S94MBLZMfawkT7QDoYmHt
	7RsFFB1XV4bIstxwZnfOCRq5kNe6TRiwcL/oLT5QGmvuHc2nmRtTJEfor8tVvojCg77a9hJhzQZZQ
	Y9gTct7DdymsWcpfBCKqmZu2WGr0Fks9DQovAt1xP0jS/iePEB9TzGV8yPPkUP98osY6cZgSPXXVh
	gAH0Ot1Q==;
Received: from [170.254.153.168] (port=38428 helo=guidai)
	by nyc3000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <code@agatha.dev>)
	id 1wXLIA-0000000GTCj-1PWR;
	Wed, 10 Jun 2026 11:56:34 -0400
Date: Wed, 10 Jun 2026 12:56:27 -0300
From: Agatha Isabelle Moreira <code@agatha.dev>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [PATCH] staging: greybus: remove driver depending on nonexistent
 config option
Message-ID: <guidai1XKN.5119.20264910ailrVzaYHJjfjtzS_13611_LINUXKERNEL_AGATHA_@links.agatha.dev>
References: <20260609202705.183875-1-enelsonmoore@gmail.com>
 <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
 <CADkSEUjVYOCYDRkr+WYD34_LH=gYGRyvHfwWH6q5jPLZBtXeTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkSEUjVYOCYDRkr+WYD34_LH=gYGRyvHfwWH6q5jPLZBtXeTA@mail.gmail.com>
X-AuthUser: me@agatha.dev

On Tue, Jun 09, 2026 at 06:14:41PM -0700, Ethan Nelson-Moore wrote:
> Hi, Agatha,

Hi, Ethan!

> 
> On Tue, Jun 9, 2026 at 4:56 PM Agatha Isabelle Moreira <code@agatha.dev> wrote:
> > On Tue, Jun 09, 2026 at 01:26:58PM -0700, Ethan Nelson-Moore wrote:
> > > The Greybus Arche Platform driver depends on the config option
> > > USB_HSIC_USB3613, which has never existed in mainline Linux. Therefore,
> >
> > Actually it dosn't. The `depends on` line says:
> >
> >      depends on USB_HSIC_USB3613 || COMPILE_TEST
> >
> > That's a logical OR operation, it depends on USB_HSIC_USB3613 OR
> > COMPILE_TEST.
> 
> The function of COMPILE_TEST is to allow drivers to be compiled in
> environments where they do not work, to enable better code coverage
> and easier testing of tree-wide changes without cross compilers. It

Yes, and that's been also discussed in the thread I linked on my
previous message as well. My point is just on commit message accuracy.

> should never be enabled for production use cases. So yes, technically,

Not the main point here, but I'd also note that no staging driver is
intended for production use cases.

> it does depend on either option, but only on one "real" option.
> Therefore, I don't think there is anything wrong with the commit
> message.

While I do understand that this driver only compiles and cannot be
loaded, I think this piece of information isn't accurately described in
the commit message, especially when considering it's been argued about
that in previous patches.

Sincerely, 
Agatha Isabelle Moreira
