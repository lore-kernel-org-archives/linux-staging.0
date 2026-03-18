Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763969460
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 22:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773874289; cv=pass; b=r8ft8lvAzvHrqoaX2BGGDeJZMr6aTE6RHSVW/x1jyWHd36jonumV85ofnGueZV30kCJQu26PmkF/crxvZVhF+APzBZOCCUZRmwXAlPZ4vd3Kbxssm4IsUGZsCh87iFEyDlzwLiP+iFVU8Ab3ot1pluJwuqd228/BGkX4zjWsCwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773874289; c=relaxed/simple;
	bh=fQuwhJb88X3QxRA2Pa9NBZdJ6EyCn/qEvLxJYwx6VHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WaWyIzkIHtRSBNh82mGbhVCJzGNjte7RbbEnwVJ4UlPDTVHzusJkJkZvqA0oq1sHlga8Xoxe0fI8SzP/X5myXvuDtppiHumFrpcV9FPoo5a91ees/7HeWdEONOB7fYI3cmTtwqDI6I3vWNYWwCkACGvbiHbuQ/9SGr2Kl0xkZPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbllbrvy; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbllbrvy"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0c955a481so49509eec.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 15:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773874288; cv=none;
        d=google.com; s=arc-20240605;
        b=DiKZna++WAUmsXlQqQ86zEOizqxi2jHgonwbTRBdkEC89QlCbjnwzgGx9SqKY8DAsJ
         gCyQO1iNhubwyyNGWJ1NzNQqN0rV8fNxKJzHWQqrPu8nN516WT8ZQY2e/UPqEYqk6zp4
         lZPTBylnbsKbMJQGtlZgIDgLp6y1pHW70ffPEyLGUNVyo0u2AoIFqY/nilcV/utWMfkf
         AUQQ+uvttHLT94B0KPWAHgJAvxwmIab7InOR37pwl16vUryCTiLKY2YIAzPqD9fMj7jg
         9p2vQ5aNU92Q6SmDDnUpH8sfxlTKRecQ/zZLcpuHRkk5HruqhiX7R40/mukPDKZieH1j
         YyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D6ELyk565H3C8iXNoZI6i9IQRJdJrHnpo7orf2brTRw=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=c4dWh9v/ePchZrEANqSksI522pJ/ye3X+km9w5M8DJHvT9pO2i1J1kxgNYcy8pB+pl
         8NLUtHmb1Vjn9gTjjxXVvpxg3zJKf9OUKUANiwT/vaGM75IkCeOhnYNcOs56dBymCbdg
         NHIG1/lLFuJWKcm3xENtQeTIk+7PQRYtCM7A7ulqYuZ8Bgy6KsW1pDgmktmY+WMm5OQ4
         vJjtXemImGW7CWyzSzlKnibf5yBxl5rofcNkcXCCS7HjISXOdZ2r3AyvkVx6FLkETnv4
         1NQ3D3LCsHkudDkAjWGRF8ApzeGlTJqysHUxWPmoHbnYIoBYd/4XtZstzo50sTujDZZo
         qJ0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773874288; x=1774479088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6ELyk565H3C8iXNoZI6i9IQRJdJrHnpo7orf2brTRw=;
        b=Pbllbrvy+U7xuCDkfv7H1VDWfIqCbjj+OVjUhsmTGh249UxDQhdmLCFIOOYDl5AZRF
         tHZoSzKAClvWBvDM34RbB0Jn2jpsB+xm019ZWCI+mYUWjCZWmZOxXBcWeSeG6JvQAqtL
         P4opbwA+QYESSgPDFAvgsKbKgyxhTFYdcAPqsF3ZHOLDMB/vfHsdb7pZVoffDXlCjaxw
         CwJYiZMVMT6YLlDhbcB76VTIh7UKTrbC37bF2hRkEUg7L4/y7NCghQ5z+Es+kYHK84W3
         J+EJwbn/xBzOyERgFApblIVXON9ujxT46HOdluyimnRmda7Pn+33Hu2a+kEjbEMw0IW/
         zRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773874288; x=1774479088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D6ELyk565H3C8iXNoZI6i9IQRJdJrHnpo7orf2brTRw=;
        b=ds3I7HZRMXCYstEBBQNY/VHmOoGB2stT2mf5Uejwxnh0RxlXkTCSINdyNDz8wiJ8td
         nyfqh0X7JuOXighVgdq634VWSZqVOaqpkDJQjyuoPKN9cPGNHzuhTwWcIARUJGk6XQMl
         Od2S/tWvTyYAir5fibQjwNkKjGlGixCqpsqeWbEQPVSFw1JJ1Jlc/6jvle8eEPMU/KW0
         vR7SSGyd7uLexFFOXe82rvi37r9d5jUcGneHXjBgkFcpi8z/CxoPtEvqRc47/l6XzQM4
         FG5D8lUDrbeIthQtNjSFzqE/vQDmnGFG37f3MsYjtElUqlOa5Yrew/v9fEMhUAU5w9OR
         00cQ==
