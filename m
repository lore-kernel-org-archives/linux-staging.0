Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793802015;
	b=UlXCAgEUkc8pmKq8i5GC3N/7LV2gD1yUX46YwS5D6j+v1w4cq+3/D5EMYiolHfb93aAN
	 DcILzd6xjAqVX6gYAuzfYZUr6YoQpZncpwA/bcZxa8PhI7zebPw8y6b9akqrDCEdrqj3e
	 3KXwaUeuN9yhVZLlKaTos2bKQmnAK9Mv9w58HzUeSBDIKP62y4y+04SzXQd+fHuTyoLlL
	 YBRINPzYj6uP68laRAcgJE4QVVLRjp5rHIjT5X/BgSCxSFz5MtbdHD34OqQB/idp1fEus
	 G/69F7SOuxr3EhllLI57POFEU+F2poAZNvrZpYlXtoqlLdLPZ1WmhaeBGydlpNRWIzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
	b=pCkrBcuZoSfvb60qbGIgs41879u9CrSFuD9fBQVZ94gtsrSG9YByNHBYhTDqpHYGAERs
	 dtUtUUXW4QhzADB3OZXK1JblEd9RAXB0lq3BzCAtxE1X+guLmynZ3RRUIgIzPw1LBwjl7
	 4Ll+3/nOAqSb/BR6UOkTidWvO7D86SubNiB3H3tIm9C207Wno8NeHQTYt4B1E49PPKaf5
	 b7P6XbC+W34gbqdqpP4JTS9kMfSoo0tTEq5gB7J3cEb4o7/5nS99mKAw+aKQIVrnLiCpU
	 m9tXIuDoZh2dep0SljD5IWZLUbzTxbZkmsmTvVyfIT3gh/Vk8ZKtHiTkG/rocSw2PPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b="VMKQ/7RR";
	arc=fail smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA4E606A31B
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 14:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=VMKQ/7RR
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so911486e87.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 06:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793802012; cv=none;
        d=google.com; s=arc-20260327;
        b=MG+GVqIcvk/b8iKNir2+IEGJm/w2gPTP0H2TTkmCqBTJOPf8wb0IGbzwSmgT7aAhLA
         ZluTHg1/5C6/HS9H0JEuleKfZtN/24blG1fOaNXUmj5ljEEMHNIyy7wtgJsowp9bcirK
         TZAjrFeCHpam8eSlUJNv4Toqie0NlU0ktwjPiHUJ0/t9D8gQcd7GEcszkHw1if6xN62m
         gt4+RMZEDJr059lhW1D5QlXf3ev+1yAQD84Ar5+7t0Wz480ZjRvfI94f2PIzjh4v3BNt
         Pf21qEqTFBFz1GdukRatcpMIHqP3cQyd7C8Dqklhw5tbSng0LbFzhmPC5fKNOOwrm64o
         lvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        fh=tmnksCPydh/esPh7B3sDWDUdiJLCEUhSPLNIA0Eq6ZI=;
        b=kUWG0jtY2GaZ110+FVsLh19XEFlbWkO4mGEX1STRUNHOauuuZNEyROVHdgTbq6uecR
         hs/4fCZnXP4zKQPRz3mRa6S3oGLs/RdO/CQ+B7TdM37p82L6floi08xYIfdhNioJiWaa
         nfo8kFBw0+ohDQm0ml/qx10iSIto3RfYVP/XcOOGMnZOe8zdx1GQnKMLxANJ3pTYKue+
         2yNLv9ycz3G4fmVTFJ0lAQSnp6QoCKuWAc9Ds0kgFJQJAtIx6ssm+4T1QhrGhmkDSyUK
         OTDavN2iD47UlC7c3buq1mqKn3Jg0BZmQnu0M1J64ZW9xMvHW0i2Ao6H0DNjCBQcZx3e
         TMJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1793802012; x=1794406812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=VMKQ/7RRy1X3ZpA3dyVt4DYJTjddjl40qxqwOGB0ngcmtxeuwTgXx6+KAWn+5OnquE
         zOOYX5p3JjErFbeilCuB2BinZiMTQ+88o4cby2aHFAeGZ46qvN1x5bNA06+0upUvcqu5
         tZI7iSxc2T2GERoeVk+XBckGkpILqWWPJLNtKOcPuQu4jz6YkJaqPQB6qEg6uQ2kxURN
         3/5OILQWYlL2vfQ9ui1pH8lYnb30dkyEpeuU2oLXUVkIxAAxmio7TCl8ZbrkICVcF/yF
         IiMbUtuh3qADncEnl9+O2QSsVPldItd+QPCSNYpgHc5ZbtctRuJa4It/8Ssg8IOJYp7k
         8cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802012; x=1794406812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=uvdZB23DaXq9S3YnBfLng6NvgGSN4mYBsRk5CPh//5Z1EtEDPmSmCr/ysPx+KOpn60
         75hZScTlg72WZqROysUvjQComTRlHEmGTUPLk9ZS4kbkUqzG7rLiSSeeQbZG1fTs9v69
         IJAN9EO4dxZl4XHgOLgRfYG6089l2JBRQSRUU0pFiIRPJlbIeK6Z9N6pzcuGFqIXJMa0
         cGdZeBJXmm/L4PjV5G8+09OkzrNnoQ5odgW1pT8432xd8TM1j139uKbg5GMOXiYjVip1
         agGR4q/Fl4aT2EXGXVVLibO6xMBiP1HYVr3iKSXsyWZ4+BTpMpO+HMQRa1FLCOAaFVqx
         Ri3w==
