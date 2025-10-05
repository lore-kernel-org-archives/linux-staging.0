Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D1258EEF
	for <linux-staging@lists.linux.dev>; Sun,  5 Oct 2025 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759675709; cv=none; b=i4sEhf+exyhHzUTCqPA8k8RibaaPimq1yw4X7K1NBxc6grFJs3k20G2fc2WgE7Yk9P4D8Oihd3RfIwTJGkapjVHZf8HWH+PPS1Y7ge2yg5ttNEOfkuve41g7STrFIH9WF+2ndBkPlLnYwptQ/LnN4yYyYUrWNSOBTlaGwyFKrUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759675709; c=relaxed/simple;
	bh=oYs+5FKiuqdmr562c6Vj8WoQyeELsGW1c4ij3xz6igY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KH4Ss+3GzthmLLKuG4UPyJLyb8cgxY7AGUgYLbW533zRvtqPYKVL1wV/uqq9nlt5rrwlllcDtZ8TleNKUyR6Q2DWDyJHTEHjHDCni+Ih767vVhKkBObaWmnhhJoEaI6LPlrQS09MIov17ieToagkIr6p0TO3HwVeIBlxDCAHQcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddaZq1P2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddaZq1P2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so734378566b.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Oct 2025 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759675706; x=1760280506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Li8067XAjYgU1XijTNdw2M26YBT7ug0s2F8502fWQUM=;
        b=ddaZq1P2/VV77i7ZYJdvZwEfm8ZxqnuRMJj4sizmMgyV7Bnic6RJpoQDdq73AwmxiN
         7Cdw4cjyDZuV0Etq4Ik/tTPDaKIa3fiLy8UimtrmwOsFgz9D3fiAzUIBe63ItJcFC6+X
         qqxqUOII561ZE0i2W0ZylLDOFI5+yMUWsJ5Ykj/mkQSH3zYAc4feN9JjKHenND0dThYV
         rFyedcs+FhecKhIdhsNU/Crz+R8n4xBLFAl8lI1+JavPt5LOR/0WYeMDygKLxY7pdfBa
         s8YMaE9NR/k4/50NHr9SeiHCDqaLP6cJzj1VnFblsg/H3ZuV1tP85N7fY0I/aKk0vPsM
         /z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759675706; x=1760280506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Li8067XAjYgU1XijTNdw2M26YBT7ug0s2F8502fWQUM=;
        b=Vd6AfGBpuAgRjLbEXXO1uQeF2OqBwio5HCu42QEDC2DGBLp/TKUPmNwt+JuR5M2zxi
         qNu7D2ZksAyZwsTU54t8DJJXhfS04vopGjdsGdg1g78atUHX+cGFq63naiVVbwQSnsWo
         xqhi9dKZnzJ+X3isL6Du8zKnFcMI4z0+dq8glj70zvPBtp6KaRP3oA+XK2M/Pg4QEHYj
         DsA31SrxSd6RbxUEotSvtydq1yvxJLidbOI3ugowLrDLNwWgGlJAKSASIB/eKzXHAUhg
         Sjwxe12Rk8Ln9yEJLystqmoBsZfZpWsz01p7UdXcCRoNgeIIYI1bdWRT8zyrCFEksk7F
         vmPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvgnPDOVD2l54bvQ2PPldLVIbcB1pGXS7isKOR3CFVO4/8zoIWXhlo6drw8aIGodHVItMOkwEymhAmeINm@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr6SZlawVT5OKtzPMo4cEPPY/cKHxRey6HijqFXOcIby+9s208
	0mZHvS8OusezA5KyuVXchU0GEpSG17vqd/yOmMASer11H+1BquVcO3AU
X-Gm-Gg: ASbGncunvO/PJOUPDgXl2tqVm6IT3m5TakHbm9Q/Vy+JMyP1VY4HHKHZrAsNtDkHN1+
	eLn8RxcdkS70RWftaVxLMzOkgfJeMw+mPT6kc3mXPeGArBRnqQPgrqsXBirYDz0lOQago4vlM3D
	f/4Iv23/Ec9ValA21fdwLaelh1zmQHogzItRutIOGj3MR3/q/A394bXJYFICb0oT2Y6DcZ6Ymy5
	HvFDOlj16mSj0a8zGi60i17QMTdVtnghbG90ltoGa1F/kB8rAXH43zcYrcnudGqZcveO1BKCnTa
	l9dtJ6hs1m6014DpIFt6JUKrEiRb4hpNdg38wn1l/gAdBRHjts8LlJ7swFWsgZ4VXRL1rQBmuBA
	kQxZDuNwx8YOfpw311XxOIdygbEvNlQ6RcfPQkLgIRg==
X-Google-Smtp-Source: AGHT+IHKY9rvvpejdXZNJCEHfcSPdgdirExQui8GodmpNdb1/H4E+TX0nhVtgVx9TLmitQ2vz/my2Q==
X-Received: by 2002:a17:907:a088:b0:b3e:f028:2d57 with SMTP id a640c23a62f3a-b49c48a532dmr1314634366b.57.1759675706342;
        Sun, 05 Oct 2025 07:48:26 -0700 (PDT)
Received: from ASUS ([182.185.168.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ebbsm925246466b.7.2025.10.05.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 07:48:25 -0700 (PDT)
From: Taimoor Zaeem <taimoorzaeem@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	taimoorzaeem@gmail.com
Subject: Re: [PATCH] staging: iio: ad9832: move ad9832_platform_data into include/linux/lib
Date: Sun,  5 Oct 2025 19:47:58 +0500
Message-ID: <20251005144758.190457-1-taimoorzaeem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025100548-stereo-patronage-408a@gregkh>
References: <2025100548-stereo-patronage-408a@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> No, this should only happen when the whole driver moves out of
> drivers/staging/, staging drivers shoul dbe self-contained.

Right, I see.

> Also, why is a .h file needed for just one file anyway?  Shouldn't this
> be part of the .c file instead?

Not sure what's the convention here, but yes it could be part of .c instead. There is another .h file in the same directory (ad9834.h) which is basically empty. Should we remove that too?
