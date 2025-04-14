Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE125229C
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644957; cv=none; b=SOFTJ4/vj92AtiFsqTIHXgofEf2CGAghskMRK0Y/MGb6XyRqCFxl5EhOeKMg2+FEbTBnc8nbynmaHs8N7gVG+5fuWAkFzz9utym6vgEKaHkwg+HWJyjBwkU2aT6nj4EIGJPsMsT40M/69KSx41YeXyMJi6Pf4oqXIXhR1YeLdZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644957; c=relaxed/simple;
	bh=+v5GBdFU3hoXN+uGNfpMqMGmAv7vkRfYIU2MS99/34k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rm+4WDc0n3++mXJ6vEwK6psiZDcEz1EiAKVTcA8BlCcqFVzoR57LeIm7D6B5baUY5XSKEuMFf5VuGG89JDOxxRIRyHp8lZm6W9xp9M8BO8fTaWgaC7zaJQqEl+Y+FoqaGJxKe7U/C5IKIJ2hAH5Xjs/UqwQczje2FvlsocUeW7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g56E54t4; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g56E54t4"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c592764e54so551669585a.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744644955; x=1745249755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+v5GBdFU3hoXN+uGNfpMqMGmAv7vkRfYIU2MS99/34k=;
        b=g56E54t46t+uDQHNnnfp0ShihgILCGcpMwhy42Pjzk/9kLm7oMSOCxS/fLQ4OdbUx+
         ZvymVcgoQWis5BOHZ5ICx7wROaB0ZlmGINRpOoqC9IlXjwKrCSJkOfcPpFkvApLMHbdW
         zV7TeuZqyrVkwos3sBHAnGgZPJ/hpyfMmgNJGqr7LQbIImSYumEdH0f9V65DoTXee8CT
         lHtH/4yXJ7u+HT5xDThvWKxqdtK7my0qeKgBXmNBCxRlEy4iEXlPEVicqD9HG8vHTgO4
         q1fS5NX8mvP3m9ujBE5Cd+wckhi90r/cgDiiZSHSOYxHE/lQeFhETH60EyOXJ++Wk/1I
         V+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644955; x=1745249755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v5GBdFU3hoXN+uGNfpMqMGmAv7vkRfYIU2MS99/34k=;
        b=IEdhd8UV2TakG533e8piEKjOvOlv81Yg7Bs+nxrsTkaKMmhP7lu3kJ9/Vz2KL/dnwZ
         v46As2amK37Q3/YDz3YRDN2wFLi/OahY+fnlPuibnTmuHd8XlPBi7s3/WKyBYkr9N8T0
         zaU1eGQJ6EJtaJNOLTAYMHbF976zfFO1h9ANpV6Loclb2OVzagcpa5EtuQO1t0RPjRa0
         vROeonmFnna2gaWY/xgxcfcgEBDQ9UAzNfIf1AcRJm/0dunSFELHcl4JpDrCX82CrQxG
         m/s5bRPqqVUJTQKmCCf/RfqVtINmvPTdz07JV1WFA1git/jeQ7HmLhHbrWOyVY83VgKg
         nfjA==
X-Forwarded-Encrypted: i=1; AJvYcCWEYxmrg7Hj5e9g5YK52KLrQb8HsBLGdp85pv/I8fm3CvKHUDvLYUz+U6v7JuQMkj9bSKaFwUgbIqzc0gLz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5WPMj7ERPpwrD7ySy5kf1YTBV/eFefDXr8EVIHzeRMi6L9fFm
	TPzPRAFRcV4RBqfEfHSnOeO2uGDVmvNFO4l+xtbhqlVKR6Jy8Pg9Ov/NMyaBknXYvEgIxuiVji2
	iZQdH5SxM2pGTiLezTbPT9+Ad8S8=
X-Gm-Gg: ASbGnct/RevlG0RdMrcZdSWbrkLe188ZBx4Yl/oYEyujDwnRqRNN/zcc666ZgK99Dm3
	5b6WnP5gX3rKVAUW/XtlP7BxqUSJCl1MK03mNt0qERF2UklPEq4s7lrM0c7qslF2G6/xw5/CF8l
	e75Uqb8djwMIJ22DT/PlsVrjdwIwbMMw3amz5vFdoaFS2Xo63vnAdAjWj2fbkEQjUl
X-Google-Smtp-Source: AGHT+IEXe+Wbw4q6CnrtWNp/owFqYsFsq2PQKIoSF9ymh5TUERZr/I6KyL4du/gXWT+SXUA8Un5UdgkX9zgThmHvwjA=
X-Received: by 2002:a05:620a:4310:b0:7c5:4738:8a0f with SMTP id
 af79cd13be357-7c7af10c12fmr1618638085a.15.1744644955019; Mon, 14 Apr 2025
 08:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414140901.460719-1-gshahrouzi@gmail.com> <0b1b428d-9ad0-4581-a13a-88f4ffd6c4e3@baylibre.com>
 <25db1c97-001b-4b9c-bc57-879fcd0abb14@baylibre.com>
In-Reply-To: <25db1c97-001b-4b9c-bc57-879fcd0abb14@baylibre.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 14 Apr 2025 11:35:43 -0400
X-Gm-Features: ATxdqUH9M8QgQytsQePy5fG22GAOlscRHU9LERyMaCWRCdJfNFKV9N9M4IYxo7k
Message-ID: <CAKUZ0zJs0mgmgfHaTzsPaiZFjHO941wJG2CmyJnA036aHu5vyg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: Correct conditional logic for store mode
To: David Lechner <dlechner@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	gshahrozui@gmail.com, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 11:02=E2=80=AFAM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 4/14/25 9:59 AM, David Lechner wrote:
> > On 4/14/25 9:09 AM, Gabriel Shahrouzi wrote:
> >> The mode setting logic in ad7816_store_mode was reversed due to
> >> incorrect handling of the strcmp return value. strcmp returns 0 on
> >> match, so the `if (strcmp(buf, "full"))` block executed when the
> >> input was not "full".
> >>
> >> This resulted in "full" setting the mode to AD7816_PD (power-down) and
> >> other inputs setting it to AD7816_FULL.
> >>
> >> Fix this by checking it against 0 to correctly check for "full" and
> >> "power-down", mapping them to AD7816_FULL and AD7816_PD respectively.
> >>
> >
> > Sounds like we need a Fixes: tag here that reference the commit
> > that introduced the bug.
Sounds good. Included the fixes tag and CC'd stable@vger.kernel.org.
> >
> >> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> >> ---
>
> There is also a typo in your email address in the cc: gshahrozui@gmail.co=
m
Whoops - I'll update that.

I just realized I didn't update the version for the second patch
correctly so I'll send in a new one.
