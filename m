Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5D3126BF
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772390792; cv=none; b=q1H1s6AP/vyws+H6X23pvEdNZnBK46mBRsUXMVZ6oWh9o5wmLxVd0/C6D4QjWuiRYVH9bJIZRfDQ/27zBIOOK0fNE9U1mkSYOeYiKY1ALwN3hqCkc/6Zx5rpUWEWWoqUBVQTfjn6EKRFvL6D0MQ2AxYaurbjZsEp0uUzNwoI9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772390792; c=relaxed/simple;
	bh=MTSnEjpYR8vM4akW7ZXa+rMykxXSDF2v8uHHBxzI11g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hi4V6b7nNUOhDtk56s8+ogJzZ4/l20U+yDPHNcylK/nq9XgoCMMsKaiFDBIL4/ti3QoF/y0yBcdDlBqqJsRrt1Ja5/oo+0LDXw7rnYRHtqOWx4yHq3j+Ymtmjn9jo8Ye+UsUDYvShvh6abH8kxlMZISO/FGwlTJnVsdOrc5890Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UElSMKlO; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UElSMKlO"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-793fdbb8d3aso43577587b3.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 10:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772390790; x=1772995590; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTSnEjpYR8vM4akW7ZXa+rMykxXSDF2v8uHHBxzI11g=;
        b=UElSMKlOfAWqCyMUeiQMYq9FT5zGa5hgGhXJsCbJsSgskpVzhZGEr+alSkKspmA5Z6
         QS0JaJ1iOUuNbvZvgTR1QlEzKj0b1Bwf9k8ROZ9xCKThlAIecn3+LCxqJ2ex7ElPFFiO
         F+1Auue06ct/iJ3Ji4yKyKxvllEqvgj960RupFrW5nqxsF3LxhScKNMS9q23IyyT8Ihm
         VkAEgXT65Xw6j/JTEoHU48p5AbkD//C+hagDh3LNHq2S6PzMpHp6wZ7P6vgA1Rs2euge
         k0JrzohzTrDTe9Lj5KHayqnEXXP2PLwsy6ae1jAh08RHiLglft49nEp3oR/4HaVuL/CL
         H5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772390790; x=1772995590;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTSnEjpYR8vM4akW7ZXa+rMykxXSDF2v8uHHBxzI11g=;
        b=kFZ3yb93ktkP9xaQKGPPtGfDKTbzQ6o0heW3gacPc97TLZI2Sb92yYT/PvCbpc4fCr
         ppBhCPMwAXxzETEv+cmzXqTJbqAERWP02OPhLB1DP8/4eigRuUOEFvPf5pbXC61IVRn+
         axJuqU4YiiW0zmWYjFb5F7FcGPw2+/Fqz0vDNpaIymNnXasmqaQW9HhxmNr1LYW9tVIw
         CRKvluSwTTLHGaYAkGLu1Xrnih/Kpyi8ON7PXALZqsjWF9A4yWP30bMoNws/Yb5uMc7g
         AFkoOrPn3d6vJzwToEw49N0CrG04d/fMcykzTPw9qF7+o8WGUJHuKUqTbc4dxP1yE5Sj
         U4mg==
X-Forwarded-Encrypted: i=1; AJvYcCWBGwnii2nnaQBYwZpSG6LRQdQNCD7VsX93yNrxxfXo3QpZLIipCAttR7mPg0iAPZtqhBrWKcCtGW7EI42/@lists.linux.dev
X-Gm-Message-State: AOJu0YzM+Ef0W+3o/h5UB1tDkWQEPlrRx6PqCLtZ39ilDt9sOftGBHR/
	owitW3R/aNUU47J+huOhzZcarjwvh3vPr2WteMLO3hTTUZvIoDAy55Yy
X-Gm-Gg: ATEYQzzgx1keWiG7+dulVAvv/upZCr7RFcU9hn1BGJyo//4UA7IqJRHk7MSN/79u1pA
	GzLQNwsNXKetqA3ZokDrwDO2S+oB8YjSuHYfWb2DOgpNhXFwcqjB+DxAWeTxCCPN6h4vfxNboIx
	H7w2OVLbn69Tf+6te62/siZwlO2Q5gifhgC92VyoZiWzya553Ji+coeBbud0ZGyvRGm5o7KBZiP
	SDlu6dte+GBNdCkQiIghpmIaSJ51Gq1F4o5/iZtpb7m8dZ3u5/YY5h+Z1J8kOH7j0pCav33trc+
	NE9OZuAIFIl4eC4wyZFgGqXLwSROLQlHXqEcjJtXecP5yuNM+9ePIGzgdrhc9qSTASuVOJoacDO
	X9GZCC1uEGunspNg3hl4nevFUJA5IYSz3y7E7KPiRrQvoudVywTw3tREbwOGAIFYnQJJM4WIc/h
	dpeRe82dGo32IlvzZBMP3zn5qYDgktcQQTQJLQ/tYmQkUz4VXrVPp4M3QYXkpKWpJjI8J7LWj4R
	MdoakPjYAt7y8Nu5NrlYlP4OUpq9McQ
X-Received: by 2002:a05:690e:4248:b0:64a:dc80:c256 with SMTP id 956f58d0204a3-64cc20cae24mr6365740d50.26.1772390790103;
        Sun, 01 Mar 2026 10:46:30 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7572340sm4828591d50.1.2026.03.01.10.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 10:46:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 12:46:11 -0600
Message-Id: <DGRO3C3JVCRK.N84RA9RCVOXS@gmail.com>
Cc: "Ovidiu Panait" <ovidiu.panait.oss@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Josh Law"
 <objecting@objecting.org>
Subject: Re: [PATCH 1/4] staging: axis-fifo: fix grammar in Kconfig help
 text
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Josh Law" <hlcj1234567@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301155318.2596519-1-objecting@objecting.org>
In-Reply-To: <20260301155318.2596519-1-objecting@objecting.org>

On Sun Mar 1, 2026 at 9:53 AM CST, Josh Law wrote:
> Use 'an' instead of 'a' before 'AXI' since it begins with a vowel sound.
>
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---

Your email client isn't setup correctly. :(

WARNING: From:/Signed-off-by: email address mismatch:=20
'From: Josh Law <hlcj1234567@gmail.com>' !=3D 'Signed-off-by: Josh Law <obj=
ecting@objecting.org>'

Thanks,

ET
