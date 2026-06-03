Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4230395DB9
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489515; cv=pass; b=oq04xLCCXJylw+WBNNyxRRxu/2CLpYky3XtmM+6Pyjq1cPN7MANdck/YnNgo91XTWMnqt3muO3jwIUZL9kNOJf83x7huQZicHwxGVdP/+/2T6H2rS7V47xe/GUFkBp9TBAFVmUUVHy+iuBjDFhHp0Do5N5un9viAbUO9S9EBBW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489515; c=relaxed/simple;
	bh=SfaQ60tvSp8P4opd/0sYd2D7nG+svnzGhA4+l1wNBXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wj6Q4IIZJSXXD9LOXSC27rrpdSZRts4xnu6OZWcR5FykVAzNfWKDmdZuUaKPlrwKzuniMzZ9+ZK3PyUvuLeDBA8W663hTHilLwYzFg3ZOIvsgWvAKxteEvHznTeLcgiXeDr4Sey6eEE2u2HGLgc9zjrTSJ8vjyb/Tu5uVKQXFeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edn8Wnq2; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edn8Wnq2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so3042669a91.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 05:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780489514; cv=none;
        d=google.com; s=arc-20240605;
        b=j/qCywHlemmOtajDni5Ry9kNKl/TUSz7prU8Z4ZeeSrMb+D9SISb/cNCfB+LmoDdY0
         NYGyZ0L2PM/ZzVtCauEt8KPlObxqRuzDGqHFPPT4Ylkgwn3JWn5+G8vwg8q/b3T8hgsY
         bDBMoevHbMov1PFZGYi1LktDlCr8faYq0mhg+FxMDs9vXwKlVh3AXyWUzkbCJqH1csZi
         UUpqnQoP8GIZj4REt2T4K37ztgfuhD4OBxG+ydlw05BJmsWAOa20JVVCTeDfrrvIR0SB
         Va2I29K6Sgqbphm2vy4s9n4RBXCPbaOgiTQE3+Kzl7xRrYpdMrfWa/UF8/jDKKN/uInU
         knGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkVriO/fbiz3aig/c4mDEgr1ggGnpdF066LdUG63/Ag=;
        fh=jpd9p9zJZSfVHTjIwBb7uyZDjzbMrHfvCVZHRQaUoro=;
        b=IsHY+41+HfAFKwAMMQjDPKd4Mq9HfWy/qu15v+ohsZG0gMNNHKPPshK5JBTOtb8R89
         1Q28HCbnetMYbAshJpZX64YdRXb0dqvwvPtZZrwzHxS2agel9/e3dUHMv7JLtWh0zDtW
         mq5K6iVS+BKKOTddpMwsBXYXIvqI/2AAe5mVHj2mK8vxTPyq+0f8XxlJbfIZUV0FjuXE
         vD4gsAyGJuVnR/gcvCwznQBebmKyA+zqw3lhiELSdnY+z72aJztoT1RM43ess/9EwAtO
         MDUOQ/DZbQ1TAXZZfYrZjU8CyijhehjfD/bc4QUULmxZQn20v+VxTp702vVLmofee8R0
         otog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780489514; x=1781094314; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkVriO/fbiz3aig/c4mDEgr1ggGnpdF066LdUG63/Ag=;
        b=edn8Wnq2y6N52CmySah4pUb8IuPS52aCzxvx8fT0lDP9C8bSUvopNjxrKbwuk4SkK5
         HyVF7GCBRjCleFb0zDqzB2lvsG0xI8fO/wNi9XfXV8ke1IBYQ7Xk63f4paTwIGZODUV0
         3NMva6v9VGHmX5AFS8tP6z2baiGLLhdA3T64rdoZVTGJw3lUY2Rs5wE5ROOCbvxYZUPK
         NtO07nIgnPEPkZVomSH03JYyePT3LW+bJTo+RmEhXf6eGzQL2/B5m599JkICXbdjPzud
         egbL7tBZYn1wElfECLjqXu/+BmpSBd0FDbu3n+GKqeLiulJh9QCM5p/qRMjbYGrZry4L
         FnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489514; x=1781094314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkVriO/fbiz3aig/c4mDEgr1ggGnpdF066LdUG63/Ag=;
        b=hmEEA8wdAA1x7eatw55clXXKcBkHE/minezxdlhRYZIPPZM8JpPr/DqQFaDgfKenK1
         vL7ozGIXJZof7a7/wMWBw8zHNmnocDv9Uw6qZ0Ryj+PXhefYvBvnYmrp0AShiYGuQrPi
         Cdrq0+2omnckWQmWweMCA47ofONXrc4TpcIFQ9DiB879cShlFVKP1wmP1ATbdL5HMCAs
         KVTyf0PoMEJ+PTCMyf9DX7ZtERvWr/Gzpl9akpvctDoNDDSJQFNKEYfe6Jh3wE6+qOAE
         wp5roo/nI0hN09nRdfrUauJhsTA8APCzNPtIg9LSByz32cypTosIJf5fSK6aeMC8VICa
         XPGA==
X-Forwarded-Encrypted: i=1; AFNElJ8H7lAyHuKqw9HQ7ODAD08EAQYY0h+B6zrCRtLljNgQHhlwriYrHbrx8H6HRzWyEGFLtV8kiD/DSOgDWzBr@lists.linux.dev
X-Gm-Message-State: AOJu0YwSw/niYB4hpLkXoTuY2uPMeVcU4bn1NanIIR8NgLPKqj3kNfcb
	XsaSM9q6tmFBTc66BahN52poNMqb963ZwNNiZKpZ0RPPd1rjvyJKM5Bw8GSro/58newt1d776gj
	+1HdlnmX0/A5XmO3iLZfVDAIfcRb+fYo=
