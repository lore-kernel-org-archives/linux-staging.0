Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A72031D
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708326239; cv=none; b=YoxW4/HrBWgF7stW9TbQBtZclP5GjsJ6VDoZk8lup3qtBgutzudNquIgG8Z1vkF+MG0TepVL8uhd34ItlZPW2uSEa3IAN1mCF9R9/L/P9PTsodcdWSrEr8O2ES9YxFR8Q8WXDs40JnhF5nWLDmxkOUHOSCG/PT5JDFMDNTpkdPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708326239; c=relaxed/simple;
	bh=jnk57gCiieofwPwLYmr+wTfZHf9tdNcTYMX0JS5uUUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffJLlfSQhey7sFoR+Aw9kEBLWX18zKdi2mlvuywma2rsFL541PU8CHfHGS7Sbf09J1jgFRaTd+Q/aiXh7E+uxOaGMoO2Is/nCgTh3sRCiShq8B7KxgHEucT4cCraQm4HNTakXtZzxj7T/K9WObjcLJDTwcOW0ayjHrGmdEqphtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0dOadR3; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0dOadR3"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7875adf71b1so84013385a.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 23:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708326235; x=1708931035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BP0dtJPdqQuZ/KVSMPsLh0JG4MWEZdheL3lSe0slG5c=;
        b=L0dOadR30r9+FjQn5N2EbyHSPnrwIquU/gG5tR76ZQrF1yuqnHPNHbYhtO0h5x5Atd
         cViTFqijrg/3+b1VCggiLIv388cTjmnNhkS6M94Mx9r13a1tyhIgy6NoLrPR/tdHUNlV
         gyaR/YPBiN/ue/Lg4HhrFEGiXhT8hwv0Q+HOTYwM5Kg421mqfVYfc8zjyIYy2fB9Etl7
         zzjeKrcRTWk68CmdcaZGd5rBbAPAiXTQ34uewSzHHjMCxpwENB9U/Ennu/aNGy2/5K5w
         htFhGwAzyV5tYi5YzMQxbWN+LTdLhvxXLVx2futpLVL2QVYIyaQ2L+4EhGM0eaDgaeRj
         phVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708326236; x=1708931036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BP0dtJPdqQuZ/KVSMPsLh0JG4MWEZdheL3lSe0slG5c=;
        b=XSBoqyOTzFfO4nQ+HDJ1DRK2kAjzkUPvPVCmbc+GhnlwYczSt9+tTlP3KbAYI/LeQG
         CndNzqx6WZrgnPifC3yFNmtgn2Yqxeu5F6JhCdyqgXV/uB5avdey+1xm8mOLo2j/s6el
         hepwmS5piCPmxG6chBveEEo18Jh1DC32JGCG80xoRAcdbJiOQMmXPr16faT+FplU614X
         0KgMfBJK7TgwRLVb8soT2gEbo3S+/cfyXX3UhUlVUbnKwoVvtwE1B4RyD77zpWhR1HBh
         gYPjUMaQ3zXZ0SutjZFmYdNRnMpQVBZRhNRCEUCgmH4+R/jGIN9B/gn5c1bW/mSNcTY8
         OCkA==
X-Forwarded-Encrypted: i=1; AJvYcCUineEUYlJjMqRaFVCiGcl9uChRBICIu0DUmQeDc5wXZcm+eRh6TiT976k/rz1DojD5QZs5XdqQsBH/hsgZ27ww8qzYdtpYWykBA6hF8w==
X-Gm-Message-State: AOJu0Ywz8B3ybWwARDDBIohY/30JytFanCm/ZmldhSbyLyM7rt0syCVR
	JYQBX2t+KWeByJ/3CAMnvCE8/uDbO5lK6CkMf5VebmoftCJ+9Pn2N08Z+9C82UmYKHamHpt21y/
	30HCpUzz26MUwEll3fgv889qGbsk=
X-Google-Smtp-Source: AGHT+IFC5DXOGGgbErS5vNxZkRm4l/bwqJ08oU0c9ApJInOMa7c2fC9oWE+hoZBKwPWEubc3vYF8WyfT6NBk/Rx3eeA=
X-Received: by 2002:a05:620a:414a:b0:787:564d:d94c with SMTP id
 k10-20020a05620a414a00b00787564dd94cmr9283390qko.30.1708326235688; Sun, 18
 Feb 2024 23:03:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240215220647.4096-1-mo.c.weber@gmail.com> <8fe8c4bf-5fa3-4bfc-9535-b48df12f80ff@moroto.mountain>
In-Reply-To: <8fe8c4bf-5fa3-4bfc-9535-b48df12f80ff@moroto.mountain>
From: Moritz Christian Weber <mo.c.weber@gmail.com>
Date: Mon, 19 Feb 2024 08:03:44 +0100
Message-ID: <CAMn1LHB_XKNx_9VortrmxAmPrHxY--wp4eyUpg0GzjCjOvjv3A@mail.gmail.com>
Subject: Re: [PATCH] Staging: vc04_services: bcm2835-camera: fixed several
 brace coding style checks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: florian.fainelli@broadcom.com, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,
thank for highlighting this. I have redone, split and resubmitted the
whole patch yesterday due to the issues Gregs patch bot raised. The
patches build, are checkpatched and also survive a last look. The two
issues that I introduced and which you raised have been not reproduced
in the new submission.

Best regards,
Moritz

On Mon, Feb 19, 2024 at 7:39=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Thu, Feb 15, 2024 at 11:06:47PM +0100, Moritz C. Weber wrote:
> > @@ -406,12 +405,11 @@ static void buffer_cb(struct vchiq_mmal_instance =
*instance,
> >           is_capturing(dev)) {
> >               v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
> >                        "Grab another frame as buffer has EOS");
> > -             vchiq_mmal_port_parameter_set(
> > -                     instance,
> > -                     dev->capture.camera_port,
> > -                     MMAL_PARAMETER_CAPTURE,
> > -                     &dev->capture.frame_count,
> > -                     sizeof(dev->capture.frame_count));
> > +             vchiq_mmal_port_parameter_set(instance,
> > +                                           dev->capture.camera_port,
> > +                                           MMAL_PARAMETER_CAPTURE,
> > +                                           #N(#O(#O(#O(#O(&dev->captur=
e.frame_count,
>                                               ^^^^^^^^^^^^^^^^
>
> Wut?
>
> > +                                           sizeof(dev->capture.frame_c=
ount));
> >       }
> >  }
> >
> > @@ -420,11 +418,11 @@ static int enable_camera(struct bcm2835_mmal_dev =
*dev)
> >       int ret;
> >
> >       if (!dev->camera_use_count) {
> > -             ret =3D vchiq_mmal_port_parameter_set(
> > -                     dev->instance,
> > -                     &dev->component[COMP_CAMERA]->control,
> > -                     MMAL_PARAMETER_CAMERA_NUM, &dev->camera_num,
> > -                     sizeof(dev->camera_num));
> > +             ret =3D vchiq_mmal_port_parameter_set(dev->instance,
> > +                                                 &dev->component[COMP_=
CAMERA]->control,
> > +                                                 MMAL_PARAMETER_CAMERA=
_NUM,
> > +                                                 &dev->camera_num,
> > +                                                 **sizeof(dev->camera_=
num));
>
> Also Wut???
>
>
> regards,
> dan carpenter
>
