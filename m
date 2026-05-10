Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F2270575
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778405506; cv=pass; b=Fkb7UgXsmirvsp3RALeI4OpGpPGDNdIOIivAfq1PcwwTz63qRRzW4PwE8+dkVfqOy7Iwisa1W0TvO/zyN02we7ViamHQhEUkTF69bdVsXQZPe2BaGbNPjXJNuyVOFZLj7OaahTKwLslNae/QMDcYMSz4AsvxZsvFMlqIRnrXnKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778405506; c=relaxed/simple;
	bh=oe3xfWtcC2xxpq5nAlWBl7hbI4M5+HYKZ0lkzcRhyXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJf43Q576+30RO4fHX5aOJiZE8Qdb7ERc9IMJ/QFf9RNSo9yTNe66odORxDBidCFWvx9dQI07+W2WVCFqoacJ/PHEp7MILJtLuyKJg35wE/XxqmHQj5jM641/givC+JEOvnMqkqtNcflI+hvphudfQb0Tc5KXf0Mtys0iauCICE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6fWePxK; arc=pass smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6fWePxK"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso29491241fa.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 02:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778405503; cv=none;
        d=google.com; s=arc-20240605;
        b=gNXuiVlk8URQkoGbSBMfZxpNCrNeRKb7rCj82gbCnTTSarGJfLa/+sk2Mqp2eA+9of
         OEO07OBH1x9tNJTi2bUUwjyyr/E/ilDkvge6qlsdbiRgfGtohitYkxUaavW/I6pzFUg7
         i36+YBeSpQSw1E2HhG0Y7tn4XtTHj3NWzqNCEIE53ZvjHL0Ac+HyhnqdCB9BmWwo3G8J
         aZojC6f31qsQCWAkcI7OUEkpvmy62ZEwjfeGfzGHmqY7qawxv2PzKTIHTZEXjcivTean
         IGHIAqICW6fAtJBmsPEQ6Cz609hwnVlHXYu7u0VCrMnUlroHZLEDtZKGqhilXxaCTfR7
         WyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oe3xfWtcC2xxpq5nAlWBl7hbI4M5+HYKZ0lkzcRhyXU=;
        fh=/1zPpcUzvPUUyJA5IqWFQOMd7TiLoZ4c9yXylSrzA1c=;
        b=glcn0Ipm7rr4+v+/bK8ixRY5pQNa9xziglPVVLM8qA/+GtwpBLtvZh96/wz4LOU0ky
         aJ57JQoHLvBlUKMz6j/Dp5XhxUIAFhYxkL+fNr6hVYSkb59jf0f0NNQlLmHqZBSh0Y8i
         hNYxiHGYluFI7y7Vm9RHV8ekBBDToFI0875veDZ5Qnp3V6PVl432gDeKweaPr0IZgY/R
         xr7er2VCg1dV1liRxdZaPX1BzoxB6XM94irw+g6IaWZj0EJVn6uy9M9tq9YdesKugarn
         B38YLYdE91rMVZt9FyCDjOkdrqBVIVj1DmsrG6Bz4qag0t0/QJi9O85pekQTytxFlZVq
         crxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778405503; x=1779010303; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oe3xfWtcC2xxpq5nAlWBl7hbI4M5+HYKZ0lkzcRhyXU=;
        b=R6fWePxKmryuuhVQi+k9nD8u03GBpak64NB2sbFOcNINmtmaQ62o0/G6xYxL0pN0Pa
         4vl2PqkyIQ6CIYuZxU4vZLsKA/S6IDsOhpvMfo5xda7VZ3JN9KxItutyp+hLDIEc+hsc
         lHiZaLnJ6lB7+WYBjkW6vrCjKHxUvDsjLyChqFgp39haXT4oI86s9FVmxc7OFf7mUf8T
         EzGLpktQWpJdpyi5sn28OjH+BGaLCk5pgLL5BTtbKHVEsd/4zogi4Vqr6dgi6toJ5PZR
         c/jwXki7DaX5rfpeb5jx2DaVJHCUQrveTOys3Op4vBVAvbf2FLgvcbw3U2p4fzXcrZ3y
         2muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778405503; x=1779010303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe3xfWtcC2xxpq5nAlWBl7hbI4M5+HYKZ0lkzcRhyXU=;
        b=KlG5Vlm2BwVkYEEOLGRaG0Z2ulEfUz78aVJC0kXAh0XSV0/zcDFEfSQXuP8zjZvu47
         DOvgogdcmP4YOnScZA0zpC2Je/cY1/RehFp5o+4fmtCkveg8whorYAQv56d9jG0B0D4E
         5tg49lr/NQc8tOnVnvEzIkTSMS3Pn+mD4SwxdlOjlTcee1OsVQUvLzGIJ06hKKaHulvR
         M2BIRokGckpKSK3eEkAC/EffUwQRcfW0USQ0UDY8BuGTT50febCp81VsRMizpOnxfIWp
         TptPvyAtUJLes9lfW57X+h+sPSoCWH1qbbUi7A2wvITvGA8g38aUzx2X0Db6RUUQU0mN
         cDlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bbigq7G6bQJWwSfYaltS7uTWXS5hhxBRg/iToBYGaDu1uz++K9sSbOjPecTajp5n+E/DyBU/mzdyfG+p1@lists.linux.dev
