Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F28235BEE
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676048; cv=none; b=BTMzOPkmHddKg/TJSh7T2Z+fJ5YoQQYU+rk2PjxxaC87mEQlfm4cFPB/uDdZ18t3AzVMjtoT1rrz8nf0EQQY6QuI2BX4B3r9KGYu2Kvw6HcFWJgWRdfanvbiIx3+XH0q1g5/i4iGNmaEwsC84+dSqcD0XLTVk03nei+ll8yhkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676048; c=relaxed/simple;
	bh=6+8xlbDr5fN7mQXnhtSPaxgdIgk2eut1FkccnDGgG+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSGal6R/oYREtLFbAx1HZydaej1vBcRO1kOhbbyrM8G4cn8TcVwcpLd9qiVzoZMomMLgreQQqESaJTQWO7js3u0HCl5oj+Vgx/0kXqEAU5aRlE4wSJ1gAAz3aw12UDLayongsYJvm44avBjq447YpWCEM8+hTOhgnGRMgO8CUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COGLWBLe; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COGLWBLe"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73a8d0e3822so2054238a34.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750676045; x=1751280845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DWSVsYHNwP8rg4rURoGYOq5yv5GD0eHOKkQLtMDF/j0=;
        b=COGLWBLe4Nq39wOySRDVwGzuBD8MvAvSeVFwPsA/ttoCdMy0cR3gc8BCGY0Bpwf3YY
         EZugs8jBCsb2wAO/OBEqEyfGV4CWIYw/6mwQGHZBuGolQcSGAxVxPZXo534i9EEN48Ue
         We3AqtxVdOHP5DrZ3bEX9CtxWTOWnTKesahxHt2QtBdWfm77JJZA6fT2xj+8yqFcgQRh
         +jcq/KUK9EGsIDjPPQMo7VXyehfznXwfCJBWUdQMi4USgjCEdn+0ke2kxbeeL+0tgVtm
         BBLvaYRgNJNwvVKiDdaYLYG+LlYG2LxX1NL02Zj0f3fTb32tUssmAG1DDawPjCHBTm/8
         ilAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676045; x=1751280845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWSVsYHNwP8rg4rURoGYOq5yv5GD0eHOKkQLtMDF/j0=;
        b=Kbz2fAcm+CGW9cGC/QZiEoGPnJCRQSf/LeBc/oPcDki3gcm+m9sqlGf5DDs2XzpbMQ
         lN0c8kpfltt2CSkkmpkA8WDGaILoSF1NnQ9fVSSucRUXFSCS6jH1Ar1/6y7EWM4m+1iS
         bJuQMzzx+Hom/gFK0GlrjKm9Y6z68nkMAP8HfX4xJ0Xo7mbDuHJ9XDvKUxvc1Yvap0vW
         TXKaCQ0Af15PNr9lrCOGpjlRQFuugapq96qpkUZJIR1pGC+jBxuscI0mTohfo6Ta5Zll
         Zm6vxa9Pu1O6OMiXlmGhH82i1iWVAKuQwRjJr0nZF808axFwB4PinADNKXz2F51bJ9hx
         48yg==
X-Forwarded-Encrypted: i=1; AJvYcCUQBEm75qUB+GOWzhPVrMUJOFCw75u/dDZ1jfFhZF0GRwzI/etkrMtZ229UqBjReGMHlMHC5s+cBv6Ec0Ke@lists.linux.dev
X-Gm-Message-State: AOJu0YyccnT8GeymAUBTQMz7wPfGo25OqiOJfpRUTTrdJAQASt6iiST5
	MjYUGShSI572kwBqVSYN0MrzHTWfipLpGCMe6CtZONp3Tf1Vy/tEx7enMzfEUM8RKw8=
X-Gm-Gg: ASbGnctbleYHh4gEmUIefoPeANwqkGPBUOlZGwfjVFAqtty0LJrxzVILzg33q+BZgTM
	2T/2Lo+fKvri3VvvGpjWiwM2Di3aTEBCuMxGRQdf1hd1ZYBTRO/QqMoKarX5CMsqr0UlQQXL+w9
	vuHju0HFFJSC9xNH/cSj/x9kZBx19YRb0QMUn5Dc2hj9SSLeXuFrYsBbdeNnBaEF9dPGhN8BJiu
	s3gl4jFeTwzNAnbKa3mbSrJA8h89KD/IZf5fJeEHYAH55QCc1/iZiyB4Hkn9SSUQu3ZbwifcBpO
	NbF2GmcoxmwTnZfqIYLCbf+52XqPzWbokaNqnUBzyoII/ZaS7L/c8sSnFBWXmqiWUvz+
X-Google-Smtp-Source: AGHT+IFMT0KF7HhSx9nvzdNTb6lPuAF/rdvKkBwDB409hsxV/5/mAe+Pc8GJzAaje7GdXO2+8edZ+g==
X-Received: by 2002:a05:6830:919:b0:73a:96e5:198a with SMTP id 46e09a7af769-73a96e5a731mr9613005a34.8.1750676045191;
        Mon, 23 Jun 2025 03:54:05 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:608c:e09c:db47:348])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90aee8ecsm1407624a34.10.2025.06.23.03.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:54:04 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:54:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kisub Choe <kisub.choe.0x1@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>
References: <aFdAEM6GnCudvqMV@zinc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFdAEM6GnCudvqMV@zinc>

On Sun, Jun 22, 2025 at 08:28:16AM +0900, Kisub Choe wrote:
> changed msleep to usleep_range to
> 
> Adhere to Linux kernel coding style.
> Reported by checkpatch:
> 
> WARNING: msleep < 20ms can sleep for up to 20ms;
> see function description of msleep().
> 
> Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>

This type of change needs to be tested before it can be merged.

regards,
dan carpenter

