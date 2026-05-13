Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252323A426D
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702140; cv=pass; b=L/GVU1P11dBlSAaJN5zTbVstKEP+I2BZylndU4f6ljVHQ1m0qDy8Ha7guWnal1i0NgZkutJMzZIIF+a8CiiVvNhcJ5XBTkIVzj87ln6CzwRnVdRNXBLHHRmN52grPz8mDaztXf7cvcCgPifehxNUeKoLGBjSzSO37BkwHpJ9cMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702140; c=relaxed/simple;
	bh=WcWio7mgXRUVAYpzCib9WcVF//wmjkBti/gng1GlHL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCZJjMN+lwSzqUVlXU99bZZdubPUsazDbcMb5TsmxHIQaGxJFtBfHmqWECCYiFqFW9JxqDPBHRLN32UDrh1N3Y9ORXIY/nvAYTDbKTUC1P0BWYcGTD1otO3WTA/9jAECCGZoydASvCSAUhnN0Jldsd6KsHKs77K/+x3FdMR/4Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJw3TGzg; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJw3TGzg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd124546379so520629066b.3
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 12:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778702137; cv=none;
        d=google.com; s=arc-20240605;
        b=Flrl5MzpV/0kb3x5yIxmtHXrCzaTzty9FHURMemVHk/xrqEEP+XkPhNV4oAm3XYCnA
         CMQY1Lf8+PdN/uhihY5WxNsBzgkFK5jFMSGPTutxs3ljpds7L3IZwF6sNrEw+0u84uf/
         14fDXEErPY1Q9swBLgDH7TpTS1qLGAArpepKLMHKUnPMKg0YEabaOPK8Yo9VICBt+XMq
         s/vE6DbQU8dPgyz5JQ7nNAj55o2rKejT9wW5WuThkcrhsaj/B29J3RnzyWUj+KRzf/Ww
         JRQtUlqjAK3NQGtNuFh0yQGjeQme7FpQXR/Iz5lf1fjLgkwRNhZF1GUKlrTimF9E6iiN
         SaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=822c3uVxAqn4jqapQ1Rlah50pmYeZWCyU1NZmpi0pUY=;
        fh=Xayhns+GAQSODepoNnkEfPJG9gqSQ0iI5xw0A/iTFV0=;
        b=DL6KUqHndqgq6c8dyS0OLnSkBmzr8lC8Re4aK/ZmUAqZCG22CWT5mx8uIDScT9CjdA
         RA9IpV6HIgV6dgHf4NngPoCK7P9/5o217FkYkVgdH7JXq+SFnUV7TOI/cRAlgxjccbrR
         FIMRcgthHRCwW2Lk1/VLAH96ADEykkbCM1ISrpbU9i81es67+BGmdwRICC2Lhdz3Tz1Z
         ospmQA2DFXa4D5Qg/Z8C8TSCjIrYfqnekF+gEJa8G54Si3CyFdIAizIk9ltkUj+9cm70
         YUfU8tG59eymS/8YxOdT0/bJ7PTOBJKQC8QvwdqfBZOWv7dg4L9ZKnSS7dUj9gY/OS93
         sDpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778702137; x=1779306937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=822c3uVxAqn4jqapQ1Rlah50pmYeZWCyU1NZmpi0pUY=;
        b=pJw3TGzgUDYpZ6+g6Y5Qv1wXo5OdXHGQeDdt16g4y5HQ1/O16zaTLJWQyoTEG6tPRs
         rErgjAFFjG8y7ACFGzHPW3/05uzMEHlFrfpqbh2Dv5Y3kN1fPkuJ4TOWD55QYgXUnbRO
         Mrw/aHjAxqafdHhzlZuzOg2kS7Axgxhw1BLni7eK7hBKbEgSn9JNFIx+I/HVFeKdIm/G
         TfWBTl1CKCNIdLsf9JFQJ2b15qvDRKjUuQJMggr/h03uTcTK1JkwEAfvNced9TRB43E5
         kwyvhZIwOAYL8/MNm6pQbiocNd8QOrywJaRMz2qXuIxIEcccgKsdbSHfEbYFdPIEPsgb
         YH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778702137; x=1779306937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=822c3uVxAqn4jqapQ1Rlah50pmYeZWCyU1NZmpi0pUY=;
        b=QVhtJZC9vAQUvBZDa9UYzSaYErfoPKbWgRq9JmFnYlcNyt9I4m5hELwa4rPxHmMXXN
         5p2Nop7yODqKQAAxaRwwkgkqrpu1lKD1SduotYpJRFQ14F/hqMYkF4a5E4xvE9eQ7jxs
         sHCMLH911aWJKvZpMih1M0sgdKDFc9d/ntiexWry5T4nCgvqJVZmGreOx/QtCo1NTGy2
         zvMagRe6dVrypulAua8oGhOsAxiLAJONBJ6nYpnUqdAOdA+Ca7oa1RWjjy7HKmwRpbK8
         krssgJ8hC54B18wFG9PWtWBUVdxkGv5DJNQMSDtsRMi/ItvWECGsPzIv+0Roc+iEOhFU
         qzpA==
