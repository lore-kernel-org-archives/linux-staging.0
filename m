Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D13CFF7F
	for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787642654; cv=pass; b=Od61hILhKEYTzsKbBjBNOOq9RCPaUUqXF10lb1FElW0xpWxYpgLI8HrIImrP3ICEVOwS4x7/AbJHyM2HudVepwvXBpo0V/XMPg7s3bSTbuH2zBppHQ9FvHplZAe2v/gHkWBHDRjo8Xy2oKhtdpKFcV+E4lv3QcXJHawZPIIojhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787642654; c=relaxed/simple;
	bh=SiNqUwUIFt6SRHZmrmpiB724uzW4gBOBRWi19Ci/8DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQbwo4sF66IjEn+uXeEwwXJdyyIQOEhSF9f7Q3m8BuHEZTMWDVZT4//pTFE2lzkp9nkNXztD1jklF0upTMmEZCveHvCWH5HJaJFKzzxLOZJnAd4q1+72i/+NHowlgsTSa0OSlZNnhby/ourlzsKQUArcdAwd8L54aFbCxXWn7j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPAYD2bm; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPAYD2bm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1f758014b8so481122866b.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 00:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787642650; cv=none;
        d=google.com; s=arc-20260327;
        b=Q03SbNW6hf6oq/Ja+6O/ax5BcHHKdnMig4WIZMSQ1xOuoOjy3EirLoQkKDaE12Aw3W
         X9CPJhSJgerc0z/DkiGSSJZsFOZoH8KZcmk4OeY5ItEM351Y0zQj5rB/9BdFAv0gE8Zt
         CXHHUcDCARpXzJtCcsCSz5MQ4CpiM64CcP170pFnGQvxt+pG8faxmyFt33Jj72VOuYDe
         1czNOXoGasjhuaDI5CjHwZ5is+eNST5h+OiDIbwxJUNQp3cqqJu/dgYGtbffVN9+wvgH
         kze76Msd+L/lRZReHeH0dkSWu3AziVJvE3hQHgxWh7Bq++8Fx8GJrATOBpKpPbSaC3Od
         7gQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SiNqUwUIFt6SRHZmrmpiB724uzW4gBOBRWi19Ci/8DI=;
        fh=7i9cxWMjOVCadkG02ropF1GjyI1wNV+s/dP6Cf4rCSg=;
        b=W7Ep1LZbfdLxr8YIeJWm3CLc27AgqwSfV/BELZJg2hCUb8E2HATXRSEbcw94Hgq2VT
         aF6XGnoNYoymLcnj8Kl5FxVohsaRx0Ir5Yi84RKuYYxvqfkxcAUUTT1w4MwKXqL6EaHx
         Am95fCVBHvTmQ0jzA99/cuNt7bKxX18yYS/bgEEoXAB8ZRXapLofQ7Y3VSTr8pL+PYPL
         XEggxL7geLiqcOSk97+TOoElDWvIAJyyKdQAX8RuLbJZPHYQhZPl/XB+GlAJ9fwC1txb
         zLdpc9+l4VgpYxoe2y6nzqH4AF8OMSnGQ3MYAkqDbPxZXNl7EpspJHW6RNhAAYlVcUha
         JQNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787642650; x=1788247450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SiNqUwUIFt6SRHZmrmpiB724uzW4gBOBRWi19Ci/8DI=;
        b=JPAYD2bmkELasQyC7kwKpdDxWIE/kb0iXQPhbFWvcJgtEuQywKHSiNu98RWwgR+TkN
         O3wmmD7FZrftaLC+mMV4O+m5wgjuCJnhI6cJxqnsXkls7fPw3HURg86JDbq/XjogRMT/
         p1x/HLurTaNdOtJoDFCpJ5G7AavfkaY59e8JqYAJNqEqIAgTTmvpBKIQMtQuQrh/CZ7B
         Vh1rUgHkP/tJ1kml/pmMVILIKP5lWXe/mRhiSn6n9H4uDvQR27Yuei1Zt2lNtdRMWqyZ
         Jv8SoL6uofFlcZAQqz0fYljhoFYU8t3R2HknDXTDyv0h+QraIZYNvR0i8pV+04QAoM1y
         zrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787642650; x=1788247450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiNqUwUIFt6SRHZmrmpiB724uzW4gBOBRWi19Ci/8DI=;
        b=CtGuE+I7SqXSJC7SyCP+JISuNQcIOZgv4waXBFpjAYd4CzGXXSc2RqSGJJDQS0PUTo
         vLEd3c6VX5PXjRUTeI0utnnV7BGugY7dnCPOev6wjVMqvBeqsrxggV/6f6AMKBxkNebB
         ez9b1Sl0wvyAxis7EE1S0XDee8uO8y4i1I1jwnDxfcy4xUDSFwzc0yt5SIhZWkeflTnv
         32Vo3gzCxVdMHhUb2r6eJbzOxNy0SI3QJzZRlgpBt2/C/+pueezoyNhbwcWm/JSiaIYR
         YyJq3ZCmj2J5UU/46/wsaAhOECPOcG3saKDWiV7xma7JJlpA0UOLLvZSlim2BX7UN7Cc
         GjEA==
