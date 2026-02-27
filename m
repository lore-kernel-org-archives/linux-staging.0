Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4FA3603D1
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177147; cv=pass; b=r0cUpmAjmOXueJj4rBqKtF0mC0jdHSXMw4hNKVQtWDHy6zKpEL4FddjzqbnZU4BHS9JrnPta7o5AkZf8eS6UIrXDvXWl6ivn/34s7GOVhaM7SXxMn+GvWx3uaFF6hpsvRITWEHCk0VyoMWPFIIFKZJLAQc74cU1glGi2r5iDgQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177147; c=relaxed/simple;
	bh=w4aS0ZcywOQQMABOyIZesYIXGhD2FPImJ5TqibCNsI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uP6vaGQ+odiNtb6W0ZqPdAEACLPBjplhXkiRfxSPcqdpXOKp4M6S3hgi9IARyIRAJLmEBsatW8HrqrvoQNBhAA51SH/rHu0kAqN3QYbDyuJ+9/L910is8QwNO5rBwcBvudCwqKd4F3Y7rjmidssF+eNle1Dwuy2zcYesrfrKmbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C44srpIF; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C44srpIF"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-797ab169454so16536707b3.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 23:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772177146; cv=none;
        d=google.com; s=arc-20240605;
        b=LuL++jWLoEYo68B5PszfoWUNdIW+KsTUwzFMh5f1IGdNi+PuelWWtqQZfobIczVSfY
         k2qmk7/F9buWvhfqyLb3LricM/QNwnayJobzjBtjvY6gxnZxvmNPAhi9EQXlHQyDDINX
         Ax808qah9Yv2xFTG4L8CK60qLOyXBT7mHD7Bl5DiAKVCU424BAkvgJdjWIwWOkYpTOuU
         8Y/JPyP1JpVWSE20l1tUcauBw6VdSrThI4Zb3oEXwyrMtYartbX9juqI50I/RdUVP4FF
         XGK1UKmMS80BSmHH2dRQ4Ce2nJ+NJ8FNDwFtnuFtWK45WFClP+N9v2ol0iIKL8pPlQEG
         M9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w4aS0ZcywOQQMABOyIZesYIXGhD2FPImJ5TqibCNsI0=;
        fh=w5czFjrd9kRW3JyfN6FWdVPrQMkpV812Axn1GfEvSe0=;
        b=PypuC4NN80BtAGNdIfaqNxqQJDzUm5MycHY74UEaUf/l02g8v+PmQ+ClW6AwmP6OZD
         kLe0yABWIlcKCTQpN41+YyqJ8o8P/GacOPWiS8jZZL+2TlQguPgR3+zqWIelKv0hj1Rm
         groxOb3lyLwTLMZvO1adju3sQ9LxbSvvprHTx33G4is/VqTcsm7/x7tohi+MdeS9FEHw
         ObauK5sfBoWj2LV2/keApLbEOwqxEoGlxiQ4sqpguBchYG3bVIMCUNUZ0UleNt4Pz/eP
         9dY5UZ45onYudfYip5qO+TKaIJugPNPLcCV4QMLXG3WK2fh806Y80CCzdBDhSD9/p4Th
         YoAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772177146; x=1772781946; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w4aS0ZcywOQQMABOyIZesYIXGhD2FPImJ5TqibCNsI0=;
        b=C44srpIFkPcc/bNvB6HRqDvx0aKDqmC4CQjzF72Nuf2mWyIziXAMBCX24ZYQMteGy0
         BuT9n0YkRZnFekG717ksBVhNN3HB6VMy9XQ6ebFJcascrABQgdySqcMn9TJISEm67tNT
         ueaOgBab6IsQFCjGykq9KPjMXd6avlx57F5Pun7t1THJVXpGZ1tbxMUXOU422WplVeIy
         2TbERJcR5GBTE5AcpRmGzQblLuOrxvCFEurDa6hW7PuXxz13UY5tPU0+t5fqu2Oo/uBL
         wfGlGetZyyPcwe5qG47KdguXdUFqZ9a9r8kPDI9/DwnCgg8XprLKYzFqmPTgozQkqwY4
         +AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772177146; x=1772781946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4aS0ZcywOQQMABOyIZesYIXGhD2FPImJ5TqibCNsI0=;
        b=k4NHlZmvu7ofkgoZMU/qCFElSL6NLm+mAoZwh9YhNCnSaGLJ0IIK5HeWidkM9a0fML
         zhoQ2cEVDzky9kjUeu7UoWO4onRwQP0fNJwWR59rsMTqhtbeIorH75dgHe2s0+emqWbT
         POykRgQk8vlvNQZK8pubq5iBHV2U6r1fqseDvq6TrLagDJn4GmrXEZjn/su5n4YV1IL+
         Soe+s4vzONfSGXT5LLHAXUEON2x+k7s1TtsrnQkoX3Rb5fRqTDFZK5gBdnRk0AGNYOaz
         ph03zOfxg1gPsIYJSS8lsu5oIrOQ35TParRE2UPblLvpMBPOuJfJhQB1xcMQ1nyRkGo7
         Pj9w==
