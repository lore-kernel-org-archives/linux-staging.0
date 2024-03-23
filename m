Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB5522D;
	Sat, 23 Mar 2024 05:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711172879; cv=none; b=o86Xgzc196mwrYg/R6GJ4iS9c4Fc4xDIFx7QemEYAO5/30/Sd2/XiIBM1RNSlf2flr5qFbMkKnxIZsuvAafJabrUqY2pM6eZpNOJrvlza3B5Y4ytTFDeey7idKo8u/6A20ZS5Gk4ytOrxE1tyTul2u/3a01UjBZEAUOfGnjgPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711172879; c=relaxed/simple;
	bh=QAuGX3tf8P2TdpQEsv1SIpFMKW5zutY6rkbdp1V6ZtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xo1Q3hyw/ctRj3u4Zraugec3ZGif2K6yAClp3TYicFFbsFXW1sxXQd2fExSIDpqBvOBbbRGgzTtvGIfIGGmuZMBCJP8vtiGzD0CYhlnGI4CV91P4ibEzqkOpYTlZNJ8uMGNh1Pm0oPq3lJ0mPZfgdVgjlhP1DosOB/GmeCOj2e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiwZZg2Q; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiwZZg2Q"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so1736287fac.0;
        Fri, 22 Mar 2024 22:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711172877; x=1711777677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAuGX3tf8P2TdpQEsv1SIpFMKW5zutY6rkbdp1V6ZtY=;
        b=XiwZZg2Q3Wkeh0Wb95OgX8kAHnLH5dvFxE/AoPt4rjrmQJU82is/1p3P1AO6avbiCg
         kdog1XB6o5EMrXBoJmG/A1+bQ/naBMpvQs2WsFUlcS6Q0Ur+smbjgGTH3N3wc3XEpxYj
         FuHXKYKrf2bYGMicpMozvcgQjGu51KEWw1VBreQ1fNt2K5LHPgSmN5vnLTamoQ5ixFUo
         19ToUwJ+RC0fRewVN0ml15hnwWRPiiIZ5DjCkS8i7zZqO0vViyZ3/W6dw+BYOslurXHx
         UArQbhL9InMVGWFAnIIbOu26PzNM+tyLk9iM3WuKjWd6MnjuZyCmdP7omlDP3J/jQKxl
         OKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711172877; x=1711777677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAuGX3tf8P2TdpQEsv1SIpFMKW5zutY6rkbdp1V6ZtY=;
        b=Bkn1rkc1Qu1quuAoq+sd/hRt7V/wFUQHsYK3TcDdghEK5zykioyiG8vFvrmmyqQMZf
         pAYD3ZzrKiDuGe39bKO8j7o9ASeUYYRPa6MinCT2Q1setkepFMS1WA+/AeZBdLxgWNMD
         Z8C6M7Ka3xlFB/D+liGs7MAh6QDDUC1VV3Wi7RDHfluYQ9yVUTg/GDCwlb7ycgYMk2F0
         Evf2kzCCRwyiRP0gc/f6Zds3jqwEutu5BvzThMd94ULMqGApNZVTjIDy7ybL1AJjMbX1
         6xHm2LzXqlW9rMLPvJuv4H4OCf4WQDUDSNrrF4FQdAte96P6HRCieDJbfMYkqUlmIkfv
         XmGg==
X-Forwarded-Encrypted: i=1; AJvYcCVuqVpaHwNHdDl4ovvQUu4APp9cMmy0UWwX3XG17l2xY6JwJZnbZNlMMKVvXnRRl/cA16VOrBTaanlnMlMFoYReG5IfzT/FRMZIJyF9qLONUtccC2J4axHwzDdVP43wM8HFMRmWbi5pXQ==
X-Gm-Message-State: AOJu0Ywq4hK9MJ6iTYAklLNGogdInbywvzz0IP5kwhZaDRNH5/5HPR0R
	rO45tXrawrsVn9E3lex7rGGUSi8t/vye5pDrw5jt9iRz2iNGV+CZ+Mo8JrRy/uPAi1M8Ae/ETlQ
	IN5HzG8bUf0NqGpZ0ZrOcPVPd3sY=
X-Google-Smtp-Source: AGHT+IGJuQX2iGfuUjborXV2RXTg4cvlqOj6eigknOA9Nw1r0mqmWiyMuva8xs8W9i1yeBUydj/AAnpRWkrzLkF23Vw=
X-Received: by 2002:a05:6870:818f:b0:21f:236:a316 with SMTP id
 k15-20020a056870818f00b0021f0236a316mr1914018oae.50.1711172877419; Fri, 22
 Mar 2024 22:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zfk0UfLh3rRf6qDv@MOLeToid> <Zfs0+0C7nzKiBjGy@aschofie-mobl2>
In-Reply-To: <Zfs0+0C7nzKiBjGy@aschofie-mobl2>
From: Felix Kimbu <felixkimbu1@gmail.com>
Date: Sat, 23 Mar 2024 06:47:46 +0100
Message-ID: <CAK=vLx+bLg90jgWouqGQ8itsEsp5VNeV8tJuEzZHMm-D_0+bPA@mail.gmail.com>
Subject: Re: [PATCH] staging: pi433: Correct comment typos in pi433_if.c
To: Alison Schofield <alison.schofield@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 8:11=E2=80=AFPM Alison Schofield
<alison.schofield@intel.com> wrote
>
>
> Hi Felix,
>
> This commit msg and log can be trimmed. Please take a look at samples in
> staging or here on the Outreachy list like this:
> https://lore.kernel.org/outreachy/00be5f2a97b0c899279bd8f9cd27634186b77b9=
d.1666299151.git.drv@mailo.com/
>

Greetings Alison,

Thanks for the correction, let me fix that.
Regards,
Felix.
