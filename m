Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFE3D0C09
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603520; cv=pass; b=sVti/FhLEzoNagZ8RS1+/6Jy5hrW8zwE4FyPhRhf28SSvGuY4N7mZisgZcCZDkhitJY17/mdDhYOMI8H1JmHXrjM3cPa8dEBI8wvR7pf9URWh7QUFfnGeatbkFncAI/SUDi5dOW2eEmNYsDyO2c9Pnatoe78/ajFqNzrvs/poK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603520; c=relaxed/simple;
	bh=mH//tM1Tq9RldE3FZYlmlDWKdTcRpKsQMst3NvX0SEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svp1rW4oSqCl9ap6S25kQBRYuY7wzSfwLUZcN+M7nW8IseeUpx5IgxTiWZMg6g0U9cLhhra6I0Qx3GY/tRQex8asK3vDoLgkuowFjXgyKNqZFMdyk7ly0EwU4sKLD2KRjRgTtqUPe4EUSGSLZHB33F6QdSa0C6zE8cjMj0Wjel0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcSNV4HB; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcSNV4HB"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso5660233eec.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 09:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778603517; cv=none;
        d=google.com; s=arc-20240605;
        b=GnY7E3BgHlg9drZmytDc7oIuEUX0ONwF/rCHJ5Ur/050EUAgWbuvcH1b9af7nchale
         CrmvGFHLZiHR/sJvbyU7om/wY+i3PvIJcmHyxJ49akSvedX+4683g7le+MatwrrVPUjW
         jiwaHaQaQedlFW3iNL4fEYarEvZTsG8IX7IfbDMiJyGCcnsoP+IZe6D97uPe23R7anVm
         FXIUIdfCPYayCipwevQZ5LRbBFTX8hBynCAbW65j+d1fO7flKVntX4v1AkqO6OedFu9u
         zBzZ4/w6SCTWzRuoMRqmbhBl5HlV6JtVqRvNv+TxZ1XU/yI1V/i4ntQxCnPlsIkcpw7r
         3V/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mH//tM1Tq9RldE3FZYlmlDWKdTcRpKsQMst3NvX0SEc=;
        fh=pEpv7+pZ+ThuQ+v30gKlVeVqH7t0kjTyk6jnc8ov+40=;
        b=AE1cQ58nZfc4vavzVrIg5s/52N9jGpGb8klzcE10vzfBeqL6MGA8WzEPmrJdxDbymH
         F+fbOQCJF01CekypPE8Ag9SvMn/5WB+/kCD8F6yU8kdowm+7ebtEucpyCQNUtDnLyki/
         XDiyJauixXQY2vd+3NFbRSVaXfO8unRLKdpozze87SejhvRFNDWBxaeBN1txRauPnZzn
         OpLMKHFP539Pe/cPuFr2h+oOiBfnRnQxcYIR1DtWVwTR0hKvwzfKHYEbfbfqjCQpRfUi
         hBoH/BkgxoAYo7oZjHSYJ+YXZfoj3CSYqXiNbdS1Bu+93pDDbqvDdBrqE5DpwmIuohBF
         FmPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778603517; x=1779208317; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH//tM1Tq9RldE3FZYlmlDWKdTcRpKsQMst3NvX0SEc=;
        b=BcSNV4HBplKAXAdVZ7Xge3MIntCtxH7pfMu6HaaViFkp5QvVKG5Q9FcXZvhXH7OsuA
         Jm8vKuBJuqBbQVL8GYlj4BOgOclxWzazI4dQptzVZZfuWrVGZ2IYLxA2bw5fWu3HVuRa
         D0nxqvT6hzYsGdVtAJ/UlJ4vShjZB0b7+v+OT+XHjHxnrk2FuzGsNO8N05E/bhYtAU/X
         BwIPNnyDg+Dy5HFXYfRBMA9/uHYhV40h4LvDeAO0b5DWUIeu8S8yg450OUK4VTO96eF8
         DBr42OtyrvKfev76JjM8HRJ2YJ/W4FSXxBQt36VZ7f3UOPPD+MFQQfaqktMcpXPTTnXe
         5bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603517; x=1779208317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mH//tM1Tq9RldE3FZYlmlDWKdTcRpKsQMst3NvX0SEc=;
        b=szSknFDPrUdHfPtN0m9yMS4VhHxNhwikZViqHmA3aebH2tRRBTnEjv81UAzX65Ohfe
         wCoTCChwTIKkyLrcU08LgyvoDUF4mHi1wZEqdEFRhKPicgoCPZHAvJLEMvAFImAsX2oH
         GyFx+bq6vt+beaMfrXwH2YXEUNVdmDLsxHqrwvIjI2spTP0qV4a6W7NWe27wtrcOpdnu
         yLgKjxJ721Bt0aHf0LHptC4LvW8E6/0/kWF15tjxRKpQPr/2TyQREof6I4lPD3cD9Kje
         SDCe4nNrS2GKXEUkkJjztmz0ziz+rbuA76SC4T20CyEejs5cw8DskA3CUB6kfX2ZcruW
         J83Q==
