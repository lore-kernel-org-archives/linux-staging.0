Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FCE31986F
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770825233; cv=pass; b=CXzSBbruRCdJS1ZJKU4CtAex4FQagItzeu659YX+TZ4X3urHlgNPKdoRmtbJvH8BJkMR/XuVMBjt2fpD7KcJ+66KAW+zewkRi0pI7Snb5PdCFhhIlGNbpCjZvuHLjiJLh+UJHjeRXgzUArEsMgTP+zISmo2l8jTUX1+hbSMsg9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770825233; c=relaxed/simple;
	bh=l+sc3PCO0XQjASt5CEcFQxfGds7p04cYAiHy3xuG6d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phYuPESblg87865AphzcMf5uUuXWAAhpzAr3sASlWiiuL++kJ7xhIqTur341dlGM4hpI8kxeEaNHxHy8LT4ICn7xfivKyNolBJIVdaX6NoxUUkAV3luYp7BfXOYCCReVSFlx5DxxLiiaSE6NaWKv6xC6ymrBn/oVXdh8u4GJASY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT4hmUnD; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT4hmUnD"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ad019bb5eso5391162d50.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 07:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770825231; cv=none;
        d=google.com; s=arc-20240605;
        b=C95+d4ZYaR2Z0mHYITOE19DHhVoPZ5vwv2Ug7rX4g1kl1jAt1QyGUyG4Zp9sZU51J9
         E/8fADu03mta7unb2Gn3C2E73OEEwd2rAEp/cLeO0Jsgf3WeKUv5tTNYVtqov8v9Cv9e
         iEF/EvxslDQL/vUzPw9r9PAF6CbDPWpkJ+iNZZ1BcU/pOEweS+hXzt3O7h99CffUUA7r
         q/0kb/v0RYmUQEiEzgPKiIbheRjNdxfZg37I5kwcmzYNHqA35FxiIIknd5mpR+r8UU4f
         VCbYXRCC62+QEQSA/pcoru1es1GlgD4H5LFsC7WdZfTrKa+2SZ9JhvHks+1YYGGXlzb5
         oIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L9HI415fGlpndJ5NHxjsnyTWZMK0R8N+jrc4GpW6SJQ=;
        fh=IQXlYZa5ADar7bzYVMkuZ/0pHC1ObN86d121voq3c2Q=;
        b=Il15XyJuy2vBohuf429k04gmKNNN5HpvVSZtd5ZJTuKaV8u53qjUFmmpikrKwsNkdC
         ivSbnTq+HA9S5o8pRuvqv6Ef0WMO5URpi8IJsQ1krygHNGv3SIdWaTipgKjaSXQP9M4/
         KtbNKtSkTEPdxYGN5cpIurkTwuIQuArdxqPLpP4XqKuv8yg/pwhY26T8ICw3YnGjqCLE
         l2+Q84tRPijW2ORsFhqfQKEFUNcO/ou1h9yQ9TWMLfoY3EHuiOiseBN8G/C2WsbTPGdJ
         b0FCcjZpNW65TRrJNnHQkvysG952t+nZ+O8FhALZC5tR7e/gOKBIGfvMR8EBaUlHjwum
         5UCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770825231; x=1771430031; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9HI415fGlpndJ5NHxjsnyTWZMK0R8N+jrc4GpW6SJQ=;
        b=RT4hmUnDRJtqfoL5wiyYo36uNu8rbVuzPXwWEeHXc7Mq3shAZlV43h6Avu1xKTzfvA
         nLeGLkJW0bCTHFNS9Bk9kmKj3Jju2EWX3Sh/+sICb9/I2W6qN6l11kphCn/mfza/sJrU
         KWAgLEg1mm4APn/rAc4wUOFFWS9m6HmWMWG2IO97aEIvF/T5lI6M7A1jqgRYGU7YimY+
         OgARJii37viWgtmfj3NaaCLW2gQhZgfjbpsfgbyoI0c9w2dlDZIz158vXzMmEjYphuqV
         +MsO1V0qC8a/rq3zDQKgD7i3iv3hYJjM6M6OT0xzWpK7tmblrxcxR6AIdzLjUkvSNgXD
         TdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770825231; x=1771430031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9HI415fGlpndJ5NHxjsnyTWZMK0R8N+jrc4GpW6SJQ=;
        b=Fi8qqCpZYTeHYCvR9Ax06+6EtM25P070j8x7B/wzPHAOefc89yTWO8BoWtfTeTRZUG
         gvq859ZUhbUQ2CbN5ifgP5S4j4Nltya3KcPARHVWK5VxgEoR8ORhSAMXiLEPH3UCX5BN
         mw0qLcHP+kznUkyau4FKn/F56rv4SPxB9eAUwTGGn3baF5xMQamMqyHTqDQ88mlvRrf6
         flQ2T0OuQzzVy07w+jHagdv0vF1rq48BJztnRKKbOOtO1h0Si3NDslxxru/O+H8mJQq8
         yHjhVl2li4hAYIfatmCVjXjkEiR6CSnZc4z0PgTTGkp2TWZC7ixSfkhdC9MmkjwCx7tG
         ODlw==
