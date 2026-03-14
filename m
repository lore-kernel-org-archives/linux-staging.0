Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349956472
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773523844; cv=none; b=AWz2YpgOuKsFLQOtMYb8rsiJhY0fUR58DYvrF96JTfmJv348XrdjaXt++qJqJFH4gMScA7+DjHN9gtnn/IJ9PftpXLLAw9hEj3tO14no8JXUO5yBQ6N9Jg7ybcMh+kGpjDCEWt7NKe0syQR6jbwvnDbe0RaOdKtkNSpTJBfHd6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773523844; c=relaxed/simple;
	bh=YBkWBM9XkFPWSbpTeYx/p+UXVJnS5tx6OmvaK9X5uVU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZTX1B0xSKQ6bGZQ4tj6reh0EvQIu+QVY9sUHp7AGe6DJoN06RKqLnnPL7Qkiy8mGTlGG8lbqvsZoQXgRx8fxxQnJxA/63dTfHVEGktqQxnIL/fv6Zfi3MTM4ImRTusP9YuGpaf+TQMG7rCm06w81iPRQnK9hGiORhZ6UsBJ5XlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVcgTfoi; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVcgTfoi"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7987531082aso34433197b3.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773523842; x=1774128642; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgSYP6cBIfHHGOkDhK1jT8ZKSXTix+OQr6s4gZh8rt0=;
        b=GVcgTfoi64dLO9EJHC/84MT5speiKvNC//CF+GOAtY9P6/LE0FNIDSmjL8SUkzqI6I
         Q4JqFoLJhZYXbzTU6IcNUGMOcnWCsPA38AiH87soJGjhdoe0dAllpq/7PAlpGBWf9865
         +aTZQXSGCZJDetYj+7RY+QVVU09Osak+jdLohdGsFg44ixv647cqv1SyUXrhhBM6OdxT
         8nTfQJ5NQlu0jf6NWhyOMbgiDNcGQL11kAcG/3EHs0C1EZvGqBKxIvbQIeMeoYwiAmd/
         pj+CNTs/dqDc0/G5eYQYW5qIF4b4cj3PcqYHdV/PEjYqHdipMtjPgNnA6y//PF6q/QzZ
         4gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773523842; x=1774128642;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgSYP6cBIfHHGOkDhK1jT8ZKSXTix+OQr6s4gZh8rt0=;
        b=PFY86MMZZt+G2p1f1PcDE5OpFQuVsHcru1eQjIKwlagm+5JTiZ2Fvj3iI9+OJrbu6K
         OxI75LDzY13QAox/MJay4+uZYGotX4rhD4LbZ6Av1mRSw6V6ur+Q3S7Iu6dSUtOm1ELl
         7FBa83PS9FHwQgvtONM6WNrWSKJcra4W4qlW50rzol1ChG3D7SaBIv48EOwhf7WPTqH3
         ZCVQytEJsELCwMvfw1317bKHuPShg56mnK65ZzizKn274uKCdeewYE87oX3S0gutqlAV
         n8Ry5MHxcpn/BlFOWyCKEcf36fwmT3gCkNGfOyGFs4m32uBLE9Lf6w/8ZGxN9/dH+9sK
         WgmA==
X-Gm-Message-State: AOJu0Yzr969teF4KDCbTxhp1+S1XAq1/MBoP6JGoUzP6PE4axVY51c+E
	u5nnTYg11omephFg+fBBfha0IYuFVzmBEUPqk8ZFku+CqytX8evkMkDT12bT6F9u
X-Gm-Gg: ATEYQzwqVt/DUuj10rTSZNeV88TIajC3JzQkZOg3wh7fLJd442DqzaGNHsEi8ytH1Ws
	3H6vxq/yb7TVFMR7cPIoFn5zkV0fuUiRs3KGyDqDEieTXrbY0mfWmvp7bQQL0m6FK3lRlV9yZg7
	zWXzXOWaFswsWQKQv0hrs3vDaiRIYV0eM5CcAfw9BNwoDHCPPSbn0wpJDdYiPCTccCl+qfkKaNx
	+DUXsRBBxPu2cPrlTzOZgXkHfjOx/Hb+9PHII2CMyOzxM2UmcXHpZUvJl2tKCoOidMGQ9x6Rub3
	XeC4+QUIojNhruYeL6DD3DlYKe9iBR9RYtTYZbWbJi62D6FFAot+UVjVAkvehOHaG7UTX9ynyyu
	uUwBse7uzKroB5Ps2g3nG4JaK9JRwhv8fSnV7MilwgFiwYz2O2ay4OHAXWz8rTBoDc7m8Jgzsp5
	qLkIRhNxnCn3GOrv1Zz7R4NdoAl9MODGEZxZ+qxthC4gz2J6oFJRJdFbX3rxvnees1IfJw+jM2s
	Idq8EulGrCAx3Lc2KXN3p+F4CLAifDaXked7OAje/2twedV8Cwp+SYkm3HBFAPvXLmxk3vBoGKK
	+Q==
X-Received: by 2002:a05:690c:e3c2:b0:798:c347:ccfd with SMTP id 00721157ae682-79a1c0892cdmr87528937b3.11.1773523841866;
        Sat, 14 Mar 2026 14:30:41 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:f174:ec69:bc86:8883])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a420386c2sm1240567b3.42.2026.03.14.14.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 14:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 16:30:41 -0500
Message-Id: <DH2TQCWG23A8.1K0YKHXF7QQYP@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Replace network magic numbers with
 EtherType macros
X-Mailer: aerc 0.21.0
References: <20260314210426.42532-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260314210426.42532-1-marcosandrade95963@gmail.com>

On Sat Mar 14, 2026 at 4:04 PM CDT, Marcos Andrade wrote:
> Replace hardcoded magic numbers for network protocols (e.g., 0x0806
> for ARP, 0x888e for EAPOL) with their standard EtherType macro
> equivalents (ETH_P_ARP, ETH_P_PAE) defined in <linux/if_ether.h>.
>
> This change improves code readability and aligns the driver with
> standard Linux networking definitions.
>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---

...

> +#include "linux/delay.h"
> +#include "linux/if_ether.h"

You always include linux api headers with <> not "". Also, header files
should be included in alphabetical order:

>  #include <drv_types.h>
   #include <linux/if_ether.h>

You won't include <linux/delay.h> in your v2 for reasons below.

> =20
>  static u8 P802_1H_OUI[P80211_OUI_LEN] =3D { 0x00, 0x00, 0xf8 };
> @@ -128,7 +130,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, =
struct adapter *padapter)
>  		/* Tx buf allocation may fail sometimes, so sleep and retry. */
>  		res =3D rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ=
 + XMITBUF_ALIGN_SZ), true);
>  		if (res =3D=3D _FAIL) {
> -			msleep(10);
> +			usleep_range(10000, 11000);

You didn't mention this in your changelog and is an unrelated change.
Please make this its own separate patch. Also, this should be changed
from msleep(10) to fsleep(10 * USEC_PER_MSEC) as this is the new
standard API.

Thanks,

ET
