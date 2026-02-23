Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214933F39E
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871000; cv=none; b=HPrwM2WGlL50mZ9GhXj57Nu1mjXPdoJJGNbS2cBhEPF6YY78cQwYY7qIJ+hOeBJx1i5hPzK1WUvM2hz2X+zMhrKxebsesCvNRnqFraw/C+rq68kS/waOlw/PHBf3QPWbOMJa5pJtQ7/uAkB3NJ+90gH5cbaP6hpSnHuuQcRxafc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871000; c=relaxed/simple;
	bh=xdTK4o7H/wxKQv/4fqgc/mS3U1aw6G0dXDIixxI3w/w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=SSLW9PcueY+J7gVM3R+fykpS5hZljn4+4ECBhDH35lToGA0xkDgMa+H6sRsWR8qE0Mx/HwY1dI+R9ItHe95tsvPZugexlc2MblYbdTZKhcqLbiuBD6BsdjFSZpIAESkQIGJcO3+3YF2dvk0IeDxZ8cNgmbhLKmaQqjhSomQ8LS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHCZAuXi; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHCZAuXi"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79827d28fc4so21651597b3.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 10:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771870996; x=1772475796; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdTK4o7H/wxKQv/4fqgc/mS3U1aw6G0dXDIixxI3w/w=;
        b=hHCZAuXiYWfYNl3cJP3F7dvq0wNaXoOdeN8yRvm4oGiSd6VGveZmTe/Tic8R6TYNvD
         46S6bvXvUZl8oMuV8wjoKH8bwBTFEai2Qi7sbITyB7SlNxy149/vTYlGuQ8pxaKe+AB8
         UVXxaa2X1U7ntV0S/CouGXH75DSCZTQl6EGQbsxE+M2MUKZ3kkB6YE+M3DGmCOFB7REA
         QFuoG9UCC4PpD3zrfqucxwOokYYlGeFyZslGSor1pVo1eacu5tG3oB2CSEzIczAiYm2K
         XgZ/lfO5IuELFFNobXk1ckm9F/OugmAL370VFxizV18zBlPAFfUbvwPpC05x3rygtWT3
         vnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870996; x=1772475796;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdTK4o7H/wxKQv/4fqgc/mS3U1aw6G0dXDIixxI3w/w=;
        b=pzEgTXNlGiQq4VFTa9BQrsGMbN3lwXbAxKTJt/1/tWOfiTjBjKsU+ys++87/yvtOXV
         7QRmTMSmExd6wixSErkQWCXxWGDNPZy4GL6FQ7gzSeB6B57QW0qeFEbDBYD4o6mAhfwd
         ObGh1LesaxZvTM2af8OOshmmXkD2w8XUP6bVv0+Z1JK24Isud1o6f4VGrcJaDPcWeGSq
         6qkXUlIG2lNlMbFHiC3tgSB/p4o5v2+/ItDNaUkQ8TXpQ0ua3umokIDd3x/l/+mmjG+M
         AaybxyENSeldr5Xr1FL9jeo/X9HFYwQliMxowS5lZlDBwM7/gSNmVavpdLzfEvLWb9A1
         Sk5g==
X-Forwarded-Encrypted: i=1; AJvYcCX6vx8hzz14QJBp7fzNLV+bjirEcacSRMed6MzpcTPkUczafvJkc9KVZVGp/5GUz8RWkNzKECoHEAFIx8GM@lists.linux.dev
X-Gm-Message-State: AOJu0YxUKF1d+W0hAMl1+8gy9hXNBbVPzaTXu9myuC1Va1f+/BZrfVF1
	gfjKdALSZQZb+nkVuoPteJiINGgqB2+ggLZMHjwvXKdK2Npv6iniq+GJ
X-Gm-Gg: ATEYQzw7ph3+H7bc34v4Qe9RBviEd34pIfHKceM6tnknp2WEjVezUN7+b0a4MG96r0k
	aSlU2RxNUrNihYN6m765vY0w0dyaswpu3l9FL3zWeis4QUlDGgzG/kdxAeq7APlZE/vH5EzCwke
	ifqwxRfNkdZVU7e3MyXGPN1J9dgrSZieyJUUKRKvX08mDw0hCeTenWhaH2kAZmZA7g1xxiZ/2/s
	Wb5CTZcGQSBf9lqE6j678WDt9LHHgqYhaZamGs5aZVqUgfkacLTuVcB4Lx8rungSK9yAHSW6a7H
	ammz0AaUou9ifN1JYIYVzG06SAOU0gC/w1TUgniqbKU3KssE4E7AV7tVWUvEHk702LkQeTtPXbg
	WgeoNTQHX80PF5xVKoEkcT7PziM/ceO8yei4n2qCW6TyNcg/g59/u61FbbIre4ktdab6AedkukQ
	Dlohqi3HykrNjqZP/gQvvenfV+7hz3oIn1PKxzmGzG2qyU50C4LBAzVS9v3E6e1nwajI73B2xS2
	WFg4W+P2Sn0Lmib2TEfLnEGgwm7P6Q3
X-Received: by 2002:a05:690c:c4f6:b0:798:27d2:867e with SMTP id 00721157ae682-7982916261fmr77282937b3.66.1771870995901;
        Mon, 23 Feb 2026 10:23:15 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982dd81f73sm35265797b3.25.2026.02.23.10.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 10:23:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 12:22:58 -0600
Message-Id: <DGMJUA3D0S3A.5U8RWR6AP7TR@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Mariyam Shahid" <mariyam.shahid135@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <dan.carpenter@linaro.org>, <ethantidmore06@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Replace comparison to false with !
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223170708.9627-1-mariyam.shahid135@gmail.com>
In-Reply-To: <20260223170708.9627-1-mariyam.shahid135@gmail.com>

On Mon Feb 23, 2026 at 11:07 AM CST, Mariyam Shahid wrote:
> Replace comparisons to false with their logical negation
> to fix checkpatch warnings.
>
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