X-Forwarded-Encrypted: i=1; AFNElJ/dUo1xqPupCwBcYhK+ylW0+HXmovi/AZhhKyRRBnfepIEFlr6ZIdI1I2wZzFj9wgk0gyYbnMwuG18UQ9am@lists.linux.dev
X-Gm-Message-State: AOJu0YxKe/uPzxlhfStUfjmjX9dIeg38ug0GoAAWdrMvvdFuQfLd/9u1
	/hcbiuO/8BgF9AlzNqQvePldVWYzCHNBhGzcx3xZl/ZOd35JPei0Ga2R1kK1OJgUSXXUsl8c/Sa
	ADSG4QAlYZp2ImVWwEzLEuApwN1yAjfE=
X-Gm-Gg: Acq92OHCzyeZQ3Y4/phPsAV/8j9mfb4QVhq0/0o4MnjixY1d6q5L6lW/EMIWf56T9Fi
	8JzdONrMnGd3GJuf5CZzi2HkNqrLzxYYkTqKxcQ93n1eK0BRuXHXMfRE/HwjrfLf9YkPMYyPsZN
	MmwoGVhM3dsWqafQs6J1noAQy9dOAERPuPKunHzZzhn9ulabWPLCMFccqVztlBGyhhDZJeZuCfk
	QCWd01+GcsSYogESaSUDMnPb0u2W5kyAW5ZS7caxptqCZ/gpv7M5EUB35uJG7KEwR3CwCoz+jWH
	HheyAoY5xvv1dQI/EG64RvFa9wzuZEqmv7TFlLcRs3StTqIIcU01QSOL16PAuddUl12ulfe10GG
	t9zn44oXI4Ok+pH83XQ==
X-Received: by 2002:a17:906:7945:b0:ba6:8f34:b419 with SMTP id
 a640c23a62f3a-bd3dfc6cea8mr288622466b.13.1778702137270; Wed, 13 May 2026
 12:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513170413.58469-1-igorpetindev@gmail.com>
In-Reply-To: <20260513170413.58469-1-igorpetindev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 May 2026 22:55:01 +0300
X-Gm-Features: AVHnY4KTHQag2G4g38UzEExnxRw-lvkXriTG6I3lrf3pzMt1lNqsyn2RTcgnr2Y
Message-ID: <CAHp75VfDXdRTk41tgdEjmaPYUGCKh8L5CtWo=KKUKQhcg3pAVg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: fix trailing statements in input_system.c
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 8:04=E2=80=AFPM IgorpetinDev <igorpetindev@gmail.co=
m> wrote:

Missed commit message is a big red flag.
So, no, thanks. We may not accept this.

> Signed-off-by: IgorpetinDev <igorpetindev@gmail.com>

Also you need to use a real name and not an alias.

>  .../hive_isp_css_common/host/input_system.c    | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

In the entire almost 100kLoC driver this is the only file with such a probl=
em?

--=20
With Best Regards,
Andy Shevchenko
