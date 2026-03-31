Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F103C872F
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 22:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774995199; cv=none; b=BwThJGZc3vomBwW+Vt47DSVNy/NRvbTObGRL20TBWRCkDyAN8bLsYdcqTVALDcxGOH2boitE29TQavjXtCBSh7ukMeuQTwjIKNmSr892r+BXcmboImyfPDFEfCaJMtmtk508z4SxVNupkoEfBk9MaJPqo2mLnHcZpvoHQpdHyTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774995199; c=relaxed/simple;
	bh=HuQHc4b6hKFhKQ3oGfTPqSdBetYj0QzNoKB9C/BOmz4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=sUVu4rwj114lbnNYGI0hZEF+Xr+ji2L4a6y7A5gNAl0FIfbuJEIobb0bYuK+jshtreNTj70Zq2gYG4zT6cV7zN1Y+k9ooxKPj3ASkxfF/yTHMxozwWZ9asDNeCZNYkS7Pd/BjcyAVUZ6LdIwVSvzPjucygPphHCCSMYkmIzutsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj5wcKtC; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj5wcKtC"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79f855b2575so2348617b3.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774995197; x=1775599997; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NfeRpmDAJtx0Q2R9lsEeauc+/VC5cMaQXZH5LRFKfI=;
        b=Hj5wcKtCYd++PKNwNqTGmpHdsVBxMidml4qPxEXIVZ9L5Y9qPHa1q5WfhjWlJE5pnM
         foYjBWFYTwJ3WyggtvPOuw6ckNy2nGBM4AupghgcGy89WRDOQy+wZ2Coxn6sfeE48lAT
         MkxH7mLzv1aAqM3FBz1LERJeXy1RS7+yajh5F8S+krPfMpX4LPHMVT1SH8bRILPA3fwt
         PADbGICTBuJpW3h4DPxIGQzBD4sq3rNfTFhmJGuGc2ha3EzmaSTHr3HNYFtU0EIwvlWL
         oJ/0beiwCg7DYR7G93Wja5wwKg3846Bp1VAiPqxpW0xNk7oEKee4eqS/iNt0Y3EzlrYJ
         jqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774995197; x=1775599997;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NfeRpmDAJtx0Q2R9lsEeauc+/VC5cMaQXZH5LRFKfI=;
        b=TEEPiW0hCksbhhm3kw65ZiWfXDmcVnIF1DTLCr5cwpo6MEiDOxq9dIDOEIAWROnvWq
         OwC1XumGBiOeJxUs850Jo8mW/OrHqjLoQcbki0zPJvrmQV7EBrAQ/NRy3sePYdOHeRPj
         nRZA0H0x4mUrA5LC3aSJpB78ef6HOR17PzBqB80bI7/X89BD8dvgPERCGJnx3Lu2yoQf
         t7KaodOiSrtr3gRHbQNjJ3pYkrJXa4tl1bwnFF/al4je7Iy96ZLYa8FcsPg22OuJSaZH
         fIY7FIXhRL8mSl1b2y/P0mvnfwcujgi88HcXYzBhAH3Q5DI7qh9njyVW2ZQu4PdWudAF
         9e0w==
X-Forwarded-Encrypted: i=1; AJvYcCWw5U3WBNL2sZIcTfaPHa3Ar8zhSeph+UJuXb257mFfIL0gUoSWMVao/zfUziS3ilgqZny38BE1pyebk3C4@lists.linux.dev
X-Gm-Message-State: AOJu0YxIJQsJRqGdb8vvW4yu8c/Tyfj0y63rAKmthdzB9Pns62cnffKU
	o6k9YUdAenxKFQhPa4wpFnLkCju9Axfi8M3R9QwlGMA85yyrv/VHMdNP
X-Gm-Gg: ATEYQzyP4qC0H4wGZTFmYWQ90GmqSWRAef/5gu+UKp4mx5jsu9G2jINxSwY14ooUr/D
	ilpL5BpC43S8/Segp7XHtHDANk5IrD2phgqI7ePNf+azZrFZTMNU1L0L8tZLrfnWY2FqYBb7Ntk
	vw6QD7NTet2pmxVJpu0gNL9RIt/1gT6v4SgfG5DtQD6f+AinbVeZE6r8RlSgnet4//cK7FZAk9o
	I1YKHwu4aS95gdcoxbLljTOSphlOSxfSAJsisR/PpBO33uQTu3XRZrRcHT6Izj3p6nmo71FZzkt
	fdNjk59dYoVID+fLXfcp6Uko0IN1qAKgAzUGkDtN9Vxt8LNBwIj1yLgttXUDT2c7Dcmbq/sveuG
	0p5DXD6TztY7ljTr3ZNc17+zc22z9mBtpqTHnWpTHbTokHi66jtFymb5V3agrrkm2th/BNDSxgi
	RY+160GEIF1aAKhdQ2NX8t9C1pVV8u8DvK8G/ms5MWyJ5rAWHMokMYLrePbwwTGe9L04LzFgEf4
	68sB7gjr/s0YGWOY+I9T1M7rjLcgz/iPuPer7bkKho=
X-Received: by 2002:a05:690c:4806:b0:79a:b440:5c7f with SMTP id 00721157ae682-7a2104a49f7mr14625517b3.2.1774995197494;
        Tue, 31 Mar 2026 15:13:17 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a09583f32asm18799967b3.24.2026.03.31.15.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 17:13:13 -0500
Message-Id: <DHHBA6PEJEWK.1V2JC433HHM9H@gmail.com>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: simplify boolean comparisons
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Andrei Khomenkov" <khomenkov@mailbox.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Luka Gejak" <luka.gejak@linux.dev>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330184640.17795-1-khomenkov@mailbox.org>
 <20260330184640.17795-2-khomenkov@mailbox.org>
In-Reply-To: <20260330184640.17795-2-khomenkov@mailbox.org>

On Mon Mar 30, 2026 at 1:46 PM CDT, Andrei Khomenkov wrote:
> Simplify boolean comparisons to improve code readability
> and match the kernel coding style.
>
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---

...

>  void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_sta=
tus)
>  {
>  	if ((media_status =3D=3D RT_MEDIA_CONNECT)
> -		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) =3D=3D true)) {
> +		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
>  	}

I don't see why you can't remove the parenthesis after simplifying the
boolean expression in this patch.

Also, didn't read this entire patch after scanning it for a while, your
other patch was doing multiple changes in a single patch as Greg's bot
pointed out. Maybe make a series per file the first patch simplifying
the boolean expression and then one or two after (depending on if they
are different changes) cleaning up the code around them. This would be
much easier to review.

Thanks,

ET
