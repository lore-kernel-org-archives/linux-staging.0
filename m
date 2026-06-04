Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6034036BCDD
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566734; cv=pass; b=bnWxJzJfxXLqBMJ8MOlmFHy17ItXD2kIU19Dccn0qqINl+qPelO/MuKHq19HMik3P/aeJQ2V3tDIyFCqwpq98IbhdNerv3EEKQUfNEkFT3eIz6o2F5G2GJnTSMzAQczUwpWCNoFbkZtejNdxM4vXldszxN8s+YssyT5zskKRyOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566734; c=relaxed/simple;
	bh=5OJCMJ+HcTg2MlMj6RL63HqLG8V3a4GLeDXOtuwojQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXrIRpUQm/wu4oKfsejYLAVDjuXbF2Zy0kUmO05IF22DNGOQl6n5HOkGFjk2GS/S3uGFzzgy5+d55TJroe02lnuvqWE2bdprIA+5XYFtu6sFn5/kuaRhMB1VUtDYl4o+Zjn7zdt1SghAPcECrlvQZWZDENTNY1BNoTxDHFE8Azg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmJFkVG6; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmJFkVG6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8422f395a4aso307488b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 02:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780566732; cv=none;
        d=google.com; s=arc-20240605;
        b=ItrYpz7VefsmbtHJRGTmoFlryv+2riTbChyUyjUjaLE4wxr10LPJbdpTeX1OpyB/F8
         ICMqpb7yQ0RnFM7J848/hkHZJ1EIXiTkPeSUvxgiRvvzYHYD6mFiRqNHhVHJ2e+EMt0m
         vIh332ZOUwnBVapZkAOD/kWiE6N6MicyWsRYvp+V4wdBx+KNBCAyExN4wU8RlLIOehfh
         QPAfV3s7NNcH1Xz/lwrNUXeGW45aF85otvTUJNmiidoHRIJ+9zyuPzqVSMcaL0EhO4Kr
         l+zCkQJSmCWgI6tv6YywydD407T9G+UHusfr8Gv4Mr+/2OnhTa3Ww6hwtBA6tm2neLNp
         L0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5OJCMJ+HcTg2MlMj6RL63HqLG8V3a4GLeDXOtuwojQU=;
        fh=X05rUgnOtrV29ZohCNUycGaPsgXN11YPP0euZg8J+G0=;
        b=f/Dq5Gyg209cc4xfAgC3HfjPTBrpTWi6KKPgEEJY4h/qIMt0gm3snCLXW3MCpUtlcJ
         qZn9eX6wf6WrLEv3f3YPFPT6DlE3cM6vg5cm1zxf12RgJsbQ5cSuSyp6DF+xWqFH5MTd
         IOAr8yeoys/K1bu1mQ9HawIIH/+aFTS2sdBOhuVbAkcF6fff7qpPpqcpTqrOdGsvOOGO
         bvl7BkXEv6N0BMXqf1UO73WQhjzQTfdohG5ZXfKNitMy5Yb4SHXJF+cNeZATjVBRjOSJ
         0YJjUKfmLygTXbQToIzOGNMQ1wRyL5xI/cwuxxGAZJj20xCPjzBR26rgLSy0u4+q6S2d
         +ETg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780566732; x=1781171532; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OJCMJ+HcTg2MlMj6RL63HqLG8V3a4GLeDXOtuwojQU=;
        b=JmJFkVG6yJ+26AAdzMcqPitJtV8n74JzsAR71sYbWvF2eXJtCn+9J007KAvyf5PspA
         AF/cbQZIzCER5hOVmTCaLytesqHrGBYdy8DU5tG4ntvMRzqO8BdayOd9UCsFrxhIwnnR
         d1YlqDM0e7IqnWGLOd6ZXkr7JsKFdQa+AjapNXIko+fmbYq2ef2flLLIiWbUuN8bNFrT
         xYpz5teEWfiprEVUPYIOKIft3wklH+nK9jHKtzWGA5Cwn1BHcghpkaZmm6nbGJi5kkwc
         bd2NXCw+A63WKmqHfj63A444zb6UtKB2j9zMhNvC2qn5U568ODp2cwnh+wJKYQ8btmlP
         l7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566732; x=1781171532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OJCMJ+HcTg2MlMj6RL63HqLG8V3a4GLeDXOtuwojQU=;
        b=nbeZCgRAaba1gI0DZCr5l5+F7APR8mdf6c/MJactbPgfRw/ZUmIEzc90E5e0dv8yBO
         FQ06DEoFGWAKoEQGINXnkOCa/kxJVmxGqo96SDZT9CMvs7920Bfog9HWN6CWyGGikQhb
         YNMM41+N4i/zlz3hw+IRb93sfQfBSFGlCZasNVCi5ObEqXq8QQQCneJMXwBtqnrtuK0Z
         uMJx+We+25oxGd+kTXhXlZZMprBqQ6swI0+r8oZCLIEc4bUGs+Y3QcEegnCnXbAxJluM
         lep02/zfGoJ9UEKJ45fZvpICTBfHabMVAHZeaPd4WBeoi8Dieg3yMtzXTnY5zxJqXjSl
         L2WA==
