Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF71624C0
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 05:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910769; cv=none; b=n2+zEp6uKy1GJYmOOoQ+1gPHHbIAEEzBFE/sIGYS0FYDcPko35Kjs8s2/j2AYmLQJDK16udjPyqtPBs1uP0U9RzkVRP3kmD6M/ohoxBHJGx3qkniXTN9CKt4QiuVOrdF0c0HEdTAt0eudqoHjgJwJFUPztgSBUF0X+rixCNBPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910769; c=relaxed/simple;
	bh=oooy1fRC4PaiOXX+Qkpyn2La15Mgnk4AGRUON4ocqfs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cPhKHvnB+1oUQbkmOFMtrMRM2IkqOuQD96aCAnLlxPns6zhaneg1RQW8D+QMYL2562hT7cejRlAePNhfBauFiq/KaowU0podmthwq2OFv5a2JfLl7+qkwXYzTX8TiByihcMTGlPHOJS3wD5WQJYi53LyG7ttRDd1aLGvkyLmU/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoY3X6IR; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoY3X6IR"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64aea64bf15so4964142d50.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771910767; x=1772515567; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBp+vRJJMoWgbC+X9bz79TS9XBLGjzi1azuFu2oIHws=;
        b=MoY3X6IR+ZbTdbX3efxymhhVmd+2kQQXP20r1zznl6GrBFEmt1BpxiagNaSlfSx/za
         jFTzP68Mrffcfy6uOlpUl1Trusvf7Xpza1BdEyfiTJUiw8FRKP/4E59sFuZW2GIVpQg8
         6LCNZ30tKCUkMkgYgKHIme/7K80AUI0xcywugYaATsLY030HtYX/sc0zP4YHnMpyTdkP
         JtigLyGxiJcnP/dxEPJHishHg77CMVyhpgtEsbcW6HIOojLiuCZ9vf/BgY7/D9/0UsHL
         T5hyEx5Zd5YHbKwgmwUVQWUowisbCW2koohfCR0OEi+CGgUGt9CxuYI4Ied5qMlH3aT7
         CB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771910767; x=1772515567;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBp+vRJJMoWgbC+X9bz79TS9XBLGjzi1azuFu2oIHws=;
        b=uGxV75RAwOYxQ++qkTy7NQSju6RkLm9Qw53ElICpTPNy3QlOxHRZGv0TlnQKH6O6Iw
         N7TzmZk+/jIy5EcUuWaHJ3Peo94JvAVDt5DIMzmzIG5RS0evg23a9DGsOODNL8hGkP5d
         RlSpaNy+BrIOBURLiREMz9EpGZ9B/scKmNFYimeFQ1W66mEnUPVmIVCu1NSbxERrQqvV
         Ee/7m3epnUyKNq+HkAGDSET3wwLBvK1o9nS+wbu1SEYXLuKd6u2pAz+HT5t1VceX+A8K
         8v4fnfARNtpccLZ00Q2tMHVdLjMe+IlZTjL6vlydbnrwtByH7rMVEIdtMWBiA8gqCzmG
         GfLw==
X-Gm-Message-State: AOJu0YyGFlaqFe1+HAcKOxGplbq2kT02eJil6XNqJ3Rj0l+azR7AhfcC
	1RtoqjeINMi7WL/BC5Uc6ot7Nc5N1NHnEcxQtmTx2qvGBaSLB2bH1q4dZxNG3iFBX3E=
X-Gm-Gg: ATEYQzyzCbfSZxPX0PZDRHJB4Jnh1iRPo2HrxzBxsKB894h3fApRXJtjcx0kN0F2BJH
	E8i0mX/81qjPj9cix3fMRNWxV3QmE5v70guV4k2rrEQU7hneEeNmkqI/hO85D++u6g2OtdA3qFn
	FGykDk/tEby3smzATRY9+4IxNCctcBhTfe5AfZr5kjOPm3mx7fOQOuEcnMdm3ROe0GiE1GUakdv
	NQFX+fBFK1c4Mp6sOpuH30RYHEZaIPJAb+3kkN6YSyxmiA+iUco5Pehy/UeIZwDcz2Oom7m0KH5
	BmUED64mv4aTzg+OoJxxbPsKIy6HGNgLQffGVswsQNaw29visYMx2/QIUB86W88S9FQ7lelaqKG
	SV1FTRKFn7pGybCzelYDv0Ow+LoD4jfduGeZpb7KtN5ALloMniKkuRnU1amxPD3Q2MgwVEtyLBv
	AKrQb6yFWmgkgUvfzZ3viwjWKHfss8qsLalw9jZaN1WI0RklxK1l4vV08VkNT3kA9kcxxeI6b84
	MOUs4izz1JZ7aofBEwl/9LZVV4PsgKM
X-Received: by 2002:a05:690e:1653:b0:64a:db34:8506 with SMTP id 956f58d0204a3-64c787d6f54mr7019980d50.17.1771910766792;
        Mon, 23 Feb 2026 21:26:06 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a37bdf7sm4028840d50.17.2026.02.23.21.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:25:47 -0600
Message-Id: <DGMXXS3DIY2Z.3GUN0MJI6S15M@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: convert single-line comment
 to multi-line format
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223200006.145296-1-tomasz.unger@yahoo.pl>
 <20260223200006.145296-2-tomasz.unger@yahoo.pl>
In-Reply-To: <20260223200006.145296-2-tomasz.unger@yahoo.pl>

On Mon Feb 23, 2026 at 2:00 PM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> Convert a long single-line comment to multi-line format
> as per coding-style.rst.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> v3: Split into two separate patches as requested by Greg Kroah-Hartman.
> v2: Added multi-line comment format, changed to codespell.
>
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/sta=
ging/rtl8723bs/core/rtw_wlan_util.c
> index 74c31a97f093..cffb1a9d36fa 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -597,7 +597,9 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct s=
ta_info *sta, u8 kid)
> =20
>  		i =3D _rtw_camid_search(adapter, addr, kid);
>  		if (i >=3D 0) {
> -			/* Fix issue that pairwise and group key have same key id. Pairwise k=
ey first, group key can overwrite group only(ex: rekey) */
> +			/* Fix issue that pairwise and group key have same key id.
> +			 * Pairwise key first, group key can overwrite group only(ex: rekey)
> +			 */

Almost, the correct format is this:

/*
 * Fix issue ...
 * ...
 */=20

Thanks,

ET
