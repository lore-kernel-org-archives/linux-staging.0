Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269038B145
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262310; cv=pass; b=BgFX5O4DOTCAmgbdJweHoqRS3HyOS7E/FDtIDBGA3Ij9xCoOvfvvLxl9b9dBKd3lYQMF0E2UKNU7szMDnxD1H2hnF6uBlKKVcm7I4YwZ+kMf71CG3E8n9JmHYXoioIQWc2OL+P8ORTQB5F6KmKPrDeAU3AwFN9hb8Nt/dhE/sDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262310; c=relaxed/simple;
	bh=O3aNPyJAbOapaJekKvmY1hHzh90m2P8Ft5zPz7ReCDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+fqCB3Ez/AD1JGJzCUVDpY+oAM/q1o2fLWQ9+DovutZoGWLr55k1dXNK7O7UZMl+IqHSunXpQLMgkX+fv2wgUUGaTbJd8vnza+dlStKYIbarWpP4qUavE9md9h/3RLl+tBCPRgo1/eyj4k0SfXM3lO1kMGYk2a2wQiBRfWDxEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qoe/QDcS; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qoe/QDcS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a12c19affeso4989300e87.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 03:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774262307; cv=none;
        d=google.com; s=arc-20240605;
        b=WsGscz5mE5utF+lzHiYkI7zIhEK0ILGpJ0ayRNe9Vy9b4iJb3rS1/7hBXOHu976o5G
         5SWfMaNn9IBfjv21a8i4ZI8oLcfUHEzOpunrRkASLmYtJDTEXtt9JzTM3cV3l3UZ8lvb
         BrtyEN0ibCJ1DAr0aLKX5/8Ov1jANVQk4bBdhTXnCgrLN7i1EmzBQqDSFP5IAMxP/Bs0
         k4ZEhW7fRTo+8qDXUuSVR86Ko2+reSOh+oV5A3Vdm9wBxnRTaU8WNU4oSEDE3iGPxzLF
         wCw87e7OAi8Yt0HKBh5npeuEPQfQvPAtogpYRhnOm9AWC0Wth65VuVLD0sBdZdt468SA
         ec9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56EBA/boK1iAze9MxdNbcy8ScRBptdUHHz72H3poxZo=;
        fh=GqLf99s/s+0AzwgoJRO5X8PibbWfoojSCTu5NpJJpxY=;
        b=H1J38lt0l49MfNt6Vuu4S2PapFaGqCtnuu/0oAqb9K10dxIQkWUxZNSfb4XrfKgnPK
         NOpT8Sf9cv8MCqe9IQtA6jGkmvXg14vn9K7qdGRYjKhRY/fH7vWMIEidH5cUrReLhYwV
         FknjJKDtd4aAGXrI713JkybYlZ5SaZnz7a7jYMmjFBauI0wlo2dwuL0RT3iAf0+IFOGr
         zraVEIY6hORzzqxc/8u2LkmR84Zju70EVpOk9T8JY+I6spilQxwYcls22fJrV29+TytP
         MFWiUJrjS+dtqFFXd0M2vCQQfonuO6RubgLMOsUevoYNIxWYFtPAkvFPBv+J/Jb2I2ae
         TnTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774262307; x=1774867107; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56EBA/boK1iAze9MxdNbcy8ScRBptdUHHz72H3poxZo=;
        b=Qoe/QDcS/sG6v7Xn0RzBTMZJiVE9U52uLnVn6bdgZFL8kpqInbarLDouuQVPgwf1F8
         5wmCvl9UsJENpkTb0qAE6CwvBoi9l0eWW7jawdXyMB159AriH60vHigejzBJ2aylQrAC
         l0NhlZNKdRom7PYIFw4+XDbIib9tYIM798y8q12NPJeRG4yZtL0t3NFvfDZAKpd1po5R
         hJtgj5HK1RJYKe6CkadHEeqJv1WFcUGmP0YMBz/aAJ2qYVAKO+RLFevrhNPabsd/ImQM
         VLeOmz6WC8X+uKjCgemNE2dynex45P8zoppuS9SqEV1f1vEW2LUiefLpK3AILQTi3IrR
         8Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262307; x=1774867107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=56EBA/boK1iAze9MxdNbcy8ScRBptdUHHz72H3poxZo=;
        b=N2N/H0V0CmOdsbiTyNC1fBv+yLm3cSvtK5T7i2hwOsYjoFZdfhIlVaFBXMHGtAjXON
         298s1ooPUoL0jSMhgINmjZ3G1w0HgwD8FYv/ohL9kx+ksQKi3Do2VXLVkNqm0HxwVI9T
         bcZxwQVun0uoukCH6Ok5QFFJH9XU0CM0BcvA41OrWoopZ/0ZbhsuiYYKIUlVO4ZTxjQ7
         CoWhVbY8TwvUyKVQYbcOGsm5gNr+34I6VVcdkSFa/iQKyj7Qrj1rBsazedQ5MZ2GlpL0
         PxBF7+r/2yWU+dFG8OcTfu/WX87yWZ50Y/s79aQhaspxvwAPd/Gx+sINe0BYETPAjYV6
         7sWw==