X-Gm-Message-State: AFuF++lFTjCNCqIe1DWnbEaw99DLygLAismApocFPxsKA0gkx0QKdAq2
	eLwwE+EE9eI+CvNXbYL3KN9JTSSlHcOEGHd7qn9Moe3LzwBaJwaSvsWimMTfuiuzYAAZvxVXDVg
	0PrtzvT8Dbd+fZi5eEVMawHv7H1WEehY=
X-Gm-Gg: AR+sD11DBv3GuZPcKkU0e64QSYn5nU78uYH1c/5ffqOInIFt/6p4P7rBFRB7Y48kvdC
	iikuuXWYQCWut8mvRUL2H5AvlTJ71cAJaUHw8kZEEuJ8HLGw/uH3Avmnpmv0QpW2YgyHXWQk5vQ
	BngK+ifWHsbV0yndgCYgsSUlpQ21DliScUp4ejUBjnA6jpvskQGfB9xQaGxkwVu7M3RDf02ve3U
	TUVPoF5k2Xbf7c4h4vJA7hOvd1xKbwZ6SRVFkT8BLfEj0rsZ7JGoppYUImJoNrnFzRmY9DyVndm
	vNM1l1VYU17K4MeUb1yDpnK3zyem5Y0VQWsiCJ7yg5HVzvr+vGw3fQziyYvBfWWPWHkArYq89k8
	ldFdA9mX1lswxTMgvim1tmxkp0VRF
X-Received: by 2002:a17:906:fe48:b0:c15:fc59:cdf3 with SMTP id
 a640c23a62f3a-c24b3ebee48mr1966772166b.12.1787642649742; Tue, 25 Aug 2026
 00:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728125456.32359-1-meatuni001@gmail.com> <CADqcGB=j8cSE-CW8dLC8My0rk70RC-Qidmvr-dZvzCUFE5wadA@mail.gmail.com>
 <2026082538-divided-raving-3346@gregkh> <CADqcGBko4B8hEXkgG6LCb9HXoW5HdcTNBAuWh6CQN2cURgkT-A@mail.gmail.com>
In-Reply-To: <CADqcGBko4B8hEXkgG6LCb9HXoW5HdcTNBAuWh6CQN2cURgkT-A@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 25 Aug 2026 12:23:57 +0500
X-Gm-Features: AcwNN1UC7gqL1hUuA2uFBvo4qMx47GRcm0iQcoityUhZNg3Aaw43rBz_aKIoujA
Message-ID: <CADqcGBnfEgGm0=arJHGkRtGJb48p24cJN5-X+Hzqo6W8B9JUFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: fix multiple OOB reads in IE
 and frame parsing
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies for the context-less ping, that was on me.

For reference, this is the v2 series (sent Jul 28) fixing three OOB
read / stack overflow bugs in rtl8723bs where length or offset fields
from untrusted wireless frames are used without validating that enough
bytes remain in the buffer:

1/3 fix OOB read / stack overflow in rtw_get_wps_attr()
2/3 fix OOB read in rtw_action_frame_parse()
3/3 fix OOB read in rtw_restruct_wmm_ie()

It's been about four weeks with no review comments. Just checking
whether the series is still on your radar, or if there's anything
you'd like changed before it can be applied.

Thanks,
Muhammad Bilal

On Tue, Aug 25, 2026 at 12:22=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> Apologies for the context-less ping, that was on me.
>
> For reference, this is the v2 series (sent Jul 28) fixing three OOB read =
/ stack overflow bugs in rtl8723bs where length or offset fields from untru=
sted wireless frames are used without validating that enough bytes remain i=
n the buffer:
>
> 1/3 fix OOB read / stack overflow in rtw_get_wps_attr()
> 2/3 fix OOB read in rtw_action_frame_parse()
> 3/3 fix OOB read in rtw_restruct_wmm_ie()
>
> It's been about four weeks with no review comments. Just checking whether=
 the series is still on your radar, or if there's anything you'd like chang=
ed before it can be applied.
>
> Thanks,
> Muhammad Bilal
>
> On Tue, Aug 25, 2026 10:28 AM, Greg KH <gregkh@linuxfoundation.org> wrote=
:
>>
>> On Tue, Aug 25, 2026 at 04:10:36AM +0500, Muhammad Bilal wrote:
>> > ping.
>>
>> Context-less pings are not really helpful :(
