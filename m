Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81937D134
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776612510; cv=pass; b=N4Vo3zrFXHiBg9EXuQctUMnU83tA3A17ZqiDc82Z9tAEChASOOWyEGmpLvmXtG/1jD0qJ/9VYg+NjCdY1h8w6L8Nz2WK368mFTo/WcddVCbbb8h0W36zcuq+J9ZHT0pNETA/tzbc/dDrEu/krB8eIy+4NqevqOpU760RwR+sQGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776612510; c=relaxed/simple;
	bh=1qXxUpRlYChfnIFPcOVlyShFJ76R6A2au0xDr6H6/nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmz1khoGKB+iwwITRWRbESWoK0LtENlRJsqx9whscJlgo2gn11Y1tEIBshgi2atixdlzb7TyFy62TvAXeIUDl7pzbTuRz5dSSCju6juZ36XAa+tTOJchFz65HlRFHjiYHG77uuxbGdFp1WfkuHfn1yECQr6HW6oOvhOFgOcYfLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCz9t3ub; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCz9t3ub"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-797ab169454so29956047b3.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 08:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776612508; cv=none;
        d=google.com; s=arc-20240605;
        b=jgtDJd8RggRWr4JWnktzQPu3yexnGOL0s7kxfne+UsfDguoBz/Mpy1p1A7BQTURLZE
         1AF+zmhgm6ThJcpAFkAq5AkC1glhJgW6MBSTDPD2sEnUho8ZgC+foC8wX1wZyX4vsCRR
         5RfnRyarANA4dHGnNTIk05en3lQvRARvorRik8vcMIZp/buGNfC6YGRUpwqCXVqZe00y
         wCM8ApqxHSgTx0ZZw8RFy8DSpDtQF3jDP8ZsxIJDNKQXb+kHhHgpeUlO+8SwnMGVNQYS
         2Ss8YoAAPt6C6zWUrKloJhMsTdw05h02lljSwT4OirP2ZEKuPpi+PliU/y+eNloJFN1I
         HH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qXxUpRlYChfnIFPcOVlyShFJ76R6A2au0xDr6H6/nQ=;
        fh=t3PlZVR5nbBQTlOTTCwsCWfOJ473IN4MrzojSmxFXaQ=;
        b=PSJSHJMEAZryYGeWyL1spM16tAbcXPyIjArRjkn9gLr0b9Q1IIZ6TVCu8cNVBd5GWS
         TVLL+QHrAmSPpARAH+Zf5epBC546P3YbE0xEO+xTPlBEZsRvoOmcywGSrUFU0P/xoWO0
         GVwXRhsQycmH/8EJNbE6AiDcIPRScaTe74wmqWo585rvs6AfhnMxcw+ZvgZAkokR5uzT
         R1NU4s0qsrYygtS8sSvESUxpu7azN2C8vhpnupXT04PJcrmi6cwh5F8Aj6y78DftYdAg
         AcTc5B+sGJhDXsVgTIwNszVd8aTz0Nm4BGnn36taJ33+tgIZBTX7m4Yc82ROD4vYu04M
         h/jw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776612508; x=1777217308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qXxUpRlYChfnIFPcOVlyShFJ76R6A2au0xDr6H6/nQ=;
        b=tCz9t3ubvgPbiSOivIbAK8sHAS5DY3X9S3QALWbNSa91WV2SCaFTsaQyLdPQOWFF3r
         PZruuTG+drWg1mC6ApEduLShK7DCWWszz5VFfqzeaWOm4Fx5dF1uByJR9CLaUKA3O0h+
         WWn0zacgft5d5bbhcb7pRVba7BfpUyW2j3El80vX07351MeFlXKjRkJeD08vnswDLOTR
         phThZ2GjkpuSJkaO8J1OdKf5FnCJPcMgtwqW61Sk5p//O4Qt+dmK98YllXeiim71yIsk
         iwVWilOeajECLhs4NhH3lVQQ0zu7dpRGfRQ89/NyPpmp+vbuvs0qE3/3cwmioeQ6jpHL
         idxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776612508; x=1777217308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qXxUpRlYChfnIFPcOVlyShFJ76R6A2au0xDr6H6/nQ=;
        b=qF60BlCo9rruj7vgvihF7nbEWaU+PnPFkOLHEAgAUuHp/2iSLry651NeQXszw/Ys88
         Ok8pxsangasNDGiYS3pMwvicr1gUQn051HD6SxUJRhEyzaBCc0/UGtt5XRebRy4dMnOp
         UjZEKdHoSVyC7Xkn8TdpG4DNKKXwhZjkFucvFT+M10RpMX4MVUS2Y0N0QoUlXFpfN25u
         +nLgMJrpTzM3i8te7JOvx9cue2tZ/kGedZ3GakRSevRBmh48Aaxad8SbDP/70zGUeFlR
         JYcS9ANHlcZFFD1GXDFG5AiCoox3C5avtNzlkNrE0Q335LD06PargNvge/8ow6avey3L
         8nmw==
X-Forwarded-Encrypted: i=1; AFNElJ+3i8c/nSXLoh8xNlRrwLCdwNLO8mYwoZ7GRvpqSrucegZcJibBc2KhzEVVjmXO4sFlWnsWoxalhclC+Euc@lists.linux.dev
X-Gm-Message-State: AOJu0YzA40iLK11Y3FgeE3QOyjuEEosQfo/fWX27P4t2qbnspb2J1Xad
	KK19dTT4vnAAHgA44iTBk30jZ9Px/XGgGZXX5HtMK21nNc+GGYBy84PhdM+BGXZoPM0t/baFbUZ
	yheDXdVPTUQABCojQQFPyL1cJJh0pDRg=
X-Gm-Gg: AeBDieufz07mXWX5nwMpxfVUnvucIF0Pd3P2vgLWT722bT8RYtAzdULLSXJ8XOTFV4b
	isRDuUIkDPN5cOZBZEvhT94njBVoJez89oego+yPcrX9fYm8rQWnGxuXnuaAD0+8p8nfJ6nuRdU
	Fiw44LoANv7cYJoDXDFUrNH4tGgjcQNdC//3NHRIoA7J50c7/ob2MWIRkaoI1kfkJbOP5M6+88x
	KzxoYpbs2G2xFB7WS9THx18Y8tEdd9mmB3BHm4ThPoxUYOFBw+4umV7YB7tK4aMiVQKtstHC+gp
	erSLouFJqZv7Dxs=
X-Received: by 2002:a53:d748:0:b0:64c:9ec3:d71a with SMTP id
 956f58d0204a3-65310a737b1mr7148641d50.48.1776612508091; Sun, 19 Apr 2026
 08:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260419010537.116002-1-m32285159@gmail.com> <20260419123306.1e0bb59b@jic23-huawei>
In-Reply-To: <20260419123306.1e0bb59b@jic23-huawei>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 19 Apr 2026 10:28:17 -0500
X-Gm-Features: AQROBzBNyCRdEIpZA1X8Ugv19iox4PzSooNAwBVXCuitHY476h6X7rruCph7lGo
Message-ID: <CAKqfh0GDkVy3B5tp=dDyBv5JpJ_=+Yx1ibwVjX-s0NDO=PKcTA@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: adc: ad7816: replace sprintf with sysfs_emit
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 6:33=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> Both because that's been underway for a little time and because it makes
> a wider set of improvements, I'd rather we took that one forwards.

Sorry, I didn't see the other patch. I'll focus on the v2 for the srf08
patch for the time being then.

best regards,
maxwell
