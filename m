Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A17C25B0AB
	for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554405; cv=none; b=r9iod9A/x4m5z2QG+2LuIZ8jpH0qNNB2YRiMN/z6fMJAd+ZkUUpqbRaS2cJarF9oXoHuXsXHKilcJ+kDAK4ME4p0gmwyRcjZHrCpG+l2QfPF/t6UtaDnEs5OMJXHcvGDthT9AdpfKetKdV49WQhEsfLVXugw76ug2PkGIMH0YCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554405; c=relaxed/simple;
	bh=pO4KxckqlmOau10oim4Efs8550QkOWuJvAT7+QzfHKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IExDWLITVi2zXkbxpkFQVWdFw2Bi+oyUCM+tY25/6ioQ7tN2m7oncmfKFz7qT+0rOxFf6bSb0PVHHPVM5O3cj7HYZacQedcovR218fhMJIdsgsVxRtac4tBexztdVUL6DjsdyfyKG2UOaNO+WHSLg7cgbbL5VSJN32tjfm1V+Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJMfgsDu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJMfgsDu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so24476825e9.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 23:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787554402; x=1788159202; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1tc7P+DJ2q/zsatiojt2TmU1wmqNBXKru1RDam6Ht8=;
        b=KJMfgsDu6pNw3yIJ0uRnpgYES431Zjfexas5sfffd7VT9UPxhjaBT42CzCsnwwvK5X
         EcLqlKgbY+mY7n/mUcIpZPtwo2bLf67sG95yDSU3km9qZsyvrkqxQuej/e2VidtpYYEe
         U+hePlAzEivV7HYZfMhXPH3vCN3Pu2V+2/0Bfh1Om/wqT72XDSvSNbhRStEtm6S9CC0F
         j6dWXaNfudWALeXEI+BDHqnAJ9wA0YHOs6t6DTw3CylzYavWXsGHnWSqMQpujL0GkevD
         eGqWkQArrYz8zKFd3sij+UIHbm700Lst6ygxkkd1Cf4snNuQlIZduMTy+dCTBvjJ4c4+
         IdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554402; x=1788159202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1tc7P+DJ2q/zsatiojt2TmU1wmqNBXKru1RDam6Ht8=;
        b=AxG2gXoyk6R2UUlihRgYtzHiZUW/pd4J7XKMyfsK9dZC+nQrqQR65R5gEwtjBTc+Fv
         fLWLIe8qxN6iYff9xzmnk/4wNLHP0MiHtNM+8/kX3kTLjrjYeJ7tKxksKWgnWGu3C3nY
         Fxl3kdS22hUfewS9zgXb7W9xoz3vWA6pLu6IV4oVLXK6eyGFm5vVlsBTs6B+A+Kc+8Qs
         3PP+zVkCS4o+z5lFXxXcSWLCwfhWOPWeWOwsnFimdO80C2mgX7+dFRNenBmF1MaubhSa
         3/vuIbT4GlEuT0ZGXzCcRxMcv8P+S71UQTyJn4/LBJpjuYbSY0+TMWk4KZB10GYHuvK7
         7VTw==
X-Forwarded-Encrypted: i=1; AHgh+RrVp9YVOE7R+SNL0DEI4jkx08gjB7SJ79CkPur4Tb0iKuyuSsnXQmkEP5KkcWI20O/SMqsWFndv+XNcjZTP@lists.linux.dev
X-Gm-Message-State: AFuF++nImh8XxwVbuKZ7V2Ul8dFKpbup2GomY5kNZOrgw2ZACDxEef4E
	zahOA9UVh1FlKOkvVRyGDYc9b+vIXWu9uG0K15uopaxbsFRO7a7HZjZ7
X-Gm-Gg: AR+sD11YQDVASiNHXBMQqanRceeosRy1RrEhx+JhIrVgWahR4slhPhB80U4j7Ir1/OO
	cJ0WguP07bGfXVBnLykJmrlbUK66d0V+pA9+zYLGvEDaKxMGkciHSY7mPrSnYdX8Y03vJ9LZ5Zh
	y+G40WSPc8AB6eLhvQpE4eCmBrYG2A+LGvs80kprZ5NDbKI1pdC7CpdCk10k9NyypDmeOMrqY+i
	M5kPBHj703vMSsDEbxHECjQgh9ZvxUkyYmdW66fnnA60xIjZAHSxQwhEs0S1ognwtgIAXCgfAvT
	AFmNwaPaDncv7UvMyv7ip3qwf+s+gNRccsAwDgxkKy2F2RDoSZnFSE/jwhjXvCmNBlOCezhL15U
	sSxCk05S3iS2mPiljIaWK2q9/FbHxxdCDjxtJwDhZUEk0rgah36IEiatSEQFS0d4EsUTtG0wZPA
	9MAnNCYhb+M8UJSSaJDgwpuIRZsGGcuY9zNtNjTAnsiTycqUNBTUvjlvpW
X-Received: by 2002:a05:600c:4e47:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-499b8464503mr298725135e9.13.1787554402293;
        Sun, 23 Aug 2026 23:53:22 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d2e7a8f9sm4908765e9.10.2026.08.23.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:53:21 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:53:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Samrudh Nelli <samrudhnelli@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com, azpijr@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: rtl8723bs: modernize locking with cleanup.h
Message-ID: <aovqXYJ_96AyG2aN@stanley.mountain>
References: <cover.1787421961.git.samrudhnelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787421961.git.samrudhnelli@gmail.com>

On Sat, Aug 22, 2026 at 11:53:45PM +0530, Samrudh Nelli wrote:
> This series modernizes the mutex locking in rtw_pwrctrl.c by utilizing 
> the guard() and scoped_guard() macros introduced in cleanup.h.
> 
> Patch 1 converts functions where the lock is held until returning.
> Patch 2 converts functions where the lock is dropped mid-execution.
> 
> Samrudh Nelli (2):
>   staging: rtl8723bs: use guard(mutex) to simplify locking
>   staging: rtl8723bs: use scoped_guard() for mid-function locking

We're not doing this sort of change to existing code unless it's part
of a bugfix.  It's just a lot of churn.

regards,
dan carpenter

