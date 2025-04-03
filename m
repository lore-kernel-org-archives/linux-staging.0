Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C741DC9A2;
	Thu,  3 Apr 2025 23:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743723291; cv=none; b=THrMx/4tP+8lbdizGgfeidpNLVHBx70M7oEBOVMUlVDotdow4W0khFzBZBh2JcVjfIKh2T+Birpxe1cPczgAz3Gm6T4Pk/9XPcNycm7pljsqDOyrEg1S9jC1oArchKGJq2/y/LeyvD/pM7p/2cAyHp5jvJ+SrFuppBbGp84ApFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743723291; c=relaxed/simple;
	bh=yPfUoEabLqKntQr8q5pur3n1i93VDPliNk27Nfw4Yc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYFpVg+1sM5p9LggbghGtgI+WqT3+GOEFvmsLGsUC5x+w++IXFsoRsSDSLOgudjCRTw1ITR07v7PMpgQ17a8MGL0jRFutpd5w2MCUQPsxSzSjC3AQt2n380a1XgZ8A2+vS2rso/KQxdcE6zbn4Enq41kHnM2UGHA2QrDk9vfim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz6NOCDy; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz6NOCDy"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523dc366e42so704895e0c.2;
        Thu, 03 Apr 2025 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743723289; x=1744328089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avbDQjcLHqr7esMYO8nwxUtIxsYjEDsKF3924zpDBE0=;
        b=Pz6NOCDyHNIQVP4krjr/mdKZRZTR7m/krD/keEewYrxS50wJKW9v829cxFkn7hDI9M
         SY+hnFrfTtWMicUpHwJ1oJw4Wl1shR2MElEyrlyZLm10vHxKeu+bDkyCqxljuCsmpacZ
         iUpkeZKaO1nYHgkTsA+2/N5JageTE8qaS0eVpnkJ2uY6N/PHQsDmtkmn8dBmy9g6eqV6
         D8zmAK8bS5Hm/4YThvy7ML3uZe/brRCd2nyOShY6fWrQv35XdTSpEJ6Uh1O8XAz4s3yK
         u5yfPbgiBnsH89kUQePYUSlVnoTF+gCBIFpLyvmSpx/ddSuYvlGYv3pCxDo8ZUB6XKoJ
         +Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743723289; x=1744328089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avbDQjcLHqr7esMYO8nwxUtIxsYjEDsKF3924zpDBE0=;
        b=MeBt+i6khWSDrQoZTagkAzq1qzwmkKrzYwOxijbaLL5RcVBCYQE9Yw9SI7mG290Eei
         aWtVcFDqD66WZgAwc+OXdaWsFd5DtUFQBofHCOqf+FiGhaknu+0mm6P0TlMm/ZOmpp4z
         5ReL1wACLj+MfY8Id7QFXLM/qrnRh6m5LJqF1Hg9tT+mW6g6jP3WCLHCb9hnGPp53T2g
         ZcG0Yg9OiRrwERgUtIa7idlOm5NKZJsgvfJxMSA2c+Vaj2Un37zSZ0rvyAs46o8+mTo+
         8QC9IxoSMQ34/+VWWTPmWY8aNVgbZxMNjaH+mCIxC9OZrpcApaVeVURp5Z79Lsc9fwLR
         wRhg==
X-Forwarded-Encrypted: i=1; AJvYcCVuh39K8cYI+ZCzy5PFVYW/ay0P+NRy0gGa+AuUfMz+8sc7ghIPSlS4U4LDU+PSpZD6/QlTgoEJKjIwXdtT@lists.linux.dev
X-Gm-Message-State: AOJu0YxOw0Gktsby/O9ve7fFTCHw1dvaVh2htpg9iPi/tOhrMt5RmVY9
	fxBeyMemmYISG8DlcIKDpUn/MGI4ZSudeDSJK8sRiXKN6DiUR+nYY7rg4PX4Pf3ROj9zyLKESuE
	0NjDyB/KdpN1Oz4XD/sSEDUHlGRA=
X-Gm-Gg: ASbGncu931ABbmUxY4vlielxrhKj/8ltkm6FIgrXAPYO2T96q3sI38O2UVqVGNZX8YM
	9E6BNBaIRibByBozB7d/C26pHbpni7Pa8nK5OAGC5E4pavkX4q0iuZy2v4JfpRPkkpCHklqMsfc
	Y31IVVPbgS7UJldWKxkfevSa0BSTSm5CfWwIUibw==
X-Google-Smtp-Source: AGHT+IE0jVTAdZK/1z5sRC69OvaJbihukmG2bfl5C4hSu/+suvfXKUqs00L2PVJ92KBbTrochuTagRBujIH4Xq+OURE=
X-Received: by 2002:a05:6122:16a6:b0:51f:fc9d:875d with SMTP id
 71dfb90a1353d-52764573f29mr1079951e0c.8.1743723289031; Thu, 03 Apr 2025
 16:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <1325d06f5a4eb18eb52eb20d5af89207504c46b6.1743685415.git.abrahamadekunle50@gmail.com>
 <Z-6PlWGmn09hYYKU@smile.fi.intel.com>
In-Reply-To: <Z-6PlWGmn09hYYKU@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 00:34:40 +0100
X-Gm-Features: ATxdqUE2HQCOn8HmmyJdYwJeZCngwFtMlNx29UmcDIb26j6tvHO7ChxpInIanIg
Message-ID: <CADYq+fY-y1BqnzK7fCvjPhLfvpTgMeiK5_XCoF_BZqiYyX_1bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging: rtl8723bs: Prevent duplicate NULL tests
 on a value
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:40=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Thu, Apr 03, 2025 at 02:26:43PM +0100, Abraham Samuel Adekunle wrote:
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
> >
> > Found by Coccinelle
>
> Missing period.

Noted.
...
> > +                                     psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D (tx_seq+1)&0xfff;
>
> While at it, make this more readable:
>
>                                         psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
>                                                 (tx_seq + 1) & 0xfff;
>
>
> > +                                     pattrib->ampdu_en =3D true;/* AGG=
 EN */
> > +                             } else {
>
> > +                                     psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
>
> Ditto.
>
> Also consider to use module operator as it shows the exact amount of the
> records we support in the circular buffer.
>
>                                         psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
>                                                 (pattrib->seqnum + 1) % 4=
096;
>
> Since it's power-of-two denominator, it will be optimised by the compiler=
 to
> the same code as it's now.
>
> > +                                     pattrib->ampdu_en =3D true;/* AGG=
 EN */
> >                               }
>
>
Thank you very much for the review
I will send an updated Patchset

Adekunle
