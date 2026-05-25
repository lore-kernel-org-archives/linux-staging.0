Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DF633F383
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691741; cv=none; b=Oxv1j36eFcyuO+5T+OwjD9W+dNNIotQSwLX2wV34jIUxvnyz3Q7R3RYMuFsmSfQ5U6WVVlTeVONK84NggMvAfLI6d3kCvqFR16a2P2FCdTssYQ7kS8HcbX/GATnbP69BxTj5ID5GBstUySqCjIXk4jpWgkgEvdKa6Hw8B7SGoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691741; c=relaxed/simple;
	bh=HHq1QSUjs056PH7cjgywIQWfnmXGzYoIPUUqf5zLQDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlmmgIJDypARAnIYzHiwm4vv4qsENonC8bByRfGpomYSL3Q5hSSCcKgQuWayacAs/jPoqU3f/uYcllkHeS8MfX0220/kna32EOpVZHBP01P4v9KK8zy/fEdATG2GMUnpoNYvuLygfecfORo8t6apoZFdWPNNjLTyqPSCZZHu0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7AUgYX3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7AUgYX3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-441209fb77eso5708939f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779691735; x=1780296535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg9BVrSj6Dzn6qLL6Tv6JbsRCCZ5e73XFV6/+LT3Rzo=;
        b=Q7AUgYX3Jsqj06KIvAQjONysvBk+y0GB4P5vg6y/ewovszwJ+ho7HZfTJJ6gGwruTf
         q8E0KaZVDuU9rlxu/NuOkjt+zhGUKBiyfZxl3bClcICH4JpiUk4gddx974fgQ60PeNy3
         n11tRhWu8vydUezAR4uZCRpbZ+HjjdiSfMeS5I92x4XF1x1PSrCgkq1NeCEDxOCj8fSR
         zFb9F+5SVDj0CT+nZQRXhYNyyJsMme/rhK3RFa2GEpxG0eJg5PQWa1+4Eb/kbXzEctWx
         g2x/dsLKe77Wa3Wch3B5dy1rG2CjRiD3MiLu2ktGtpe8GnU/7jL6RK5TSZTeuG7HGuGK
         eFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779691735; x=1780296535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg9BVrSj6Dzn6qLL6Tv6JbsRCCZ5e73XFV6/+LT3Rzo=;
        b=hHhGfwd2UXWhMew2+dySoXaZukv5qVyojcxmUdtuv7DwiloNIw8KrS27F3B9+pPUiO
         rZ9HzuGUuHkzhoENWcYO5SRqJR0lnqKSGuNALGXFBX8lBIexTwnNDUfULR+N2WX2Whv/
         vTd+gg6LWJv/xi2pEkJZx0dZHzMa9jpi3mZ/HCPw5xAxclJLI4LVALofYbcFSLg6wEo5
         gNDE//anm03So6CjBs2qznTYxExZ8DkDUgjppbRKObns80cd/bFfvd+eE2iUqex93mqS
         LVBYQmPvIun05VspCbtXks8J6tdM/VqYbV2RmrdxO614Hta0wa2xI64eSzv9vLcekhTf
         pkJA==
X-Forwarded-Encrypted: i=1; AFNElJ82l+m6L5NuVggCiSlRw2aZ0bf/shX0uQnSqgv/4mx5i4/E87Lky0zdjESztLdu5RAL/KJTHVT1N4zQCnsa@lists.linux.dev
X-Gm-Message-State: AOJu0YwpO90De244ZiFyvwJvJE0K4V6/qSzuCsxv3vF8OEdbnnJL3y1N
	MMUExm/WZwK3Va/GXMzVJxYmJSiEFTYU6XUwUJs+W/SgPK78pcyZRpKu
X-Gm-Gg: Acq92OFsP87ZieDSW0M5kJNfklaxOitZrdPQgEFGOSBDwjMo3Jiuz6RpYO/4l6VoJiF
	xIXUzv4usR0h1+iFHQalXQILiWm6X0np6jwgOtGvuHYYHExWK0F5UKjgOPftYdXD/LLlKANWAAY
	xVJcQDyLiIipoR6myxYSiRP7YMJeBO1axn40ib7HO5XojqDYDmgKySUhpsB775q70iH1NQECBP9
	gSMwDWpD3z0k7wyIyYtmV74kSEMeN3tjKf1uTOnsvnXOxljK+OXvKOv3iJkdy50jRGna8Hy45sJ
	mDgwsP3ZU2bThWUQ3I6jLhX+Y8d5vmd6lbXPpHAeC1YDSDOMxyLjDyufzr7/Hj0V2ZXMGQ89z5f
	Osyx1CWUdJPA9krF6iJYcNcJ0TnTPxOhPZ0aym4kBDEXJVn2zgNCRcQFn+vlF/Om0Ax0+O1gjBl
	jBSSb5AcUqq+BINYAB/kE/RMmRvzRn/MJboQ==
X-Received: by 2002:a05:6000:1a85:b0:45b:d872:592d with SMTP id ffacd0b85a97d-45eb3123c54mr19243503f8f.10.1779691734991;
        Sun, 24 May 2026 23:48:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f6ffsm24971846f8f.1.2026.05.24.23.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:48:54 -0700 (PDT)
Date: Mon, 25 May 2026 09:48:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces and fix
 indentation in HalPhyRf.c
Message-ID: <ahPw0yB7Ax3lfhKu@stanley.mountain>
References: <20260524175247.5229-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524175247.5229-1-igorpetindev@gmail.com>

On Sun, May 24, 2026 at 08:52:47PM +0300, Igor Putko wrote:
> Fixed braces around single statement blocks and corrected indentation
> to follow the Linux kernel coding style.

You're going to need to split this into multiple patches.

> @@ -230,14 +229,11 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
>  		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
>  			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
>  	} else {
> -			for (p = RF_PATH_A; p < c.RfPathCount; p++)
> -				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
> +		for (p = RF_PATH_A; p < c.RfPathCount; p++)
> +			pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
>  	}
>  
>  	/* Print Swing base & current */
> -	for (p = RF_PATH_A; p < c.RfPathCount; p++) {
> -	}
> -

The comment makes no sense now.

>  	if (
>  		(pDM_Odm->RFCalibrateInfo.PowerIndexOffset[RF_PATH_A] != 0 ||
>  		 pDM_Odm->RFCalibrateInfo.PowerIndexOffset[RF_PATH_B] != 0) &&

regards,
dan carpenter