X-Gm-Message-State: AOJu0Yx/psoaBn5D3CRobim70CJ6Bixhne0awnK/994+nMjgVfLqFlGp
	TR1BMyJPsQNEzgdEqrWlmnYiuopxPxj5QsBfB/Pk1Dcrck6j/S95ma1OpwUgAISvfp+98rmPNGA
	3cSfZn1YSqT92eOxP5fO/qV78HgA5CGU=
X-Gm-Gg: ATEYQzzbHgwwWPL6tODjCOfxQkXnrG7B05O5jSJD4YUTr7LNwes3vZXUhjNfDHSeF5/
	PEd0Je2Dpi+zMY5MWCSebfuYs8kFM4MFyG9NT7N00L1bm0NMyaxzfDc9QnA6JUhxCbKea7kM2f3
	CnVg3I+bMd1ycE9QJYLLXbgdIVHHB4Wfyl5/7+qINV10PFDYNcSZ4sW88BBvYjak2gpLb0I9pPb
	o2OOFjr0e5Z2Hv1Udj1SGxN3dT8rNnEaE1TmEMANBhWGid6Mvt5r5amDZOZ/dJkyBzzJiRXdVvQ
	h3oUc39X
X-Received: by 2002:a05:7022:492:b0:128:d6c3:9b23 with SMTP id
 a92af1059eb24-129a70e0b6emr3159941c88.14.1773874287388; Wed, 18 Mar 2026
 15:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317135548.239746-1-mshdevv@gmail.com> <2026031855-spoon-uncrown-4090@gregkh>
In-Reply-To: <2026031855-spoon-uncrown-4090@gregkh>
From: Marco Solis <mshdevv@gmail.com>
Date: Wed, 18 Mar 2026 16:51:16 -0600
X-Gm-Features: AaiRm534gedtx3qb6YknQ1H37roYcrtZWwm0WiZSRSKPJnOu46sbY7SpzWC0EQI
Message-ID: <CALqSz8OKoYTEQg_6QrHQzMP6eSWjP_KOqzMuoXbSQDcSg3mWAA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: collapse duplicate goto exit conditions
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 9:54=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> Someone sent this _right_ before you did:
>         https://lore.kernel.org/r/20260317100723.72476-1-giacomodiclerico=
@gmail.com
>
> Are you all working on this together?  What project is asking you to
> send patches for this driver?
>
> thanks,
>
> greg k-h

Hi Greg,

No, I am not working with Giacomo or part of any organized project.
I'm an independent developer working on my own to improve my systems
engineering skills and contribute to the kernel.

Since Giacomo's patch was sent first, please feel free to drop mine.
I'll focus on fixing some checkpatch.pl false positives as Dan
Carpenter suggested in another thread.

Thanks for your time,

Marco Solis
