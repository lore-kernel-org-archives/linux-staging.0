Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2843D3B42F1
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314788; cv=pass; b=oLPSziqyu+q+B0daZ8w7fFyJlSyat4vx3IcxB5GRwtC/mlB5wH2Sbs7IldzGtNXLhVL5w1sTDwrpXXlYu0WmVQb8xLqE7IsIUAE3WMBHnRyx3Iu6YehDUnBrLXz5ydcSIkpT/hCXc+FxdTYUv56+nJ1U72A/GwQBxStd4nAHEVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314788; c=relaxed/simple;
	bh=9VuH4IlPrcpfj5N+d0Erhi6riPlnm9rpbHmuksayxe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqwLPfdjFiSb2Jl83PtdVb4BBzIaWoMaFUf7fzp4mc4dlOIMmZGz+5PAy4Wks+lTUGC5bz+y6qDpd3GIFHvfiEpYsWIOIYSpkwARhNBnRql+CO+3imLCocOWaw46PeBEXpZ+Mc65trAYC1vTvqGWxtSNfvWqHDLgBmOJrdVGi6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LScFp3a7; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LScFp3a7"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso4653777a12.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 22:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783314785; cv=none;
        d=google.com; s=arc-20260327;
        b=rHTLjerJP6koUgpPZQ+2bs9oIeopfrd3PI84Zl1Rcmk9qKcUNBfRGjylZY+RyITwK+
         s8ooi2Qdt0fW2yqleyGFXynLdpFfwLr/fdZmxSKDyc2F3qjJ5VBwBmgC6DRwUjXBVDzg
         hcTypmhwKPvShxUFS6k1PhmyAG/ywUNn2P/qeoWoS7ScVwM6ouuwJESDu4/bSeymv1T7
         rAviiJHI+vcehvTEjAqyyOGEEJy1l1AOrGek70iBiVhGRqt5AybDwNqEa6RPtTdthcpc
         KfUaAujibit1oIgnUK7PhLj+NnEirjYUYGOsn85i1/T7epYBD8StawUzVY0yuFABtNQr
         veIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GHjgpUGtEcjXf9aGWrsM99t0nVPI0q6PW63zrEE95wY=;
        fh=fnm4Vr1m8aVXoe3vZFy0cvrRW+RBacLwuqdFKtH6QXQ=;
        b=i6QFZFd4b3RvGDb7HOh9oVwpeuPnptoUS7vSR5XiR7wFL5/+33He36/b+W+7E/t/Re
         l9qPOpBBCxlUlkvTDDti0KG9uhgUeqDA8isQXQNpUBI6LeG4+n0o/wWcjFwkf8E41jPR
         2oQNixLMFvlF868RZ/ctqOxcbaolWMkTpo/GqaBrz+6u/ahVfm2KFFNDXjeBOwxZ3f+z
         R0S9NACE2j4wDWlRMCrOtVybKJbpQ2MnLNUkuwksowsvuDavgtlicbGsaFe6u1n7lw/L
         cIq9Zu2FNunWDpIz1n3h/5a8DvAJwzxArVpz0aVyptTx+AFDCQkB031WyobNwhtJKxqp
         nZNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783314785; x=1783919585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHjgpUGtEcjXf9aGWrsM99t0nVPI0q6PW63zrEE95wY=;
        b=LScFp3a7sXZgiF891N0brCao/67egma9QUORBHBYimZbGGV+LrSfOQmabVcBw7DHaC
         Ys1c50JuzUoiPT0Vbkg3Tkey0RWfjFKsnUkiA1bg/LClEtnTknfqlax2OggPijzldU/h
         bHYp7j6nZxEvMBq3Em44hcdIJQlUkTZbqUPvSDRVyWpbqQJce3U/AzX0D8cHeQUjZSh0
         weX2wrIlFBcN2ObcYUtEgX8kGyAw5BzByUMKHYC7gUUqQHrev8c/Fet+SktG5xNhctAy
         tsxaNFMXk1XmYKy/X62zQEe50I3k3zLVvrD8UrHyxs5oWdA4tF/7s9MTcRLTenzgOIqx
         l3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783314785; x=1783919585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GHjgpUGtEcjXf9aGWrsM99t0nVPI0q6PW63zrEE95wY=;
        b=RPVvGmCx1vDyYvKpl9nMIJWTV4b7HU8LMtvhL010IjhYUDU2M/cDye99NI0q7CxU7v
         2OBHKO7FY1+X5cK6xrFllk4p3thOiSWfyKX02YXAwcoR2QRpTqBBMGsPEaZJorueosTO
         ea8uQN+7bOFM6G3aScQ81fIFFN/2DTYG0CrqehbuAD4fFS/zD+to7LoESMGid6YS+5g0
         VjLE6ohrr7sAealYT++iALOErGN9D5SYq8ZE76eSvbEX0yLw+umrpXtbl/5ja0rqbkRb
         j5gIoLGWDSgC9Mg2KsJE37m+h+nzhNdqgmDcwvMabN2C4hxRyTTeqcWlu0APzDtq34EP
         OgPw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8I7jeT22VBlELt+g4YEzfNyNIa7ySra4i3QEPKKgCcAX3WZ6uFr+48m7ETcurfhNAgBmjxSVXoU6y03US@lists.linux.dev
