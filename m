Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8022010EF
	for <linux-staging@lists.linux.dev>; Mon, 16 Dec 2024 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344514; cv=none; b=cyAfD46ZxdGMArJ58zA0MBueIbllnCwgnAwFgtBZqpUyhCTt+gMvUZ+nTzNMg1AmVK46r5rpVq1GP8LydqMyNojzUN+oxusrHxBR54ftZCdYXfAOOuS8SNsHMLfPmK5F1n3u0D2dwjmP6lGGo6Ovth16Vh7FP06dCiMoifPpQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344514; c=relaxed/simple;
	bh=S/qqWVZlHflFxuV4/LsI0IhdhoP3u6+5V26ipGRIEH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pW7UVYioMptqchUUocD56t/SVEFwu8e6CING1SIbW2AViTpFus9KnpeozRcCciDCX7iRfX4kb53pu/OikQ8G2Fi9GtcmOPbLFpgMTeNtwPM/BXsXU28dFx+Hjepq34csUGqfDOk7GdlYzZBE/DAwrX6DIT8/eQY2ZYuQQ+uynUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/1c/Yqp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/1c/Yqp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso43017465e9.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Dec 2024 02:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734344511; x=1734949311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uo+Lw7zjxCxUVDImbWApPZHVFAVFzgykcL95SpGwcww=;
        b=h/1c/YqpNt7CRL17cRCejCpkoWfImNva2Pypw5vLxeX95qXPwftgEYjX5NG0I0brdz
         8Jv1AdWbHz88qP33f2WBnfGjTbEQ/In02mi2MJb4Of56K6xxNj7iK/PuxLc0jTSOqj1g
         b/+gFIUpkIZ5xikB5FtUmTfjumQEOFnJTPSgW0VqBmO1dGxNPm7wmqo8AL/3qylw9gL8
         TXIKdo9CPpdFjINWDDiRuAgPc3+jDEpXOgBiYpx6br5FnqfFNlTzGj3+RVvoe+ftOoG9
         q/V6UPi6dFb9yfuMRZG++aD6CD6etiO7RVayD2QT9bXmFL/5NLWpDsUPBXb2/dU1okyl
         bgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734344511; x=1734949311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uo+Lw7zjxCxUVDImbWApPZHVFAVFzgykcL95SpGwcww=;
        b=cQhViXwPbVFyjO0ZFqPNhCpfPVuf6uNx1tdZeD2gQ5ttk2lNIY4lbgX0O3f/fxPgII
         ljM5fzrhjB0wuElkVu0xM+0NxGNGshA++f6O59HBa6yL9EMYCEflfKG2inr/4mWDmrtn
         nEQ7dbHav234UNBx2+JPzpMaBIDg6rRAvVf1L4bsAjcQ3xIkfBLYoNjPPeQ17i6H/hHe
         kMswJa9gEfqOkUhlFuRs/D5eIuwwXCY5rZMg4hvZ6f/cjRwU6z7M8KpWSm5BdP4YpPNG
         YYCthWgdjwC53cCE9/LbxaKfftclPc3xaS2PlzmtEwCqjTbGuET+BBXTlSGHEfEJ4q7d
         mlaQ==
X-Gm-Message-State: AOJu0YxXTPaaS7+yRVo+paOokdNmZiVnvMSi/q9VKRHUKL3s3m67oZfb
	k6tM2iFzkljD45pFsYS9WNQTcOsfnNb4mBnuHjcYEfYGDTvxxfe3Ann6IQwA
X-Gm-Gg: ASbGncsT1OGUut0cFnJe0AlQqaeOs+GSbtXmHUV9gkI4pSU1R5uxm8LER1w3J1tzJ57
	lm28kxmIT+40P3T6A1Xfx7zryicFmFtgud8e89YQE16GAtm0xhqZf8dZMesoQjDsmjHiLVpt9BB
	GxGmQzvA6ZVjBBnd5+44XnIdlTi5JnrMtnTcE///gWG51Tg45w2E/lprkje+w4+2LkxM8DNIOQm
	nR8OwMYyVYMVbptMulMO5eVHm1Ae4nE5XqjR7EJmUToPO0fMk7kbXK5LGpFlwXxxv1acW7n
X-Google-Smtp-Source: AGHT+IE57/ONNWi8zLcjHXfGO97j6oHhQwEZEabcKaVjeXtxH58AFaUawvLjGnuEvmeRbxSS3ru4Ww==
X-Received: by 2002:a05:600c:3ba1:b0:434:a765:7f9c with SMTP id 5b1f17b1804b1-4362aa13613mr101241585e9.6.1734344511291;
        Mon, 16 Dec 2024 02:21:51 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436360159aasm80163435e9.6.2024.12.16.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 02:21:50 -0800 (PST)
Date: Mon, 16 Dec 2024 11:21:48 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: GPIB build failures
Message-ID: <Z1__PFvt3ujgbGGj@egonzo>
References: <Z1/u0u9Nu4aEHA5h@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1/u0u9Nu4aEHA5h@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>

On Mon, Dec 16, 2024 at 10:11:46AM +0100, Alexander Gordeev wrote:
> Hi Dave,
> 
> Drivers in drivers/staging/gpib/ cause multiple build errors (I guess not only)
> on s390, when allyesconfig configuration is used. Please, let me know if I am
> missing something.
> 
> Thanks!
Hi,
Arnd has submitted a patch for this which Greg will
"be queueing up this week and getting to Linus also this week."
-Dave
