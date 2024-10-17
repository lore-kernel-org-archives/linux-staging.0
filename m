Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051FB1D88C2
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157377; cv=none; b=XjpAn7CtYl+NKsv+scpD8qOuY9xw/vPkqwwRRj4hCUlhpqm0qiKRkIiNOp3XOV6JVWaccaxKGv8UX37wg+AFbuUJZ3uSma8j7IB1tvXYdpqzbKf88k9whLyVZIHwhiXmYmccke9ZL6DLFjLqIF8c55wgXSNKgclcAKwFA6g4IkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157377; c=relaxed/simple;
	bh=2BwbOLLmrev0DEkdKU/J1Uf9cnFyU/EArcl5PfVyQqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddWtExtjvKVEEAY/T83HT7pUZTWMeHss5a4Z/hGkl0jJROlRN/6lCKJDdjrKHq7QB94RMF9ovS8ITyaO4A1b/kVUpJRNVkkqlWoToqmk1C7w1zdTs6curO1kAcGaVJTk9uFwfaksdF/QLAQkZTLrYmM5RuLruOEk8HEmkBq9bpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=JP9sYS4E; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="JP9sYS4E"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c94b0b466cso859238a12.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729157372; x=1729762172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qKzlhjU/lCm02BVIQEq56igyc/HvbAaIKSc/+Cfz6E=;
        b=JP9sYS4EB5vy4wpNQZriNXoTbdoanh8Gj7yzaHsv8FXiMLw58IS25oMmhMharbJuaG
         4DOIhDxu4b/l7RJWNj2hbpp/4wc1BRTMkUVw0Rh6WgicFux6rPl2i6jptqkHB47N4sTN
         zriP+VPnzo3+tXdc4kz5UT5u3NYErVRe6HkNZFJ4v2c0PU7iaOsCqcsD3vyEH/AYw+6a
         T1cLTHu/OARlTsdcrSQBDXWILTO56Uv3gDaCbQ1xFbNYCzE6Dodnx5pmuN+0m+WLxa+c
         kbdWvRVwJcccjgr2yLYBgZzDKIayColIftsybMglFYbJA/agpKoMeKRcrhsn9R29CNxn
         PIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157372; x=1729762172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qKzlhjU/lCm02BVIQEq56igyc/HvbAaIKSc/+Cfz6E=;
        b=POxlUp5vFJ7zNS3ZTLZ3+8yq6gOudaU91nGRSkpt90KlLuUCsMczYf8xximVruX0S0
         sChXcbgcGv4rfFuGOVwE0Jqz5oywh+zc5mYb/Z3SwSHE7fZxB9LjuiKgxtDLzRZ4Wtuk
         LbdL5+KICCCBV6g/2k3VzNOElKz3HUaiIzyYdy7lKy+RpKp65ep54b3KXWSnbC20SOch
         NiYS+ixL/+cgr6sO+NaGEsyLt4fXr7GhJ83uQQEwc6hsPxHTsflT6kSRRdcWJtBxqsth
         yy1RE3W5+Inwf0LBpyMHiARO4wqms/MCr0WZzSCIMzHA8C4UVu8nM8LjFwiMNy+TFJnG
         b6tg==
X-Forwarded-Encrypted: i=1; AJvYcCVlpLKOBjz8dqV8zms9oZV57jTdEpyqJS4OP/qBa4G6iAnRfVZTYop9caXdY6cYeJZcwZhIsd92TtGUgnWz@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrd/eT2WIaY5OUh6uGRBXSRjX9XjqpoZ9tt3dPM3URut/0I8HV
	WjZAKuyggz52bnDU2a5m8WdYEDmiqXjt8odiH1sikcpS6NUH+xLKIcYKl5oJfnMM2owpYLqLoAK
	fohgeNE/JHumi8+9TnT2DzSkvLQ8eemdGRGJUOQ==
X-Google-Smtp-Source: AGHT+IHQuIrk6tkwFaRZW8HCE+De7KpmbbPUN1UvWoHF8GYLJXLjUh6P69bytRBvqyiyWXA8doMSnNZ99QI2wlrM+x4=
X-Received: by 2002:a05:6402:321c:b0:5c9:9bed:a5cd with SMTP id
 4fb4d7f45d1cf-5c99beda6d4mr3438038a12.34.1729157372138; Thu, 17 Oct 2024
 02:29:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <912561b9-e446-42e8-8922-9e8952355c79@stanley.mountain>
In-Reply-To: <912561b9-e446-42e8-8922-9e8952355c79@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Thu, 17 Oct 2024 03:29:21 -0600
Message-ID: <CAEO-vhF0NWB4J+WFu_c7Nn9tu_kYzAvNeFgLrLKc_Lk5DD51hQ@mail.gmail.com>
Subject: Re: other staging/gpib bugs completed
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, dpenkler@gmail.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:20=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Keep up the good work, Everest.  Here are some other bugs you could fix i=
f you
> want.
Thank you for all your feedback and help. I am learning a lot :)
I will look into these and try my best to fix them and send patches.
> drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_=
attach() warn: inconsistent returns '&agilent_82357a_hotplug_lock'.
> drivers/staging/gpib/common/gpib_os.c:889 board_type_ioctl() warn: maybe =
return -EFAULT instead of the bytes remaining?
> drivers/staging/gpib/common/iblib.c:242 ibonline() warn: assigning IS_ERR=
()
> drivers/staging/gpib/common/iblib.c:505 ibsad() warn: AAA no lower bound =
on 'addr' rl=3D's32min-30'
> drivers/staging/gpib/eastwood/fluke_gpib.c:592 fluke_dma_read() error: NU=
LL dereference inside function 'dma_unmap_single_attrs((0), bus_address, le=
ngth, 2, 0)()'. '0' '(0)' 17 9
> drivers/staging/gpib/eastwood/fluke_gpib.c:592 fluke_dma_read() error: NU=
LL dereference inside function (pos=3D17)
> drivers/staging/gpib/eastwood/fluke_gpib.c:949 fluke_init() warn: was hex=
adecimal intended '10'
> (perhaps intentional?  Just leave it if so.)
> drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn: incons=
istent returns '&ni_priv->addressed_transfer_lock'.
> drivers/staging/gpib/ni_usb/ni_usb_gpib.c:1103 ni_usb_request_system_cont=
rol() error: uninitialized symbol 'ibsta'.
> (this last bug is tricky to spot.)
>
> regards,
> dan carpenter
>
>
Thanks,
Everest K.C.
