Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DEA18A956
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 01:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771290469; cv=none; b=O1SVMsEcJJSTpNFPbALtt11oIvTrt7jN4Lqc/vvUXT8MsaizphleFq4Y6Sz+nBrhEjJrEotMQvNHa+GTPg5Twsrdxnjq40qw0+WcFxR3RAZanZJ+NwNLreppm0Ka/Cobh2D3D6jV67lEEH/IgL03XnUAFjs4j42eHOW+yrM/gxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771290469; c=relaxed/simple;
	bh=qszBCpUfwuXuz6QN1z6c+QXHZkXHZoUFfSpOX8SwZts=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nkvfWu5uRYy8vy1qEhvuK1/5OsEBMz6sleO5clQiyNHsgHEqkRErdhQQeTvSvgR/70kuypfqfLsvacAG7gZ2F9CmLb+2ve/32qUYzKGRwIn7Sz2GNsBMdw0/UM2EGLRnCruYJAGTk9HR0GJfSDkzTFltJAcsGKuE0pPE6kx2DZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3DC3QAp; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3DC3QAp"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649b1ca87ddso3223803d50.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 17:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771290467; x=1771895267; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qszBCpUfwuXuz6QN1z6c+QXHZkXHZoUFfSpOX8SwZts=;
        b=O3DC3QApLyOilU1m1uNON08QPKs1qQFr1T5Odp5N0l/t0eqJTgIxUtd7evkd91ubth
         Mrqe+jNCKZztXryd4XoaMYihejlMOAAYKyGROVbRIXm3eWTX2fTrykZrWMYb/QaJ4cYN
         Y0V3jBGNUwNc64CzdG8RTLdcbE34LlYNiUBdktKZxdOPcnUI927YHRXjf/IibU+MLG2M
         6EjMRnjkxTWKwtaoChLEvbF9rqwDA0bgbvgfvkYqyqmgt9bNBikVSL03Zp6b7zC4TnGy
         sPK4BiALptzpnDbUj/3cU19VgPIgJLVdsJ9a/ITcs6h9b239o26HF1w2eAgTIFNsXaG2
         onww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771290467; x=1771895267;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qszBCpUfwuXuz6QN1z6c+QXHZkXHZoUFfSpOX8SwZts=;
        b=Pbbg/jik4NiTt7n0ayBx+AgfKcNpyctLB5/pPSkgY1jR9jOZ7LHhoj2Q8MC+dwyxiz
         NfpXZ/4cBoJKPhckqbUbxL+0UzSyAjApFnwN607e94feymF2YtadB1oekzUqIuyzZ4BG
         pvOcat+DAsrlaCFUsBacBkLnzeqpRdWJLFRn2EQj9P73qz48rOraQcUV0RMLOznfl9GG
         bTykIj133Z98uLiZE80vhNJvKNGXVNdZWOn/Vd+TiH3oFSvlH3r6IK901MNCxdVgeIZy
         1BgJLoBxm0ZFcOdXeYrv+y/jkKM4iKbrTcSl85AY3LGF8LHCO3mLx5gVNyaNqwIV8bmP
         hQXg==
X-Forwarded-Encrypted: i=1; AJvYcCWKIRuVRDwFGU6AekdBpyc0CTyqa80y4xXoYeUzfNOwrwP8BD5fkxLGds+7geCyywHYfLeuvDOS6DOm1JB0@lists.linux.dev
X-Gm-Message-State: AOJu0YwIAxZRDrJGkLwV/5xb08sX/RrrR5FJ/S1H0u54dsEU/HAsBgD4
	P7ZXDmxEfaesO3U8rt7UeOQ8GPlxFbgHcoLGOl5859DrxmQB3lgC9UoS
X-Gm-Gg: AZuq6aIG1bkQK3vKqnGQ3aTNgxpT4S5XmAZ3wcjSJJmyi50Hgd6pDNvlMlSUvTxus/Y
	H1ZEhMFuZBBQZJve+2ALpXhOX41dVP7h7uPNGiqeuRH0O3ikK1fJ3CN3/d82NnzJeW7O4b+TVVs
	Ef3qGnP/6+7eu8B8FtjO04ZCGQfg1/F8wuroqd54H2rr2nQxOdu11jS1hp1TxHcBUYrv78Z6C0F
	j6TV0weHIYCqA8T43KjEWdmoKHyCGcTV8BMHeuWf+nYSQu3r3TJtTXxY+ueXF00ty5YVEvmLPhh
	fnSvSr+xnC610/ouSKQGS1nEtmXL7Xy4+vSjdS2tZsBUfyu5YftmnWkMFSBco98Vd39+0IvaGvZ
	EhmBQAJjfQJgjDAkAqsiz9O2Skp4iatiBPv/J/UBcqG0lE9WEgDVnOCTRVyVrWU7iIlQCnmZl3F
	OpnFnbLjFiFpo99aHLnshWSOMG4xeAFBnPNU30MyyUtmd3pwUbXldYQqJF8f45q8hdMxR/wdLFm
	+5FI2A3zWVJYed3NCr1qiY7jdqY9cF2/FkaUj6jmZ7DS/5DVp0=
X-Received: by 2002:a05:690e:d06:b0:64a:db39:f010 with SMTP id 956f58d0204a3-64c196cb783mr9818770d50.0.1771290467368;
        Mon, 16 Feb 2026 17:07:47 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22fb1d2fsm4174439d50.18.2026.02.16.17.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 17:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 19:07:30 -0600
Message-Id: <DGGU27CBNB16.1JYT2P1QGHQP7@gmail.com>
Cc: "Michael Straube" <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: use kzalloc_obj() instead of
 kzalloc()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Mariyam Shahid" <mariyam.shahid135@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260216161733.7704-1-mariyam.shahid135@gmail.com>
In-Reply-To: <20260216161733.7704-1-mariyam.shahid135@gmail.com>

On Mon Feb 16, 2026 at 10:17 AM CST, Mariyam Shahid wrote:
> Replace kzalloc() using sizeof(*ptr) with kzalloc_obj() to improve
> type safety. kzalloc_obj() ensures that the size allocated matches
> the type of the pointer automatically, which prevents potential
> mismatches if the pointer type is ever refactored.
>
> This change cleans up a checkpatch.pl warning:
> "Prefer kzalloc_obj over kzalloc with sizeof"
>
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---

Hi,

The macro kzalloc_obj() is not in staging-next yet, so you'll likely get
a kernel test robot email. So, wait until this macro is in this branch
and then send this patch.

Thanks,

ET
