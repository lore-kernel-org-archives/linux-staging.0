Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBE42749DA
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 05:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784696959; cv=pass; b=Yfo6uOa8NuvIZRCXVNSs1iZYCQh9JMI3aeBh7r6XumWtH7plQ9uvLVAaYh4Icbr2IEoclsv+ECLhRztRWN+eZdqQ4yW4I8sH1rdZyQfGTYmtv6mSHiaGjQXJuBLba/iWBBpDftJZcj86PDhWQ5EdRKSXsd+T0uzRnKHNr/oIaX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784696959; c=relaxed/simple;
	bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMZEXQdeV8YuxemfuoauMxbo3EIJ9deP2VB/RKtKK6gIeQnj8x0L6nbFXeQync59ShZ4Obir5mjmMAgHpNaUn/7a5sTh0l6yapxWo9Bi894/Wu14gWyqSLk1FgqsgpCNVTXX7xmDq2UGOT0gjQqNHK6BkAMgM/7mG8NQLSoWViI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENVNMDzf; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENVNMDzf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69e54d9c8c6so4487006a12.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 22:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784696956; cv=none;
        d=google.com; s=arc-20260327;
        b=TW1Wf5LZcyLtOxhJW5OpYNw+Lkk9ut2PxKjdsTv+AVFv+uiazV9T4Mjlda4hRjjQEj
         4guqZriYKDCcFKkLhdQ+KuInakwcvW43V/4JHMPvzj6xr+19Gwpkbz5FjVt9Fvg515g1
         7T4akmUSxx0ZC6jfuX4KUBREbqrj964XQQXB6rqfZeRPig/enFpSTDP7dKXAerVAB1Zt
         ztqLj+Yy+161DHvHCkZooHhsvB+tlcTF/D1B44yAEguihrWR+swYmMNjPLrSXTjyyrEA
         nCgzcYZwm21BN7TiP+/FNmIS1HU7ByGQkaJhhdLDiTpL0EgaWuKsmbJyD3KLIpVujqNx
         98fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
        fh=XWPls8HyXMchEAZD1IIvnl01IGcchxvNQoe2OvpOhsE=;
        b=r0IgaNyH39UOz71WFy+4iXNh4AQNR8lNbjiybp0lxsUqRusiCsL7UDaORCxIgzrpaO
         B4HEREzf64k3EzLQk6iS/quFitnkDtpyhyZPQrZh9drvd81ucBGZuYGKey2aUx8HbL6d
         IkGxu7IIRM/m0pSszHIWe9LWCYT/UifHR3XjfXNjhbM8c+Fgz2V5HKMNhFHwsCYh/ozb
         lV1VcAh+GdzBs8tCQdXMsNXlZ1L/51ilnvhhaM5D6T/Jw0L4HayGdZ9eKmp3ru1dU3Rt
         WJ/M3ALqTsfAo2gQFq2Lp+vj2mchbusnZ7tTlGwdwi60PhNlwN21ccksgUau6NFqysq5
         5Gxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784696956; x=1785301756; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
        b=ENVNMDzf+LoEABXrALDeVVWsKLMQ/v8vlf5xIZLxRgxITs9bG5jH460yzou6rDifgl
         hKU4EOGD8/F+t+wnQQYe8+G8/ybSoubm+XvsLzd/36HVd0+nhGSjs77J8FoOUuswWfPP
         Ba2xOtM5W+znfkoevAv1DAIOd1NvBemlMC6vOtgi5aJDdlF7S/GQE6Lrfa4qXCZliwR+
         Io5Yit9/mZn7WSVQ4T9GpuzJ3cIPCkOWFU1Ky6OiQn24U66a0MtpoWiIeQMcGCfv5l5w
         igosqNKbjsh+3FE6al/RspZkddmMyUmbj+ztPwpK8WpG1Xk7b6tFJgOK46+Wl4TGVorm
         7niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784696956; x=1785301756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
        b=U/vBMNA1ipTk0p9jVAAzRBTWmEtlxyFNFViTkoXN/686hYzYhvo7wUQqZLLrD4R5z2
         NVdzA7ff3jX84nZyd7QJz51m51bAzLu8U7DqhwCaLXBt6pFK5KarntEv2PyUAAYwy0A9
         jLil0/GO/v88wsxZ6OK2rU7Ll3nMOf/ruEVKl4cvYzu3oXxTULC2YJKHW30tFZrikRsQ
         7o0vvcrU3Ui0qyjO2+oUHEr0wQF4Nu5mcUJG0KtbC1Ksw18TJB22hvoTi/evarSebBh4
         atKimmLpnSAENWcWJmtz0LfXIw6fj0AvIRJMstaoQFqQYC/g12klGCpFBJBgaz/zpxAo
         qf5w==
