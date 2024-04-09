Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB90762DE
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712646664; cv=none; b=aKItotmORis5uvLXRj95y0j28dSLAE16IKw9tJGNPn2YhsTL3OlyvXpVZaPf0yFExYGKe8Ntj7fLOd/XnIuJ2n3cRa0xAzECc6QHWfUCc9rdj/7Qlarbf1A0VA6LBBp/m0FIuSOfKJCpe1MKPH48affIwHiD5yyNO96zV22KdQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712646664; c=relaxed/simple;
	bh=vxqtjjZhNmxDSYl1zjr1PveROiGsx4Ga03/N7ZpEpKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKtW8eaykHBwhgtU46PYYtpu8rIVmK546vQJ/Ca+Ztn3Ngqf80fILCTy+pvycsc6PKQumyCq+IZwJ7N6fsuFtnDlvxbhvPmLy/00zB1eP2xxSo3LIZV3ybEN0O5IFtIkNGM4Gkvfj+k66X59W1JTfE+1AnXgp39UDMM+YIPBnks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aocMRn4I; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aocMRn4I"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44665605f3so594221166b.2
        for <linux-staging@lists.linux.dev>; Tue, 09 Apr 2024 00:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712646660; x=1713251460; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIHINBvcDQZFvc46BboQQb5Ddni1aJUuI/LFrScFQmg=;
        b=aocMRn4IGzs1MG1++BNL9JPJu8TmmgX1ZDdR/yB03xvLGLvMJ1hgEQMBmI/nEe4WlL
         R4K9oTKIPPWszTzut8zTDc9wb4oFMpo+3PRC49onRtQMXoQ9IdufUauxnKjiaFWS8hjp
         TjhKbi97EER1f1eJWAyGRoO59KYsvky34xEbrMnp8RzZ84hfguwGgXsEiFbo+TL/F3Ff
         FncZoESr9rh/fFJS0Qd2vXzJwVsRg53bP7rQmQaIPuK7UUL6cvfbG5rTiF96RPIAvukP
         /ZRqfeRAnOnIbDcYVizzUw05ElEpJkMug6lRlcjLF/kNolA4x7/7Jo8f/3W8qVIiFlcC
         g4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712646660; x=1713251460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIHINBvcDQZFvc46BboQQb5Ddni1aJUuI/LFrScFQmg=;
        b=TYdsC44xwQmEjj4GOhTayMd2MKPB91WPANY2ROkOU20BkV6Gy0stzGZcqJtniNFyPr
         dXZ7a3xl+fWutTex4IGAR75XV/4/kmLLoYOKmmLC9IHbck8wqA/fZtpfc2F0xonCbZSB
         DyjnvXBk7uNGNRV/tTT6YsepL8cbQ/8BGKpl+Kf1TSV8jEGgE+5i6PGrkpHNI6Y6jYGk
         MsH4CBbairXWS1Xz3IALiMcCJWjjYEJinvpZArG2ap6dTd+/pjWGyGpujvYd4JHrvxzc
         KRGFH0OtrQRL/YEScgn24z2zRs9lsMx7se3WQ8MZM/y1GMBMl8248MpHA4t5UrUp9tMT
         RSQA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Xrez/HYSm0AOKY7RADy21xRlSE9cgfJv2rgU6tofz++kY8TIcjKoe2mDFJYUK07r2WtSUMY8StnwSzUroBiRcOG9BEI00VOpoijvhg==
X-Gm-Message-State: AOJu0YzYJUg+Z3ZD/2rAklhupRF1ye1lnNgHwiUBqdgr2tli6hmyZ+B+
	jmo+K5JoqBtnge3pfNP/Ymav6ozgBteVU3gKNlh82N+cb0TsAMMW3huVnOAcY+E=
X-Google-Smtp-Source: AGHT+IGzOQcvhC79NNrIeGfJCRejYSWAoFYjcKOpWljG4vVBYilGi0oqz11179BSFwo3nmvBc/cY1Q==
X-Received: by 2002:a17:906:d04c:b0:a51:b23c:1187 with SMTP id bo12-20020a170906d04c00b00a51b23c1187mr5304136ejb.12.1712646660261;
        Tue, 09 Apr 2024 00:11:00 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709067c0100b00a46aac377e8sm5318722ejo.54.2024.04.09.00.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:10:59 -0700 (PDT)
Date: Tue, 9 Apr 2024 10:10:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Franziska Naepelt <franziska.naepelt@googlemail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	Erick Archer <erick.archer@gmx.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] [v2] staging: rtl8723bs: convert strncpy to strscpy
Message-ID: <3d8bf8b5-d8b9-4621-bd82-e51e844fd2d2@moroto.mountain>
References: <20240408194821.3183462-1-arnd@kernel.org>
 <20240408194821.3183462-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408194821.3183462-2-arnd@kernel.org>

On Mon, Apr 08, 2024 at 09:48:10PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-9 complains about a possibly unterminated string in the strncpy() destination:
> 
> In function 'rtw_cfg80211_add_monitor_if',
>     inlined from 'cfg80211_rtw_add_virtual_intf' at drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2209:9:
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2146:2: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]
>  2146 |  strncpy(mon_ndev->name, name, IFNAMSIZ);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This one is a false-positive because of the explicit termination in the following
> line, and recent versions of clang and gcc no longer warn about this.
> 
> Interestingly, the other strncpy() in this file is missing a termination but
> does not produce a warning, possibly because of the type confusion and the
> cast between u8 and char.
> 
> Change both strncpy() instances to strscpy(), which avoids the warning as well
> as the possibly missing termination. No additional padding is needed here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2:
>   use the two-argument version of strscpy(), which is simpler for the constant
>   size destination. Add the third instance in this driver as well.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

