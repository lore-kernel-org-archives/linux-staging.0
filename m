Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994A2D0C76
	for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753969853; cv=none; b=LWoj8Mo/9LfKjh71CA9PtuvRfeEmbUNWxRuzT7bJJPZ21GeUPLbcyqdU0ScQQ2b2X8EOIXqS6dK5mzYI7XFtN+TO6N90dHVuFgyoRSsI0C7coolSRdDUMtUzsrsbuEsDVJgXRHTHPLKJdsldj+0ANinwdK2zaPJ+9+uLseSHcYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753969853; c=relaxed/simple;
	bh=wHephPRnWFJ/Wj+ePanHPAULwCYpiEvcIkvecMIKdO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bM0rwJQDVuRpeJCMI2RZBeBf7c41oPJ+YtIY5nv4ZJ3D7uC8RcT536QYHhIgy81DzqsbvA3dmpZGhfdN4yzQLQHCi4CTspXaUj4e8SF1AyQCoZ6+PeLPw7IcCBQ4E3n1FMMQTFI5XWMjHVinyxCqPnPpRt+HM9ZpuXtWZT7vlnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE+wh3Bp; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE+wh3Bp"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70884da4b55so4135556d6.3
        for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753969851; x=1754574651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEQ1XoGm9eaZ2CQwlCxSmOHdyKgEeGnL9srDeytRVGU=;
        b=UE+wh3BprVZiq+JpQgXs6JmgJ//Aa2mBW3wjdKsDIgqJEZBUheZop/kEjbZhd8SHdE
         DExErGU7KszsNSZtwqJlEBPJAuoTQyrSOIsYdMSgKusU/z7AS37SlxMA6KVzclWRgq6n
         Q8O7yT8DR+hIy+RjmxJnKCYizx4ilMmrPlxNEd9v/T+ozHHw20kdAAdZBnhXA1FuSXTE
         yzU8M0bcd+IGHPia4+4naye4Z5LvAa88vlbjGB9m9EAEcvJBR2eypR6oceqmavljF7ow
         vpy/5fPG1/TNsaiZdqOYedmM1UL2/H2Bcv1cB8WwQ7vGpBLWUKVERlWAGUdC5mG4dJl5
         Enuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753969851; x=1754574651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEQ1XoGm9eaZ2CQwlCxSmOHdyKgEeGnL9srDeytRVGU=;
        b=R8t19w8fiBzA0UWx1JLrCKqRxKpkSznj4bg5mU8oACnzYCTHqPj4m/gJWYbpTc4RjP
         ROcgjyABxMnRFM/S20ynaXNWnrzSQJ2/M8ezGTDTzpOadL16/PxggFfifloxXXVjmMZw
         9a7MyCAmQm5Jq99mhPZPLLE+kc3uzbDFq3IGGQwm4ULSOlJ9AKyeyrDeiNZsPcVHvka+
         5ecgFmVwZcMVO5UX1o7/S9aMWQXkqi2cRGTiUxEPx3SQxJGqfrH50NNClxv6YqDolR7M
         MTdb1B6jzueMMyHvgUyhdI3fdQMm0drU5iT6KwBmFxpf/jFQjKWVUHcPgxT9zF77vqu4
         3mEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3pwUmO//JZRXzekC6AmQtu8m78jGVTdZdofpkiz9vF1Rf7ydSPNjKgMn4rSwgG4i4YewWVEoDPCeuDDR/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1yS8fCuynYimuPWDXCfsplUtg1LlkWXwbF9s0JLOWqAR88ZqI
	mB/s/hdDYArxRIPQNDI8d7VcAp8gVqw0oDvOAOVDOc5GRqe2H4Ar0i7H
X-Gm-Gg: ASbGncvh0AHi52wBFp1Sfn21c8QCEA9QjHS9AyoogAxSKFI6uEJUieGh8ijfHNIaFQ3
	2rZ5ViUrw6jXIBhqrkX7h76w/qsjw+8X9fKqNYdq8KUlOkXXVob0j+2UpUflF+2c9mw+sjlbn6s
	FqLzfPyyN7iGfjVyL1U+OpNdpSF98xfzURXvFEr1ceZdUL7fNFqy0t+iZZ/+XrfSYBdZmUm70Ge
	5fkMr5a6UuclD6+W9I2U20g9iW57uUZvGRlIO8BNLSrfOxH3HeHxxb4+YOMCqCDJVGM3eGdS0l1
	XqxPEnEw/wTTLYbgzft7dz5HeubvYplKVpt0SskfcauTJwxVNpENTNRFGvsVSsntaVwxnSTLyGc
	KA1bIefaRLV7yM7o7MbDNIgWGQ7auEwzRDp0wwE1UcIe9HzcIxsc=
X-Google-Smtp-Source: AGHT+IH6+W3kKYsyKhKdjnmM6R+IzB/8tbDPac9jcn00m9evOh5Gm43paWEMVoBv6rMeNBc8x9iA3Q==
X-Received: by 2002:a05:6214:2626:b0:707:2ef6:c13e with SMTP id 6a1803df08f44-70767056804mr95728996d6.1.1753969850705;
        Thu, 31 Jul 2025 06:50:50 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077c716effsm7740906d6.0.2025.07.31.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 06:50:50 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: Re: Feedback on Patch Submissions
Date: Thu, 31 Jul 2025 13:50:22 +0000
Message-Id: <20250731135022.515348-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2025073101-playful-easeful-3008@gregkh>
References: <2025073101-playful-easeful-3008@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks for your feedback — I understand your concerns now.

Apologies for the excessive revisions and resends during the merge window. I got too focused on addressing review comments quickly and lost sight of the timing and volume.

I'll hold off on resending until after the merge window closes, and will consolidate everything into a clean, single series.

Appreciate your patience, and thanks again for the guidance.

Best regards,  
Vivek BalachandharTN

