Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2D5B672
	for <linux-staging@lists.linux.dev>; Sun,  7 Jun 2026 00:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791956; cv=none; b=SB2DtkZC+sgIP25/3EqboX3/v4gZvnEK45serq/9PhtGEwk4DH3EN1tBmhLRzs0n51u26X0UPQG99Qxnk+dxTuwxzdgs68R5LumzyhSeF9R5AQCDF4G2Kudk94g3PiXVZ5VFar7HvpYNqvcFDnPNQlPV0XPgQmrRXJ8z6vI1aUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791956; c=relaxed/simple;
	bh=/0MRKkXG97YvNH6uGWojAsZlKq2NUX9Pre0pYNOKhcA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=V2n9fzLppyjno1fi6qkuqCQ8CK0nPMdEwjYYdPjuJcYD9gaddBVQlSw6U23Vapsiz3YFKnjyKiq/Xj3q6qeDj07Cml6d8MXsi3fAZVnuK6pC2GmFBulDEAKNxuy1lgdSLcyZE4lxA+Yi0CYsVqx3CLkJfoojkx61C5Z88A0CD04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMErykn7; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMErykn7"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7e87602f26aso35447027b3.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 17:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780791954; x=1781396754; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0MRKkXG97YvNH6uGWojAsZlKq2NUX9Pre0pYNOKhcA=;
        b=qMErykn7kMnj2D6TR7PMFWvuf//3IFFE5cXXwC6Xg3EXlZL+sS9Zfoj3+GH1Szfjew
         p+TXjfFL2SqaSVyUVaukaWhjeWQR9RK0MNu1hi7f83HsQUQg7YJv53xB59MlnJM1h5G+
         45VA/PsGlna9uvCHfdRQTy0wLwAUfLZt+EJL/+z9X3ukeKrNJMwQUSYrsr9J2pVpzqgX
         qoKKGJ9S8L1CMPOYKVAiOlyLXHPZuX6roqhNh+juYZG57ho8v36b9Rlj8PAw1rAyosMl
         XLjSjpt+RD0fjzsZIX7YVewbPHlj4QGtKtZiYbzwS43z2+5k7MdznwkBG8SRprmKGZH9
         Tj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780791954; x=1781396754;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0MRKkXG97YvNH6uGWojAsZlKq2NUX9Pre0pYNOKhcA=;
        b=WnGQMtDXI8f/xZjo41AHcaaJxkkDZ6vzXjQkiCAGwdDyt6kbjRNiF9FU8+RujXX8JZ
         x6R3NJZEy6r5vbR98m2t0nHruLn2Pplu3AE3wqaA8eDN1YFgmOn6Fg7NACpn5TF05uad
         pL0HUOKwyL0YZVtrbas+l1+kOFkbxuM42vnhvk1rj9qPDTEDk0F1IYBuVUpLcBKyUsq5
         GKXuDPeCRDs8zg18xT2lsKna74vk9mK1V5AFBSnsMHTSRcUGPExs25+pVtWs9PZP2to0
         ek1zgBmbMhv4hj93YZ6tHJO/RV0i1I5DgMWiPXpl7AvRjfQEJ3wuhfWIBjgiXawvNxrr
         Z/6A==
X-Gm-Message-State: AOJu0Yyqe3n8mI+RdriOhiPa7WJU52aXUXflvevhdTMkk3+t9nNJbyVA
	iPb00SjFCac/0j2XGraZH2Lpe5LtB7t2VrtAwoMO1NbtdQRHPB9lFsjM
X-Gm-Gg: Acq92OFsKj8eNq+FZhBo5OHKhVg01iCE+6bjbrnxy8YV3ns4ldUEbKMhJmsxmKP+DeW
	Y6fQsMeEd3wrULKwy6Z6/AQqvUKL0PsJWNc4EUi1UXdr4bD2DgerfR2hOJzlaLXjI2yHF+/tOmF
	oU747L3szIqqEse+ztHm02PGXejL+uwNH+SsjQn/KdixkYWBAL/sIkBcQp7+6ET8YNRCRsV8Xhe
	4hd/sONFufAiLsCRrSbvJ6EgwoVz7fp8oZ54o9+mzph8VAPiYrFJ7SBKszPY2YF3GZiW3g/mlCd
	Uqn8iIFsQhzY1pLHGJPgqeMpSfzajv2zGd8I1co1muk+bG1H2B+3qMTqpAdVQ+zRJBge3XLJBUS
	WUSoe5arYQHBb7+Y4mX+zKDHd7RATM+TiGzoHwmU+/cfMLdTTKN5W80Kw2BLx9DoTBpbYSTOR7K
	bPKpDv65556C0CeIsLDlgYYfXKfisQbeK99nziC14SS869p7NMSkNXSzlAx5sF9xmhlgZkKdNw0
	mKYe6Lc45fqoaaRgiBPvCF8xeE/4Y9+28Jbkut0Xqen9lLwrmZd7KiNKrgpq/XoWiHThJiT
X-Received: by 2002:a05:690c:7204:b0:7de:8229:e86e with SMTP id 00721157ae682-7ed526f00f5mr64247387b3.21.1780791954527;
        Sat, 06 Jun 2026 17:25:54 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea986bsm67635007b3.9.2026.06.06.17.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 17:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 19:25:41 -0500
Message-Id: <DJ2E24A0GO6T.3DOXKXL1HL968@gmail.com>
To: "Andrea Frasson" <andreafrasson1995@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723: remove multiple blank lines in
 rtw_security.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aiRL4dekV140SPGw@frassi>
In-Reply-To: <aiRL4dekV140SPGw@frassi>

On Sat Jun 6, 2026 at 11:33 AM CDT, Andrea Frasson wrote:
> Remove unnecessary multiple blank lines.
>
> Fix 5 checkpatch.pl checks in rtw_security.c of the type:
> - CHECK: Please don't use multiple blank lines
>
> Signed-off-by: Andrea Frasson <andreafrasson1995@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,
ET
