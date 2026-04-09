Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD1C2C08C8
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775747752; cv=pass; b=uFj33WSKph2720RfsJj35+j1iPjZVsAsTeot8RqUlb4NChXytVE9OmAoUgHxs67MRSJA9hgL/xNMBhITNwMJWrTPmGALaXizXEGvN8HUuuBdUf+2MlD8rEVscNc8vrE7r86MPfmFewNfhJf1z679s8H6fHhZwkLvC2IyDjwor9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775747752; c=relaxed/simple;
	bh=R2MX9fmlirsxos8KwwfyegHkzw/h5GdV0JmS82MR+SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzCxmbE4yd3wOHpYK1BWlve9e341NHWMxCPQ48bXmusdAGXTEggTlQzBSL2Cv/aqrFuE/LNPOiHebXOjAwGqxlRMOk8a5b0yizMCnMJnm5H7it/RX1hMVtjzgokQORJAIVM0qO8wwbL47kt7/LEBYJrOmoNXnUrUstiZpPUGjGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwEM//Dd; arc=pass smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwEM//Dd"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59e4989dacdso1545881e87.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775747749; cv=none;
        d=google.com; s=arc-20240605;
        b=WKnl6gs5hM9H3uXGdqR1/peqxNzMpHUIzyz66+jqwL4Xn1fqHFlJUIEOSpmzYSVUH8
         umzh76KbGuiCpjYYdv8YbEZTUweahxjdhb0mcBSRJIcI886wJe89OL9uMGl3VPxSu4TC
         COE2t9IwH7xG4c4duHqM9y23FYjNsciVjkeRbrCI781s0DHNKufGpkvuOHTtKIXaoXS9
         pqKnrtXFpx/VBngL5Kb9Pf17eMjHTMONFA/c4LUyGiijUZ3f+EFrJPhvUZkteO/uL8bQ
         Qm6Nbx+Y4OReo+txno7dW9ON1hdEFGCNJXMNscUvwySNeK+CWepj4399/3IbkF8+Vsi3
         0GNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8gHcxWDojfxRJcIC8p74d59bToE+Lpp/Oh45XMXTnE=;
        fh=X5CyoAAkfFvDMEz6vf7T8BYMnzVamoB1wMK0vIEMX/M=;
        b=lFT7du3Xfog1u/KsreCX4OzpDG0T5gHyosC8zAxpzHC5b3vUNlKs+1Ay0DtB+26Uzb
         aoGkFZWnbZDmhiaiR3wNavTqBcH2NqJhrsg9sneinwPtp/ptKTE50GiG6akYnUaIlip3
         GwNxwsJpiU5D7k4BL2y/jEdvsovhUVa0RvcbNUafceg4HyAw+MHNl3yOd3bi+KifgENh
         ZsZLkh03LXlQKqLDHjoO5HOCw+S32PodfkhxoB5DG5yYtUZxis4bjb7s1kDvvKvmPdM5
         FITCRLRmdqv6/CjPPL8oVWKyu8VR1f7AzeARhuN17hf2KuHzG7OYDL2YRfMDlfB3xzmO
         nR2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775747749; x=1776352549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8gHcxWDojfxRJcIC8p74d59bToE+Lpp/Oh45XMXTnE=;
        b=HwEM//DdADFazv2cmqRKb4VHRl6ZhCnEj+IS92lS3zoVn/fQHrcmI4F4/kkuaJW7+U
         e3Whe7swWolmyV2DlDCLI06M3E6IiMv+t+ZfqLyK6GcDrA4k8Xe5KBgkJOLrEPIYhfcb
         x9nGZStpRlFsgQ917ZPkURJ3Ovu/+VmIxiagVK9/T9lYcwSLQgVlLJLp/ZTbKDfrfeei
         U+wE05F3ooyHA/GKXGD1qI37VJ5L0aIBYAofw/EudQVwfNJLh5K77l62aBDAQpZVkLah
         uMlncMvjxFXevtsfnEV5G9bFBGsQU0/nsx4X82515kKksyVHScq+HQPf7yBxhz41lDJi
         h7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747749; x=1776352549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8gHcxWDojfxRJcIC8p74d59bToE+Lpp/Oh45XMXTnE=;
        b=Kk0HwHYmlCneb8xRnZIAzmhfxXBHCDzQK0Li2q5LuyrU5C38unodhFXY3S6Kk47yRl
         H4twZf/IPi2KmopeHQ9QgmsaLOD3iLVBfHyqHGk5BZI9F66Yqyh/1VgNmeRY6k3IMVSq
         iAaOzla/zzmfwoYlummQbc1oLawS4ZwIzDUG6RKHq9ctIp1LAIp/xwCnS959zpqs/G2p
         4FUPNet8YRrp3FMOUIaG7guCuc2WsvpLQSElztUDoN5mXpKt6peudYD0KghpdOvcz7XP
         AexuJOqSu7ooi16uJkhwn+Aq4YArJXBMs9cwZiDQzMpOtjZvbIkEW3lZXaZ2ZnHlkffS
         ylFA==