X-Gm-Gg: Acq92OF6rztI5rZ3KFqxbEYqFrBzxBY/JTbAZ0Ji4xo6/ujddGb0Sz3lTMX4kAC5tjU
	dUInyyvYmc/t+jCDu+QszCvOZTU9PkPdCnMdjTUQZOKPi5pckLsKPR/rFGLLO8zZDDezB/DYMiR
	ZO43oXIwpzsGRHyIGnl8AomuqPKRMT7rMCrVglFsXDfSCDRpBv2BhqtR3SOlV2R4llqEQEh5EyX
	CnjiUM6rAt6P+rURPH8wPs5IWmORWw9LVbXZS7YSKImWSPkGIa+ReHUCeY8bPKkjM6AYLZrnj8p
	zLFYZCB5ewcmwbGZL5I=
X-Received: by 2002:a17:90a:e710:b0:368:83e6:ca95 with SMTP id
 98e67ed59e1d1-36e2dd4c595mr3268416a91.0.1780489513853; Wed, 03 Jun 2026
 05:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602103208.15799-1-dogestad24@gmail.com> <ah7AYukZ5uzW1NVU@stanley.mountain>
 <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com> <ah7Wn3-meqmDLk_d@stanley.mountain>
In-Reply-To: <ah7Wn3-meqmDLk_d@stanley.mountain>
From: Grewstad <dogestad24@gmail.com>
Date: Wed, 3 Jun 2026 17:55:01 +0530
X-Gm-Features: AVHnY4I0E1xkPrMfF7rXwax3M7mS3ETwqcc5FikKQ0ng-ZlJc6N8j4whhKzJy50
Message-ID: <CAD03fja+rghsG=nY7zEZCO1RuX+ZEst92_U28xLoLv8YQMjf+g@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Ovidiu Panait <ovidiu.panait.oss@gmail.com>, 
	Jacob Feder <jacobsfeder@gmail.com>, michal.simek@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Michal Simek, as he posted some relevant points in another thread.

On Wed, Jun 3, 2026 at 1:49=E2=80=AFPM Michal Simek <michal.simek@amd.com> =
wrote:
>
> Hi,
>
> On 6/1/26 09:15, Grewstad wrote:

>
> It is clear that driver in current state can't be used with axi ethernet =
out of
> box because pretty much it is just about user interface for fifo via char=
 device
> fops. But we are talking about the same IP used in specific scenario and =
this
> driver doesn't implement integration which can be used in ethernet driver=
.

> I don't think you will find out any in-tree user because driver purpose i=
s
> different. It is about providing a user way via char device to push data =
to axi
> streaming interface which can be consumed by user logic. It is generic wa=
y how
> to push data there without writing specialized kernel driver for custom H=
W.
> I think this is leaf driver which provide a way to axi fifo streaming int=
erface

> where stream is connected to custom HW which consumes it. I can understan=
d that
> this can be very useful for a lot of people who wants to process data fro=
m user
> space via custom logic with using streaming interface.

> And I don't have any issue to agree to move the driver out of staging to =
common
> location.

Thanks for letting me know. When you say common location, can you give your
opinion on where it can be moved? We cannot find any user-space application=
s
that use this driver, as you said it is a 'leaf driver'. Because of
this, we do not know
how it is used, who the end users are and hence we dont know where it
can be moved.

Thanks,
Arihan Bhor

On Tue, Jun 2, 2026 at 6:42=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Tue, Jun 02, 2026 at 06:31:27PM +0530, Grewstad wrote:
> > On Tue, Jun 2, 2026 at 5:07=E2=80=AFPM Dan Carpenter <error27@gmail.com=
> wrote:
> > >
> > > On Tue, Jun 02, 2026 at 04:01:53PM +0530, Arihan Bhor wrote:
> > >
> > > I don't think we should delete this driver.  From reading the git
> > > log, Ovidiu Panait was obviously using this code last year.  Let's
> > > also add Jacob Feder, although he hasn't touched the code in 8 years,
> > > he still might know if there are other users.
> >
> > I could not find any user-space applications that depend on this driver=
.
> >
> > https://lore.kernel.org/lkml/CAD03fjb=3D_kW9=3Dq9YV4qnQ5GD=3DHMB5Bx7pf3=
+AFcgDR2gVc1V6Q@mail.gmail.com/
> > I was looking for any users of this driver on the linux-kernel, linux-s=
taging,
> > and linux-arm-kernel mailing lists as well as Jacob Feder, and received=
 no
> > replies since I posted it 1 day ago. If someone is using it or maintain=
ing a
> > proprietary app, they will complain and we can bring the driver back.
>
> Here are people using it and running into issues in Jan 2025.
> https://adaptivesupport.amd.com/s/question/0D54U00008zRBdISAW/vitis-is-no=
t-creating-a-driver-entry-for-axififomm-43?language=3Dzh_CN
> Someone provides a work around:
> https://adaptivesupport.amd.com/s/question/0D54U00008sLBuMSAW/how-to-use-=
the-axi-stream-fifo-drivers-xllfifoh-xllfifogc-etc-in-the-project?language=
=3Den_US
> Then Ovidiu Panait fixed the bug in Sep by adding the correct
> compatible.
>
> regards,
> dan carpenter
