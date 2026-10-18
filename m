Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11F35C68C
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792360247; cv=pass; b=H0QxvFd74WS1nGtjcwz6XD+zKLbUDJ0arAMQFAppuQzFMWXEgSWeFP2/j42sbphIrzM4MYEsuRrim8CzA6BU5PB8LEL6Qz/R1PRAw3iDu/T+ww4UdboSbl8uiChF+Eri2Nq20W64VLxbRn2avXJW7AFvy6xOerpEk2shR4ugMKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792360247; c=relaxed/simple;
	bh=JsApNxqREUvCCfWYG4AGYT7TQ/2LL6l0vjt9rZikPwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWeWpjpUSOKqbbLNtTIoIfp13xJ7OTIr/oMULI/zJVC+tx/iwQZNvDbbQDlvKss7k9EVSvcR09+JyW+x7SjTAPPP2CWU9W2pCHUNR0XvaY7VHJRsUPoZGqPi6VAPW3CCK8q5lzitNHIRYz86TXgfKsOZ4UT7QwJ0H8gorEy6GiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYVSXpAa; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYVSXpAa"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ac8a2ac52bso14121827b3.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 14:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792360245; cv=none;
        d=google.com; s=arc-20260327;
        b=q5AsJyucF7tTxrhBCDyWEebKeH3LMT+BIm6NHOJ3cM5uEqkoumvbXp5ao3vHEH7M9P
         yXZ1lFRwNOSNv3bC0GGJRWb7z0pEnK0I84pqnLazZbWjFaT7FiYI7hLHCpM8CT1PVpR4
         9D2cw+flauhCSqo6BlSC/MDc3do07buQ/t9D98ILj/fzmU7qY6TkvoNDEbyQKZUc8q9G
         pX2K37J877cm9UQya7+tVJ4Sd8XKsXdhu13j41U5gbOOPkuOl64XfMNfvqlsRYj1cdOC
         OGBL07VYgImmn+6Qoiovn4E3vUaWgeUkqj0sYqiBMu2ouRcmNnt1T6cIZ2bClMq7mZne
         J0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yi4OcEVBleuTF2zelBND0PJXNDFdIaerPT1ALBRVIDA=;
        fh=CjnD+8HR5fVWoXVyGFsoet30UjT1ZFw3vodma++EzLQ=;
        b=Wx5uNS7TZAMLeYpKYmLGaT+2GeLmf/wIqJDPKyRbL85ELd8HQlW5WemZoGsxcTm3ZP
         Gikd5aP6dc1MvdilrjVAsjldyuCFR22fHrS9/1KE7dnNBUqhtEgpVpKteXplAC8K5KwH
         ASRoan59V4zqRQyHvvPLOjPyRNV/mP4vI22tDE8Ih0ZTwKFOYo1c8rvKbZgqkRIeRY+q
         QNTCHM2gzAzBnhlD0omydwnud9eKQ9Ad7yWvY3agRifM08d5YngkUJl+gColkFBJtBjK
         GxNWs1ckDT9X8U4Kq9jKGzK6q2LUyYDi9iQA5osnkuELd2AOMeIxLnszfKFNo3lTApML
         yrmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792360245; x=1792965045; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yi4OcEVBleuTF2zelBND0PJXNDFdIaerPT1ALBRVIDA=;
        b=jYVSXpAaAm9cz11g+l6sALl8O9Pr2PAaRxToA9bILXLxzUcB5MEfXDVtYVVerc60H4
         3elHof+28BSxLCDUHgVequ0+XI8HM9If2IBxzGoYzGrk79qQq4KxYWTaBnUfIW7mQBrU
         KcLriJajTMzSyAI+FUo5qnOaTy6qrwRdR4cWY0pAekObmyOY+91qlEWXr97dZb6ONt5m
         UutTg0PEyNyqKpFCkQSQPC6WA9iiiFAppusSVHU6cINRr4+D0B1mB6P/PAjOUwIXd3K5
         7cs4WTgBjRTGSF6f/FIpeokAV8xhb5pscAyLouxDg8w6sr49HA1dEyVzz1yrrbwMldwd
         MJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792360245; x=1792965045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yi4OcEVBleuTF2zelBND0PJXNDFdIaerPT1ALBRVIDA=;
        b=wIkc5oFb0rjl2kTW9x+H/j1Y/E30tdUzaVaUpUCIknA2oq0sJmqeP1iIKvXlXie8OK
         2Fxx6WlJ2zbf4V77EKSTTasigB1bf4WufJBOmWoz0Au+kBHoy2Vas52Lj8uG03mgdCKQ
         FB/3Qh4AuJy+9dqHoxPwGNMMXyeaIz8b1XQ1kd8Zmuv+isRT9xZIBuT+nVBy7pBQWYyG
         sArvwrNWkNgVjb+y9c1OPIr6fKqh1GSfGAm2gijfxZFqwHG2atEbxoguT8SFo9QcxOQh
         ZvS4d54erhAc0wfylYqvAgNvs/QKftm1h9TvfC1yRpmC9FTlXZ+rOIwa86t0Tu8MSkNY
         vM4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEhEEIwNK+vStOabeXHYBBWnmZgq+YFB7V6I97yzZcTRTfugVHmyfZx4BaRxHjr6J0/JJ23f3uaGnTZAr8@lists.linux.dev
