Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F81F2B8D
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372594; cv=none; b=Xgc6EOHUTiE8UcqsLwOKHwywe7mL9HMTmvB5tXkQS44iWRqDN7ZrDwtQ9B0JJBJ3I+k9NN25hjGux3ra9enbltb8es0YIEAlnAWD3g4TJYjq1DliQe1Vrxej3+hG4GwjZTv3HwvjxQf2Ud/p6vpqbsCg8xv+cct5Q2nCtowtJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372594; c=relaxed/simple;
	bh=5lvZg3U+scBEvCrZIXd9bemrphcj70EI2LHcSLTCqXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEsuEPqTI5Z49xj33/I1tgrEDJEWfNqVD1fJfA3+YAJhjOb+vL9Au228VdmljJySr3eBha7H9MTVSAH8fGSCe5I8qKW4EbpIEgFXMwQb9GPN7dVtEnoTKniKLFuFSbxlIdMm4hGHr4CzA25wAH97CflK5KOabpBGlA3Snhi0bXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeoeyRsK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeoeyRsK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44e1860558fso4001682f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779372592; x=1779977392; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2swC5pnP8/D641H89k3TH80CaPKG4obF2Pq11WZD08=;
        b=CeoeyRsKQ/0SL9pNqB29iSKqq/GJbF5ARd7Q9wiDoJs7yE5RLuunM/ZguURhBB2w1D
         1YWjSQvpb8kQHXBnuDj/Xg6xdQdfSEEbn2b10kNu8cdpAaJaM1ZzlfMLezc0W2Vi6x1y
         rPFCV5LCFTUULOIc6NZVX+rLWk3xXM0drpP7vVasBWfaToVaovtk25sDT+qqG5VNIWOc
         jErPmfiMkqswFWOlW3ZlMmC3zyGhjAUqlHkX6n4/JH3RKRSZgE+U8pRuDgYy4YSzFrin
         G9ydGxmEpNA1lm6FmeKXJHhCcOutHAPWA6JarDW4b+0x1ZDVsM+cI52+879OOsMTpoml
         TxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372592; x=1779977392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2swC5pnP8/D641H89k3TH80CaPKG4obF2Pq11WZD08=;
        b=QobbZbhrXpimRo/tr7yKBwfO0Egatkz3bGnPYzphzvpUs43PSOdYRsRTDGA0uoEZM8
         Xbu3S9U35jRuRsprWY/m/vD92oY96Uqaxr+wAk5zz1+euOp8eBjEnwvqLmdgHN2UX8cD
         qebKmfnJmaKQEVQanPThp+OODmHCKjbh+VxYh0yK1lyvyIPubbJfg8EoWzbkMRaOvs4W
         t4eVTXqNoWLUpTXyhxVzEeT3k0fvqWJRJPXOxd/DemnzDl2D3dOA3Rd29TR2+jBBxPB9
         kqL3eBEBB2FCDEM7Y/4Q3k0fycTcrR//9fGqhmhof9QZ6JUgMaxmrqhvTGjKB81qy1q2
         T88Q==
X-Forwarded-Encrypted: i=1; AFNElJ8KAvJPqSEbcwdJbforxfYR7P/pxts5Rjx5sd2UExxv0WR6cboPGIzAqxNGRyjKDs2IA9wvr+UNDzm3eI19@lists.linux.dev
X-Gm-Message-State: AOJu0YybmZryBYBeFoIqDtmbz/GL2DdCk8rAb9YZC9GyTlACnui+onlb
	w0tXUUW6DrWyTbD9FGLoVvm+1Zlx12DBDZb0Jk79Vtg2iIaYG13XL3B3
X-Gm-Gg: Acq92OGdZnZ0agd44xnsmnRfODoXAepUjKO39a7Qdu1Ln7XrDxuAVb6UzBWKT4YzPOO
	Ariw5q19CHYgEaKjJNgTktZbcnk/PFPyvFZj3shbfiiNjGY/FesZ0Y/BfFDjYn69qGGUWhdwyPu
	vGvH+tZSzVzAerLKMIayxOYoHRKivYqWqYDLfYbnkpEJjs0FNy3SV0Fv0VT3nPjkdzf8Wk+gM8Q
	wAlMlnWkGjJbQ3rw5UDgiV+37ildBLg+vewDPcSRMlYDZNtetpigucyppZdDs3Qc+F4d8vw1JwI
	IC/QS4QM6oa7CmCunMEfrQIEOU2CdaHD6QppB8+fdkY38sw9+HL9A7RI6tzMbw9VRrokkgpg1wv
	jJ5HshGka+8vRfsCEflA1xkYzDOtjaqxniHNWDQnFFv/kFyFw9RYnaSbGzVN3odIxmJN3EMY6Km
	rxk4okmMoGR3wWhDXHX5Q5s24=
X-Received: by 2002:a05:6000:601:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-45ea4126a81mr5187223f8f.27.1779372591682;
        Thu, 21 May 2026 07:09:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92ca4esm3158533f8f.22.2026.05.21.07.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:09:51 -0700 (PDT)
Date: Thu, 21 May 2026 17:09:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ahmet@sezginduran.net
Subject: Re: [PATCH v6 1/4] staging: rtl8723bs: shorten long lines in
 hal/sdio_halinit.c
Message-ID: <ag8SK_CdcCXr3MJ6@stanley.mountain>
References: <20260521134756.24546-1-artur.ugnivenko@gmx.de>
 <20260521134756.24546-2-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521134756.24546-2-artur.ugnivenko@gmx.de>

On Thu, May 21, 2026 at 03:47:53PM +0200, Artur Ugnivenko wrote:
> Fix checkpatch warnings on lines above 100 chars in length by splitting
> long function calls and long comments into multiple lines.
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 52 ++++++++++++++++----
>  1 file changed, 42 insertions(+), 10 deletions(-)

You need to add a note about about what changed between each version.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