X-Forwarded-Encrypted: i=1; AJvYcCXn32MbxVK0aiDRKh6i2HMz+ZFPboD7iw6P5FHJnaLzLDI6H23WfimB160GpFO83+DntSBJnNuZc6+dTxc/@lists.linux.dev
X-Gm-Message-State: AOJu0YxSI7+eQiz69bUZ4DNVIPR+g1z82KtNkHoWolHEMjkkgzCnv0MP
	8ccLcIjLqU7gnJ6LFfmho7wRQ9ylUDZA55/81fzvPRY6DeVsCJDAcwP6S8Ubp1eB+Qxls6s/Gag
	m/+UWBGeRi+F0qRE36aoqc+vinOCu3Ks=
X-Gm-Gg: ATEYQzwm90rlqutYT4LUbroY3UdSxQolMmUEVKBVa/+e0DY4O+HiQCDisn/rDMmwZTB
	zN8Fw3VlVoPeKvajQTaHpEjFPrKSYDiSO6rG8/E7KxB5KXuDqbDw9D1Bfw4nOvUrg4XZMhanCs6
	uyAeEAkZuKEuOzsUygK9Q3WSQo1j7bJ8vZTjRe5/v38jaMiZthDz04tIUcltLdSg0QnJ3jVGXnT
	UWVyvoRqsdayvFaiZdEHEsbMjEE3X8U30CMzDYPOL67ee3+raAX7e63bBIDSsxO4PDNTCs0tGF0
	uWpopaOIP1Q=
X-Received: by 2002:a05:690c:30e:b0:796:2dfb:4af0 with SMTP id
 00721157ae682-798854ac1e0mr17428417b3.10.1772177145839; Thu, 26 Feb 2026
 23:25:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226103120.32230-1-mariyam.shahid135@gmail.com> <aaAlxYSqSaHtIDIq@stanley.mountain>
In-Reply-To: <aaAlxYSqSaHtIDIq@stanley.mountain>
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
Date: Fri, 27 Feb 2026 12:25:34 +0500
X-Gm-Features: AaiRm53l0JLnRyr0ghu_6CaoAC2pvBVklAHD97uzau8ECvpcEp9CF-N7ySevmQo
Message-ID: <CANhxO_ibdGp0GFd8RTpzPH=Wg1GhPe0BPGc=MkPXY6Z2r1zk7g@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Wrap long comments to fit line length
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Feb 2026, 15:51 Dan Carpenter, <dan.carpenter@linaro.org> wrote:
>
> On Thu, Feb 26, 2026 at 03:31:20PM +0500, Mariyam Shahid wrote:
> > Wrap comments exceeding 100 columns across multiple lines
> > to fix checkpatch warnings.
> >
>
> Not even one of these changes has to do with the 100 character limit.
> Please, split them up so you fix one type of warning per patch.
>
> regards,
> dan carpenter
>

Thank you for the review. I will split the patches and fix the commit
message in v2.
regards,
Mariyam Shahid
