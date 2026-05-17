Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1852BEC52
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779047865; cv=none; b=KH1WLq6rsP9pnl38RE5VncKMhGMjTLEInV5nTzct7WiynPFynVUSdNwBqngeqlrmsoKBfPqz9xY9f92dk9XVMnU77pWG46EYiXNMJwbKfY2FMU6GjtWT/b+POpd+AFfgnVZeDfK1LWoZSQErp1oaY2df5B0OcxxGIZcio/OvF3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779047865; c=relaxed/simple;
	bh=RyUQt1EQ3I60uIK/Do579vvTJwX9n+7QKF8NsmXJW8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWrHqPhpE/EttrW1SYqICtsEolIMKadPaLQwgaBNg3C/vB/OfEeTNU232yLX9WOOs15UnnpB1LF7CPjCV4/1B26uw0iEGyC12i+xJTEJTeHX5ztSZwmScjXFDvSZ/PDMu65DD+n7wzUnVV1g1x5dojuQ9IMLZts9gk/O4tWQQKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=ZLbK1JYc; arc=none smtp.client-ip=178.154.239.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="ZLbK1JYc"
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:181b:0:640:6cb9:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id 23A7580BBA;
	Sun, 17 May 2026 22:57:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (smtp) with ESMTPSA id SvVvEIgSDmI0-YOdja3zS;
	Sun, 17 May 2026 22:57:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779047850;
	bh=sbb+FQbVVQjCCMDDei14LyUgPdT7sy2tbMko4Rs+3iI=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=ZLbK1JYcH3097wNBQmAiTrBx65mZvLmLeEmakoO/0wFPOFNN9idjDuTdYHgt9O3eB
	 v+7/3BBGZB5ovBhQB8Aa0i3HxBlVspijXr96+h5SndSUCI3yvrHBJPABRPD0YeAFiL
	 Bi3cL3kf4TCzcwLWWctVzvO3UebKElGINAOqt9ts=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <27a0c849-7aba-4ee6-89b6-362e1eb9c43d@sezginduran.net>
Date: Sun, 17 May 2026 22:57:27 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: clean up style in hal/sdio_halinit.c
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <agobLwfT2OEShgaL@b550aoruselitev2.locadomain>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <agobLwfT2OEShgaL@b550aoruselitev2.locadomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 10:46 PM, Artur Ugnivenko wrote:
> Fix checkpatch style warnings in hal/sdio_halinit.c:
> - excessive empty lines
> - spaces before tabs
> - inconsistent braces in if/else statements
> - long lines (very long function calls)
> - bool comparisons
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Doesn't apply on Greg's latest staging-testing branch.

Regards,
Ahmet Sezgin Duran

