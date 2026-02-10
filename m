Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0921F03EF
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 19:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770750099; cv=none; b=tGEU98ukHLeyAqzes1WUORfba67biCBCR9ZVn9iWkcySOq1sRMfotE7cpHHs97WHeTMEeZlqUUo0ga9Mt8wNxRkawTkbOIg1FdICddA3Bes7O8qrLKw8CXEJatRm1H2+Z8uj8ugJaV1Q9SKgSoVrUUWuqEebAvqux5KZ1ir4BYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770750099; c=relaxed/simple;
	bh=nbQpcvOVLudHIYuc6B+mgTqxb0tydjvJqDHCSQEuyTY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=WFOT6IdCRYv5hu+3i2eQRqjsLWJjnIiTXheGpW2Ln0JlRssKu/DuIfmK//r/Eov8ynYfGxjXygzDKwTY+1WL9gOuOrvgzfDRp2KANKHBZlWvHXJl8ncoaGmPzvCoAtJFtrle+p8Nl0LisbrAYXD96IFjrZ1joW2pfpnbn+ZYuis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acDqYM/g; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acDqYM/g"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233b953bebso608847c88.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 11:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770750097; x=1771354897; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbQpcvOVLudHIYuc6B+mgTqxb0tydjvJqDHCSQEuyTY=;
        b=acDqYM/gU9Ux6tb18yUNx7QgDMnyOe1CbZQyCavG2EbP+aL3LwNr/TDLmWuBVPLfAX
         hP7qpB1aeFhquIm22vw53JPK+0OxnfYobchRrzx1Y3KhA0EZ2Qodn2Ho23N+2IKv5ptF
         aj68tPYe2UP25/qIPpg7sfeQODHzfdVaB3zdwSzRCn4LgDEbN2wxzCEC9I2Z/fx4ICI1
         yO6vz1k8O/qUivmNtLVRziahdHRdk0pALL2pWAiZxAEz9al/WlPGt6PR6Ajx2z4RvWl4
         49/TuT8kb8pkpYULY4QNEl4dXGA8/Yc68IpY0n+nR60jo9PvXfxWCH2aLdJLfuMNn38m
         bmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770750097; x=1771354897;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbQpcvOVLudHIYuc6B+mgTqxb0tydjvJqDHCSQEuyTY=;
        b=xJVj6Gu/R/9D4750hIql4ZOrRwgPrWMtJlJ632DuVkWgdtSDp7AUZBtNa9WYo7nOr9
         vcn3qofn796bJQSM1FzLur56W4xRt33bakPDQwZrmQworNoKbRp4RtxgXil738PxpBxz
         /gbi1jYP7cAnXX75WlfJhAtokguEuD24hrOXbhtnKqwX1QPOFae6qzwKLAZnnGwsQIND
         AUXQ1InEeggMpqt0SdPnclVKEJ6mivonR4BQkuoReR+jAF8+gggIMMf5xqZXvaBx6W/s
         2ppHwmXegg1AKFLVBylfHwIk+SLUCfzJ0pbo0eHUEruiVBbRpqVgoFrgb7JLVwsmIDmc
         HzAw==
X-Gm-Message-State: AOJu0YwXQbotdNWkDRfWEyoiRaxnOMNpy/KaNeF9UFYP7MaWavoFx/P1
	dLWGRUPCdwgVeCXlGqOCXTjRH3Zs9h3BWkJtto8Mn97bZx1RGrSwO/aEe3a9x9qrd2E=
X-Gm-Gg: AZuq6aLbcwMuEFx+3uwOavxpepjRxAnsZj0xKHYMDJ2VyRZchQ43QGlQByYwHdaTpWI
	K9+MfUDO42ywIcFrebg0VKM3aIbFIYnYXckFR1EiahUlkox3t4qT/nIDLTCIGEVQ1w/GySOuTUw
	gBpb3CQOeMI5DHkydJyb/fle6bz4RO6O6wFvSKxY/jksFnyY7TyoapdYLjQPAB6ln88C1X4/9R4
	m4vIGLUzU7cW3Cz5llq/QbZaFqKOwKjgLrOjLqfvZr19kHRd2ot+rW2ev+DaE/doqySBaui31hO
	LCmCC3ZUPuSXK9lpYjfUYiYwtus8ZJu8yI4lbEMBgakhnetf6mLZCOs95zsvi1lLFWmqu6ZAbjh
	m+hFNrQydvhyhKXkAabeuHUGrsqq4QLRFAz8ekOTypDeS4C1sfrfO5kMz2zEFppB/MYyqsq8Y3i
	uJqCNXcgW16W7muGgPBHinKjQbGVnkXbG7WFRg1Tg1i6srz5M4QwlstEBK/Xas+jmJ+jiWxYj6c
	BAlQ/15Zm0NR23P538hXrCfZblK2RF1
X-Received: by 2002:a81:b813:0:b0:793:a2fa:b980 with SMTP id 00721157ae682-7952ab25011mr259823337b3.44.1770749673681;
        Tue, 10 Feb 2026 10:54:33 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a1dced4sm127175667b3.31.2026.02.10.10.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 10:54:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 12:54:16 -0600
Message-Id: <DGBID683QZLL.275K62PPUD5D8@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove explicit comparisons to
 false in rtw_ap.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210161628.42130-1-tmimiharoen@gmail.com>
In-Reply-To: <20260210161628.42130-1-tmimiharoen@gmail.com>

On Tue Feb 10, 2026 at 10:16 AM CST, Haroen Tmimi wrote:
> Fix checkpatch.pl checks regarding error prone boolean comparisons.
> Replace explicit comparisons to false with the logical NOT operator
> to improve readability and match kernel coding style.
>
> These instances were remaining after recent cleanups in this file.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>

Please slow down, there is no rush here. Wait 24h between submitting
revisions. This gives a chance for other people to review your code.

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
