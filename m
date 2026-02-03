Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52D8318B8F
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126265; cv=pass; b=TeWawcWBf+IuqhZYruAFGFvlIZ5GU9caqs93bkTtRut3R9ARjzQ4QFsZ4RgFkbrkUvdnA30J4FMfDybrfXxZTv7pE145kx5W5jOjoWQPZrFRBmM37CfkMLr8KpYQxFRUS8ItqjbHPQI0xpzel4EMiFgau5meHmqPWHRFETg6L2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126265; c=relaxed/simple;
	bh=iuZSpPpaPpTFtD1ooeSKqJrFqchGmetEYieop4hdUSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLsDfiPuujzSEnwh2ctHB2wlWZivKRazb1OEFsCmahkNuz+5xdTKlrheKGlcDr0xXF5CwLAVujsdQj6YJ4U0UWEIPjzz3SL+wDinRj6fZk3nNCIXSoZMKIu+GHJILhSes/4s0XO5hV08Cuvt6yUxgMEDbj4ybj644UWFc7Ew4Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYuq/ioH; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYuq/ioH"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-894a2309a29so9567056d6.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 05:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770126263; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCVkzg8d0BUE1jQcr+6zTeXTraH9de8invwr6aa03CLYzhCUN3xHyS3tP9qP4Roex5
         648PGu1XVkMjPLr44/AGvgtlV2HcsUP0jEMSCWn1bo6vvWWVKaYNUeCKpmvHDzffBoF5
         6nZKp57QUb7V/2hXCXOVF0w8/pM5QKV8lEKXUBDvD4JbGQS2ZOvfhJZnjWFRf7twtUh1
         AzKcySCBs3vxn4hLpsjUp3G2sFSDKxjKt0EzfYJMt5yY0372HgniU+99hNWujFZigI18
         T9i/RTQ5C9jyuCGbWPyv8d+aZ1yJRjWnRzEg8FGqyXf8DG94LXvAaADBbHSp+ILlEeeb
         BIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OMJ5HEsb4Yf04zBk6h6L8A/5qEh5O7V2Qv6F0cZbe1c=;
        fh=DAGLpNfbMhVQ3evNrgdmuzpGq/6783mCBY9lLSrEOsg=;
        b=P9TWY06wk5jsW31MkFyge0KhCYIaMf+VEF0Wj/IbgDxreBTr0Zs/Y2WpPONhp2ulz4
         CCs5crcHGIKlEgV8DCeloSBphchuVbPZrGjx4mavJYJpT5mbOOuq5RDSWgvZXTRuh6qU
         K7696wSZ/LA14lqI3FggAj6otF1ZXJojl0HnLyXvuhjEQpZG6SRpWmFdRoTE082RtFUS
         DFNIfEEkoCXzEKeCI2IgtxA6UrYd8FIJFHaHhCOWtYVk79XhnP73cxxtVRy9oeJGg15f
         spCFPB+wc2uoWxy9dMnI5rJxgNX1LNO94IOcMy88W1tuDIv6SsOvedzF0jPzjhJB9cih
         7zcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770126263; x=1770731063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMJ5HEsb4Yf04zBk6h6L8A/5qEh5O7V2Qv6F0cZbe1c=;
        b=HYuq/ioH8xzf6689bBkuhOVg7Yw2Y/1DkvBY8jflKGeBp5OmdMdmiAt4+dK2HLkGXA
         P43HagkWtUfvUjpfQCKDb/7kH5r8+efgsBbjsYGcsCao8IUXkq+9mBBYU5l3MO/PK/v/
         rBaU1Mf8d8kh1Sx9rVwG88l9kTH2iS4gNawWoxxacR3W8lsC4bKH8IkXkBcpIyXr1Xfz
         aC452b45fhvIYzYeI9dSjxt6rIuaNHByNQ23zY8D8RUh7H1JlCY/1IdwG8jA7+4PXqWP
         83TNP20qa89ha+i5gfjQQ6ughB6TPmoA60k2Lt58YezmCwzCWwdJZsd3arL//rPIKM5M
         sRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770126263; x=1770731063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMJ5HEsb4Yf04zBk6h6L8A/5qEh5O7V2Qv6F0cZbe1c=;
        b=IaRWM/K5iJOVTLbFVYTrUQb9nwLfWXAcyH1wpgWEuzieOgMRazVuNOJ95bltuj9pOZ
         hl44WS8p8HHOl7qKs+zyobtANS7psNE6QLK+8pr/DTWRMI1omx4IO//AqcHtTi5uiHD9
         l9CRhDgwm5wu+V/bvm913FSYvSe9Nx243y29nXqu/Gw32ikS3+Six08xzi1F4v6cN14S
         2TYw3fZYduhTO2BKMDLZ/9lKUGahslRFVgMNy4j78V7/b+B5Y3cBCh+Twzrli959G0qX
         tl7CU7YoNUslgHwCOFfgLeOHiH8iAbQoyJotoCR+KA4mQumEk6ZPeN4rUCxEgHi3Qi+U
         o/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD5CR1WwOCr/GLyoZwUiiRE8jCOrJDrimqLkHp/m0YRaUNNBXBt9wVV9C+ab4jR43RrgDWjpcQRusgG905@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/kndNbq9md0VpoKQfDh9JFjRHfONw3t8kkEvyuj4rzH9l9Tyi
	tjkl1QIabmvsCHwF9EsZAlRstfoD/eHNWSGEDmnLxVH9alJiupSSP6mq2KrMSqSmg7hQJaqOGJy
	SyUJqMwD/3H7XT6zaKdw4dWUbYLTRego=
