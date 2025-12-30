Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70FE248F6F
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 22:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135095; cv=none; b=cXxCUexZec1NmST21uIN5J4V7BYM+/OPtCCQGSkzSo/5JGrkqzDVHyCS13iwbvlZpL2obMY2Ks9/sOCvj9eXG+QZncLTt+Ci9RN4mIWVJBeaqoyhq50hbkk3SwwKPzE0XWJ/+7PHNaq5jTvbhTO50onm1Og92rbM1aNmpiVySlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135095; c=relaxed/simple;
	bh=uwTMxixqDFwJzT/YcES2D247zq5VMSRtvyF8Xzf8XoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfFIwJ6p0D7ELLLhmP58bL88e+LTgfFpEvA9Gtez3vAH3gaWF1aNemX94Y8mxY9RJ8/y+BedASgQS4Ax8p122ZfGX71AuxjXa6bneNPjyJeVkTm60OqGts1LoMkcjl3xQPD+Igq3lqnPVKZMhhBbJaaof/Q+uEnV+30CFY4gc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQiqDr5+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQiqDr5+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7a6e56193cso1643706766b.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 14:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767135092; x=1767739892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68m8Et8iKajhcf2vw0RxShvDBILtNM5HyOsc0o5A4aU=;
        b=dQiqDr5+9xZ6X/wtUgSmmPKe87k0AtaiGVigrW7ZXjpaiGClI8TDfFikTyrHRRLNqY
         XV22SjA8K2/MAAeQXb5ZyK/Tf2svzeuObLcHsE3E+lp7jG91MvMtYKdvvZHFmFCIUftr
         f6m/68nUhSucOKSOuMpEzdkqw8mpKPKQ1AZ7lJrASB1jpCXpHvnH9HkVPZkz1E/DscMH
         y7LAvdCicQWv7WDwFd9ACm6ss6Ar5VUuerl19IFoszFVS7/hqPBND+Z8+5RhBtcJvjDy
         T6mjw2FEL3+sYZd2REdGGGc1qFzQvthM663nnVuSInpmCLMdquYxnB3KR02PszTL8Q42
         rgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135092; x=1767739892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68m8Et8iKajhcf2vw0RxShvDBILtNM5HyOsc0o5A4aU=;
        b=lH9ArZESr5kbPh8xqnnB2uaP3Ax1R/MYKKkrA6PPzIgg7Ex5wMG+mjAowxyHQSePhL
         NRH1mgNbwWDJysuo2oizkQZ43o7R6g82/PnwJknaTAu2Xh9P7+ikJPr7VJW+dx0sMAP1
         z98Hen2VsNu6WxjmYFHwXDCPS+uxLWH3Lc3+nPBt3y5CchoEwGW1OLqFSl9Pge97aOX9
         QG0CfY0JbVYGBLVEDW99qYMFUm4gIyniDrQ3Ia284FlaTE//EO2TigEXDYFpg6T7AF9Y
         sqHcZbSf1fG9/qc6zjjCsX5ml8T11oRzJv47s1OBKxRXur1veVJynG0bDNrtluxIZvgw
         3FFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiDCFdBw0qraDJs3BVlMTCe2M2cnPeEyTw4aW/VWI2wpiwOJmkzbRD+0FCTcL2HJlQmvpq4P5+2rPaApjZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5WkHEZubh8ToPJ3p8Zn74pLPB7Hk4HsX4uu1/0sO9lS/KJB82
	+/VtZNqIqTzSrwQ1hJst1thVpeWt9R3LwNjeszqEPsdZqAZ7znUTsMUd0Wf30Zh1AfI/amEK4gj
	IXVL3bPywz0lFsNmrKBJpD1GDTMSrhZc=
X-Gm-Gg: AY/fxX6i0hgDC9dZAVJWgE/Inp6/40mfGMDHeSUw6cBKyA5NHy+CLii6WdYwJhU/5XK
	EHOsNw+Q7dJsS2/tcXwue6vJohFSnkJXQxAiQrCR3e4UVjkgdWp0djRr+LX/vQr5V9PEvyUhycG
	pjDecr7+nKDk8SIJ5z4NeMhGBNucJxVnhR37uUijsi0XqhAUPtZ8Oiomwmx0smrmeFW3EGYB/+y
	WC8ll+4C2mKtTT5AB3IHXWLdJZhTkFrTQ4/fXFRhUuKknI0DWySHv7q1Y0rRNNLomnWCWxjWdWd
	3WR34dL/cqQXiwVfA7MO2UJ68U0jhJXyXsCG5W7HiSdSgA9af84W5R20+UwT2kpm7Y+8fbRzr43
	Jdi5DdqY=
X-Google-Smtp-Source: AGHT+IGbHofExjssXAGtcn+wc7knIPEPN+eZQJGtS+Tq5WPDkgFPiDYqG5GmJg6SsvIDAY3HCfyZd7DjDsutbjsCsqM=
X-Received: by 2002:a17:907:3c87:b0:b76:3476:a83c with SMTP id
 a640c23a62f3a-b80371d7dcbmr3740046166b.40.1767135092087; Tue, 30 Dec 2025
 14:51:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230203459.28935-1-tomasborquez13@gmail.com> <20251230203459.28935-3-tomasborquez13@gmail.com>
In-Reply-To: <20251230203459.28935-3-tomasborquez13@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:50:54 +0200
X-Gm-Features: AQt7F2oDnvEMs00d0vVFpiQOazaxtC8s0yeffK8CiV-wS1QSvyv6tMvcpje74j4
Message-ID: <CAHp75Vcr76Z=npXr0pu57oCrgmSWsLO4uB9qKLmmxSKap4R9MQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] staging: iio: ad9832: convert to guard(mutex)
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 10:35=E2=80=AFPM Tomas Borquez <tomasborquez13@gmai=
l.com> wrote:
>
> Use guard(mutex) for cleaner lock handling and simpler error paths.

...

Don't remember if it was in the previous rounds of review or somewhere
else, but Jonathan (? IIRC) suggestd to use

  ret =3D foo(...);
  if (ret)
   return ret;
  break;
  ...
  return len;

However, this one just duplicates what is already in use. Have you
checked the bloat-o-meter before and after and see if there is any
difference in the compiled object file?

--=20
With Best Regards,
Andy Shevchenko
