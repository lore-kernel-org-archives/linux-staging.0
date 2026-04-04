Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8E2D73B5
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775342156; cv=none; b=hMgTYeq7g6NvYB79C/S9AYkr6CTB82EK6z5CiePhSgLh/jCKRcG3IJwbMKr1p0mdzYTssbiqbnoCCqIRI/ZED0LpLaJ+Ww7RcN3f1QYxqSpFJVRKO+vZyEfGN8aQra+5XFBVU9YX2RkOffNLhKI6BDld9NhLfCI3JwtMOMajDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775342156; c=relaxed/simple;
	bh=h841FlrWQtyCcCDB0AwdUvRd4ePYxm9XKfz6UzfHuhc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=O5iTvLeYnVFYMGpuwWBbgfukmjqU1IGuw/OTcXwGZ+HOFAOXmQNS40bpqftN6C50BVC1Rq/CGa+gwz3EcIViUSv34+22xZbd0zWBaHZMaLJp6iQAdJv5XdVeFk8h4XWIATgffj1KJIEaVES294vcHnhlchYgQe7qkBKaJWs6zk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMeVyOfu; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMeVyOfu"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-799001d73bdso20643577b3.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775342155; x=1775946955; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnRaSARCLJgoTehmC6uQnak4zkOMqeFhXU3Mfv6P5cI=;
        b=iMeVyOfu6DSr6GpTPqVVh7EOiIHTBRYd7XOBlsy1+hy1QYodeB8r/ZNC28GZ0QcJXp
         vY7Vu3GDXf2mSC5kpUxgUZ6mFXZGrz0rU7//XYcge0Jdw9Iiq/qjt04kIazTXwvucWWC
         1MQLcuQsM4BGWF12QFdNJ/URHzkLoJmf+4xUQUUAx0jtENwQ1bbkBjBIFIt3d1sQ5ZR2
         etJY9etiH3suQOEknKJiweD7mOw8X06fwIUxLS/BRf6vfzAakxrKGXHEqVEPWHZOA2zo
         ogrkFJMCH7N92X40N6jk6b1fDnmozYWr7Uer5EIanbWOkfUYPB3ipMQtbyF4CYsX8Z7y
         sxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775342155; x=1775946955;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnRaSARCLJgoTehmC6uQnak4zkOMqeFhXU3Mfv6P5cI=;
        b=pGEDMc71dr/JmR/vPRFTQ5s77nZSCZ9Mxtte8BmgmcC1Gw3cBNYvsXbXCvs9V3cxIg
         axeYI4e1LwoBMlsUHP1sbBdc+/+Yltef5lqwhxXQi/fag89/GUwZcYn9706OcrS5F/CG
         RHn3qtJAg840Sfre5AgM00AurIzaFqCUkUV+K8JflIwcMsSXF7EMZ3AV4HpUxL/hHN+9
         iE1zpBiVFWUErTbBQsxnQzgb5jSpJtJ4KzY9402i3Y9mgdpNFXPhY9+Ms0fwWKJgEb1b
         vRPGXAQ5yVUzjt1co9ZFQ0XwgkfnDXt5Tln2w2bkHZIwXOAiApqjYaCD37UKWftN/ejk
         cOnQ==
X-Gm-Message-State: AOJu0Yzd94FSG+SdlehHOU0mQOxbusdHJKqeu7AZs93ti7Oixe9cNJaZ
	nKwRvedDcilulHnJqLdsngVJ0K6RiLOMMt5JxC4jzqd4zFwgWIKSUJRZ4m9z8QZ+
X-Gm-Gg: AeBDieuXU5SMsSED5YHY2KCPFiLr4Yz266L6hi+VP/7864yfNhdRwwylFJ7aw5Ujrei
	GydemOJ6+lhx2gjjev8B/f7ndzLsEXJ6pu5BDjP5rkvgFPYsuDAMfvR3XT21QMPUZ3u+1+9L7Ef
	TYwhaiN0TVF3tDaGc8tNPoApwJlVUUqELHtfO2OR1ZJSla5wBeFgbSm07IQXnXW4i+Xb7mmPZK6
	vIKaRTy8q9ln7lOJlNQc+W/PNieuZNTkqw49/cVQo1fO05byXd9NvM8+oYiQzUHUnbkmcKdqomw
	LC8DnSQ6PemMTmKQz+PNidZLADwWtD5rhQfhMeaZ+/FxCAl/0D8Tofnj/xdFVKMI5W8asvib/PG
	zQGM0xoK3GouzwaSV3q2m7xhD/7pteTEQReexmnw4Rp+I56DB2wLbK/uEPaN6RFNRIZbYJUYUjF
	ijxvY035g9bfj/GOtLvxF4bVITOtCfu6D+VZdjlTueoa1VqyP6vbSSfsvATHcjQa9J654586E4b
	Vgt9upIuJ8gLnbkkn//RmaetIJ6kOh9
X-Received: by 2002:a05:690c:6:b0:79a:c659:6756 with SMTP id 00721157ae682-7a4d3ec9348mr79360077b3.21.1775342154630;
        Sat, 04 Apr 2026 15:35:54 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370905c45sm36825087b3.24.2026.04.04.15.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 15:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 17:35:52 -0500
Message-Id: <DHKQ9PHLTODX.1QVJO6QP8YOXG@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant assignments to res
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404100933.7911-1-dennylin0707@gmail.com>
In-Reply-To: <20260404100933.7911-1-dennylin0707@gmail.com>

On Sat Apr 4, 2026 at 5:09 AM CDT, Hungyu Lin wrote:
> The variable res is already equal to _FAIL when the condition
> (res =3D=3D _FAIL) is true. The assignments inside the if blocks are
> redundant and can be removed.
>
> No functional change.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/=
rtl8723bs/core/rtw_xmit.c
> index 7b18be8912e6..ea1923023caa 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -209,10 +209,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv,=
 struct adapter *padapter)
>  		pxmitbuf->buf_tag =3D XMITBUF_MGNT;
> =20
>  		res =3D rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF=
_SZ + XMITBUF_ALIGN_SZ, true);
> -		if (res =3D=3D _FAIL) {
> -			res =3D _FAIL;
> +		if (res =3D=3D _FAIL)
>  			goto exit;
> -		}

Thanks, but it'd be much more useful if these "_SUCCESS" and "_FAIL"
macros where entirely removed instead of trying to clean up this bad
style.

Thanks,

ET
