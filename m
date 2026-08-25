Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDB43F4854
	for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653536; cv=pass; b=Jk7/AJjr36WsGhsoeH+n2M2EXkxvLiZg0yEVk4HLjkpqBk4EZFwR/zPjJzmJTzF3TqkpNhFfe9BakKuAuCBnYJ+WLkeKzU+cx5c3at1ilXglTXp3D67zOjCS7RxAYwVfA7xBBELIC5gc+ugaM8MeiP1z8Aupt2dn392W8i7NC+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653536; c=relaxed/simple;
	bh=HZodd8oSY+EzdU2Hvr+eLXiq3pe6OJQvkFM8hIxOLbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dv3LDxkw/RMPIggSGFnGH4UHCMcE0g0CYinnzilvFEu30fvDHzKWb6W9nhDa5o5W2SDvXZhzVi/B05t2JtoVU/5FEUIBvt2odkVyPoT4QRSohHjniCEckApSFlquhjiteI+cM3aIPjEYX3l9GhdcUjZ1qk7ZhATYpT/e5YrVrY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQWYcSVd; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQWYcSVd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20ce3c118aso134542166b.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 03:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787653533; cv=none;
        d=google.com; s=arc-20260327;
        b=m2hEsE95VwwkcVbDL5SEFbuZsT76pxPAspp2CFXUEDUF5ZFoI3S9P8WzoKTHo8n17k
         1r4+dRFHgSdvhfIowscExjnM9GMmDFO8D/r8fn+WBiLx9gWltDFpI1xp8OjULw0saOlq
         tFHA9AQHLYVxRf5Td5nu2mi+X5i42R5b50HVXXRyts+PLg7X0W7vb28tJJe/64ilw+Yh
         EbaiSv2Id7wHhJwpqA6t96ojBz83SBuQcjBgyYLzPzfDJ4Mce7CJUiBIkAeeKDimgEi+
         0wi2AP7QMuJ1lSJLBYB1mqAvVU3BHK23tEusXQH/MryLSOKqj12+/5Be+Hy1cC1n429W
         PO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HZodd8oSY+EzdU2Hvr+eLXiq3pe6OJQvkFM8hIxOLbs=;
        fh=sBEaFEC2FTx6hFGsARpl4vup1cVmHO//RDxyIh5EoLQ=;
        b=Qm+nqpB5A2ZvBSI/ISKOWbQAu0ZX3iO7w8sP9VHsmFjdW+NhGEThLjUl7EwLSXOmsk
         s2KVyKzU1bOqFevPYS1ThmlSrunTadleTrF8gVhcImrM4lUdvlGbdFrZeBlLQxX8mouu
         s8KBM/12ICFXkNmaEkVHPoyVccAiDa3zb7YWOY/PcWFjtIsosppeZRjrwZb7mUThKnoJ
         6F54a6+cdW6RIRnc2083cxqJqEVUgvr99PyWLBK0cMcxtq3gJAx327XljFHyQpwHnCtU
         CVvzOQc4rt7gtZtvo6IDb8FuuShMY0Xx07I8+KdDXKtmN6awq6YnKIj1SrE3ONe7+jbq
         EuTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787653533; x=1788258333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZodd8oSY+EzdU2Hvr+eLXiq3pe6OJQvkFM8hIxOLbs=;
        b=UQWYcSVde7f9Q0SYndt8cZ0hVXl5ce/Km4Y6E28aJfgIKQCtVZkSu3I5kXHbDuxm6q
         V4LdrHns7+jGI7KUY6uiWkCO/sVZkgBSKZMvlfo/cEas5Jd6aw1BPiy5/t4o9a9e2Yjk
         wC5hHfdE+KdaAyno6IoR9o1/fpTdip7MEffYdA3ycVYxy54CD/XjbvjdN4lEuO4f8O9p
         ws7LB3gkY7MgHR8B/GyMJKv/mMV+osqUrQvRWWbwv11OMLQPgm6Ivlbo8Em0hs2PPstr
         J2Vba4237E7TvwAKaIpau0leTsoZ2ytHCLINMFgdaH+VeWcN4TlCLitbNE7jpYG0Xhk9
         hD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653533; x=1788258333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZodd8oSY+EzdU2Hvr+eLXiq3pe6OJQvkFM8hIxOLbs=;
        b=i6qnE3usd7j5T4QoJMwUb6NctVKgmY0y4MxGNYYDct5FiVaLjhZU55my2bxf/sgId5
         YtQn7SvILm/fVqtu6WjulLeA9i0mXk9MLGlUuCECPR72an3XwQ5hdTtDiPDEL0tMiAbW
         uXnjZlW2nv1LlfgFCCKghYbu/y3i4W2YVdvvWQZYhHzNzwTDKQkFzm3NP9i74g8iAqjy
         43pD6tK8rbhkXihiVLr7tB3Uq/+g+Y8Vwi+B9Z4Ml8qepjFSxeH9pk+zWDfFMQyJTXgm
         Oo0Hqx01KLrxR1ArlCxx9Pos5CjS59t9OwvHcg4DGEwFpEZin86Cu3o9W69MBe1SpUDQ
         v9rA==