X-Gm-Message-State: AOJu0YxEhHSekXOckymjf9uzHzMmA/ra57sH5DOPxhB/rWoEUd9nNTqS
	Sq/tDcRRGeEEcpCX84fRizTbslnJICnygF6oE7f/EKQSi1V4vwE0I5iH2QYMSuU5X+gMyrTUwn7
	+l/IbtLW0CTRY1TRDDJEXplZ79AF8kDo=
X-Gm-Gg: Acq92OEprgvlErN4tDiTinoND9ntl8glUG0ucYj8T5xT0ZwvAGDh9/mjvE7eN6ROrJy
	FuAUFTDAv8tY+Nhq49O3bxAV9ATQ3Mo3P7NVVG6a58F3ceSz5JNjc/pEh+GVQSz9u4gW1D/7xqo
	Qq0QASlJA4Gky49aj0HtDckZ81xiwa/HjM9LtFx8/33bAyNAndhaT0DJcnQuvwHOlX6rmQ73uOu
	SJTOFHGO7ur2BQLrnojnr3n0C7hrTuWVhhxc+VU22dBdLYQ3GGZDpvpViflVmINvgOpM9Ko3boU
	dqIETbMgBlgHH8BoXg==
X-Received: by 2002:a05:6a00:10d5:b0:82f:53f1:1937 with SMTP id
 d2e1a72fcca58-8429b7254bcmr2457636b3a.27.1780566732530; Thu, 04 Jun 2026
 02:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGEkeHfdQcZ4tfayL0=pbN7roXrO7VBqdWNu_sq6yLjEk=G3Dw@mail.gmail.com>
In-Reply-To: <CAGEkeHfdQcZ4tfayL0=pbN7roXrO7VBqdWNu_sq6yLjEk=G3Dw@mail.gmail.com>
From: Grewstad <dogestad24@gmail.com>
Date: Thu, 4 Jun 2026 15:22:01 +0530
X-Gm-Features: AVHnY4J0FwGCAqLHTL932eHC4rKN7g1_okzgbq1ywZ412q5kr8-A-dgUcOxIxl0
Message-ID: <CAD03fjZ=QQ_riJtUd3pvjioPRD8_DZi7p93+FBSxBAYRV+S7wg@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: Denny Lin <dennylin0707@gmail.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>, 
	ovidiu.panait.oss@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	jacobsfeder@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you. i think now that we have found some users and
applications using this driver, we will not remove it.

Thanks,
Arihan Bhor

On Wed, Jun 3, 2026 at 7:18=E2=80=AFPM Denny Lin <dennylin0707@gmail.com> w=
rote:
>
> > I could not find any user-space applications that depend on this driver=
.
>
> While searching GitHub for userspace applications, I found a couple
> of public projects that appear to use /dev/axis_fifo_* devices:
>
> - strijar/brass_gui
> - ppoolad/uoft_lidar_test_system
>
> Thanks,
> Hungyu Lin