X-Gm-Message-State: AOJu0YxyCwd81+Wsds6RO9QKlM11sCm3zvumYVCbmP/yTb+Z3h2s4ymS
	TFLz2ZLIGoY36plGJg4fax4eKlj1YP7fPm9hSJsNlp7YMeUhQXm/gtmaYhlasxBwNHnCrFvIf2y
	vA5BaFsTHwTV87jZI5YiOpuv6O+I2PMz91u8izec=
X-Gm-Gg: Acq92OEF/nE0I7R9OSXpSOh6eC138VwCwF7MRLxgnHkBg3H+yfH0tM6EDUcAfliV0ED
	d4N5BcSTQuUsNqwXlvPx7xE97VVQ/AxVw8Ixxhurx7Oa7PDknl5LIm8BLAleb8Ef1bksQdP0vWU
	7Q0tfb9Rfm9Lc+hp4ChxhIKtSGpG1WYSh9p4haOhKwLVJgm5rS0Z7c7Gvxmz+y/+5XbPwBxJZUP
	WzP/hHwzRjmmTiPJOJXfraos+eovWvXOvp6/pPCYa5oZPqMfW8ITUXRLRFJELdChh293gky9izR
	BpEzOkKsnwozU7goKP5vKr+0Stsyhg/wB8R3u5UjWlw+y6hgCOWU
X-Received: by 2002:a05:6512:2256:b0:5a8:5699:6d3e with SMTP id
 2adb3069b0e04-5a8b6ca1d89mr1418016e87.14.1778405502894; Sun, 10 May 2026
 02:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510081041.85880-1-dennylin0707@gmail.com>
 <agBH9QqHW-cJN0iQ@ashevche-desk.local> <CAGEkeHf_wueMkwqQmQ0m2drXQ_m9UsvcFwqu5RVvg0WsjAJW1w@mail.gmail.com>
 <agBPR9xke1MTzL0B@ashevche-desk.local>
In-Reply-To: <agBPR9xke1MTzL0B@ashevche-desk.local>
From: Denny Lin <dennylin0707@gmail.com>
Date: Sun, 10 May 2026 02:31:31 -0700
X-Gm-Features: AVHnY4Jee5Cy46dbTQS-2fRN4iAVwne3JIJc6Gnis5eUGpR6E-Rl3RAwfbr1f7w
Message-ID: <CAGEkeHdZoDGtHS0Cmh-HULo_vz44gF1sDMoxrtJ0Ykf9mqcZ=A@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: document SPI interface
 switching sequence
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Do you have the Datasheet version? Maybe URL?

The datasheet I am referring to is:
https://www.analog.com/en/products/adt7316.html

(ADT7316/ADT7317/ADT7318, Rev. B)

Thanks,
Hungyu
