Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474A3C81B5
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894577; cv=pass; b=Qr5PS+QyUU6KFeMiOCSY466Sxx+2rEsEWOmuZu4J8IYmYULpwuYAKsqe5eHOkTThanHcRYttjt/e8+BKa4QVDNipjxvk8OQqAdQjDrQ3qc85QeIcH2TI8R/qjUuc81g8bJ4B/jfmfHBrkqezpqyQly3tBTsE8is0CtkwZGG85F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894577; c=relaxed/simple;
	bh=v0ge2enVTO4PtD1q3C7O0/Qa3X2JGLKSit/PciO0YDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQKfojo/DCbayQTScUANPKfLFD4RWO707VXQ9JmH93boHaesQJi3DJ3npyVfs1246dt53ovZEZ85w5jqvNQ0zMqU5R6CphbQx49Xc4b33vFD9chHcXGTxFCzk6Nqbtq50xPSX90lqyNF3Mdl+qZUE2Fe5CZEz0vA3kwu2N6zTak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm+80gn5; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm+80gn5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so762665a12.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 01:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782894574; cv=none;
        d=google.com; s=arc-20260327;
        b=gp1TMj/YL9PiAiHHpS1h9YEsNA+E1SQSN48zL23gWhrqKXRV+XjoFSXLXv2CW+RHcs
         PSv7CxCPe81jHAEvdoGqwdXevqEdVMMr+gV0MGOhUUlQ10cO2rIL9LGAzMN8bC+y1EZL
         JRWBqSjSqG+Rii82zZcTgA+cG2QJ/FjWcOo9X8Rm+QD93BqXgCANqOVkKP72UDlncr1j
         O8K0vFHASIUdNgtR4NuCjV1EZOmv9xssowcADx/5rPwCIJY1aSs6lS0voFJHrqzRa/nu
         TpzUGOZa0N4ayIdpZqZ2GeNk6j9PDFzVPNo0OwBjyojxCKuUXVJFeIXiqzYiBBLZQZOd
         JOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w1kzFzm7a5OLVUZPmI6GKCL2QcgSL9U+vEabt3WDIHI=;
        fh=cEP7wuRwKOvnEzgOSjuqyzmlJPrLQJJ6PsJaAz1BAZo=;
        b=H5VlMnL2sKV8WDvVccKXbSyKbgss2t4qbM1iLEf4xNgpvdcua3mlmLb/5pA2DyXscg
         RLji1RB0245FszrV6V8gnrsb37tV0NcX67rm15K0q3u9DUp7vx52p7E/Q62ZkNtBPQzk
         DZs+XZWUM2fYIkPf+YbFM8MwnnGAJQYjFwM5CLAw6zDDIGUF2jRYK1HfLzJKl7Oa9zKI
         qdHS2qWN714eVQt3Vz3gjwLTTzfeII01qt1v79CVMV9Y0J83jQcORGzA48MzGkVcjfG1
         7bzUwKQ0X0YePfWzvSORpAng3erhaoZBvBWTCaoylRyXBUz+X+VYMomgIFC7QJfr3e/B
         dpVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782894574; x=1783499374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1kzFzm7a5OLVUZPmI6GKCL2QcgSL9U+vEabt3WDIHI=;
        b=Lm+80gn5WhRgvAaZj6aA3isRw3dh2YB/LW6G9yv0zHssW6paALXd6hh7pHI6V4+ILD
         wjj5YFivLGXeIdXDxDlV1e1QqyopLyQ6iMg+6BfrbdpCB2uBVabLsaLJ4uKdXy4fVVA/
         dh+EBUOMgpdo72X69HM55ci2JjKfq08xN8tU6MFDAjeZGhsngPmgf3vVANUkveLEQDI2
         M6AK/GZidwqV9a3U3l9lOEhoK/tcitXWcjqv3pz/a1IyYarswRRRAVEDsLBfVfJY2Gyi
         MJWCmZKhMIwZSVrWkb63nxakIZS+aZY2PdoQWst7ATZOAGe9fDGyk+3WCek86x27smyF
         dzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894574; x=1783499374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w1kzFzm7a5OLVUZPmI6GKCL2QcgSL9U+vEabt3WDIHI=;
        b=L552sEhbTMvV1FdpxhqIzwpXtye+KaNchEYW4+J44feivsb/m8Dt+wjtLlNA95ch7O
         KBP+21lCSurbUjeI8AAZHSwrrQ1zdV3TLQrIUTMOHShUyNJCagqiX906se3L2UQ2zH+F
         nkmcMQZU3Aq1G8sF7nE0zfwCESCVgnPpGvXxNpSB5r8qEXR9fduwVdGWFWwPvUOohNsK
         eLoA6KKfTHSBwHQ6wopqXZC3ikDWTUqKrlDlWBGPm4Z7KBtvIh+PO0BlqEyOm2nxVqR+
         YI3QzMb7rCXby3ofdmtkNdDN166CWfmll+PvzBX0RkeN38hQGxkePEEh33zts/P+N2kg
         xXtw==
