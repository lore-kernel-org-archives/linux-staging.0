Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8821F7569
	for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273288; cv=none; b=HvCsEQ08bptaclxb6bg48HMGHaUbXlasNJBPaUCD0+uTsU8+vQiIVpZkDg/kli05h4V5JL7nJ6XI7ero3kdJxdazNUnINce2yRfbgDgTLI5PJJGzAk2TmHh2vL3/bQcPYS9LOCVFbLm0SUxKeO6csSfez9cXH3MnRpY4Y6QlPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273288; c=relaxed/simple;
	bh=VYTh2Dd5YpFdfEp44t+vH0d7Jh/+1s7ZwElHdQz8p/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZX5WZgQXsriypiEDR85+x61USGJQAJbYxdr7ezzNQ8TWpIF9sn1wJfM7akbX8JookpclhA/9pw9KUPcRwBtqUuqTGtPQa1y236vU0gwj3Oe76FuPNcZ6iAVyk0TkeyElmQOMxqmYjtdtcNY7G+BSShJ2WHiC3OR581YuTtOITfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESQ5VrNW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESQ5VrNW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so53946615e9.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739273285; x=1739878085; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYTh2Dd5YpFdfEp44t+vH0d7Jh/+1s7ZwElHdQz8p/U=;
        b=ESQ5VrNWCyaJbNzF4a4YsOOkg0lgpX1cle/PDvQzH3tqDaoVyAIUovnKjDtA0YWulB
         r4DFM5UdqPLjMHa8DKZqn5fYV3YGhxeLcHxOJK7k8K2k2vsvLh23H7THNki4kVpzC3TU
         9AjPVzRYBEGbyAqotiNtRqj+ChBINEBiUZ0XiZckdj9+nNRgTze6svSGJ4XlfYBhtt3n
         8eFWMRUldTzQZefOIVjvMjgKfOaHEDC6MeUQ9HzTfLtNbUFoezieBd4Ieh7kY7XPWa7N
         m+A2TMzCSEePJvn0HMVdt2QLkx308O9S90pECxoqV/SojrtnN357cC/yZIjkwtk6V7Iq
         sPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273285; x=1739878085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYTh2Dd5YpFdfEp44t+vH0d7Jh/+1s7ZwElHdQz8p/U=;
        b=HGECaeTmSEUUkQ6fo46hBw4fE68DfN38DA6cgrxkKSUkbl8S87N8Aelgtyxg1Ag9JG
         c/5+sb4WBpml5a/ZkfwgFBKQwPJii6uWuz6Xe3NGDO0EgDbVlQTufCDg/ldDGLgC76Bw
         wQ2M65pOCVf+bEiXW9MFXGS4136ExpzPRQiTB5ebuqp4GvbpaH5qhf1nFCm/Y/ga8IS7
         9lZboqv91dtShsg7XrX+a7yY9xmVzoGaFeePFm3NSkREj78mTobKB/mbcvDf+UFZsz2t
         WaJ9U15riipAIfrOzoPm417txLAsmIik2//xvloaAVN1MNp/GMFqgOXCdyBOsBXNFpDB
         uZnw==
X-Forwarded-Encrypted: i=1; AJvYcCXnGpxcYPtnjyOV3TFJHhIPdTyHyq2LERlozNnxw5K+jzG0/Z4tMgWSapSXVnuGx3NYh6bMI7ECZSLHsOIt@lists.linux.dev
X-Gm-Message-State: AOJu0YxFYXCxiGbRNSk81AL/i412tIYtH6ULN7Nikl3vKYwUd9+uruQP
	szzs3Kk67uJc90hGsGQqqycSTCF+AFtDW2LJ9dPU7vLC5jdUVhQ0me/DX3oz
X-Gm-Gg: ASbGncu9pm+2cqy0LOFot4WLTxfZuSjHV6ZlizNo7h2oibEHhaE3TpDGvvcxinOxaUp
	QdSIa/5FR56exT88vOwNXreixfBmWD0shQtaiKujSzbVF11asTZwp9NDDNJGEF+Zl2kNFe7pQr9
	f13y9dNzqKp1nlNCUijYxZWhKSugpZqfHtH2JqNjkOtLQz1W5i9LnV8qCHDmUUweuAxgwD/Jb/h
	8Trh55wvUeaqDGyXWCJP8jmY/YaYbXzubmZrBn2dLBDpHjAYmJ8NJYt5TPcNHIWQexcLVsTjli1
	m/u7DXbWsvM=
X-Google-Smtp-Source: AGHT+IFjtzrrOH6AEcWqOF7uAUp5Krt174vzd2ADL15QEq43Z93qXvsdyAqa4jtx3B2VMmowJ/TvPA==
X-Received: by 2002:a05:600c:34ce:b0:439:3254:4bf1 with SMTP id 5b1f17b1804b1-43932544f7cmr96377755e9.8.1739273284557;
        Tue, 11 Feb 2025 03:28:04 -0800 (PST)
Received: from void.void ([31.210.181.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm71091105e9.23.2025.02.11.03.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:28:04 -0800 (PST)
Date: Tue, 11 Feb 2025 13:28:01 +0200
From: Andrew Kreimer <algonell@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Remove unnecessary TTY_LOG expansion
Message-ID: <Z6s0QYoEZf9gJqAv@void.void>
References: <20250210121552.33455-1-algonell@gmail.com>
 <20250211093051.15993-1-algonell@gmail.com>
 <2025021119-unsalted-shrink-1211@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021119-unsalted-shrink-1211@gregkh>

> What is the interdiff at the bottom here for?

Indeed, it is pointless here.

Should have sent as a separate patch as well.
