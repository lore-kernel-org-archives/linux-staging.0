Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A69737B41B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448075; cv=pass; b=At0nDbmCwnivceXFCYN90AvR8taZs1JEAx8Bv2W9BAOSLTJ+/1pkbLvK5fPzn7/agcEooh/SZTqDD3ZbQbx79BT5IQt/KhPuETT6uRWm380zFYkV5lGjmfM4ZJNt0YuuQoKArVZoTwMSPbeJbUaDJrTyFXhZsVdO6k4ZxDMcy6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448075; c=relaxed/simple;
	bh=mRqH6Ek3y43nF1Dmwi5BJEBjG5UGgqF7TA0tuT0IpUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVtSVqNKXqL5shffOi9JQ1RbY6FI5pPuTNRZsJ/S4LybCU97y8+G4Lht/jRA2HjVoFjD4yf1hlLnZUTMK3xVeBOF0CoFuKS9lFZ5dVinejLtuZI4mh6yut5FO4lEeUMa3yki2cmZoKdEts+EaPnYzYAgS1vzjunNuizKRIg5Y/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvJRWRqJ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvJRWRqJ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69e54d9c8c6so705101a12.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 01:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784448072; cv=none;
        d=google.com; s=arc-20260327;
        b=Jy8iRq0pVDNBJzBKQ6kvOdSzKwKgxlz4ryfZuhdCRzhTlWPl35nRfJXaL2azyka4sQ
         FU7+maEYmk+dw6o5xi+KukmhN7BSof+RBvpYabpAiGcyOU7hiSf3bpqrlRt7q1tJjzy9
         a0lcr8Ei83+ZI0AgPYWdGBKH3Y8+M2Qq0Rhx4lY6BoCab6njFW3cvbzvXNjLfkMsnTQR
         96zJrGxMJcYEFQ1ZWRde27rPf65khBu5+jdyAjxO2ck1NWyFwHX7vJg5tqalfdizyYr9
         R2CnqRmYZPKmP2lvve7qWqOhDgdZj2xkekvBOB+OENDjGh5oH4WJoqxnjh2exnnzyzku
         SGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRqH6Ek3y43nF1Dmwi5BJEBjG5UGgqF7TA0tuT0IpUI=;
        fh=0pKp/9bY11fdRv6a0PPuABsrtx4URYey/bMYOrXD51M=;
        b=nQYa/32Q1yvm80GT+2kmGm5T0YcFMKWEbWVQcSRlv0Jf0REOGINluqkVjDkpe4PRys
         EuMTXBjQPSyOweYbBJ0oVZS2N2YHIGFk3EhBBUrGHTy5fmscSvg5lq5YdFx48oAWj8Y0
         3et0IF8rvOF5iSjQ6mua90q3E8TBeU4pzyCvlXO6GsJsJIqJm2Z7G5CsQXcYFNph0oKX
         htl4uOmELy1eKK1lTdBLHTDp8udL1dHoMR7/VOCBYmN8bU6sykta9nS09yFH3oKSy1L3
         bve6AboYqPxI0sqn/js51RO1C/CJZfv8LXwnMCsHPZlNoDk/OZosRoRTv/Pn/3vL1QBK
         82Jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784448072; x=1785052872; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRqH6Ek3y43nF1Dmwi5BJEBjG5UGgqF7TA0tuT0IpUI=;
        b=cvJRWRqJ3ccYUWTj1H8SU17LOrQ/N4kbt/OMqf2/pokQWBukJ7jfdqQc9G0ETw+Xby
         w876CnFCYH4uJO45TkmmQaruEs8VQEqF9umNMPatzg/gJHCNP48TiR+BAzXbpPAE3bbd
         fZrY+Y/AjyfBKX5yrdjyIu1a5Hi6o3GCEHxLHh4nxGf2cbXLF4Qfg/oGxckRytJRaCH5
         sp1WKAUDpWKMfDlRGZPB0OWkv5h0YhSvUBk9tgXG0TfCuCR2bj7Ddayo6BPAKXWUIyFc
         YfhTkM6Wv+0YqACXUfrTTU04HCGuXouD5oii+3P7xOv4uAa6VTgnxtnKHVhVuO9ak1FF
         u/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784448072; x=1785052872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRqH6Ek3y43nF1Dmwi5BJEBjG5UGgqF7TA0tuT0IpUI=;
        b=WC1fVIdNYF58tp/zovEot9z11wWqFBjmQjRDdDlDKDcrZriwbGWJMml/4zc466Ek/0
         sEM5nJSjtZLsSytopNHudBTgOWZ77gR0+mvsshvJ6+1lMPl+I+8nBGEa9ywBBpvEvLnD
         CZyj/fxthYJlqH1+xu1C8ZUV2qFhmij1FM1E9CFDsPOze5bU76mbBKEuCsuR5HhB1zSo
         e6yb06tN04G83Sr1urdLzHqDbi5zHmgPxt4U9x099z7ZBkrXKxqAuI6lVwskG0cn7NBz
         ekn+kz/SYj2vb32T2ecEp6kvuGxvAoGG8LUbg7r4/SzA5KRQK2oxF5EqIK7ldZ2axbzb
         kF1g==
