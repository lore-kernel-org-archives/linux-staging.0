Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D0316180
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097241; cv=pass; b=CqswSm/73Fh2jWknykKHqFjOr2VvfJdrlnNpHW9MeX+lPHMp0OWR5I0B039q1vBsR6ZDWRGovexd5xNBvUp54qFZmxd0S+H0am8E5zySL1gFb51LTToWMs6ixJs+5LQ2c3AyTybyXR/kN3mlFu4bopF26l1HHlQDQbzyTr7KXDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097241; c=relaxed/simple;
	bh=dlpVf1/xdRVoYW1LUbENjOnOCFZFbtIi4CW1lhGhAF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+LWB1HUuLiD1HDm05d9RPmBQNbWHzvyVAkUEy1AhkynR6Fx/Y8wHjTw6TCoTuqlYSSsEAEUgb8RH6S4l+YpFxYqc3mnV1L9mV/9LgPyzPYBr8daVzHJYoylQGJVqbcXAoJ16H972MW5RO1TRYHwiFlcL7cYqeyPBZEEEzgwz2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmGwNRdt; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmGwNRdt"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-798578e2918so5389797b3.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 01:13:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772097238; cv=none;
        d=google.com; s=arc-20240605;
        b=GpG6sNCJeHmn8+s4EH33NJPfM9tTMok/gyOe8CBzePtyDf1S9UbAm8GxbmKUMgm15M
         wkdPemmPSXm5IZxWUE8NbqWrtgNc/7y8bgUzFlXAPsk6UG+sZhAiGvE8M0NEXJBHAUDG
         9hCMDlqy4epOr5sJUjmltuIsp77Js2ztFAKiJI1oGSKPbkdJabDuUA78fvAnN0lhgItI
         1bslOk+NhTj/yYYyb7jILSDkJ2NDL+0N+sZPbtVpwByJW9hDPwsRUZDgZtciVq4KgFIe
         phu9T2+uUkrn4KZGvblmTG6f30GV8arwEhL09Q6tIFsP5BRf9BRM0+hLvUA9CPyhaxPt
         c2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v9+bdEO6JL12EM8AWNj+o5jYXDkW6OAAfPRf+doXNHc=;
        fh=Sh5sGnWCDXWtRx4nz/Mz5qUEbRwq7fIXq8ayxwOI5cE=;
        b=awUz2qcg4juCqQOjwqSThQEsKb9nS9HdCSaCnL36BlAg6WZa7BrShMVZUuaTvuhYj7
         gYKhVF1BE0IqJnq75sQ49ROh+S3LRhST8/DUMihdzJbFKnxw5If/ysCSkLmJ9l+moFOC
         AXDVfdq6zgV5leMG7dW9w314PnBfv4spRzGY5cvBSjiopeyLqEMTBJ9fTsmdkmgKKor5
         /arzFz+TpuMzEutYVerYfKxLgImz1C/lfyIyWLOPZ9HkkejXQbcefRed4re9GsDdTo0k
         edLPHBE0vq5pl7gRsKBFr2LFtdZCg3EuZsFs0tHiG84dJsNDApRUP8k6ONkVA2YsDEFj
         MjBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772097238; x=1772702038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9+bdEO6JL12EM8AWNj+o5jYXDkW6OAAfPRf+doXNHc=;
        b=NmGwNRdt1hhvMJpPSL/ISR/Z7ynuQIivUfuY1vH8cN4UeRB22mwq6Ea0yUVeGUUgi5
         VLSmbQUu0mKeMC51Tc+PF52TtOVEXuvT2tetD9UY7JnQid6d9jp1CV7X3uUor55trBni
         DD4XfKpa6p6CgjgteZVUHwH8q9u7UTTGM7hjOgYYMCN5f3Qsg12h5Qeu6ZHsYTWCJILZ
         lf/uCqEri9Oj1WKRumf+AKWi/gi97bu2+Ik7iO6BiIWJRq/7sKyZywESF+/PkBDaeyfS
         YwTs/hQGJcxX8DjzHSS7oMvLSln1JO9F/v6vWXAlm6kquUhqAOB2n6TNku8zc2YUC3/N
         9/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772097238; x=1772702038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v9+bdEO6JL12EM8AWNj+o5jYXDkW6OAAfPRf+doXNHc=;
        b=DScHNlPWsBOsxvXXUwa0cm/Ty8VVLEPqBjhE/37at/IZpPoYAlIe7Eqk2BvNgNgI9m
         GiSmZrIOnR8b8duMDYBgGUVvQTQ4J0Ge3++aMv4OhpCFhuHQJLSUh34BcN9JILa+uxxf
         8MXAk5oz0sVpM4S1A08h6fQ1ems7BL9/0E8N62R1lcjaL5n44fAUGS5f9SW6dLA+TnHM
         N7HYaBc2GIqo9vGME8cWc7Au2gTsXGCuPgLQN44pYEDkjAfFU38cmTAUF/+whV/SQF0X
         D/m7sIXsTsZDGq1rO9V0Wt469pBZa1nVdT7ivIM0wbB4em6VHYeSaXxHZTgCI5RPRbwZ
         xqYw==
