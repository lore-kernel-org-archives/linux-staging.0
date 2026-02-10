Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9101E2614
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763604; cv=none; b=Ws+M+445SoeRZ0XJoVAFlEVgPC1dYKaBC/ebqCJ5M74nK1XrMMR/rDcm7/hj1DL8PUurdeNOjGtNibb/ufYW+Nb4db9zvCmsS1SSsAf2nTAWmOkBfiiHXC3dCHP+QVgOf0VOi0JIAClBH0RcGDMYy4KDu4dAwGmQf1tDLJkdypI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763604; c=relaxed/simple;
	bh=2O2dga4RnJAEvrkKJpllsfgDpZEKVIIpJHpqwcphQcQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=l2Zx46afUdtDCAlG/XB0yAAByXbmQMWK3+5PCNbxqelCja52mFtiX1PI/9pWVZ+65xAqYoK3d6K5Dj1IrD0Agr/VTzLMlgUNbYUAZm8YBuCJZxSTwnceplMnOxU9qahZI9ZO2ucqrJNMTLyitPvdHCkw4f2vwxXukW8XYHfvnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arQHG676; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arQHG676"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79274e0e56bso15034407b3.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 14:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770763602; x=1771368402; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O2dga4RnJAEvrkKJpllsfgDpZEKVIIpJHpqwcphQcQ=;
        b=arQHG67690xq6znhIYP4qz6wzrisfhMUotnnk4H+rR9I2/TyTvLdJ/PeUoPAkRd2OG
         kmROvcOnpmO2qvyzbuUMks7qvldMrszKkuSmoIbEEoBF7CEau/p5+ezD0YtkTSF8vx9l
         tjRv3LaSQj3e8E/6YcSYASG/Kx+HEZLerJw2+GlWMtDd70FciNt1gIHVyPssrGFZX477
         yHrSmLMOXfp4eRfxuUhzwtjthpsabsUxzedhxd3z6mDzaFkggel1fQh4nfMJ0PKpghxi
         Qf3dUc51gZOwH7oCixGN9c+GjWt3VZ1TcvTP6xDwz9pCsA0VV+nomwdLTrY2zznHot68
         oEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770763602; x=1771368402;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2O2dga4RnJAEvrkKJpllsfgDpZEKVIIpJHpqwcphQcQ=;
        b=uciA1vTV62Hkh5sOvyuBOnQCVcSlVuar5F9o9jsObIBF4eDEl2VLL/bMvhVNsu8/7o
         AJoHh8yvklF4iAaEgmx0ia4N4yhAic23eFEo/g+Sa7KJmPGhT+CFDyFmIUVE7zYXchuD
         dBP4RdsfFEMtYu3D+g0gImb5izbOiX9veoiP4MBGQAMr1zvjHwb+y3Mjf8F3tmZma8DJ
         vIPKSgPmzwanW/lcjnO6B2Rc8dL5R8focxa2gnv6p2XpzJula/MgsiMdOXst/11wQ+GR
         RRhZPIEjBAZzumud3K25qRZHg7vJmhYmSr+WqFTop9j5lLEL08kXs98rvNznLrIRBAOG
         Q5Ng==
X-Gm-Message-State: AOJu0YwQggDrbZhaL5Lp6Y0AMal2Jf5n7qp9AWXtcf5ZwFgAW4aixJHH
	dR/xNZrUc/ahH7KFsEa0fEhPmCaPKGK4YrQSt7s14Cdx6NerWKCOCxzj
X-Gm-Gg: AZuq6aJaXb79IEcbSAgYngtO+5zCssqnGICW2M6COKdXf2Jx1z1w5GTDCXe2sM4iH2r
	sVtB7KxED6JjiLOvfyNauCLph298DA1rRHJhA1ZbhV+ec3b2kJCN7rcDv5TILhTPUqLyImDfITT
	qR34Qy05+Duc1qSSMKNsKDbwBuU+TCbomkYcub1NR6Wmjo/UNYYqCGk1jt+KMFsGtmih1p5ETBu
	mAvznZ/GUvZy2Aym85Q5py2eHJve5PLHArLJ6/gj3zw/28RufOkNlNHoQHAHsyQJJ1cLwNWJ2AG
	NTY3CipdHnXRhB3HjBqRSgwBJvqb2gUI/zP2oa9AGcKzYa3q0yuWmCwd0ashFuv1RKa8qm6Q2AP
	R0vGP7Oa16nSyQYZZl3TWdbU7WURP48pBIfW13S9GiUX91uz6A3X37ggaVq0OEudvWxpOHgrZnR
	2xQPfY8uIGeaierjOABHCGi1HKhJRvWZ1nuClNzLNm7bYvuJON+zJC5XPJzqrKKhLPCwaecr5gH
	iBBuqTKuDgXHswUpbY9DqtNuXHSUjcC
X-Received: by 2002:a05:690c:4d02:b0:796:6c1e:c07 with SMTP id 00721157ae682-7966c1e0e60mr30327b3.10.1770763602450;
        Tue, 10 Feb 2026 14:46:42 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16e7b0sm197737b3.4.2026.02.10.14.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 14:46:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:46:25 -0600
Message-Id: <DGBNAWVP9YPK.2I9VABZ859J99@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove redundant 'Adapter'
 variable in HalPhyRf_8723B
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210185044.53754-1-tmimiharoen@gmail.com>
In-Reply-To: <20260210185044.53754-1-tmimiharoen@gmail.com>

On Tue Feb 10, 2026 at 12:50 PM CST, Haroen Tmimi wrote:
> The variable Adapter was declared and initialized locally in
> an if-statement, but it shadowed a variable of the same name and
> value declared in the function scope (line 169).
>
> Removing the inner declaration allows the code to use the existing
> outer variable, resolving a -Wshadow warning.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
