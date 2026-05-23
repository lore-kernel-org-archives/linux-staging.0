Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417713976A7
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539703; cv=none; b=qMe6evkSWL1mYXUYAExonnu8ASjsObnUpBa7tBSSZ4bLt3u8NgrkNtEJ4uuv7Z040GWpc0MzQ4F2K2YDEFPe+DCG9gmtAzPDIZ94NmRy0wWmcXv2WHb4CUQ8XSpW7Z9MBpBwBOUThmChse56+fAyHYF1XbacRZTOcgDr38Zmhas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539703; c=relaxed/simple;
	bh=plWOHTlUk0LDx5IeLx07VIBKW3agy6fRsfPXxGGN9Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIjeWd2xv4Gd/VMubc7d/sZQ4qpIRkDNQAE4vAhw90CD2k9ccIBrsrRLOI6Qir3qJfEECXMPhbO6CVCOTwxofr5u5vRMyNlpQCkVK6rlo7DQf8HcsiH7mjMSJ8WnwzyObM9NDVwrkJcCmOL3TXwyE1sMxg1+Vwp2Hs5+8dVhk9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ni4OWGFD; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ni4OWGFD"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gN1nF5lBvz9sdM;
	Sat, 23 May 2026 14:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KqJLF+81AJ4JSwa/bfSj4ODgiIzYPLKujip4XvZI7zI=;
	b=Ni4OWGFDZzBVVqOlbu99TP+OpFKo+6Cc+6pm4ozTxqAc1sX7y8KUeYc/LEH2rToEC3kndu
	Wbi48GipWkuTE32xx1sSrvQebO6x5O0XatWpY2Iw2Fud3+SIOOa0pqodKTP73xtDM3SUxQ
	EEdM/Pk1oNsw3KwGXRAsE4lefevi4QFiZ5krCEhUYCaN/m9uGRYkTirHWlg6+XXnuY7U8R
	KOVuws36r5t9C+kwO1EEXqxCzXiAM3p0PoJmyY9iV1zBxsDcC7Wwijmb+B/Oi3W8CGwHxI
	YhBLbzcPkzE18opO472hx8h2RJ9BMTrKLlJj639gppaDrEfYzEgcEv2IlcYQ1g==
Date: Sat, 23 May 2026 15:34:54 +0300
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: gregkh <gregkh@linuxfoundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary boolean
 comparisons in rtw_recv.c
Message-ID: <ahGe7kCRKJKIlNV7@debian>
References: <19e546f7b7d.2192aa4a49317.2370843901367566351@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19e546f7b7d.2192aa4a49317.2370843901367566351@zohomail.in>
X-MBO-RS-META: ps9a61w16ph5o8o56gm5mj6r99zy167i
X-MBO-RS-ID: 7c5192550313c8c9e7f

On Sat, May 23, 2026 at 04:14:12PM +0530, Ashwin Gundarapu wrote:
> Remove explicit comparisons to true and false. Replace '== false'
> with the '!' operator and remove '== true' entirely.
> 
> Found by checkpatch.pl --strict
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
> v2: Reverted unrelated else/break change as pointed out by Dan Carpenter.
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 56 +++++++++++------------
>  1 file changed, 27 insertions(+), 29 deletions(-)

This patch doesn't apply to the staging-next tree. 

I have recently done a massive cleanup of this driver and removed
these boolean comparisons. So please rebase your local tree and check
if there is anything left that is worth your effort.

Regards,
Andrei