X-Forwarded-Encrypted: i=1; AJvYcCWgdHgJJR++wRqrgosf/Y4etnapsT/2Gwtaf6zHdag5LmVYutV23pZmb5jYttMUti7602Pl7c4SF4bKIDLd@lists.linux.dev
X-Gm-Message-State: AOJu0Yzww6JlSVqjjgOvIcwLbOEEolmLLaozFbxtR/IjtYJiJ0J6D34j
	5w51zwrgw0g//SedVwD/3J5VznLYApVZKYyEQyCD+omZ3lwcl0n6SPkuMckqEY65FpYPWKpe7pd
	LrDvN7ZKjsF9A6V1C6DyrGDnPF6Tyxlg=
X-Gm-Gg: ATEYQzw5TCXwfvwjO4l+JmJTL7rfFYJ34wlHjaXbWqdxBWxLe+J1KDFjzDkluB1gjSk
	TVgxnxELBlDGjKqXaLS9fv+zAt2Rt847w1UvvwLfAoK91q1Sd5ktofTEOPpbQbY0r0+O4I3LfKy
	A/xYYh7FRMeYEAMBRZvV/cjfQZ+7+glSpIQ00QCWwkS+VCeDnSZaowCVvoB6B/wEyVXH+NdkVCF
	pB3d+preqeRzncQtKcPbUyZDHjRTsyqpQlNflModp2L81MfAKkPz5ATWfCJZsSIfUJdse1t15t2
	DZY0lIq38P0=
X-Received: by 2002:a05:690c:c4f3:b0:795:c78:b648 with SMTP id
 00721157ae682-798291a1676mr170018657b3.60.1772097238208; Thu, 26 Feb 2026
 01:13:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223170708.9627-1-mariyam.shahid135@gmail.com> <2026022410-upswing-gurgle-532d@gregkh>
In-Reply-To: <2026022410-upswing-gurgle-532d@gregkh>
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
Date: Thu, 26 Feb 2026 14:13:49 +0500
X-Gm-Features: AaiRm53OFxXtmLRhylFYYHMMskiR-ydqP6bJnu_b5qJZDncEYYdwKrytlZHQBOY
Message-ID: <CANhxO_ghHJz-MJrZWHaqUL8uiZyrHZ=RcM5ytvxiALA_5Cq4zA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace comparison to false with !
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, ethantidmore06@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 11:11=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Feb 23, 2026 at 10:07:07PM +0500, Mariyam Shahid wrote:
> > Replace comparisons to false with their logical negation
> > to fix checkpatch warnings.
> >
> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/=
rtl8723bs/core/rtw_ap.c
> > index ebe73abab892..0192543cdec0 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > @@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padap=
ter, u8 *pbuf,  int len)
> >
> >               rtw_ht_use_default_setting(padapter);
> >
> > -             if (pmlmepriv->htpriv.sgi_20m =3D=3D false)
> > +             if (!pmlmepriv->htpriv.sgi_20m)
> >                       pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT=
_CAP_SGI_20));
> >
> > -             if (pmlmepriv->htpriv.sgi_40m =3D=3D false)
> > +             if (!pmlmepriv->htpriv.sgi_40m)
> >                       pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT=
_CAP_SGI_40));
> >
> >               if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE=
_RX))
> > --
> > 2.43.0
> >
>
> This doesn't apply to my tree as someone else sent this change before
> you and I applied it, sorry.
>
> thanks,
>
> greg k-h

Hi Greg,

Understood, thanks for letting me know.

Could you advise which tree I should be basing my staging patches on
to avoid conflicts like this? I had been using the staging-next tree,
but it seems changes accepted there aren't always reflected when
someone else sends a similar patch first.

Should I be checking linux-next before submitting to make sure a fix
hasn't already been applied or queued elsewhere?

Thanks,
Mariyam
