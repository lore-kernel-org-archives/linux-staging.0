Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED9F66663
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:49:54 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5362bcc7026so3665772a12.1
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696009793; x=1696614593; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVb8bc5h6cYCDb4wln/HVuuicIeKALI/2rEiAT/rv2E=;
        b=IKC6gu5elfwA6gMbwnGnYhnW4K2XSSE0GQlfGevoEndDBVf1tuIEOe4nobWOF1I89k
         q/tsgQo931G4x5wCieNkUpq0CvxNSp2wRXlXkuNH0UJvuETrh7yrMuJBZqWQcQdTdRWR
         7HlgGPS+l9oJPWWCtRcNrThQ9XHtJSx8X+i30vYknTpTKa/tUzSV4AKwRQ6JEsX+kjhM
         BDyEJfRdBooBXYhMF4W5GPxIopqnNK88HvbM8RdKLx/v//S4thZoUofvSIo/x+x8woZx
         jVN3slLWbIW2WPBQ+r5Ch0gYC+qZHcR7kai6HM6dPjRRNvzOWCyq9dDfP18xu3OgNzho
         JaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696009793; x=1696614593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVb8bc5h6cYCDb4wln/HVuuicIeKALI/2rEiAT/rv2E=;
        b=Nma+i/j472o0tu2HOii+1sV8l64TegfyIK8qtnvqDA3CwzaqKIs2yJJ/NsWjNiFs3R
         sa0VbkpGUlX4rZR0mRopghGwCcxGzcsDBLN26KE36it5Esh4878+BSN2MMbf8zbw14R+
         Qx3b9y8l/L9axG6djw0wRazW15EJ/l5FMQ9J2zphuS37H4gQVU1+jPhSs70T6g1usjUN
         TDTjmcjdJ0AyAFimvRp6A+zeh82bPJAp4ND7piMCG8OBQXO43tTbUlKHraCUvPyrRYwn
         m6kL65wzNjceUzPw0szyPveku1t3ZvqwfgMol86zE+D735UCnT18OFM8EHBO+7CQO+gd
         jcLw==
X-Gm-Message-State: AOJu0YxFh4rS1aVVDNVDm7vqCzffSLtx2NEO9xRqYpHzpLN0VGlsFugy
	C8JTr1MpfUG9jwoCZw+/LAFnwh+tXl30k/AvwZcxng==
X-Google-Smtp-Source: AGHT+IFrazPWKmZQvejWAgHITohOjWY7XIYytqxFwOWTgz5mw+hIEm2IUh28jJx/1qJjE+rTURLQuJJ8e+d0I3x9+LY=
X-Received: by 2002:aa7:c549:0:b0:523:4acb:7f41 with SMTP id
 s9-20020aa7c549000000b005234acb7f41mr4282447edr.14.1696009793077; Fri, 29 Sep
 2023 10:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
In-Reply-To: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 29 Sep 2023 12:49:42 -0500
Message-ID: <CAMknhBHLwWuuCDSCBZV1bB1MuqDa5ur4GEY+Yqofvn9MPGRcVg@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] iio: resolver: move ad2s1210 out of staging
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>, Jonathan Cameron <jic23@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>, 
	linux-kernel@vger.kernel.org, Apelete Seketeli <aseketeli@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 12:25=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> From: David Lechner <david@lechnology.com>
>

Ugh, an automated tool picked up my personal email on this for some
reason. This extra From: line can be dropped from any patches that get
picked up on this round. I will make sure to double-check next time.