X-Forwarded-Encrypted: i=1; AHgh+Rrbh0De0ofuTjnJswMEaGxQYyglEEjxYW65DYUsbB/Id4tH+LQ6cn1pU9228z/fqM/4/5Ea7xZpXm5uGyuI@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2g2qyMEPP9W8poW1Z5mIBk5Gq9OTwHlPlc+1O1o0W3jfBtA5A
	y55IpF1zdb0oAuS4c5KYV9et61ZJTMJqLZ3DoXDPYAWLy6Qjq6uMKdjlGr+B6YBsbbXvMIH/WeN
	U9C7ByRKzMJBi+5MbD3ZwOSPD0hNBzh5ZIp+1TMyys+It
X-Gm-Gg: AR+sD10E+e29eCRrWcc7l5T98GND4GPX5mGouf/GzhyTf1W7eEHRdGRiUVj/XXA2uSr
	GLyuS81BovwQuuwhHU/rPvKZ4/SJ64lEdGJxFXeUIsJTkNhhO9fJYq7K7McEtOSyu0Bw1Bp/+Hn
	THNSRtGqEujvCeNWXLwmUyu59xx7IvKJR0pV8oQZHjl1udsY8/x3PCH8+R9lWgXbYE1bdulISwE
	4aeXSg5k+P2/BXtPSFHRyQgw751BypYyUM2Q91mt2vRUeznprQwszXdhMYOjHvac+r1piBUZw+B
	KmdBWOd0FaBYV3C++65b0kJmHwbqARe7XQGUGL81RtYihaD8XD8umm3S2JZAaGWbTy8qbcIwa3V
	hb5zQZ0xK9LkxenoRdcFSWgz7NnobHUNPGHL5rDZrymkYwJsnOzMAs/BThA0=
X-Received: by 2002:a17:907:c00d:b0:c1c:1e4e:f924 with SMTP id
 a640c23a62f3a-c1c1e4efa62mr241487066b.34.1784696955838; Tue, 21 Jul 2026
 22:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721214238.840406-1-nikolayof23@gmail.com> <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
In-Reply-To: <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jul 2026 08:08:38 +0300
X-Gm-Features: AUfX_mwHptLmMSMI2WVQ_9PxVGk8MMb3YFOxZQGbq57RK7yf_6MnD51WAeLR1qc
Message-ID: <CAHp75Vc-TaNLkQnck=OFonuWMWgdaxP+cVh7Oo+RjUeOWLfZEA@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: atomisp: remove unused functions
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 7:58=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 22, 2026 at 12:42=E2=80=AFAM Nikolay Kulikov <nikolayof23@gma=
il.com> wrote:
> >
> > This series removes functions in pci/hmm/ that are declared and defined
> > but never called.
>
> Don't do it per file, squash these changes as it seems not so many of
> them (I assume you checked the entire driver, right?).

Note, if you want to make a useful contribution, try to clean up the
below header

include / hmm / hmm_common.h

It has some ugly macros, instead this code should go to the users and
then be propagated to each level and refactored.

--=20
With Best Regards,
Andy Shevchenko
