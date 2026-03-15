Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116EB17B43F
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 01:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773539010; cv=none; b=emDAlUVydkds2qYlOceGk4PrH0tMCo3fMFxzAtJuUKHCEojU4KZ5hoeKgSxeOmCdwg2z8FWfjqQgQfRIh5DpvKC/iLs+3kXeIy1XoWpakfErqN8cWd+EEg5Sb0Wlg/XKKBwJ4aW6zDHYWwSu747Optpk2PEAorX2Uqfa083nMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773539010; c=relaxed/simple;
	bh=qJcMV82BZwS7YiR8z9LJsdW00c/RT78rvI7sTJW6f+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QjPfvlMaBncdrnWiEcpAKP/eTMigUWX3a4fHqRvvMucz/+lxNgL79FvZx5zxO/AIyH5pko4ZZPY57Tms29RHewQ5W6NytbkNb/6Ru92rU+e+P7MjXW+Nts6R+PRxKslWXT4608zq++PoI1/n7VgvGe0WdE5M7ylXU/ukHHH31bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBbvpxZ0; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBbvpxZ0"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso4202645d50.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 18:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773539008; x=1774143808; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJcMV82BZwS7YiR8z9LJsdW00c/RT78rvI7sTJW6f+8=;
        b=OBbvpxZ02bSpvFKG6rLzbRhZleeBmWDjWtD7Y3LV/rUJBKl8e+lz0IrEmC2tSzu8WH
         ybUDOzLpwf3DTF+TI5r6eMzm7OhcByUGn1bklHZIA8NRad4Ndg1QEn9+JHYfyHZxsrv4
         kKGfdDdNZa087iNKsZjy9qMUz4tQfHfFsYDj0kAADKXPQD8tnhyFrz/uChyYSCtzB+TT
         ryXpL5J3EkXTuvGKWF9fBirOLPitt3PbZ+2mR1e4e22A4Ixjl7EgtpcO/WA2yCIuoGRf
         VvnojG1jSG49vP7RFKdU7pKr1Ken8F94hEeHTWxug+yg7/1h66+Ved5hD9y6QeINyUra
         YzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773539008; x=1774143808;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJcMV82BZwS7YiR8z9LJsdW00c/RT78rvI7sTJW6f+8=;
        b=r/SNdTuCgxLjDtD64sqHKV3HlqIMAgGyKdruev70Ws76pnUvWHohBGTCtdbAPRj5dx
         800jg3DKzOuzcdqu1D0t9UlIViQvEGVqHVZ9JCtnxYvCuc71sHKpO80nSiNkpEOQG0wM
         Nzv2MXpMxltkSax27C4WsPL/Kp69AhioT71qo2Fxl+iO+aTDQWkknoIm7A0bGB1qunjW
         MYdYiFGbcRtE+ZFD8+q6AqrUnPqdQpZ2C2nhT+cu5xz/fGmUJ/UTMQq2b2SH4lePYAQc
         Z9lLekWHK3s5iW0yb1cw+b1H5J3UAJBPKlWjANoVPZBMSA/aBM9ZL1665ZJNCRdmI4NJ
         241w==
X-Forwarded-Encrypted: i=1; AJvYcCVUevI4Gc5nmoBxRCq64KRFazeJvKdwjUPPhm97g+qtCl6D8GaoQZE3gOOLnxl9xiTY/OY1woKCB+KYYbbA@lists.linux.dev
X-Gm-Message-State: AOJu0YxdNDG+xWsy6agbtEmMHmVJJciSmLrgJKu4Iy0mX383PAIngqPU
	AxmD+EtvDAVKgMvUIUCg1WSDWZAiifCdBXLWhG/+YLYE7YoSNTYa5ERh
X-Gm-Gg: ATEYQzxkQp9SBg4hSsnhIckcp22NbO3WC7gdjgvmOvjwUsF/d+okiS9efNySGnA7jvd
	f2TTGKPMxX7qbQ/H/ek59bpIQl7H1dT32tkMJ4jYGppy0+QVkURiEU0wuLFC7H1PUfcrWK2L/0+
	3kusxaW3id/fhQ1pQiaxc8EK9yiS3zGT2wt3C5NIIoyJEynJcX0UFPLmegOwygrXgO2bF9ZXOqs
	2C0SWPuSneT3PWLZwxecZUPrWo1B0AKwBFdsdXaQ7bzshGwnDJEYQJkB0Kh/9ts55M81eYbCctl
	LPwCGC8cqroawaLFlq6fF8TmIpxQ0Q0isbpIFoZJOMOftcncq/miUkMDdLq+8X1BujsHqwx4eJd
	4eHVJ8KB1UkEjVL8dUN2phwIhkWwwjafgGR2IensTaEmOeoRWWQDNBMTNMAmW8+HxMiAGb92Oww
	3k41r4CvFrnfkpdiIffakmECKnPj0gt4qpCH7TbkKMRJlvS53MXgo7tXYEVf8ZLkZpnJQcR7u6X
	YYtqwwTXtQxsCadhwPEoFYYDH6yc1JC9e+I/dryJE4=
X-Received: by 2002:a05:690e:2390:b0:64c:9ac2:2cde with SMTP id 956f58d0204a3-64dc70c7270mr8125647d50.17.1773539008053;
        Sat, 14 Mar 2026 18:43:28 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b63601sm3487340d50.18.2026.03.14.18.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 18:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 20:43:07 -0500
Message-Id: <DH2Z3MYXYLOJ.MEO58GH077PO@gmail.com>
Cc: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9.ref@yahoo.pl>
 <20260314-sp8870-cleanup-v3-1-3ec367f13aa9@yahoo.pl>
In-Reply-To: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9@yahoo.pl>

On Sat Mar 14, 2026 at 2:47 AM CDT, Tomasz Unger wrote:
> Replace C++ style comments (//) with C style comments (/* */) in
> sp8870.c to conform to the kernel coding style.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