X-Forwarded-Encrypted: i=1; AJvYcCWfDmjMvLJoE9Jyt7ydXygabhIUt4ifzOH5JV0hdj2GTHmPK9kYMsCB+iXjPNlRcW06Zu34ftCe7n/HnduB@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj2us31jH2R2Wbwr4diQDVIvuPvlMGtzLk0D/p6slLJAWOH+yH
	ttO615gMrHDKRTQVSaw77Us8pJWT+uwnMB0uKKxyBHjnlGZXxyxzXyR0qrZ27CRoqFx/S6v0rm/
	v7ImXZ+KDgwpgDxKPZ0B7704lQS0maKk=
X-Gm-Gg: AeBDievIQm4iiOgqwVxxpFjXqMTIceIV4817JMbKHNrmgdPnpD7McbaGLTejPkQLi79
	7Vk3WHfupWw6nNG2vvEBRvWZVVGH0b6t5biYiT4T/TI4v1NqjFAyQHRP/FQuBFFN4dJ0MnlLDMN
	et20dzhn9C4/iMBbeeZbIrOENI1H9gcFLKpEz2bU3APY85a3fNiWpI7sXmpuMn0xx2balZIrhxv
	M6zRo67ShrtTdsuzWJDcPOVGfGX30Cv0sO8poIHQ+ADrY/VFVgDjhXvUxb57GGmpCNGDMNzv89X
	hm05gI+98A72+9ypMcngwhFGv750VlR8RD23lRoxzQ==
X-Received: by 2002:a05:6512:3f12:b0:5a2:bd67:25f with SMTP id
 2adb3069b0e04-5a33754ef53mr8698291e87.5.1775747748452; Thu, 09 Apr 2026
 08:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409144119.21500-1-dennylin0707@gmail.com>
 <20260409144119.21500-3-dennylin0707@gmail.com> <2026040931-robust-siamese-4e11@gregkh>
In-Reply-To: <2026040931-robust-siamese-4e11@gregkh>
From: Denny Lin <dennylin0707@gmail.com>
Date: Thu, 9 Apr 2026 08:15:36 -0700
X-Gm-Features: AQROBzDb0z-udGv1p6uIXsT5kgU3DDAZ9fQ4ecatT1Aah_tIVvEKU-D_r-sJsBo
Message-ID: <CAGEkeHd8p48H6U36VBFAAMffz_tW71jcb90POekDgG51JN4YUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: sm750fb: propagate error codes from de_wait()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

> Why did you delete the comment?

The comment was removed as part of simplifying the code while
changing the error handling to propagate the return value from
de_wait(). I can restore or update it if needed.

> And when did de_wait() start returning correct values?

de_wait() starts returning a proper errno value in patch 1 of this
series, where the timeout return value is changed from -1 to
-ETIMEDOUT. This patch then propagates that error value.

Thanks,
Hungyu

On Thu, Apr 9, 2026 at 8:05=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 09, 2026 at 02:41:19PM +0000, Hungyu Lin wrote:
> > The sm750 acceleration functions currently return -1 when
> > de_wait() fails, discarding the original error code.
> >
> > Since de_wait() now returns proper errno values, propagate
> > the error code instead of returning -1.
> >
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750_accel.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm=
750fb/sm750_accel.c
> > index 0f94d859e91c..891d12a5e2cc 100644
> > --- a/drivers/staging/sm750fb/sm750_accel.c
> > +++ b/drivers/staging/sm750fb/sm750_accel.c
> > @@ -90,14 +90,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
> >                     u32 color, u32 rop)
> >  {
> >       u32 de_ctrl;
> > +     int ret;
> >
> > -     if (accel->de_wait() !=3D 0) {
> > -             /*
> > -              * int time wait and always busy,seems hardware
> > -              * got something error
> > -              */
>
> Why did you delete the comment?
>
> And when did de_wait() start returning correct values?
>
> thanks,
>
> greg k-h