X-Forwarded-Encrypted: i=1; AFNElJ9JtEFh4A9eIRe7m9B6CyS/GlHJzYgEEcERxvo3O264tyCwaKP/SUUw2rQoryBAPC+jSCWy/NlFYs5suXPF@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7kElLrPAwAEtZwvQg73MFTBMfRjh/JOTXuiDQbADyh1RLvPFN
	UEN4RT0jkiRkbWuY4/jtaP+w/bVikECFXi054USoIELH3tlNHWhOSBebps+jWzdgtR9kJBtxmAD
	SPv43wvzKZ/QQn7Iz6C8NB8eTJRwpNvQ=
X-Gm-Gg: Acq92OGsZHjXSMrQaKCuxdSUfGrxskbS6q2yXz6YjAN/Tx4icM6rhGR9aBxgoYjWAor
	Cm918Rr2oEx9sbCsRMvIwkdc9h8T1uR6GzzZOLKSXyv0hSE1zxRiAUI2p7WxpcB8DsQmFVrJO/E
	iXG3M+HZ1uMZtqXnD21u7443VghdVgIcf54wl47KgFLcWcZdLx2D75zmm3Zfdtg2RO/mg7CUvYa
	hr0CExXKf5AZvxEcgG8j8laOwX4E5jH6zkROFIB5UghbhBJLb3+UWsB7nL72+TF11EGZH0oJz3+
	MD5P9E2i
X-Received: by 2002:a05:7300:2317:b0:2ed:e12:376c with SMTP id
 5a478bee46e88-2fb5ff85718mr6857994eec.34.1778603516847; Tue, 12 May 2026
 09:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511171255.9668-1-abinashsinghlalotra@gmail.com> <agML51XAy3kSGhpa@ashevche-desk.local>
In-Reply-To: <agML51XAy3kSGhpa@ashevche-desk.local>
From: Abinash Singh <abinashsinghlalotra@gmail.com>
Date: Tue, 12 May 2026 22:01:45 +0530
X-Gm-Features: AVHnY4KABazzCHgHbci2KPH9ABE0xo2esGDhzuW932bOuY0AKY0n2jSPsX9g1tE
Message-ID: <CAMV7Lq4=myKac0hZk=-W4ibjMUwqvCh7LA7KL=QsivHpdtOSXw@mail.gmail.com>
Subject: Re: [PATCH] staging: Documentation: dds: replace frequencyY with frequency
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Abinash Singh <abinashlalotra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 4:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, May 11, 2026 at 10:42:55PM +0530, Abinash Singh wrote:
>
> > The documented frequencyY attribute naming is implementation
>
> I'm lost here. What frequencyY? I don't see that in the patch.
> I think this needs to be more specific. Can you rephrase?
>
By "frequencyY", I meant the implementation-specific attribute naming
used in the documentation:
"/sys/bus/iio/devices/.../out_altvoltageX_frequencyY"
 where Y represents the tuning word register
index (for example frequency0/frequency1 corresponding to FREQ0/FREQ1
in devices like AD9834).

> > specific and differs from common IIO sysfs attribute
> > conventions.
> >
> > Replace the non-standard frequencyY attribute documentation with
> > out_altvoltageX_frequency and document tuning word selection
> > through out_altvoltageX_frequencysymbol
>
> Missing space?
Thanks
>
> > This makes the documented ABI naming consistent with standard
> > IIO sysfs attribute conventions and clarifies how tuning word
> > registers are selected and programmed.
> >
> >
>
> (A single blank line is enough.)

acknowledged.
>
> > Signed-off-by: Abinash Singh <abinashlalotra@gmail.com>
> > ---
> >
> > The out_altvoltageX_frequencysymbol and
> > out_altvoltageX_frequency_scale attributes can be added
> > through extended channel attributes (.ext_info in channel_spec struct o=
f IIO)
> >
> > Feedback on this approach would be appreciated, and if
> > there is some other way in your mind. I would like to
> > work on that.
> >
> > I am also interested in working on the sysfs-bus-iio-dds
> > documentation and the ad9834 driver. I recently bought an
> > AD9833 IC for experimentation and testing.
>
> I didn't get is the current documentation wrong or is it that currently
> used ABI is wrong?
>
The current ABI and documentation are consistent with the current driver
implementation

But it uses implementation-specific naming using "IIO_DEVICE_ATTR" ,
such as "frequency0" and "frequency1" for DDS tuning word selection.

As this was in staging. It may be because it is not aligned
with standard IIO ABI naming convention such as "out_altvoltageX_frequency"
This is what I observed. It may be incorrect.

If there are any other
reasons why this is in staging ?, I would love to work on that.

And from Jonathan's reply I realised that I was wrong about
/sys/bus/iio/devices/.../out_altvoltageX_frequencysymbol


> --
> With Best Regards,
> Andy Shevchenko
>
>
Thank You very much for your time
Abinash Singh