X-Forwarded-Encrypted: i=1; AKwUvBwJbY7I8AbhHNsv49jY9GfhmyT49mnViDkzqJTQctAGYYlPnkjtvi0BCraHuzqeGoadqRRld4WW2Vyi9AMD@lists.linux.dev
X-Gm-Message-State: APuU4Z9x/V/6vd3miDtue547YP8n76z7JetaVy+gKNALBxBYGxC6d6Pl
	B/3vz5qnY1x7n/Cu7ImDP38rB2S3/aGF6tUxqil8iRTt3qoClVxdjH/97pVlg9ZFeqMFhnhG4BO
	pi2VlXUyI6VY9CLJMoK8A10FHfPh3cC9NLS833Tv7Nw==
X-Gm-Gg: AYBFou1nncKTch+nNeaVqtUM1RnyMBRWkGcADL+emhkGTseItFbEhQgTX1zB4FI+iU3
	KSt/fAGeiE61VZu+qvCpEkjsbZ4H7ZL2JzO9lnCrSkMSTf3CdfBYkMXXWMdgWJrjSZRTfSeFqLv
	TylZDLomjgzOBhUnk3bd85rnJ3CliAEq2nTXtLzyzkLqqs4V6CZQGYBafqePd2TMm1UN6KyfmEs
	OXK3ZOr6Epqqg8/q8Lp+3SVd2CMp9HYwqiOVy7prJhfp97cHlvQfwRKuCBIOZsT6X2BV2Pe9fQi
	qRaYfcO32x1nIbaZEAho+T2GgE+nAyLNw1S49+S8Jab0M4zo5oqcGcj8uJd/cZp5iqZGUWVVqEA
	cWJOCMafdEcqFvvOTZB1puhpl9wsHDpTcLovPnrXXM+8GOVwfu01B/xkBxlCtxZEt8+G+
X-Received: by 2002:a05:6512:1394:b0:5bf:d1e5:6533 with SMTP id
 2adb3069b0e04-5bfd951f9a1mr5985954e87.4.1793802012004; Wed, 04 Nov 2026
 06:20:12 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
In-Reply-To: <2026102218-vowel-plutonium-629e@gregkh>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Wed, 4 Nov 2026 15:20:00 +0100
X-Gm-Features: AclHuK_I0DmQgyoOW_ayNCdieQ-bUqhZ24CNIegOfCwJ565mihqQwxeJ6QVlwrY
Message-ID: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > Hi Greg,
> > this is a regression introduced by aa125180c673 (via your tree) in
> > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > staging-linus would be great. Thanks!
>
> This is not a staging driver anymore, please route it through the proper
> tree after -rc1 is out.
>
> thanks,
>
> greg k-h

Hi Florian,
Now that -rc1 is out, could you take the patch?

I've checked 7.4-rc1 and I confirm the issue is still present.

Thanks!
Martin