X-Gm-Message-State: AOJu0YyPWjox2nhyeI1cIo++HX1s0zJCT4XtiJt+UrF0fDjrg05aaVSf
	09fHJ3rxjRms709K4OmuruBPFl4rQK1ffSJ1z+KrCt7nQ2jIsj+hilksWWrLNMvcDDQ/sZKMZN4
	OXeP23Czd4zLx4TbrXagizpXvd8GFNEw=
X-Gm-Gg: AfdE7cmbtvRI2MVI6bPogFjMZRxulQwBm8g1qqLHfuMeSPaMoiCe7aDKHKbdRLUDVUz
	inav/m9HqVRHvgs1Y7O3DFXX5qNXpETcsY+H5OtYeSUYhrXLkf33yLvZbotxM4BAN+QKwDectwp
	LVj4eDiDtv+aFxNK3it2QUZDL0mEzMUFlewKGUqUPrr8tHRFKJDvbGH9ernO3QAW6FVmqOKa0KU
	Mw2Acc4s17W2NBsnRDSvr9wwjsqrJA0tMhBgy9H1OrDAuxz3T8iqQDO/AYCACx2qcWuY7R9Hxk0
	XBZ3r4oPwZtwK5ZRjIchH5zlh0/nRTxPIWGBTFOfINIRj+4t1eLO3JK/+MmF
X-Received: by 2002:a05:6402:274a:b0:699:2448:be63 with SMTP id
 4fb4d7f45d1cf-69a1a273625mr2803690a12.16.1783314785281; Sun, 05 Jul 2026
 22:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com> <akkOdQ1oT0hIc0tz@ashevche-desk.local>
In-Reply-To: <akkOdQ1oT0hIc0tz@ashevche-desk.local>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 10:50:54 +0530
X-Gm-Features: AVVi8CfTSX8foY15AMPLK4JpN0Y9K_M83Pp0PFoesjcSyeBMF5QXOkSbVzihyDA
Message-ID: <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 7:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Is this the only place (of a such kind) that can be amended
> in the entire driver?

Hi Andy,

No. There are other places too. I performed a quick check:

$ for f in $(find drivers/staging/media/atomisp -type f -name "*.[ch]"); do
    ./scripts/checkpatch.pl --file --terse "$f" | grep -i "else is not
generally useful"
done
drivers/staging/media/atomisp/pci/sh_css_params.c:2337: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css_params.c:3198: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css_params.c:4112: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:4=
13:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1=
176:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1=
221:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1=
278:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_fops.c:128: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_fops.c:168: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_fops.c:209: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:471: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css.c:7722: WARNING: else is not
generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css_firmware.c:249: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host=
.c:32:
WARNING: else is not generally useful after a break or return

In my patch, I am trying to address the warning only from a single
file. If you want, I could try to send a patch addressing all the
above warnings.

--
Best Regards,
Dileep Sankhla
