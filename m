Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A42F290B
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383306; cv=none; b=PIGp/xZdj2yNG3rWbUN38UY8AIdUID8pxk5+76WVHRvnm3Qiq5euMmXTo+S/ZOVUA9ftdGjGaEEGYCMQAzIcgWd1el1qHI1mnZILH78bUnf+nqJMAo5xq+NtkrNXCUnKhkeK1mp/w520WfKZMxAwxdK1pi7Ldy+vfisjU1E37Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383306; c=relaxed/simple;
	bh=HYgZXJzpaPo1lhmxJlKVYQ6TqGUOOhocJO1WrPJL9a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWoLDVL++zH0yL8iBETpD+QtUaTWD0jo9ZG1hermURHMIl3QHBAKaCvZf6mbC2ntsLS0Gm3SeNvZRUVx30qu0WFl5dUf1YH9u9lx8SpBSOf5qabZ2cyOm4xwteK7HDqhbm2JXzs4fCVQrwqxCvishJlKAKwFYqMBbabtyahSBf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S35dvl47; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S35dvl47"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-48633190849so845424b6e.3
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 03:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383305; x=1782988105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otpXdjNkhvgaZ3XJWWSziZvKCi33swAVBBkTmAhDpkc=;
        b=S35dvl4730q2Rmcn10FDKcGO+D+SvuDKUa/FxVmrnKTkm7fJY9eC/fTu1KhtRRiTXS
         rxfKTagEyCo7FEZz3OpHev/R6S9fz7UHtrORo/IaNjklyWytBMvlJRtNbg7Ilwpqf6Tl
         Has1PHQ9KAR1Fimh/dKjFg9BESqiMlBLbYIQIct7kx0SFbpbt7XqGhrNCfljR/q6xscr
         Z7WbovKwQcJZeFMncz3B6JmIwaO8IQlsPVhunIzVVoaVTu7eV3oSDgLrtdSgAgOH/B6o
         0lMLbkYkZdCx4zpl/ceWrOGFrUDb4cN2U1iU3iWn+x/+bmtrhT1W3t3uPYMKVomtObSI
         dVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383305; x=1782988105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otpXdjNkhvgaZ3XJWWSziZvKCi33swAVBBkTmAhDpkc=;
        b=HtZXv39Gxd68DDAbj92rkkD24RjXFo8w3zmRgtL7HZoJ7a8fKJYhz+Q66ZaQFncOYZ
         wLXwo3rw2QE/QICbxNU1T3AByBhHGlJP1vdK9hTAt5Fnqx5hWo89cJ9h2cp1VwiEwf7t
         ZrRhIFmjml3SMPYLTqwubCsNbzTwR70rS2s8ikGp2MrAkRa7JLs6SKAnXkwsEFaxYm/v
         DRdYZajKTPu/V23cbFGA8b0Gkk+q2ivDFYJj3Oc0Q/FTkY8CtmWgc9edIdOO0IT9HyJm
         aKAKnRbUVCsJy0Lvix+ecx3mqCOwmMVAaFxFsF9wr1xM4UyXp0xFTtjgJqPw6nhHN3W5
         Okvw==
X-Forwarded-Encrypted: i=1; AFNElJ8QEvk60GSGHNo19LSsFYB+B5FKKLpAJKMbf4CGHtniVUvbWU3hJy7k6h1qsETIn46A0YwPNHpJwpNG3XvR@lists.linux.dev
X-Gm-Message-State: AOJu0Yx08RJ/AEH5HmDf9F0URwrTYbLV0RtTLlA28lbgnwt2vpMtI8RM
	Ggaaqus6lp9Woub15HTEGBh7ivfgT/bkWskcQP7290KSHmjBZgIGaVJM
X-Gm-Gg: AfdE7cl+nqcIJaWLSYcV4wq3TXqs8qeCd/xZ68wA8wSrqlhWNZxK067V0+QPMxJ3D5g
	5+mMJlHThuCUGJft5gmjqbGuyggFLWjD5npHAl8DZSWioyv4ZtRB+u//QCZiw895q4Jjww+38Ok
	sTvtJGMkMsJ/0A92yZkDq6FLgDsIdODJvJaZpf8eaZ5EU/7ibmKQLKnJVx/2zcgvwDZKAOZMOlS
	r4meeSvr8ZdDToGPIlvJHh2xpkKrX6dpgsFTTh6NQ3fnSvOX7JSKRRo6dh5DWKRwT7kAhivZEhD
	f2sN7/CHtQD6C2G2a9xT4vows6ImWioBNjxuxGtYE6vH8XXghlv26wVVBLDDggA8nF0Rprm2Cp3
	BFFKoGj2DUZVhza4TUZnjAhT0UpLkbv6ectGEab3YjKqT+mTOuNusHxtT8FFA5dEJ5LnaOCEG+0
	j1OEVK
X-Received: by 2002:a05:6808:6718:b0:490:b586:1459 with SMTP id 5614622812f47-4921573deccmr1924568b6e.2.1782383304720;
        Thu, 25 Jun 2026 03:28:24 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aebb9f1e4sm10496756b6e.1.2026.06.25.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:28:22 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:28:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: replace empty modifier argument with
 no-op macro
Message-ID: <aj0Cv0Wzb3rieNqW@stanley.mountain>
References: <20260625092721.238366-1-suryasaimadhu369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625092721.238366-1-suryasaimadhu369@gmail.com>

On Thu, Jun 25, 2026 at 05:27:21PM +0800, suryasaimadhu wrote:
> Define fbtft_write_reg_no_modifier() as an identity function and
> use it in place of empty modifier arguments in define_fbtft_write_reg()
> calls to fix checkpatch errors.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---

I don't hate this patch, but I think we've decided to leave this
as-is.

regards,
dan carpenter

