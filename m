Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A42D3225
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374511; cv=none; b=IfZg9KUU/fCIyk65ENwPKeBIcCdNXrlYX/q2AGC06xoywIEFWSpMScTrt2RXt5z9u28XSiN8LOojFJ1a5DRvcmLcxnsYO9X7GJkkllw/I+441VoZUgN6KrgXPwstClvizyVdCRodzQjcPykatYRYrNIP8GW7esYB38DqS8Vr89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374511; c=relaxed/simple;
	bh=Dg24M9sxnMJ/wUGWVVDf13sGMFUGXnh0PB+6Ot0Ycw4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=PJzoZRvvbhRPyjChLxRQ+BFwXHlgUXvBaGNVcZN7eyRJVrU5BvXbKm+v+Pi2lFYxQ6EPm3RYV3vmtfiuNl9jrPH6nCnlaa/zB+vOsJIP5BV40SpAGWdUEq81Md+Ej4Ywl/okiHwtJb1IcOmi38qkmrbmThc4TzADwiPeTR4hsEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ljrlueiv; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ljrlueiv"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-675676afc3cso1517006d50.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 18:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792374510; x=1792979310; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dg24M9sxnMJ/wUGWVVDf13sGMFUGXnh0PB+6Ot0Ycw4=;
        b=Ljrlueivw309cfLYC+DvdagtcSe4kEQGU/UNmkWQiSygN3WIvcBW6HlBOCiSRbAtel
         rfqE5bOBOGNPS/E2vYz5S8/On6HU2TkFz87cFEpxSmqXEqc3fbN9XGg8zP+bkY+1TogU
         aSEFlhFMSf27/vpEMh0g0iRkXxdn0MVD+6SAYPMQdtzR3u03E35O8YpJzdG012865Qpb
         DKX4R57A9WgaJBwEXA1Pe9R++2hKGBUksKwr9fV/yuJnhcfUmLope7mFlGQAj4I9ULCt
         8e1blIygr5trdMcDMF5WOd70Rhwk95pILFJsdyUcqrJOu4+RYwZcYa/4ZmfurXMCApkn
         g1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792374510; x=1792979310;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dg24M9sxnMJ/wUGWVVDf13sGMFUGXnh0PB+6Ot0Ycw4=;
        b=hmnZRlfchnkb0L9itPSrls1DNvBiPHzO0dnwvAw+pzh9A6KMCg9LOosdQ4v8I2LZZc
         qEF9D13b5vSO0vW6mxU8oewCC3qrjDnJ2CC6BaWF2R+kMXE4SrNGc9QiDxVKl2APZRHZ
         rbfTd+biFnyGYdD8hzYDLQVSqs3ZDVxTb9EAFR/IXHZ35zVlxjNHrwFgh8+WDJv/rQ7Y
         KM3V6DZKKiOEnRmKTqi5tTr2DoxgUat8PLPnkCJAV3ZqSWCEpg5o2qmprmEwb0/A09JA
         nntCEA0drygQlh433yAfrABZYDX3E4y8UE8CmFb416smGNqaRX3kR6S1SemXLrRuiHFS
         cN2A==
X-Forwarded-Encrypted: i=1; AKwUvBytFT+nYiNIHcTtniYCyJGkJjg0Squ1BBGFrRXJ32R+XeEHte/zLGJcS5PBnq4awn8/8XXrDA6zVgpoceVE@lists.linux.dev
X-Gm-Message-State: AFq9FYLGMizQbFQ6tABxI6lu68bzVjmKPojzCFKX9FdMLycMqedcdaJH
	QD+M+mR6YZUiqt2jhtsl90GzSLpKtbQK7odPzDrOYifW5taOqbmxIw/I
X-Gm-Gg: AYBFou2vqdeUZ2XT71e2tSoCbxyK30qltnAcxENe3LfzanU2uQ1Cpnek7SHzxJyusGF
	MvO1EI0zENCxSepd8e2bD5mOf1UdPEH7ybsWQmpym/lFCY2XusO6pQfc+fwUnrLWcTG2HJD8QYj
	Mvvub2HEXgS5MmuPusoYFlOE6xjvA7R4qy+ISdEa308UP9EcZMuAkLSxjkqUN0w5td6IUY4egfq
	KwPQ63iReu22bjT790jW++F56qoiXCWuSekRCGcOFSqFT2lhQifIU2ujih7AlO1Q8Wpn2HkZQWQ
	yFfJHHHmUX01ZvQcniGIasu7BllI96tdjmzQFZGum2Kjfr4I7kVTtRacDHby3oZm1VuyOdkN0NK
	Ts+8uoxX4dQm5kDj09qrwDlnSz/8y3IrNJbCIlGkqUfBV8K5yAU/OEz+1Z/QjP7t/gWhoR4LX5f
	XODF0OaK7uWaVIkdx8Mdem+xXdp7FGBo6sErXufGOvvFLsMfpCk2oj82DuTojyx+6kFekm34zTM
	rnpvBociPa5DU18F6iZ35vSxsvi3iDQicjcK95DByiBK3YR9A2NWNg4sNNgrvAhcIDUFc5qSQ5S
	N2M=
X-Received: by 2002:a05:690e:86:b0:679:5bea:d3fb with SMTP id 956f58d0204a3-679ca8db8d8mr1463133d50.98.1792374509799;
        Sun, 18 Oct 2026 18:48:29 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e09d42sm3675608d50.4.2026.10.18.18.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 20:47:52 -0500
Message-Id: <DM8FQ18QVN8K.1FEXMHE3XEVYT@gmail.com>
Subject: Re: [PATCH] staging: greybus: fw-management: fix argument alignment
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Okhuomon Ajayi" <okhuomonajayi54@gmail.com>,
 <outreachy@lists.linux.dev>
Cc: "Viresh Kumar" <vireshk@kernel.org>, "Johan Hovold" <johan@kernel.org>,
 "Alex Elder" <elder@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <greybus-dev@lists.linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
In-Reply-To: <20261018224241.46011-1-okhuomonajayi54@gmail.com>

On Sun Oct 18, 2026 at 5:42 PM CDT, Okhuomon Ajayi wrote:
> Align the arguments of the fw_mgmt_load_and_validate_operation()
> call with the opening parenthesis and split them across separate
> lines to avoid an overly long line.
>
> CHECK: Alignment should match open parenthesis
>
> Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,
ET
