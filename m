Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32F37998B
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671655; cv=none; b=mSOs82Pag7NSn6wFSsZxjpzWjgTmNNFGFFdbpgD1C8REKHL/JW295jtEl01k+w/9fUr6ShbZaU+Rjyhfb07jMOhMg5bAHX7U83d06Fik3CooIWqJBNloAHBEt09BDdpvqkflS9VxP3EmzZhPMEq4IU6CIj19vuRtl54GjDJ6tsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671655; c=relaxed/simple;
	bh=DLpm10GOpJRQ3/W2U3PfT5iv/A7ESJkJYY7x6q97wtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPg42R37sQJXRwA0qI5LYi00q8bdwX9QzwJTjo6Ewe6A5UxG81iiGpgIQZSsEKlR6NlqqWA30eA0wKbABHAPI932TYqoF3dPjqot6qR8A9l1YWB+VT/ngE1kmyuaklh3ybF6ytYPmIDlgohcSpJSnsWEl4sady6krNNBv/KXct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=khug4M4X; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khug4M4X"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4805ef35864so4683425e9.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 23:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769671653; x=1770276453; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWBMXOY2ETHSDCHnkuYhr/YxNJoa+J8j2avoH6yi24o=;
        b=khug4M4XlrNO3e42sTGL7JrLWnynA+7zqvrhYiM6CzE1I/rJNLL1YyBh2fP3LBDk1G
         21bp0geSI3nuxK9HvUe6S4FN1QWSmcdgyf8L/O4NNERoVnpB33YBSU/IVUw8Fw7EApK5
         p7MxUVXeEo6sSfVNwTuGns1ck0FmIZdBTJO+M2FtFqEDIsyemYi+w8PLry/Kryd4BTfg
         RoY7JiDvPVRAZdAs8+2VbIQCgy0FsSVFU+aRn0O1syBjz2YEc/qtjxgG9nZGciH80xA0
         Qt8d8tU9JpvcTYtrVpvHY0dj78Kd/FETZhC1cjeC43L28QKUFcr/+hVZ3oJNJZZaJljB
         BRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671653; x=1770276453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWBMXOY2ETHSDCHnkuYhr/YxNJoa+J8j2avoH6yi24o=;
        b=DEU1dt8MwyCFHSZEuC/bPZXxRzRHWmJRRy5tGghyPqScGwMFj2ox9drgre6u9JFlGX
         HYhtYt9T0Uk9PSlPlRj+NBJ6OAmMuz5ZV9FqnWY3MhcUhF6AgIfVedaGpaNxJKgyyTeo
         7j7+MxSuI2RfH1v11Bfpmxik+Hwz83h0e36aU8hvD7CZp0wKEw4eaFxMrczdZ2eYmW9Z
         PU5wkpz9ss0FTKBr9g9K/VlOmJ1ihlTtLe72ISUWy411QeefVUIVG9vUlvzG1zR4bEFO
         FKprn0u9fTMjtiSYKoAX7lTMAs4M6jDZIG/1L+XDHUyYbCzE9KwPM4WQePAVG9V8pxCX
         LVew==
X-Forwarded-Encrypted: i=1; AJvYcCUN7r9tOW33vFPLB4deBHxDU7w89i4Rtls/Olqe+y283kEZ4xu5IcPTvRy6MDj6Bl0XjN3Gzam0nhbM3EJH@lists.linux.dev
X-Gm-Message-State: AOJu0YxAwgWzN8r5L8NvZyvRjOI+AdVLaksEc9/6WfRDdtxVJQS0XV8S
	Yc9ckFRsUF8ERx0L70+q1ybmTIOr8XXapXoitK87tvuxbWm5XdOKtFeBaXMntuGT2iQ=
X-Gm-Gg: AZuq6aLfdCZGsAwEAIy/DHMIyaFciMXt/OJe5Q2QBMAxTT7KqvsQLYdNn85X71G5mm0
	AbCHgTV7PkWamSvGVgDvMj6htaME2aToelg3EWvS0OMRXG/GzOh92Q2tf3i7Z6bhxYfv2ZO5QhB
	3RJNjsP0rWkJLUy4OOJJi1dThsSLwG3dJwVduqeECF2YMhEPsiJRGSjCCvonS/5sVSq1cg9x3Y2
	1FCBsoEpvu/LX0AiCtV5dBy8F0QsFw4Im9OeqRfhDE+ndxNLBV+WhNnHl8jXaZjp9/yDOwLrMBO
	Lxefk/1sXFA3DryI6x2b9IyEDswSKtbpPoUG9sciY0vUpKUijz40khe4qQmvfBkwu8smaq6j9ZP
	egHVmwxFHRvaOT2mW8EyFeZ1TEzwttYtx1ACcvawwdG8oFoPR5fpKXRXJw4nQMp+bdY1Unk7KgA
	JZAhRriPbnPaAW2yEx
X-Received: by 2002:a05:600c:3b1a:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-48069c601bcmr89326905e9.33.1769671652681;
        Wed, 28 Jan 2026 23:27:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm113788745e9.9.2026.01.28.23.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:27:32 -0800 (PST)
Date: Thu, 29 Jan 2026 10:27:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace magic -2 error codes with
 proper errno
Message-ID: <aXsL4a5RvlIqTpht@stanley.mountain>
References: <20260125221219.26151-1-omer.e.idrissi@gmail.com>
 <20260128172143.23472-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128172143.23472-1-omer.e.idrissi@gmail.com>

On Wed, Jan 28, 2026 at 06:21:43PM +0100, Omer El Idrissi wrote:
> Changes since v1:
> - Removed leftover comment accidentally left in previous version
> - No functional changes
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>

No commit message.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Why is do you change -2 to both -EBUSY and -ENOBUFS?  In the original
code, the -1 and -2 return meant something custom and they weren't
kernel error codes:

 * Return:
 *0     Success
 *-1    Hardware resource(TX FIFO) not ready
 *-2    Software resource(xmitbuf) not ready

Now the documentation makes no sense.

regards,
dan carpenter

