Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3437A35AC2C
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776722901; cv=none; b=XsyuF1aCscSLWHiPPOvP1G3HL+WN/DVJowE7QySqKqgj4dBZF8bgxbVdCn2YMZhTliX2cJ/awX/RPdmUK9ZC7yCLhyGMfUBUhZqyuRYM5mkyKbsspnjGjfbzVR+z7/+rJKSRgV6Ip+XaJPg+N+mCcA0pr5e9jGK3dmX/dPGMSa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776722901; c=relaxed/simple;
	bh=kcCGYtDQ6Dlub3rqMAVllrukj21VB87jtoWMKe2JJ60=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dZnMg0sEUrhosd4pyRdIUJcsJ2T++7qMkkxCHQJ4sSQk5lp2/7vgKDwyTKQ8SjwrheJ2KJo+GM5/uEyG61tbqIbroFTJQxtlVymqKHyJ+xJWTcyY6S/DFxg+hVMf7egTfSfHKbBdlAviWgpQmw4rbpx+j4p8pec6jbXz3EY/VWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyBFoMEs; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyBFoMEs"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79ab5fd969aso38204437b3.0
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776722898; x=1777327698; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJxw7OZdriZ44HQkspe6ZtOaUUNBGBrDxNE1/WClrS8=;
        b=lyBFoMEswTx/FeMuv0aCzZrUEuQ6DL6REHdre/8aLQa8zPymsUoEwvR8apjHBk6WP9
         sFjgtGfBfF7Va3yJL5tWyWRgnNGNS0Jbnporf+PgokxkLdO38jyq1HhXt6lIWNdnhdR0
         9bGNP+VS4kS/N4KCLkxnflcDQEuZStXGoCpCF9mYjnoOIxBX9KgtrXYykTpMbjopUpeM
         oOp5QfLhQNz+f8FfnRNrnBO4WS/0fLPknz+XEY4b0zEkwUCIbHeJMcc4R9ZFo/sYyF6P
         5RbA55jxe6eBxNjq5mBse6uKuG/+WdEMOGdWEjtPoGKZ75ZOpYvOjhs7Y2KFs2aQNRSq
         IUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776722898; x=1777327698;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJxw7OZdriZ44HQkspe6ZtOaUUNBGBrDxNE1/WClrS8=;
        b=RivSwbRK8SNwmay+EqugxLAgkWPsgsSXJtsSj9USfccZXT7cRBCRTeYOVjf+MghDTv
         YzqNYEWIsRU4cl64/nVuvFfdIIBdo+y/5Y5yw+bBytmTLOjPyC7ixWk6w//q0sN3qMDU
         1c2ao/Dpbj/q4v55/phLq/mAFkt6mLsIASVRgKjlwc6wxzR1Lt5QmhdtZHIZiCDe1swu
         Zm6khsiwAxsookoLOwFQKr0Wt0T0b3Cm02XtFpIab/+HEC9gSJHeN6llkW3z8p9N+cMV
         NIrduAZ0mKo6dUaF2M5AVRbgeSmPVYQ411DoErY9NcYNl+sHTjqRFylGjlcNkgSxqrQc
         cmBw==
X-Forwarded-Encrypted: i=1; AFNElJ8phNzflLmbfDKRgkJEuv0t40h6KsJzqNDetQVPRKJiaIso58iARDQfNdhIqL2UQ0Vh6LYPBXedlIhdrIjN@lists.linux.dev
X-Gm-Message-State: AOJu0YzOxDuuLS0Ifo0kG9Y8L1zA38zNAEVyXOnpwW6nq/TqVs0GZ/uH
	GE++mNy0dIIWWWDzVkzAE1Meauy6DA0xirEFgQA3Eea6cff9U1bXXBJJ
X-Gm-Gg: AeBDietPbSIosbmCMki5jPsfbk0cgTBY1crEE80qWSaL1ohLIEf4fI09YsPmcuiEPMY
	7yrpk5G34NMzcWn2H28PBDvsUTx67z0C7rzEdrtN0pa0C514Z76S5VaAA4qsH6bp9u8abzQpqam
	bCSiv5foIaFFnQtzaquHze/v/KUce/BwjuvGy2fjjE6lkFj4t94hhnfJp1PchW5zpN8pZGvNJww
	ybmLG5NZSVe7JB8VvNWY+xq/8JbwLd4SCVowtqMcAairLapKeu6GBpU5Hcu7qB9CSqNuaFQeAPp
	s57zQiMVMh68CFoCdVUbiwhJFpZYoqrdDFVaGV5Vegjg0NKPpzEo7zHu2uDUZxEEMUx34ZVrT9x
	7q6ATvi62H8j+nJMdCEBYbjo/3NdKjD5unGqx0mLM8SpdC5sXgLC9G/tVth/lQ/k5zwXxyZ3iu/
	EpulIdiGvrSio8XcIuYMmNNqkZapaT1Ca/d1N7znOMoVtyWegVy8qxJZiddrA0OxTRvDttBeA+w
	hq+cx/ev+Toy2FttYk5glicc2rMWsJql6SeY25CviRXN1iD2lmbTw==
X-Received: by 2002:a05:690c:e345:b0:7ba:f3fb:2623 with SMTP id 00721157ae682-7baf3fb3a08mr47830597b3.40.1776722898210;
        Mon, 20 Apr 2026 15:08:18 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm50727717b3.14.2026.04.20.15.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 15:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:08:13 -0500
Message-Id: <DHYBP9790JEK.24T6YKAPUTHXT@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>, "Michael Straube"
 <straube.linux@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Minu Jin" <s9430939@naver.com>, "Ingo Molnar" <mingo@kernel.org>, "Ethan
 Tidmore" <ethantidmore06@gmail.com>, "William Hansen-Baird"
 <william.hansen.baird@gmail.com>, <linux-kernel@vger.kernel.org>,
 "Myeonghun Pak" <mhun512@gmail.com>, "Ijae Kim" <ae878000@gmail.com>,
 "Taegyu Kim" <tmk5904@psu.edu>
Subject: Re: [PATCH v1] staging: rtl8723bs: remove shadowed bDumpRxPkt
 declaration
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Yuho Choi" <dbgh9129@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420030543.72423-1-dbgh9129@gmail.com>
In-Reply-To: <20260420030543.72423-1-dbgh9129@gmail.com>

On Sun Apr 19, 2026 at 10:05 PM CDT, Yuho Choi wrote:
> DBG_RX_DUMP_EAP redeclares bDumpRxPkt inside validate_recv_frame(),
> shadowing the existing function-local variable. Drop the inner declaratio=
n
> and reuse the existing variable to avoid unnecessary shadowing.
>
> Co-developed-by: Myeonghun Pak <mhun512@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Co-developed-by: Taegyu Kim <tmk5904@psu.edu>
> Signed-off-by: Taegyu Kim <tmk5904@psu.edu>
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

Could you explain why there are so many SOB here for such a simple
change?

Thanks,

ET

> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
> index 337671b1211f0..cf5698dda91fc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1534,7 +1534,6 @@ static signed int validate_recv_frame(struct adapte=
r *adapter, union recv_frame
>  			precvpriv->rx_drop++;
>  		} else if (retval =3D=3D _SUCCESS) {
>  #ifdef DBG_RX_DUMP_EAP
> -			u8 bDumpRxPkt;
>  			u16 eth_type;
> =20
>  			/*  dump eapol */

