Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E41FF5EC
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 18:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644021; cv=none; b=dGNkzI0U1LX1tP8gvlvyVOT7skMqsqL1hvdcKTGAMi1JFRYxMmomkkni2/e6F8Sut430DGhfGlIISEpa5PP1ucL/P5fb7wfvkC2E/hrjytXNxNzScfwqK7tZVvizIxX4+5s1YqUDVbC3eMlGuKaP1E7f/E8IbuvgHm0iIGXXkzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644021; c=relaxed/simple;
	bh=4vKFr7qe4vZRrtcDl0MgUKtLS085rq+jZEdMX5rs7hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+JkEIy/x1Ww3yjhsMnUsUkQAH8AwPEALtYkmu5DThmwe0quCScr2goU6f275BdhUPS3I+u6+36ZUu73UDVpUsLpnug5gzPWVCwGP/r1UzttV4ZFZCvCPDIpqdqMaFOoItmyu0HIjqypxnB2Mqr4xUvwsBHZ8OkgA8F0uPO2jXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgDdHK2z; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgDdHK2z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso120822f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 07 May 2025 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746644018; x=1747248818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fN0IMnzWBFaY2VN7IEwty5K6yq3NVqO0kz2Muvh8c0=;
        b=fgDdHK2z7uq7W42WuFCAdTCsWE+7UZ5t5tWkHcHa8a3KxrDN77Oq2rQk5LuGvCyVSX
         z31OXLvkf8/C7k4ICanf9nOewc1R409Mtj1F80C6vbZawl8WVQVjZ9ohsn1ivxamHsGd
         4tH3Gr0BOVVBwsPToG3shLv4h0+MeXDOTtx+WBWUwijEMbqo7vnJYR57jtODKkX2ZLke
         3onaXrbilHpCQELThbVVIf4aqNtQrIyvLqdXxCqr/Xj1nG0gR2o6OM4QgBAW+Ygiid8i
         RfKvUjO1ow2ivKh9VQPnvDRH5JvD7UlltlSxhNxMC9k/PbiQBC8COz39CbM1Ryn9lZU7
         CG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644018; x=1747248818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fN0IMnzWBFaY2VN7IEwty5K6yq3NVqO0kz2Muvh8c0=;
        b=GMgQkpXkvyqJsfnHZjijyBe+n8tnhKIaK+QT2X17b5bEwTZiLnQGoue0Ol/fCqdSSv
         NvjV9HDEu5Y/tc7eecdnPUDTiYxyqYFVaLJg33nkuzSl6wwGFDu0V8q3sQzOzLKuX0/f
         YNyLPPaxFNSXX/P29xJAyBeHOYcNY1CE2hsRKJXHQoHHre640v1K6mwMJQ3JTbOWyIIM
         8HfI+ypIIM5/X6MoNG1FK8i2qrzWhjEfa0Fvse+RTgh0T9F6Zl8blCsIfup+Auoqx6l2
         4rViBp6ODEs5Sekd/eQa+Oso8F8AfCSiGMfWrxAYyfCSR2KgI/oMsNug/RYHtxPjJVfF
         SFyg==
X-Forwarded-Encrypted: i=1; AJvYcCWPWn6C4tHepWPE5LuNAcQ4sE4PI1yT+oxONjN638HNRw/s2uyY6Grfd9uAvmGbp22uLAe4qe+d9Ewyzqjs@lists.linux.dev
X-Gm-Message-State: AOJu0YzmnLXxZfep3SVG/1fHoKyQRZq0MVuVEukS6w7Wj22mVcUgkqeK
	E+WN2XhQkeF8doX5xZnyfzAx7SQhZ6yeJ6I9I4zeAfvToQmmAK/sV1NOuBrJxa9qL+7HraiQjSK
	R
X-Gm-Gg: ASbGncsmV2W27zkHLZBuMWNFQrm2lGIYc8yrzuhPporl3bBC0AYBI6ccHlUwQobhSUZ
	A7D2cdWMTY28CXEt8q0sKXVaN2x2whQB15vazchyjetsj7V9MZ6PHrxDRKXnk3gErLTS3QIjmqJ
	XE6TSYF55E6wjAPp2oJh7dn4gTqh2AE5sSXxDw9cDyMlWfd6Kxi5lKT43S7FKcEiZg/WuKPUkbO
	nE8X8ZP1jzErXhaHgAa42xa4QA2GKH2+L+UhO+ijMIqCqYNQPNw1kfObHWTifHqap2u0/2/MWQw
	Ahz4z+18aKSgEPvLcznOoPlzBPsZD4saNjebGIIUo5vSJA==
X-Google-Smtp-Source: AGHT+IGbXFXl7/yZ2iz0z8i5yTYKtsZVTWA2mRb1dQUNrexl1xahP0QPQA2Qyb99RIZzlQKi8epSew==
X-Received: by 2002:a05:6000:1a87:b0:3a0:9dfb:b001 with SMTP id ffacd0b85a97d-3a0b4a41ad9mr3680514f8f.58.1746644017747;
        Wed, 07 May 2025 11:53:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0ba23e334sm103209f8f.85.2025.05.07.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:53:37 -0700 (PDT)
Date: Wed, 7 May 2025 21:53:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rujra <braker.noob.kernel@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [FIRST-PATCH] staging: gpib : gpio : gpib_bitbang.c : fixed
 parentheses error.
Message-ID: <aBusLVDVchI-mHrN@stanley.mountain>
References: <CAG+54Da+jDEXRQMgmXGyCD2EHjNFjA9nS9=ShdJPrC3EKjUgBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54Da+jDEXRQMgmXGyCD2EHjNFjA9nS9=ShdJPrC3EKjUgBg@mail.gmail.com>

On Wed, May 07, 2025 at 10:48:45PM +0530, rujra wrote:
> To pass it as one parameter, wrapped the entire macro expansion in parentheses.
> and build it successfully.
     ^^^^^^^^^^^^^^^^^^^^^^
No, it doesn't build.

regards,
dan carpenter