X-Forwarded-Encrypted: i=1; AHgh+RrPCTVpqwHfwudhLtJYPAypYDTJAb3BLOMUBElJbUsC/Q2ottIVXdeXTwmXYYmj7igRyADBM5HV5IVd8V+I@lists.linux.dev
X-Gm-Message-State: AOJu0YxGOGZ+isju/H7VlUOgHViLO/hTfMbLcix8Ia0bDl4SEqSyoJNn
	vhXHwdNUHxiXUJeUDg53HjCGMSzSyRotx3hqVqEMrYahJdxFsaCc0F7YlXWQt75sTUWHSgj95LM
	KK460Lg4XApOEnB0/yJANHyArfrU4tPs=
X-Gm-Gg: AfdE7ckXrkE0SCvN21nSU2eh1EgsdecvJMmcuCTLyj4qvo3DFPQzbG/Q8yGAbuCLeIR
	TQyDfaLvG6sgWetOVqJXOmkXguwBhlZ4uNxjkMIxKgVLxmGgU9vAGJpRI3MwA1AiFX1HdYrpp6w
	GYixtFkEAd38zKqV54oHKTlhz/Zv/P9xlrsYqVJpLoZX10vNKRRyzI/aTfgOaAmrUUyw6rfEePd
	klFE1YinnkPqcB4o43X2USR+ByAQt3i7mrSv88oUsaWV20xeAtTY8Tlh1cyxyuMyE6Cx8FZ9dDI
	+mRrFIBpWr5eKvTLjV7+7VUcDl6Db7A8i4ZySdzzMEk4hXtYhftfaLiBp0jx7KsBGCRwCuUSzMn
	nAMG3fzZDslr1gxC/eYT+ajmB5xCmUK1r2SP/1RFVVNMMTUkIOsTYxcJZDDQiVE4UToQL
X-Received: by 2002:a17:907:7204:b0:bc6:14b3:e835 with SMTP id
 a640c23a62f3a-c12aa141da9mr26026866b.32.1782894574176; Wed, 01 Jul 2026
 01:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630132631.25762-1-bohdandmarcus@gmail.com>
In-Reply-To: <20260630132631.25762-1-bohdandmarcus@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jul 2026 11:28:57 +0300
X-Gm-Features: AVVi8Cc7m53d9rpnwgtidA5UKQRV-TSkeKr2m8nhvUdgISSguI1EXtXJ-jq9qoo
Message-ID: <CAHp75Ve0c70aVSWh=6s4in=LBz5SqjS0PvMXdKSdCV_AS4sjoQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: fix block comment formatting style
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 4:26=E2=80=AFPM Bohdan D. Marcus
<bohdandmarcus@gmail.com> wrote:
>
> Fix a block comment formatting warning reported by checkpatch.pl in atomi=
sp_cmd.c to conform to the Linux kernel coding style.

Wrap the commit message at ~72 characters per line.

...

> -                       /* If the grid info in the argument differs from =
the current
> -                       grid info, we tell the caller to reset the grid s=
ize and
> -                       try again. */
> +                                               /*
> +                                                * If the grid info in th=
e argument differs
> +                                                * from the current grid =
info, we tell the
> +                                                * caller to reset the gr=
id size and try
> +                                                * again.
> +                                                */

Indentation is broken AFAICS.

>                         return -EAGAIN;
>                 }

Also, is this the only single issue of a kind in the whole (almost
100kLoC) driver?!

--=20
With Best Regards,
Andy Shevchenko