X-Gm-Message-State: AFq9FYIQ01VXlIvoIBktrB+qeg/MJteh+xfgi2TxkSQ9rkshiRw5gfXV
	TNLU/FfdOOzTJfhpgB3Gh7rHI5Nn6F9Rf1za9orNzoZ1caazxFmhY31AjJ0tkNWI+UiMhNf6wtv
	EJosa4e5WzSwQ8rrZl7JZQrbEzpI9BiQ=
X-Gm-Gg: AYBFou3XH1xWbLCa1VvZLcSgiVN5QSzzzCQf9PHisv8ah4BDi2VWDK26oDXpfEMlZzY
	Na63cKg+U99db3Snlz7I6za6tfK/OehW3s0Z/hXypYZQZjlhV+7+pSd/ikemj+2mPOsi2iiXgmN
	SOOrT8bGnqiU7QMiCRVpvtYAH1YoFDyas0Gsfzv8pN/wqZbYk0wF9Ej/r+7dx80Vd5yYdRaGeCP
	IbI7wbpB7cnWvuDLW5viG6mJ89HAcIydapem8rajZxV4KJm0bZcDEwMUh7imHw0whUVNh4RlQDT
	nPTTcQ9CX6EeCE7PQfs2wfnJFFpz85ov8ygTRJ3hyiZBAR6Qx3pJMLjDTl1kFA1Yzwp24DLCpXE
	n3Ave01SoKNjOpP4wRXcV4iL49DP18RHJPlYEdBhdfGDOXMxWORJx9lyDEr1YDoIenHAYKlKNJV
	vZtrY37LzWsf24dgVyNvGG1tdr/JdACHCwoUYUfg==
X-Received: by 2002:a05:690c:60c6:b0:8b0:56e6:54ff with SMTP id
 00721157ae682-8b0f20f2b8fmr20435397b3.6.1792360245450; Sun, 18 Oct 2026
 14:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015222735.89251-1-okhuomonajayi54@gmail.com>
 <fcdee571-d94c-a5ae-5ae5-b41977f22073@inria.fr> <2026101653-repeal-deploy-2aa5@gregkh>
In-Reply-To: <2026101653-repeal-deploy-2aa5@gregkh>
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Date: Sun, 18 Oct 2026 22:50:34 +0100
X-Gm-Features: AclHuK-ckhS_4r7IKrzFrVbhZJ4prq24_eCMG7slNkkX4fQeUlsVEZ3ToJ1oygE
Message-ID: <CAFpMFfB4ssJ=YnLeDu16NUXJ2mTWK81+krJ40qzQueHOM4=GhA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: add blank lines after struct
 definitions in gbphy.h
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:54=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 15, 2026 at 10:17:35PM -0400, Julia Lawall wrote:
> >
> >
> > On Thu, 15 Oct 2026, Okhuomon Ajayi wrote:
> >
> > > Add blank lines between the structure definitions and the
> > > to_gbphy_dev() and to_gbphy_driver() macros to improve
> > > readability. This fixes the following checkpatch warning:
> >
> > Thanks for the patch.  But I suspect that the lack of a newline was
> > intentional, to show that the #define is closely associated with the
> > previous structure declaration.
>
> That is correct.
>
> thanks,


Thank you i would drop the patch now
