Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BDE285068
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775386959; cv=none; b=Np+zXhu71/SBToI11IY2X9VhZtsKPiq9vXE6HLKO1TzfvkV0EbN64u43iQ3PDSSS3VX+bYXZpVvaSaasowVsEFudMpwhhrtMLn6YMwH9mP5l+/9w+AkqORxZKHyAGApgmpj3e5SF6JCzmG25ciWt0q82xzlOr00+uWExXj3Kia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775386959; c=relaxed/simple;
	bh=uhcj4+M8ewsoJAYo4/IwJ+tyF+usWD9SiHrQBKbiJco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KW8dGKAJ6Lob3+/5r+w9cGcyFYKgUd8+dq25NZetj09SVOBcP5+DsGvZ7UnHZMi2ko6DoVm5gbWjt6j00O4sH2drSDxJriho2zFN7KYWDIakey8Nx0lPKYSRGbRbPM+BaKpn6C//WxCJbxcfBayHY6XldW3FdAt/3MiaBLv6qgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQWR9wna; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQWR9wna"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so31501285e9.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775386956; x=1775991756; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z2SScjl33qfp9r9oSnvAllDjhwVuv6H0d941JxUe2o=;
        b=HQWR9wnaP+0bxUFuwmW7BCEZ48rcxUMMps/Jndz7EIELUaKZaRDDoxd4qZQawQ+Bys
         1NOptNOLoO9GiymAUgKndb0np+xv2vZD/VBOjGxhZLZzWC7rS/DKmuqHCYPyeLk2gOUi
         0TxvFBjtfOgy4yzzgow6b7zpuTwmEokzcSGxOSSEafdPNO2q4Bvy68yb41WBWDCdwYaz
         aeWIgG5hbx5l10pe5fJ8x6gdZnd97cccMh0k5SBxWmOo3BTzfyS01O0yp79/U5lLSx1p
         IC2gSGfO0BblC8ydnGHiBmuiWY27Zk9oTOipZPMvcPlmPgExCwb5UJx/WChhTzNV8COS
         oSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775386956; x=1775991756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z2SScjl33qfp9r9oSnvAllDjhwVuv6H0d941JxUe2o=;
        b=UHKVu7DwWg2bjAu5mi3CgJ3C3bYM/ymWTdkgRw39KKk3Lg3Z/LdXO3m0xA7ZXiUloj
         RP+qHdpjnncyP1pkp71DH5XzsMufvgFDHaOFwjlmXKudLBpHCYqypcOLYV3nVkoGPjUT
         KgpXzTB/6w/hb4sMyd0a5b4E+VEvoZtaztxjWVsbGaMtgjwfYlHiuH/LKJTELXJytBbt
         B8Ybt0AgxWnzc3cjwdCWIRDJPNnlVOfTeTwG4PeAvgxJu/2I7b6xHhl0TbfZALXQAW+X
         03TsDWfPMPaMMbfN3FXib1pSISET77+JSHBELfah1hOVszw5sFulYIbe7SlqCquBf3eb
         9rKg==
X-Forwarded-Encrypted: i=1; AJvYcCXfi2SkBFGYdXOxRdOn2DpN0euEl7HrOUHtvKUct46PKKjVOMR5bMmidc0pHkcFuncHyKBIWBYaQtevLppV@lists.linux.dev
X-Gm-Message-State: AOJu0YwOwqCXKy60KqJV+XpgG/zi8OTW3M+zVg9fsfhhSjHza6Hdv1O/
	SogdnI6VPCvZ/NVFegjzxP7I5vjAd1kiaGfXqc6AfEtGLvjJMSqL4nmR
X-Gm-Gg: AeBDietfZxY9U4QFRZP1CiVXTfW8StMV+DEud7bzyhyH5E8wYAZ+eiWnsZ1hSZNhxM9
	XJt/jfgDMxNGzH8GP0BjpN+qevobWFy5pl+g+AtympxS3D0vig7wnm1VInoVdw+d5hjPL61vwPH
	OXDpT0EGX3vQxnT5XawN+XnsJCKtHzouQw4b/B9qA+Jp5Ap2mhEWZ78d3yPzzkwXwIogzY0wxTH
	t08cdYkUjzstN2sTf/Ag0KyApDTAz9rt+q4faTBXYcn8k44zXrjRrY58VK3MrXRELa/bIdhsEv0
	mDPjXDaGoIVzipIdUetUMwadJj0yHFq+lkDzKhCt1PkSl951kGU6PanfagRMqyfP5VeYG2YvEyZ
	oGIqT2OmkeoUwf21m0TMU3UJm02qUSAqA+BVVRZotS2suC0OfoUfRyyHEmvIc4M143L3QiAkkpj
	CCHWjx8zTp5NnYfRYTelH1Sth8wyUa0Q==
X-Received: by 2002:a05:600c:1394:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488994a7a76mr125133135e9.13.1775386955970;
        Sun, 05 Apr 2026 04:02:35 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1c83:b0bd:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e457bdsm61329315e9.20.2026.04.05.04.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:02:34 -0700 (PDT)
Date: Sun, 5 Apr 2026 13:02:32 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix negative length in WEP decryption
Message-ID: <adI_j9c8MqDSdTjU@gmail.com>
References: <20260404230248.62203-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404230248.62203-1-delenetchior1@gmail.com>

On Sun, Apr 05, 2026 at 12:02:48AM +0100, Delene Tchio Romuald wrote:
> In rtw_wep_decrypt(), length is declared as signed int and computed as:
>
>   length = len - hdrlen - iv_len;
>
> If the received frame is shorter than the combined header and IV
> lengths, length becomes negative. It is then passed to arc4_crypt()
> which takes a u32 parameter, causing the negative value to be
> implicitly cast to a very large unsigned value (e.g., -8 becomes
> 4294967288). This results in a massive out-of-bounds read and write
> on the heap via arc4_crypt(), and a similar overflow at the
> subsequent crc32_le() call using length - 4.
>
> Add a minimum frame length check before the subtraction to ensure
> length is always positive.
>
> Cc: stable@vger.kernel.org

since you cc'd stable, a Fixes tag is needed.

...

--
regards,
jose a. p-a
