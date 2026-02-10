Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558C3254AC
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749923; cv=none; b=FAElkbDBTbXhr6CG37LswiTqD7e2i0DVlpO9LsUsyVVK44yGm5+6YCcv/fLvBJn6me63W0hQkhheUXZmxh6/h1h5yXVtQdugJEFHe/rchEgytOI6bEJrm3TmvcssZgruJg/mmDrLZ6OIsb9JsYWoDnNW3Y5OwMNNQgEgPcT4VTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749923; c=relaxed/simple;
	bh=ONEMFp7vcnI6sDYdo6E4jx7tPeTNLnFlhMv9UO5UFXo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=giQTNexbu8Xrzi8cauXPjuzd53cAYQK7Z7Jo9CefHKHh/mk7J3YdEuTyiKZuqmR6WcYllbw1o2XCFL9VcYkxLw7aXeh2O3u+Lk/7sokkrAkJYXtrxVhP4czqB6hDlIOMLu52W1jmptMRkOVGw+GUdaeEyDp/J/zLRA3G7B7bL7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoLZ+sIR; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoLZ+sIR"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c9eedc2363so609456985a.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 10:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770749921; x=1771354721; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH8sv4KedO9YXud5xUzg6TOIFuBuqcMpb+6s2Wz1GSs=;
        b=WoLZ+sIRsF07Z/b/F2/J0zE/QuvJOsp+hh+rwSP7YDmgDleJOzsoSTT8Aw482OTEmg
         TWqiBYphOeJW7p2jvL3EpK+Aaytn0ss7mTU2ezv4I9fLvEhcg9r4rfWMyqeUgDNdszMY
         tIAXkVBKmtj+6k1utIFG1JyptfmsUAYwwWvcfuW+D/7qeX1PuKhRhl0tcOSHOB6/+BYr
         4p69BqlpZqJQ1SUU0lOHUq9xMJG2Y/Sr6oIJaqdwZK8szeV1J9j3kdauLNgAcjvo+Zxs
         /rezosyhwEMAaQrdL/U6/qTeMqXDpRUQO/QadGhYUg8WAADWNpd4m6hdqdbLK+EmN7UU
         UVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749921; x=1771354721;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zH8sv4KedO9YXud5xUzg6TOIFuBuqcMpb+6s2Wz1GSs=;
        b=sHz9pk3mzZq3jTnU6uk3ntefm++MwmFjzndIyPtBMJCMJ7B/tioluvWgU4VWLLl1cn
         2kpvxPH9+YK5VAQdACqSy5a49YUmDDQNaGctqFJZKpRODaDXlGS80j4tJSS5JBJicEEm
         AqzWmaPKtgzqmYnbDnItm6CoZm3Hdqt6slOtymFpkzJumbxU2B7wdjiHKhsfsBQORZM3
         B5Pv9obTW3jBTD+M07EcSO+XHpgG5wLqAB9YmZGCoaqz+ETeDGaX7gw01NpuTeCOcTPU
         UYJBz39N8Bg9NcGnA9c6mE2GHZ0Qnqrq3ke2QbIn3ohKDIFPIW3YroJaHu/6g2DN7RGS
         SnTg==
X-Gm-Message-State: AOJu0YzZOrLj7bRJE1gggZ8NnfbkE0Mm/iF3yMan7Vk3G+lARQteeqSK
	io10oF9zz/LsaETmlaLMHlGgh9XDqpQpJfvy0+YPhgLVAIhVYYoVlF+Xv/R6QU5rHtc=
X-Gm-Gg: AZuq6aIvwE+yWFiq7pq+wnTOUdKhpOsEvwH1PyioTrrXhjQermRyXuPZW+BRAXzx4wA
	JZIpQY7UwziUH5ZqTQ/pKUc6dBb7HJVMKokNylEdQgURJDV7N2L8SAwP2nXsKYuc+J08asIJIzR
	3FQzdBZo19bhN8zdFKYgzDaZyuhnn6CTreFuy+PAn+TyGIoU2+J0OLiBy0Idt3obTJyt/8Q1rKp
	8aZ3ttCof6+YUlca0fEl1MohPHrmZReRmBPHvUAQ40KSSr+hX4YK9lCnUNBpVhpr8uNXOBJQG2L
	1QFqM8QIaCC+KCRNkR2mGekCMFC+5GVEFL8eYD1NECHb1uIr3rxeXtwu0TrxEdRJMpv8+SahA6N
	L1yR2Hh/dg3xgVG42NtPhTQMK9AWTqI2gaHIuwoH6zFiajYUqRY01KXCU0Lg2hQUBHa8Bh0ETUx
	Xuz0RiV6kRLdxfrUTvtJVChDug7JZpfsoGiwegm4wPafLBaz5bSrkm4yFrmHIo21VtIuhYtSUys
	zjY/2OxKSw411ySP1HBE6ANmBuhQrDRHhVHVGbo1NQ=
X-Received: by 2002:a05:690c:60c1:b0:796:5a14:87c1 with SMTP id 00721157ae682-7965f062128mr23854397b3.44.1770748381311;
        Tue, 10 Feb 2026 10:33:01 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7965f5f6e4asm21795987b3.18.2026.02.10.10.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 10:33:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 12:32:44 -0600
Message-Id: <DGBHWOGRN39L.17RRNUN1O5YX1@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove shadowed variable in
 sdio_halinit
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210170457.50720-1-tmimiharoen@gmail.com>
In-Reply-To: <20260210170457.50720-1-tmimiharoen@gmail.com>

On Tue Feb 10, 2026 at 11:04 AM CST, Haroen Tmimi wrote:
> The variable 'bMacPwrCtrlOn' was redeclared in the function
> CardEnable, shadowing a variable of the same name declared at the
> top of the function (line 21).
>
> Remove the redundant 'u8' type declaration to use the existing outer
> variable and resolve a -Wshadow warning.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> ---
> Changes in v2:
> Removed incorrect blank line after the opening brace that was left
> behind when removing the Adapter variable.
>
>  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 1 -
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c   | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/sta=
ging/rtl8723bs/hal/HalPhyRf_8723B.c
> index f712d0345b99..0f915589b518 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -208,7 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  	}
> =20
>  	if (Method =3D=3D TXAGC) {
> -
>  		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] =3D pDM_Odm->Absolute_OFDMSwingI=
dx[RFPath];
> =20
>  		pDM_Odm->Modify_TxAGC_Flag_PathA =3D true;

It looks like you accidently left your previous diff in this patch.

Thanks,

ET
