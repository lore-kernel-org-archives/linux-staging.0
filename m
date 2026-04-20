Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44B72631
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 22:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776725278; cv=none; b=XF4kPZ2BDsy34we3dhHvpcXhAJwHZXFmO4ACTd7bispQg9Y5E/PbNU2JmlL5TKY0MJo0cKrZixuSqptpCgREu9V7Fzy7STv/Eo+QRDi3HwokH25Km99ZhQcYTDG7AhlhFnQEZfvmmAy78B1wvZmv3yVY1UuzA1ZWVKAMbK58yCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776725278; c=relaxed/simple;
	bh=qrloPY9vOlHn984YEQw01CzJXqc75RxdrUMYsCxTHAE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bUxPjo8LhOitHMYhpc5hBotYVbPm4/ZTLf+TzKgEtzt1HfOkyb9Bz2fGZBAq8BmbqkGrGt6eu3SnV4TFl6OiiyRfUCuArom17QjJ/FAtsQHAeLb/SM8Vs0fC/LO9etKhl6vBtZuB6Iq3+c4heabcO5EZz1P79otXFuNvJjJy4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwxgNAAk; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwxgNAAk"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79495b1aaa7so34014497b3.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776725276; x=1777330076; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrloPY9vOlHn984YEQw01CzJXqc75RxdrUMYsCxTHAE=;
        b=BwxgNAAk2fMt/QKKwxAJ4HAhQV8oWWp9Rh+sf5pqzCVSlKNvQNV3zVv2yH71DUqFwQ
         edDYpJOAOWLKgjZ4SSpJauqnOGuN5gayskpRi8MUcGUFXJ+j71FTFg9OhiIXHUQ3qMoj
         kK4USqYOm2nlWacsMy7o80Nu1sZ/Odl5Mq82YTsZoMnq+1nmsZJ3+Kg510IDC5okP4OW
         sUQHdpsV2a0blXr3orIl3By5oOPIdvU5Mg/Dgeo9zjkefDfZyluTdw9+NEIP6VoNcSH/
         TsFoTUKpB2jExbDGMOd2fEh2uyrCoPaXF8gKSr4xNT7apIKjN3KWhOYKdt0PcLWLBVUK
         VTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776725276; x=1777330076;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrloPY9vOlHn984YEQw01CzJXqc75RxdrUMYsCxTHAE=;
        b=NJk3/8lK6KoerqD+k+LggfPcz7FG/lxcwbY1NYGulPTYOftW8f1xDAB2mMa9WaoF4+
         xMAACikKYKY/XQfJLPrBMB+69dLCtr+8XmWZwCstq+Mc679+M4b+urZtrqnyqXi2BWXK
         fdnFE0FSf7HVsbPwKeQOJCXJQZUktBdYtGbvm2i/Tk5jt6C2l8jVdfyPXtJuoasZkWT4
         uNKzOE8kZZ/TAZTxmrdqIuXKl3V0zJ13YLvRtjvG/LpzGPCua7W399EQXa3NxbC+0kSH
         bmcqumOJzFjmkCUoUl4IL7zU0o0gw6fef0LHe6J4kQMm50vJWvwdWGRvkDMTexjRAy0a
         tB1A==
X-Gm-Message-State: AOJu0YyXQMvjPQSchJIw1347N4dJPF//QGPyHJ6oj78Mt57p2axGtGV3
	0V83QHVrf1K0mClooh/VQjAYZ4Q/+4rRZqv9TmVCeqKcN3mKMVK//BVo
X-Gm-Gg: AeBDiesUx8mXcLpto6yVXH4H562wDwFnCPTcnWWB/VQUWrKEWscawxX5YcAFRj3V/tJ
	Sm+q0QF2b+oJin9Ba92biN9SY5h5jokMNVYZSLRC80Dm2skchr8qZDpeOszW4lDsjsmnxD9ETTZ
	c9ePzoLEuEFgwcmv9AqOz1CYKqUTyHLWGDGBzOUclRax4vzRjifPXDAF3V0mU8FoZJN2orjl+5y
	LsHHJ6vIDrA67TX5MaNH0Tgr19Ro381x5HeYNeTEm8VV7cn++Fl5LPnQ+JTNbWYjXgeBKvycRQw
	lJ/kOfYQzvtS3pRQmxnU4gBx/1Zz1E30TWuHj0+9mxmh0i2iDKZ/I5dm9JLS0gUgU8r6L1b3X/D
	a0PJsj7VgD1KUb+2vRtaeKgxpbbixdhCmAJ5iwLjOauJdEiyI6wjVkSSyFC585fzmJXOnTMc3xm
	JBU9bEQ98dR0MF8vO8PC3vpmUaBCivdK9CLJqm6jMZN4xfFxpkC9u7pdda5Rri5qsxRdV3M8Zzy
	gLjhzuAtt7nGrZPFxUVMmaWD46ZtsW+C8ZQcBTOMa4=
X-Received: by 2002:a05:690c:39a:b0:7b3:3a49:756 with SMTP id 00721157ae682-7b9ecf8a7abmr159733657b3.25.1776725276131;
        Mon, 20 Apr 2026 15:47:56 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm49453357b3.6.2026.04.20.15.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 15:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:47:51 -0500
Message-Id: <DHYCJLWTDWK0.RQWSDU9CUDU4@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant else block in
 sdio_halinit.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: =?utf-8?q?Demir_=C3=96zdemir?= <demirozdemir@disroot.org>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aeY1Mc2uEUKkr-dB@archlinux>
In-Reply-To: <aeY1Mc2uEUKkr-dB@archlinux>

On Mon Apr 20, 2026 at 9:16 AM CDT, Demir =C3=96zdemir wrote:
> Remove redundant else block after a return statement within if block in
> rtl8723bs_hal_init(). Identified through checkpatch as a warning.
>
> Signed-off-by: Demir =C3=96zdemir <demirozdemir@disroot.org>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