X-Gm-Message-State: AFuF++kNfY58Nh9OuMEg0OXiArsjI7fBehd2ECEmmt50uP8UNcwZd4lc
	P4kOS7qOlvnhEC5RtWctwmqOLrfjfvEuCgvn8r7eT2CaDMMeO4PL+4XB3JcViytDyPPeo2jv9Da
	t7W7B7QPaYjpRsxS5QujNwwANYrGaT/jOGKnyYKI=
X-Gm-Gg: AR+sD12SgHq5UYz62ZXsXZ7nnECtzuWTj56zYwRtiiu0fj8v1wF6o1hfE0ZO+S8+P6Z
	RFarg/MzplwAtRZfw+hzF3MHWFZWv1p74O8GwIfXnEiZPYXvJ4JKxtLTjxkEe2agfqE4jyQbwEK
	evxUlGpTdgGFhcbH1A+35Wlw4rdXOAdimyt103gPIeK9bga+mNX/ROWAV6THKGBrHmGoiQYdojF
	rt6Zxh/GnCxMNbXGTkBYcko2pcyKFsAvaB+EeGI9TW0saxd3bnee29GoDF27NRyY4B4/hBkyCgz
	/NoC3+UlAL7qlEOzSZQEeCHfrjzA1faG42090goakB2L39B9h5YqsknjQoZw7ULuLJ0nv30ITeU
	Iui65LhhDDddS4tJNvDIAKyvKt/z5
X-Received: by 2002:a17:907:7203:b0:c16:6dac:a008 with SMTP id
 a640c23a62f3a-c24e2d80f98mr533963266b.8.1787653532753; Tue, 25 Aug 2026
 03:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728125456.32359-1-meatuni001@gmail.com> <CADqcGB=j8cSE-CW8dLC8My0rk70RC-Qidmvr-dZvzCUFE5wadA@mail.gmail.com>
 <2026082538-divided-raving-3346@gregkh> <CADqcGBko4B8hEXkgG6LCb9HXoW5HdcTNBAuWh6CQN2cURgkT-A@mail.gmail.com>
 <2026082555-balancing-facility-6e54@gregkh>
In-Reply-To: <2026082555-balancing-facility-6e54@gregkh>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 25 Aug 2026 15:25:20 +0500
X-Gm-Features: AcwNN1VF6BEf03xB8JKDvhR2JhGSl-RksLQX6Ba0p7YqIXxO3MxkYHBnZ42I6LQ
Message-ID: <CADqcGB=WuYuBPaX7SMeagm5G-OwdBKxwF3OBcO105zK-f2E_WQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: fix multiple OOB reads in IE
 and frame parsing
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Yes, I have tested this patch series on a real device with the RTL8723BS
SDIO wireless adapter.

The device was tested connecting to access points, handling management
and action frames, and verifying normal network traffic without issues
or regressions.

Thanks,
Muhammad Bilal

On Tue, Aug 25, 2026 at 12:29=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> Please do not top-post.
>
> On Tue, Aug 25, 2026 at 12:22:54PM +0500, Muhammad Bilal wrote:
> > Apologies for the context-less ping, that was on me.
> >
> > For reference, this is the v2 series (sent Jul 28) fixing three OOB rea=
d /
> > stack overflow bugs in rtl8723bs where length or offset fields from
> > untrusted wireless frames are used without validating that enough bytes
> > remain in the buffer:
> >
> > 1/3 fix OOB read / stack overflow in rtw_get_wps_attr()
> > 2/3 fix OOB read in rtw_action_frame_parse()
> > 3/3 fix OOB read in rtw_restruct_wmm_ie()
> >
> > It's been about four weeks with no review comments. Just checking wheth=
er
> > the series is still on your radar, or if there's anything you'd like
> > changed before it can be applied.
>
> It's in my queue to review, it's the middle of the merge window right
> now and nothing can be done until after -rc1 happens.
>
> Also, have you tested this on real hardware?
>
> thanks,
>
> greg k-h