X-Gm-Gg: AZuq6aKqJrzs7GuFP02TeRTWBEWc9CNMXlALpZ7wGw6a6KRaWKafTtnRmSoRr9FSdeZ
	DPyTS1HL/wtGvAac4FE8oO4sCJJbBNDG8xEd1d3BgoBcOlc5VwiZ9/CodkKyM2Bw/nKR2fDCWVt
	n3ZeEiXrHCt3nHNhjsJO7PZyXbOISAyjOQxIG8QZkPHvgzlg2XYziyw93fokz02kBbStmPC7p5f
	uAeE/GEHW/sDj0ti4MeApk9qTSA9pFfNB574/gSWmCTaKg+t0k6NnxWiHwvMBGoSL6fsjeJnSCH
	sMgBWkLri5q6T4XqWugl2GOg6jffAZ/wFX5POcY=
X-Received: by 2002:a05:6214:f28:b0:88a:2ac8:9b3 with SMTP id
 6a1803df08f44-8951831a256mr37989296d6.9.1770126262673; Tue, 03 Feb 2026
 05:44:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203114858.28278-1-baran9arda@gmail.com> <2026020353-ended-graffiti-25d4@gregkh>
In-Reply-To: <2026020353-ended-graffiti-25d4@gregkh>
From: Baran Arda <baran9arda@gmail.com>
Date: Tue, 3 Feb 2026 16:44:11 +0300
X-Gm-Features: AZwV_QgGo5uDlSstxclBjc1K5vJf2i6ps9trUDJW3qfivotKTudSLzIRXBzMjzI
Message-ID: <CAMp7ucpoyXDWM=xndZTEc7H1OJSH6sJO2qFLYsux6iwSTHu-aQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: axis-fifo: fix sleep while holding mutex
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,
I didnt think there was an issue, I thought I identified a pattern and
wanted to improve speed with this update.

This was just compile tested. I didnt realize it would create a _race
condition_.

I occasionally review staging drivers for cleanup opportunities for
learning linux kernel. I do not have access to this driver.

best regards,
Baran Arda

Greg KH <gregkh@linuxfoundation.org>, 3 =C5=9Eub 2026 Sal, 15:02 tarihinde
=C5=9Funu yazd=C4=B1:
>
> On Tue, Feb 03, 2026 at 02:48:58PM +0300, Baran Arda wrote:
> > The driver calls wait_event_interruptible_timeout() while holding a mut=
ex. This can lead to a deadlock or poor performance as the mutex is held wh=
ile the process is sleeping, preventing other processes from accessing the =
device. This patch moves the wait_event call outside of the mutex lock in b=
oth read and write operations.
>
> What kind of tool was used to "find and fix" this "issue"?
>
> And how was this tested?
>
> And are you _sure_ it is correct?  (hint, I think you just broke the
> driver's logic, please look closely at your patch...)
>
> And what caused you to want to make this change to this driver?  Do you
> have access to this hardware?
>
> thanks,
>
> greg k-h
