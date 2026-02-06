Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4598723D7E3
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770405751; cv=none; b=c0UkJNiUmeSrvpBEU8MaBR3wd1OmYhGUW3t+osg7m2TtpVbJYoCH1g3mlxNjnY0HOS71b88xa/+qmxzBGtwZi5rDJs2sLoKTysvoJh9ss/A9SlP/OLEM3zaPhnafjqJdObkovqWIRypxFjHo4pB7gOWNIxKWQiS5Eewqx1neVmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770405751; c=relaxed/simple;
	bh=lVFGqBNgsfHYobOC+v3FUEHBJqEfcqvjR/qOU96Rozs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tgFjd8cEVW5G4KAX3hURxiZwUbyH2oZxTlqV0h3bcpYmGKx9tKaBm9J46IVNoK1GwjbgXFsXeAJ41XcRMIT5wA0wsX7zN/1YTHYmL8p7pE/JyNzwm4OC6RJbilnhf2qIxjf/FS3cSDdZd3zBiw0Z0UZmnf18riO7C7UsJvPysO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZeIEbip; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZeIEbip"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f171cb842so1698467b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 11:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770405750; x=1771010550; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVFGqBNgsfHYobOC+v3FUEHBJqEfcqvjR/qOU96Rozs=;
        b=gZeIEbip0rActnmpJN0l6klTJTqdXPdaiCzZ0o9BOA/fWO7g4bXH7X1+WeWKGhQB4/
         xb729T4PaGAkUwp/tWYUbxIefsCgS0iSJ122DVK6WKh/4dXO+6DlNFqz3TlP08ywXAwO
         A8Si4K3IHGQwVg3BP8WycbUDg2E58tXNTHHSElKrdLQmVztS0/9HjxQludDv9o0jc/sK
         JlkYK0lN2XlLjPDoquzi2GDyhXYFNZGJBd+HkFDWoTGYf3ZzH8jLAUr1tNii/xaVx0dY
         tXzG/fqoow3ODJz9m9ttbT6ZMMPwU097zTKT9aSQxLLy7rW2/hg4uU1h9lzHL2hU9t9z
         M0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770405750; x=1771010550;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVFGqBNgsfHYobOC+v3FUEHBJqEfcqvjR/qOU96Rozs=;
        b=VInqj8p3urXqkFkHE6/ZRmheCDsCQmHhVXN7Sz5UWzIgtdCITXFBlP3EHnY6Z2WNL4
         VZL3QV7TAJJoHXhNVvZu5CMJmUmXCvrYPXYX1KOzm5WwTPyDtPcz02itkY5PmpoS18Gb
         bokrgjgSu7UGXUevdldbI1gbBf35sssU+kqbZFM1BD7GiZMMAIpz3Ea/FGoiiSoTKtAS
         reUrN7lUcvr8Jeo5TIXirz7L3xLQawsgu610AlX+tUaO21SDFos78e3kSuyQb0VjJZoU
         9lJdTeT/nwPM3xiGcoY1WYWkEUpEyq9MVkP78FRc3JGfBOu3gs6sEnqjwP9Neq/1lPcM
         GZBA==
X-Gm-Message-State: AOJu0Yw/SXgpDppp10wBXvd0ArAEUVtCiDPjVrmYTRqHsrPzUTeFzUWy
	JQsyQPFDFaG+E61aYtGukHaH7xToqD0b9q+OLQGcDzy8TTc92B8L5ShY
X-Gm-Gg: AZuq6aJqMJCX1dYhS/yMOV2kQCRGYFONVYnT4X4LYFNkAj6N3Zm2i6HmFW69rFv4E8I
	B7+dB9IeELiljQ3Sq0kkHJL6hvWIjAsFbyruB08eQMUFYbym1x2WFjXQ2PBBV7xlW/yw0oFQRUM
	Qw06jHe05bUQOJpnpZik0M6de0bUsjvecUjl338nPTMLiWqDQ9SXIZqr5Zu0IX3ApznS752kB6p
	qU1bL9VUUaNwVNvzLD8NgzmkNjOONTECrCbyVtM15rsSoYK5AgW8Zw4w2lfVckvOsBmtdtMHBgt
	X6tEzSNOzSt+Lpn2uQ140GGixa2yGQ8SOPLNcJ58R8CW0UjQL7F5VnBRIfNtWzCmkhACKfpfw/l
	UkCOIKPP67EAVenlTXab1YvnIm40QjH/mWIVCeuihFraWxWk6bo1T9m4FMXM/D6cdJoOSZJyhXb
	yJmtiUQ2fjKcKcCeaNKijcAI9STiT4Z1oQ585C0ZtL73sQZETXLWqQ92e8jlMTeCAoq2B10yqpB
	wvPq813IEr3aUryyJHBzjJ3fOWtbN8jS9yVMBDoZ6NFCyIGWQVeUXdVeTtrWxw8yG2pLTf0Ag==
X-Received: by 2002:a05:6808:50ab:b0:45e:d94c:70b with SMTP id 5614622812f47-462e9670b3amr4583378b6e.0.1770405750149;
        Fri, 06 Feb 2026 11:22:30 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:9158:7fb2:d7be:c2a2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4646fb56dsm2257676a34.3.2026.02.06.11.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 11:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 13:22:28 -0600
Message-Id: <DG84GL1LMAA8.3KOO3KZU1N2JO@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary boolean
 comparison
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260205224210.64920-1-nikolayof23@gmail.com>
In-Reply-To: <20260205224210.64920-1-nikolayof23@gmail.com>

On Thu Feb 5, 2026 at 4:41 PM CST, Nikolay Kulikov wrote:
> Remove explicit comprassion to true in boolean expression to follow
> Linux kernel coding style.

You misspelt comparison as "comprassion".=20

>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

Thanks,

ET