X-Forwarded-Encrypted: i=1; AHgh+RpkqCJBN/x2b7Cc+VXe9H3cT4sy/fOmbOCre3I7I65rXlfNBjC54gSzIFewYkq5v6g/R6OCStN/NJr8x0fY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5rL++qxfjje7mRPZLkOLoEGX+f7lS8DFwO7qbCowOfCe1fG0c
	wYk73sX43/S8pvxN+WTB/OSBTvGr7V7T+qLxsfpg8xxLg5nQ001YcJoeCzmmSv8VPGN/qf1B9hC
	5IiglRT7oXx5cHDtbdlpt2wbrMM1j7Rk=
X-Gm-Gg: AfdE7ckmQzsv87jcO92+qQHbBCkiJKfrAXuZt+MgleTOkdnsLlZAu/nLObExxNFVQ50
	ahVTnt/N2WB16Ws7b2Gk4jc2/t4vz4VTNHGgZ3gZ26Pi2r3RAb2AGHxJFLGwkuszktLUsU33lY6
	JQWBKs46XjEYMD21X6epBPWqG5sUFWNFr7JytrKE7Xz/nG46wHNnu45aNMiY0gcHhqhcq9s5huy
	09AP0eFqPBI+cVBM9K/QG4rKVLQByLJAz/WwSfl+wjV9+EkKvSbozXaKldCSR9eCQG+ZQ50kFpq
	a9ALNMciX7iyHoucAMym90+rnqAFr6CVIbiugIfJX2oPQgK8j97VXl3uhaiD9dAiPTbzPoXalMk
	RvViO3XKOL2ch7C74UAV6pQ0SH/X5i7FHe7R489rFmPl/uvYqneQ6f3qN1Q==
X-Received: by 2002:a17:907:741:b0:c14:816a:156a with SMTP id
 a640c23a62f3a-c16b476855fmr384738266b.43.1784448072255; Sun, 19 Jul 2026
 01:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a5bc4a7.f1c1923d.2d2b59.05d9@mx.google.com>
In-Reply-To: <6a5bc4a7.f1c1923d.2d2b59.05d9@mx.google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 11:00:36 +0300
X-Gm-Features: AUfX_myg58yoFCRBGSgVX-lgudzYthoirm_XN3vbryoytwu4PunHn8W5YCPfrL8
Message-ID: <CAHp75VczCz8_=g8-is=gq+fkzcGbtf5Co1J7wH=M3+nkKzqo9g@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix checkpatch errors in fbtft-bus.c
To: Shivesh <chanelshivesh@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 9:23=E2=80=AFPM Shivesh <chanelshivesh@gmail.com> w=
rote:
>
> From 7e9684b26176644bc92c2285acc7444f3f7ddb4d Mon Sep 17 00:00:00 2001
> From: Shivesh <chanelshivesh@gmail.com>
> Date: Sat, 18 Jul 2026 18:08:04 +0000
> Subject: [PATCH] staging: fbtft: fix checkpatch errors in fbtft-bus.c
>
> Fix space-related checkpatch errors in macro invocations. When the
> modifier argument is empty, remove the trailing comma to avoid
> 'space required after comma' and 'space prohibited before close
> parenthesis' conflicting errors.

Format of the sending the patch is wrong, and you even haven't
compiled the code. NAK.


--=20
With Best Regards,
Andy Shevchenko
