Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93DD181D05
	for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721247837; cv=none; b=KXli86CBhaUcD65VXZaiDtz1bcX7B2nlRxpfsTAtenRu90kI/l31OjM+C7kfwAWr4mFuRXqUqlmtimPos3T/03QGXseZUIi51X89167jOXfanDckmkmmMGNUwIV1iSifECdoGWLAf+/ESZedAH5XbGHVmdAD2s4GA/XUY6aMJl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721247837; c=relaxed/simple;
	bh=/PeeJo6s5Xkc59y/6eBFEBnzzvUdGV0apmE6JHgTRV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoJQ0sO0B8UmJWnVhYfEo3vVE8CEiCPNz9OMzT7pz2034FR7BvLTiOwB1K1r7G/wP63bo/niXGio7Az5R9jRKE8xazWW2cpHefCGRcvlaER1mG/7+iixTEGvdSgyj1eV5jNe7SCk3Z2ZNHP44iPjECBTYykxHxueJAGNU9/GUqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFhsvLJy; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFhsvLJy"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25cba5eea69so60878fac.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721247834; x=1721852634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5e3g+13CX7VcZldCKTUfzwKWlB1ZRwLIlmnMdI81t+o=;
        b=jFhsvLJyL1YfH9WxmUbocacVQEXAhGUPTbTh9v7nMv0GN4QteT0MjgjqJ0cM4a/NsF
         msELSNdPLRUjJWC+c9s37KrvB3PXHHwAkdn20glTQUe4fBDFNFcveTyRINbpwaZP1uIz
         zspvJjLixd9xuX4MjWEr5zN2/QF2piu9mFnZDJ//gOZdDJlveKUhCGKRF/0/Ok1g1kjd
         GfCYuYfrzKcC8Ez3ENO8SbT1MdBg2NhyjT4spFcEc7x5OUNzjdAMLxFjK70HjC86UXyE
         EspcwRjR9kEmuEoZ3ddrenLORSYBpDPurLsPxisjek2569TAt4ldKzdjEaqaQToLVygK
         licQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721247834; x=1721852634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e3g+13CX7VcZldCKTUfzwKWlB1ZRwLIlmnMdI81t+o=;
        b=ZA9PhWJq28t2QkT5Xds490JkRlbPaP13tq9yqvyaPoSM9NR/ln3n2sJh1Qs7dqeQfb
         jKpsWNSXV0JENx8fKP+PlurVfoOMdAhGi/QpLpff95BXvm3SUGqMa7m9YjjulWBgBRnZ
         TSjB+BTICeMoIbpZr19aZ/H0b/SsJVtS4mz33pLClXcCSs/fTKbrKgNg4CFU4av7LwhM
         lPVa8DzqmjccPXc5c69nfO3RHzogfPHf0zpz4fSJId0+58p21p9RKh+DX8GF52fu4SUN
         u9vSNMip+tuSm5TQbdVg2yElOfWaLKIF1OosNn2COuk8mHflO5oz2ZE2ETmlge3Cp2ap
         FWTA==
X-Forwarded-Encrypted: i=1; AJvYcCVmTnPYYE+JHqD0vJHbQPtNuwQQtKFoN9zy+0EOU0MOKeG1jxX9RMhJJbrL8RPpnATWmDFLnI8IptJ4ntl52TGzZJQlRcVgdkz1mFyOSw==
X-Gm-Message-State: AOJu0Yz0ykBqepvo/wD/xf1+44kr2UbEgLRw1K+RGK8tYZgdjLkhBONj
	XDokrFkyGkmL1k2u+CtlyTASHS8UCfhtRVy8rH5L48kKz3s1RKn81Mu22jUqxrcLgNKyXrRbNE1
	Q
X-Google-Smtp-Source: AGHT+IEDo6jZSJwXAi7aXkPWYYCOMd2LzX9Kw/erTdem7SSYVzXlXN+1MJ10cMTysxGsKqhkYs4Vrg==
X-Received: by 2002:a05:6870:858a:b0:258:42bd:d916 with SMTP id 586e51a60fabf-260d919198emr2288670fac.14.1721247834643;
        Wed, 17 Jul 2024 13:23:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f90b:a43c:39d1:be63])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260ee9abcccsm70007fac.58.2024.07.17.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 13:23:53 -0700 (PDT)
Date: Wed, 17 Jul 2024 15:23:51 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Moon Yeounsu <yyyynoom@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, Moon Yeounsu <yyyynom@gmail.com>
Subject: Re: [PATCH] staging: rtl8712: style fix multiple line dereference
Message-ID: <3a7af5ee-faec-43b0-9617-71fe37f22936@suswa.mountain>
References: <20240717130636.2139-1-yyyynom@gmail.com>
 <150abedb-1eef-4406-bded-a1fe2bc9ac17@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <150abedb-1eef-4406-bded-a1fe2bc9ac17@gmail.com>

On Wed, Jul 17, 2024 at 09:48:55PM +0200, Philipp Hortmann wrote:
> The two warnings need to be fixed. But it is very difficult to fix the line
> break as you would need to shorten the line itself. May be you like to start
> with something else. Feel free to contact me directly for any question.

I would shorten it like below:

regards,
dan carpenter

diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index bbd4a13c7bb9..ffeb91dd28c4 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -528,8 +528,9 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
 	if (unicast_key)
 		memcpy(&psetstakey_para->key, &sta->x_UncstKey, 16);
 	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].
-		       skey, 16);
+		memcpy(&psetstakey_para->key,
+		       &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey,
+		       16);
 	r8712_enqueue_cmd(pcmdpriv, ph2c);
 }
 

