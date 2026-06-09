Received: from relay0-h.mailbaby.net (relay0-h.mailbaby.net [64.20.38.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9128640D56C
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 00:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.20.38.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781049711; cv=none; b=JjudEeie1RBV29t6pKmFHswcBDzHkiY96wkx2VT2Do0lNvPHx1sx5NoADdP8i97hF4bu0b1Xyual9ChC6OE2KLUzIvLN2i+git47RZtb98Gn/LuMeHF9N7D8N8pLfOZYKZgKZp17WrvK404Y9VIJlTgBE0rHuocbD5tKwxf2oAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781049711; c=relaxed/simple;
	bh=5DpArjNZSrPynDzKbc6AqHEVcKeOag6lvCOazAPsjMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlNywFgG5nIwbizmCCh/v6OjAOYS6VafKNEUBKdJQ+0DCeYQbrn9wSunhb+PQk36HUnnQDHM+cbw4eYN40iYRnm8+NXVXO57RzqJ+4BtP+pYgWHRaTFV1RMxX2juOX8hObv7bg0CwQY+7lxm822C5kzWhMQjUuv9y75rA47pWOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev; spf=pass smtp.mailfrom=agatha.dev; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=giIt52MI; dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b=XGI63wGs; arc=none smtp.client-ip=64.20.38.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agatha.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="giIt52MI";
	dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b="XGI63wGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=5LIQMjvbIMriZrS9y1PR+p05Fl4snqtGEGssl/hGNBQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=giIt52MIbH//nKjKixJJPvlpzbIngRFnTX6isicJBztAd7E2k/XYWV23m2bMvmKFArm2FjcMV
 +4g2P68pY24XoOF8yqO0ShoZRT+4f3VffbHO/sgfJOmMU1ZSkOYEP1NIFRPQzranh1SACV9RXP2
 74QCyyczZICFclCCz+an/3I=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb6724)
 by relay0-h.mailbaby.net (MailBabyMTA) with ESMTPSA id 19eaed1018000029f0.001
 for <linux-staging@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Jun 2026 23:56:33 +0000
X-Zone-Loop: 900d8a3c119a0300fefd70741d8ebabe393ce6d2a0b5
X-MB-ID: mb6724|me@agatha.dev
X-SPF: pass
Feedback-ID: mb6724:19eaed:507c5a5c5e5d585f7d5a5951:mbaby
X-MAILBABY-ORIGIN: PASS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=agatha.dev;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5LIQMjvbIMriZrS9y1PR+p05Fl4snqtGEGssl/hGNBQ=; b=XGI63wGsfXZIMI6wGAFwIoCYka
	iuaaCiCHrdWDeIbFxnfIPtMre6yM+CcYFPaxk4eDw3j557mN9HFxcVi45+zd7db0jpx+DS6q5Yuh7
	c3gbIxz6FvQy50e9deMBqdMi4aQE5UgQShX746b5j0Eik9yzPU5e/8jM5/qTnta5FiYHQREe5m5vX
	ifPiC/C4vXlYccUqLM1/Ue75sWt2sdjENtm9gkA28WDEUliwr8+OAJSucTBzG/0mR9PKaBQ0GXE/T
	3PWOyxQaeNG4jmTWMPmLCzNhj8+cfd3WFDF3u3NEvprx47z456xMjP5Pw2zlzg6WDdfuGxNe7VGdE
	wsJHhC0A==;
Received: from [170.254.153.168] (port=39062 helo=guidai)
	by nyc3000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <code@agatha.dev>)
	id 1wX6J6-00000006Nq6-46zx;
	Tue, 09 Jun 2026 19:56:32 -0400
Date: Tue, 9 Jun 2026 20:56:26 -0300
From: Agatha Isabelle Moreira <code@agatha.dev>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [PATCH] staging: greybus: remove driver depending on nonexistent
 config option
Message-ID: <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
References: <20260609202705.183875-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609202705.183875-1-enelsonmoore@gmail.com>
X-AuthUser: me@agatha.dev

On Tue, Jun 09, 2026 at 01:26:58PM -0700, Ethan Nelson-Moore wrote:
> The Greybus Arche Platform driver depends on the config option
> USB_HSIC_USB3613, which has never existed in mainline Linux. Therefore,

Actually it dosn't. The `depends on` line says:

     depends on USB_HSIC_USB3613 || COMPILE_TEST

That's a logical OR operation, it depends on USB_HSIC_USB3613 OR
COMPILE_TEST.

> it is impossible for anyone to be using it with unmodified mainline
> kernels. Remove it and move the former maintainer to the CREDITS file.

Indeed, the impossible for anyone to be using holds true, as mentioned
in:
https://lore.kernel.org/all/aVuPidYUPZxCOdRp@stanley.mountain/

I think this should be removed, but I think the commit message could be
worked.

Sincerely,
Agatha Isabelle Moreira