X-Forwarded-Encrypted: i=1; AJvYcCXjLZBj8JtwICoafwR0QddFy7ti8f/GGiZg8GSdaB35RZbMlSigxkqu4FXK0W6bMJTPQwl0qddfBsWTJB59@lists.linux.dev
X-Gm-Message-State: AOJu0YwvuCHwKj6UdwC5uikWUKIx1IvctzhkzQgKc8l0Iu5p99jIpuCQ
	tIUlNEFXqgKS4EDgwvHnC6hoD4ZyJyYpt/mlPXQ/VEL8vQBAakGhG7ju6nDFLwIqWLpLQFDXeY2
	moB/9L8sqFZVYNNIIZJJaCkJS/UoviT4=
X-Gm-Gg: ATEYQzyJY8MTSUgUa+yXsTou7GDagy9iu96kqXe7/059GsTCzRSOJJFWy76z+2DoT01
	Q+po0UdR6GPUKPaxihQ77Ure49X2M4Z77lrzHXhd94C/9QmrtTLHOYJldNBgyvBY431+qyddVyC
	ntLnPOSuqY6flvt5BLp1aehmtoHx2ODxJ9n/AxtBRLg7MB5jflBSledVxEBr3WeFNJZpyAntxwx
	gHlG8h++vuCobH1Z7oksdWhtceFaWlDvIk6SK24yaqPulTNRqFyGQgiw/BCAmhBMSp/qRAMJ3kR
	keo2w4Ztjfcd3Z1fIyCrpRqN7tzlEbCO8eXqZI+dTA==
X-Received: by 2002:a05:6512:124c:b0:5a1:44d7:1fae with SMTP id
 2adb3069b0e04-5a2855cc9afmr3676550e87.7.1774262306834; Mon, 23 Mar 2026
 03:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320172502.167332-1-starpt.official@gmail.com>
 <2026032035-opulently-cupbearer-820b@gregkh> <ab5Phf6yF9Tw9-1W@stanley.mountain>
In-Reply-To: <ab5Phf6yF9Tw9-1W@stanley.mountain>
From: YuChen Lin <starpt.official@gmail.com>
Date: Mon, 23 Mar 2026 18:38:15 +0800
X-Gm-Features: AQROBzB7XMxGGgDIAnP6NBA9WF9H05R2bgi2hhUvdSwxtI9Z9Qi4Whcnyq9OADo
Message-ID: <CAEzaNUSoQh9Y3RRdF5J-YhMHPr_PY-HwOz8gaJ0+zxjs78689A@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: initialize le_tmp64 in rtw_BIP_verify()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, straube.linux@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 3:58=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Mar 20, 2026 at 06:29:13PM +0100, Greg KH wrote:
> > ...
>
> These days, everyone sane zeroes their stack variables, but this driver
> is older than the zeroing code so it's a puzzling thing.
>
> I could imagine a couple different ways that the code might be able to
> work even with uninitialized data...  It wouldn't surprise me if the
> check for:
>
>         /* BIP packet number should bigger than previous BIP packet */
>
> is some kind of work around for bug?

Hi Greg and Dan,

Thanks for the comments.

I do not have the physical RTL8723BS hardware to perform runtime tests.
Therefore, I cannot confirm if the code currently "works" due to a zeroed
stack, a specific workaround, or if it is silently failing in ways users
haven't reported yet.

Regardless of why it might appear to work now, the current state relies
on uninitialized stack data, which introduces non-deterministic behavior.

Initializing the variable to zero is a reasonable and defensive fix. It
ensures the IPN calculation is predictable and correctly represents the
6-byte value from the MMIE, as identified by Smatch.

I believe this is a safe improvement to ensure the long-term stability
of the driver.

Regards,
Lin YuChen
