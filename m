Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615D1FECAB
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772472666; cv=none; b=JHmJHKKSyK7o0i3ApXUk8Fkwxw+IYNBoe3VAp7FW6VE1hZaYK8cXXNCJA00iRMQVLG9DC2pDR32QExfwhWP62Ccq+cyUZlhHvtDA6h8khGFceluAf0PyaJNxexB2ursHc8l7kGhLtdDCAB0XmTyxBCBDXRVb63+fbDhKoobwEuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772472666; c=relaxed/simple;
	bh=Ws3qmEuDvFT744+o+Fmrbprk7vk/ogA/s2fpCwkYqHc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LkJQjwX4xU+kfcLg6+Ba2z1GOvqVVTmtECJcsKW/pKN83k5iwKZBCfisNOkeqEtgRmzCBZRsX1uSfxWsa141yxb8Bj1QgqZHws2fKgLTR9J30Jv0aKgb772LfoLkvCU/GFWElQu8cUH+/+6ZguHYdUXeTmjBTMQ9uZ3BLjVm3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlYZaso0; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlYZaso0"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64c9707fc11so3396066d50.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 09:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772472664; x=1773077464; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws3qmEuDvFT744+o+Fmrbprk7vk/ogA/s2fpCwkYqHc=;
        b=DlYZaso0b55yeU0CL6lUXYIynqPzYGLK/0yQgoA9Ga9LyNUO39I2xo3xhgsoiO+QSf
         9QMN4r9iMyi1IwFw/0kIJQO0zYqHV+XFDKv6xF8lZTAHc3ya/oYyEVjzBbTa0i9G7Arz
         vZZRM8E/FxGRFgBgj35KkZjBU1drX3qvhIHJ3tSx10vnnCifVAWe13FyQItmBuxoF8S9
         OkD7ELZAK7mBm8LmkOLYgbT+OhGBmb4oRN4p9Dv9sbRamg6xuGH+wrawA3Utdz6HB2wM
         qedavKOKgNGOLSXuS0vNbquiS79/kCTALQMB4FJrcQ6R+ngo/0h1EdQ0hu49HEEO7vdt
         Re7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472664; x=1773077464;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ws3qmEuDvFT744+o+Fmrbprk7vk/ogA/s2fpCwkYqHc=;
        b=Rki8xZDB5Bf8Fru5I2tsJv/l/OG0N0p/gNfk9qQf72G9oV1k3r6P+nlBSgt0QnAcYg
         qYa7dofwhoAnoIuHBHanbW/gHVGhKsUdFvJ94wO5/XP+54b7uThIN410OZSdiJr1Ccee
         ZLMBOE5edLmwutRe95QQBvbXtErGGSqmCwoqB0F0Vh1s+rboFJdKd/WHoxAu+N68H+4t
         LHjIXiDxSU2ZXMpQwByD5aRzJBLtHxVHev6y3G+5wMZ2dNgYxcoOFEVFxFTSVyHGw5p8
         I29YtMGamuBsMr6HOcohpLLX+To4g88LQiCzxXi8VKUPXrT9vNaJNtwpGyP7JQt2Th7E
         evYg==
X-Gm-Message-State: AOJu0Yzbnkk32qqpnc4HDwnDTTfDVf0MkDRXkGUGZZOeONexn27/U5di
	kv2X0xcpCo5JFgu2EZ/I9HZGgZtQzVWhnygMV+O0rrzln2GjFlAGyn+f
X-Gm-Gg: ATEYQzxdqUOOkj8T1SeTsFxSocqdWlgqO6gVYFbQ45biekAt5VvBGndbg1ZKMNEspKa
	P+4qAOmPFkfXdQgZ+KxMoYb3NicJnu/9lw3x2UIf7oAlHebjA66vdzvT/aFAQnuG33CXpd27Xso
	H1rU4I1yMq1px2DmGHPDUgxw8wMbSDVibbEvZ1Bkk6hMVEHWNJaQ0oZJRrfFKNkqzpEzHv3lAWb
	mOpdcepoNJWbsk/zKOTv5esbFCtmZTXeYWyWH1yhFtHzdm6/XF2jaBIzsoZ2TqOeClvjrdiOBgp
	8tbivE4kqm1b1KTMDT9EDc3XtBCvKU3dmWLrefHI15+0Bsm3HvSIt7CtD5UP6HMMXxOn6ZX4ZI0
	ZjSK59iroZhzdpDsHyh3Fj16NHWqAdZQJ/3pogF5NVP5pOlJyTsdjOm1lPVu2abXYJ76aq9qNY9
	8n0Xn+Dk4/9EIo71r0AUIwtzSvEv8B1Fd8nMdFpnPloNH+XK4NM61W+HtLoHQYUsmI6ahry1p+R
	AqRboYsA2qzqTexLQR/zEFKu+tC0VOi
X-Received: by 2002:a05:690e:1aa3:b0:64a:ec39:dd4b with SMTP id 956f58d0204a3-64cc2285d4emr8515271d50.43.1772472664363;
        Mon, 02 Mar 2026 09:31:04 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb759f507sm5839717d50.8.2026.03.02.09.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:30:45 -0600
Message-Id: <DGSH44H1ORRZ.305LBTYIL3ZJ7@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: fix CamelCase variable names
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Rivka Bukchin" <rivkab300@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302160849.2693-1-rivkab300@gmail.com>
In-Reply-To: <20260302160849.2693-1-rivkab300@gmail.com>

On Mon Mar 2, 2026 at 10:08 AM CST, Rivka Bukchin wrote:
> Rename pHT_info_ie and pHT_caps_ie to ht_info_ie and ht_caps_ie
> to address checkpatch CamelCase warnings and follow snake_case
> naming convention used in the kernel.
>
> Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>
>
> ---
> v3:
> - Rename pHT_caps_ie to ht_caps_ie for consistency
> - Fix commit message format
>
> v2:
> - Use full real name in Signed-off-by and From fields

Patch failed to apply against staging-next. :(

Thanks,

ET
