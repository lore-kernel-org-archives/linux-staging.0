Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2382F34
	for <linux-staging@lists.linux.dev>; Fri, 19 Jul 2024 22:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721427146; cv=none; b=AuK+Fyyi3Ot5N3MboE0I2bFQdWB+wx+Bkv40AsRVJ4v1JccmOZdom9x5jvoMuR96b5L8J8+MPHdanJTJeaM6KcAciNiyMxBW4qMB0BNjUku72FXxMW4mE4oboHS6QDaxPE2072ycvduuuA0Y/CHOIqNHHLX3M2WSLhM2A6bncKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721427146; c=relaxed/simple;
	bh=y5sMk/zS+lIMJ7zbR6jRJyQybPNgrIopmjWz2/cBtw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8Kt7dMDc0GokIzn6sICLmSbJlC+QmEt2YbkRicrFkwcJLoP45QCxQzqh1c3Bd837JQeKF+1Uezvvy46I1isvoNg6/JmHKKmVXZYJ7oobA6ir9BAoHN0HWjvdgq9VyHE2TMenUcH0d59oJlYT0Itzu/FSpCrulvKcNtwJvu7dCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Li4rfKfN; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Li4rfKfN"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d93df6b54dso1228072b6e.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Jul 2024 15:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721427144; x=1722031944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsrUvHcOlO3Dh/9IpJULPkmqkCFzS/qDzWwDyW1IZW0=;
        b=Li4rfKfNmb+pyt83Xb3F2Zph9aHj9w/c7PVd0gcKctROhtmLkMIbBdfdk9FF6zBomk
         krW5/g/Qvd5LpCQskZ69FeR6WPHIFrk8rxuwAzYJp3u1AMyXdIgLEUOs4oBASYhWIqAv
         0uRFGwxN/z2PV5bYOCRVCXpHoloIT+g7tR9dojwU9GXmzk+SHtTyWvpY47UE4RggC0rz
         JyDfvKH6fPxV+bOHZTlPxPh0HjCBLbtFyovGWun/2+G7iZJzrJQTvQB3AFd8cwkc/gXq
         yMDCSZ13U/p2yTjuQSZp8weA0bnpx8G97A6gA5ivuKn1JCYWVjZHSzvug9pSm+fFbEfb
         k8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721427144; x=1722031944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsrUvHcOlO3Dh/9IpJULPkmqkCFzS/qDzWwDyW1IZW0=;
        b=KX32sRbX7GtirPUd9WMtt4VO4/b4ZnW2iLgPUXcdcqBrXKLCdBYcitcx1ups1/ZReJ
         sA0a/nmNEDFygeqDbdTR7CuS/KvYPgx/sGb9hsSaKpaQqSFO3Xz00cKF4YFAOyDWrJ4b
         iIdl75Q/vLyc2d85WdOB3CD56x3/apvR3wH7/sj+z07w/9CVLUhhH2u4hmjFknTDhcSk
         tyZc5gwouV1b3tgnoVRUhzbQBF1hRk5uPDEalYrPBXxL5QJU5Nxbdwl9puxefLocvcM8
         ajams+T3qRIxFR60IcO21L8BRIi/MrzDZStORczYtRFAeMXVG93kk9susTKybTpRCaeA
         ChuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTMYsn7ANDCsz+1lJasCakIkjx4ixQFi2SbzmP22dlBlRP2JaJnVSDrWKiBY0Fj4lcBnf5wnl9F4rDda7x/iJohPrxMktx0hcLS6hBcA==
X-Gm-Message-State: AOJu0YxNAwhO2gh/1N+Qc4PgTTrdKrxNz33hpfAdsp1kkxJY8rrWoekf
	zuyorDihJ75p5Hm7caN8PVRyrTB3txiQLRx/lpLmYGJpc7A8t7LJL2KCrp9v1Kw=
X-Google-Smtp-Source: AGHT+IEACCDFljlhCVx3UC2edV2r9uCk21B/qGgoe+9pg6yRmzgbSu4fDEallSijIg8HH3qfpPW/CA==
X-Received: by 2002:a05:6808:219d:b0:3d9:2d80:2e11 with SMTP id 5614622812f47-3dae5ff9f4amr1420022b6e.40.1721427143793;
        Fri, 19 Jul 2024 15:12:23 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:4528:a9e:1eaf:80c5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f60da0b3sm489970a34.42.2024.07.19.15.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 15:12:23 -0700 (PDT)
Date: Fri, 19 Jul 2024 17:12:21 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Davis <goldside000@outlook.com>
Cc: gregkh@linuxfoundation.org, christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Made the error messages a tad easier to read
Message-ID: <94189c64-a8ba-48b0-972c-a9bcc378aec6@suswa.mountain>
References: <SJ2P223MB1026BF236AA81666C823E947F7AD2@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2P223MB1026BF236AA81666C823E947F7AD2@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>

On Fri, Jul 19, 2024 at 05:19:36PM -0400, Steven Davis wrote:
> Signed-off-by: Steven Davis <goldside000@outlook.com>

You need a patch prefix in you subject.  You need a commit message.
To be honest, it took me forever to notice that you changed the lower
case c to upper case.  That's the kind of thing you could mention in
the commit message.

regards,
dan carpenter