X-Forwarded-Encrypted: i=1; AJvYcCW1DQn35xoJHWcmnnDXy9Hepq985vxJk3/ADJNvMeMkMc45fmGCb7cTQgAY4CaD3ZlOeTINJOd+XW4/dhDX@lists.linux.dev
X-Gm-Message-State: AOJu0YzMUUT886JSVkCr0ZrrPnDs+dehidA4VyQYGFixidmJprwiAVGb
	T9oCIR0kViS8hBAlW9t1aUGcMXbDoVxbiRenAvGXSmXDwnOoSfmBHfSqmaQPrHJ/JjIl+Shu3Jc
	cgZdsmv7O19fbBnPS0axX0h76bMPGGyA=
X-Gm-Gg: AZuq6aKHMnJVG/pucSRAiSCIaYiWXEVYBKeHsUrEA6zseyr6Q0QNz7dHzS2N5t6FQnr
	URX8Yea1vYzv7MD2SNcOTOOjKvk6LWmBSkBWmPpq2Fn7OpVtRUDWxmiDpd4j1CBujilLHOL5qQ/
	iSJDO73rA9zUTaGF+52+vSInGmJ7O3cXIgi4URtyZZnSx5b3GirlTAc08O5qax4JUOmCh8jM9Tq
	qStQRjOF8NbPjgwtM21FIg2U7BF8aEmw+O5uChAacYKtxLTJFfkqgMRRuM2wisw4SVVJv58DMpB
	jHTHibq2XR0=
X-Received: by 2002:a53:d008:0:b0:64a:df97:e075 with SMTP id
 956f58d0204a3-64af210f357mr4603958d50.33.1770825231072; Wed, 11 Feb 2026
 07:53:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211135731.13560-1-mariyam.shahid135@gmail.com> <aYybs0WNl5sYWL5W@stanley.mountain>
In-Reply-To: <aYybs0WNl5sYWL5W@stanley.mountain>
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
Date: Wed, 11 Feb 2026 20:53:39 +0500
X-Gm-Features: AZwV_QiqSjflFmLnOwXVXRtoSzS9zkWoYGpXTBDhxJBAhxPcDxm33AfOik3wEFA
Message-ID: <CANhxO_hopZQrDw_2nHfvCZ9zPdhqxtwx8C4mRaHVuBbZBvO58w@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix YODA condition warnings
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 8:09=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Wed, Feb 11, 2026 at 06:57:31PM +0500, Mariyam Shahid wrote:
> > Place the constants on right side of the comparison in rtw_security.c
> > to follow kernel coding style. This resolves a checkpatch warning.
> >
> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > ---
>
> Someone already did this.  You need to work against the latest tree.
>
> regards,
> dan carpenter
>

Thank you for letting me know!
