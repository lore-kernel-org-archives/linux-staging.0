Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE13290D9
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776247632; cv=none; b=K0GvtWkb8Uc9eKzj10cBsVEi9VroBfLpMAmnopHG3njZIQ3h2xIw0aRhb0aGP0nu5u5AFR2wBP2CdHlQkEihytHnZHuDObUia37kK8qwg9XEBWOf591AjjbCMIRxoFW2YgsliYc6PpsY4uxVyiLLshSDKio6Zp1BE6sL8BSIf/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776247632; c=relaxed/simple;
	bh=+EHAfEWM90jKbDIZLWcYKq95z89L20I7QxcNlHpcZdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOSLm1AV+xFIgtClhdL5KBZLMOQhl60h2KAkvcXCFtIYFhLWuARl/Yrfst+I8JeliaHz7gOPl2/gsn2ZofsDp/OFT/gkac5s5sIF7Pcnng0HbW8tqPh2wNURuuH6JGZKl84674INl5kTXFORYBbNWma9CQPSvw64cLi/PENRBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJMrIzdN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJMrIzdN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso77192245e9.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776247629; x=1776852429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwD7g53BnTePogg0UDsCJwaAtnVvF+V6jFjATkNomOw=;
        b=DJMrIzdN6ruu3LHH8NfepT6V+rTMquBp+i2xAxiVT0d+jqz+F4ghDpwdizy2FiKMJS
         TlauRAovkrRLhhiuipZ0YRN38U7ZXdU8mZpyyel0Ee+RGYZ6OJgsx0orOPpulC0Phk6q
         h3oe+vuWTVoxxcmlwcTNIM8EQVvcqRQ0kjxektr66/QhlxI2I7vZZqApdPN6fOccbZ7e
         AeQ3GaZhE/SAp+PyEPFcP+3lYByL24j4kUPelK6aOs6L35dIlra6oH4PgAaMPfDYjcgG
         2lxc4VpKO7UUDHa4UPOjv2DQJ7nh3lTdlb34G13+su/B07vDl/q5faZ9zo1N2m+r3gst
         tVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776247629; x=1776852429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwD7g53BnTePogg0UDsCJwaAtnVvF+V6jFjATkNomOw=;
        b=X1nYlIAjk9MVMvgdeDYTQ7U14YX6R49JENgtNfTHplHHS73Vh9kuuTgdZHcrobGXt3
         e+p9//paFLfWEXse+BK+m9/owLdIz23Ahzn0bZMg3DpSeQbLi5IbVSPylIS0b69gCRkd
         js/Y2KOzUoFlhDJC4HVJPbmZzOwKVVpcuajWIzRemPTmIaEmg7lEuao/mVmkm5fTNq4q
         sazTXnLhOeno7Nsym1UX4sA96qdkshx46UY9rP0SrX/KOPJeBAFSGkuKoxj9vINHPmfb
         YjxluNNrSNEYoqYownZDIbdneuHuWvJMYfqMkTer0Rbh4b9fJMMSnxrS2qHW1LWMBZX3
         D2Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/strzS/vhO/ah+aOrg61wI/6gyrYSEr8PURrv5kxzpJQ85oDe2PCtZI+H47RSjwjtYfiZJA21ag9MPgkck@lists.linux.dev
X-Gm-Message-State: AOJu0YzZqVeP4lRTw5I90MAMTQdghxBmkZRGlKvwpfmmAXEfRRH9LLYc
	pc3NfXQ3/HUY6qjqj5WFxCXauLVGRWWZOz84WwVMacff7XfEsuA740FN
X-Gm-Gg: AeBDievwiKalVo/c4B05LbG0/y4oriVUdEAHbPhW8iL540M518perBq/KngBroC4uwQ
	3SwxavZupkElKn+CbEno69vbt3+uzxwAuTY0/emjomO0mTZX1nlib1MRzURPchQtK73ritW5F//
	8oLxQVJp0AYvMEIvjbx4EBnWhKe8Av4QTPvbrl4PhAYGVwWvxWUgNLUPoJEWQt/g5DFle0f8DpR
	rdRUh6Gw5Tv+i8jA++gpPdeOlCFFmfPpBvYNmI+sv4AuCzZRQewSasZE6k/a6WmvIA7kYOqjQyP
	PQiGHH3cyLmWOgOXkj+uraBilAjMgKtH+/wbIcBiKE/7tugVNDsKrmen8eNPKm4+ZxJaRA/nMua
	nw7ss6fyhYGRiG2LPDbPx+oEf7w47sl+bQGKi9YYxSk8qM1jG/0JZA0isTPDK564g/oKgQK8Zr3
	2ocD101mSx0jKlQwQamOI=
X-Received: by 2002:a05:600c:820a:b0:488:b675:360f with SMTP id 5b1f17b1804b1-488d6889a6bmr256997945e9.27.1776247629301;
        Wed, 15 Apr 2026 03:07:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f253647fsm55232475e9.1.2026.04.15.03.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 03:07:08 -0700 (PDT)
Date: Wed, 15 Apr 2026 13:07:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: clean up memcpy() in
 rtw_check_bcn_info
Message-ID: <ad9jSdK56l9eyyxi@stanley.mountain>
References: <20260415085638.6427-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415085638.6427-1-luka.gejak@linux.dev>

On Wed, Apr 15, 2026 at 10:56:38AM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> Move the ssid memcpy() inside the ie null-check to avoid calling it
> with a NULL-derived pointer (p + 2) when the ie is missing.
> 
> While the kernel handles 0-length memcpy() safely as a no-op, keeping
> the call outside the check is confusing and poor practice. This
> change improves code readability.
> 
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
> As Dan pointed out kernel handles 0-length memcpy() safely as a no-op 
> therefore it doesn't cause kernel oops or panics so in v2 changed commit
> message to move from bugfix to cleanup and removed fixes tag.

Thanks.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

