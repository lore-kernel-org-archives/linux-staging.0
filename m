Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF0025E47E
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689335; cv=none; b=VlDhvehkOpifYlE5AuuzKasxYGzmj1KVaMhVXQ/csJ/+Oq1VG+Sv3wLT4iV9gCCLnfwBIevsL+Stl+A8XfVlUbejni0Akh7va2toeiFCcyY/rqBtlUX1gKOKHr3HaQCVLfo25hQJ/OeK/vHbTGu1PnMcTcPx8TQ0OjH+kMGzEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689335; c=relaxed/simple;
	bh=9LGKOzoBSn5ielAxf43x1FsCr8uxqxO5k4cdaz7r3uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyzGTJzdFklTpEfDmLYzNhDKpdSe4vO2DR9HdGGDK0j4sm4wUpRn9QRoU3a7NJWjh+qfQegXVz8Ks9GMYvgJFgJ824+/xMg45yY0I5Zyt61PllZmlYeBbcrAASG5J106hrIBO6hG9CijKz4jJIJBi9kq8oRguLY0X9RQWndHIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzaFLRfB; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzaFLRfB"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso4400952a91.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750689333; x=1751294133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XlzQYA4Vqi8dQ5FDOU8JcHAlJHgTJcysjtW2A8SXnvI=;
        b=XzaFLRfBsE6eHkLdYb3lr19/vYhfi2JuU8iK0dewTAZpFuA7RXpVStm61vYQrrL091
         GUqFrsLdUX+o48Ni5hh+e38lq/HufrA1xn/ybBGVcS2h+ruSyYqGJOHqcVzfO3M07OzI
         dELmCctiEyVogZwFSvTwGaqpMsZ8naN1sOiKknhVd2bVvYnXY3nKQp+F8od2ZPGFPOYi
         5/KPmmMpaCa+n36G/Byg9B3qPxNDyhlntmdIyMVop1FpKEMOLiIJYIhMQL+ZXUoX81ad
         3uTcHrumT275Sr6NRgBzDyeoqeFQC3fWUJYEUFyK5U3se7QsYrMSJxNJA1VK8cAU8HjA
         aNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689333; x=1751294133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlzQYA4Vqi8dQ5FDOU8JcHAlJHgTJcysjtW2A8SXnvI=;
        b=Mv9WJczAK5dhRRj/IrMAltZ/9X2loq88z8ui3aAylpV1O4gW132aO5ahMEWz4ntwWo
         6V0FK1L7zW1BpozZTuVgxgUAb9OwPQLdAzExqyADTAmOWU1/uGRO9YGJYgoLWUvQq8kC
         OiyvOzYPq0D8wzNqH1JOoUny8DTUUiOumrc2eBKY+im99lLAbB9VHBdlue3/lbu8prBg
         CST5KpddUZ5Aq2aVhXmcXiJsu1wSYcTJtidD7qH9Je7tbWdKN4uC2BpQi38NJV8d1fyI
         ZqwJv9Zf0X4N8GResQ1pzYhbY2npuSaXwzdsC+doc5bLzc/d5CnTAnuT3LDYWk2sux6H
         FoSA==
X-Forwarded-Encrypted: i=1; AJvYcCVAYxmgTj90ZejOsebPikFMokhvydKql/H6uzTXA+muZxT0bEy9XJ9STD3gOn2dJ7fiGbTLIn61MWePmupW@lists.linux.dev
X-Gm-Message-State: AOJu0YwDgWt8ZieL8EG4+ejj2Vi/oHNHVNE/Ie+dG68lsHcvsq2o3vYd
	lSJBK4BAVjHi+FdAa7DWN6BYKSPZWLVC09HepL5Zvjm2/ajdlSb3eHd/
X-Gm-Gg: ASbGncuEYg91YFcM9QNblT97NnPYuyRH88sMeB+FuZnUzk2Rt+5QV3h/4u7uTgxmHSt
	mLTwDU2qo/UMosyKIDMQGrWdYMD/VXIn37V39jd5Mki98JQp5v8GBif29twmIA6syegCt3NLbX6
	PT8NbpOeJb7Lhm7nGMuA/5YOtRdRIcA0k6Y3l2qLRL/2ajNdaxA9eMtjuaS0VFnbZnZlUBl8x7H
	j0zMZShXneDq1wktXfAwhGfI+ULp22PI3MQNqtBT7yfp6yv22c1DJvLjrGFYd2mkFLrodKsX7UO
	k+rd0hVFTx+Tn/ZvXreLbhk2/0BHU0O+6JGzDKeJnaMWlkbcPgyNHqKLJ4ard1k=
X-Google-Smtp-Source: AGHT+IFX+VmhiUBnmA4pNZEE74T73jbLUZc8BjmHxWRKCnJo1+RhenR8isYSZfLvtDMHgo1LsTb7Cg==
X-Received: by 2002:a17:90b:4fc2:b0:314:7e4a:db08 with SMTP id 98e67ed59e1d1-3159d8c5de2mr23707176a91.18.1750689332776;
        Mon, 23 Jun 2025 07:35:32 -0700 (PDT)
Received: from rpi4B8Gs ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a331288sm11812762a91.43.2025.06.23.07.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:35:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 23:35:27 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kisub Choe <kisub.choe.0x1@gmail.com>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <aFlmL0DtydfsbFl0@rpi4B8Gs>
References: <aFdAEM6GnCudvqMV@zinc>
 <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>

On Mon, Jun 23, 2025 at 01:54:01PM +0300, Dan Carpenter wrote:
> On Sun, Jun 22, 2025 at 08:28:16AM +0900, Kisub Choe wrote:
> > changed msleep to usleep_range to
> > 
> > Adhere to Linux kernel coding style.
> > Reported by checkpatch:
> > 
> > WARNING: msleep < 20ms can sleep for up to 20ms;
> > see function description of msleep().
> > 
> > Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
> 
> This type of change needs to be tested before it can be merged.
> 
> regards,
> dan carpenter
> 

Thank you for feedback.
I understand that this type of change should be tested due to its impact
on time-sensitive behavior.
However, I currently don't have access to any device that uses this
driver.
Please let me know how you'd suggest proceeding in this case.

Regards,
Kisub Choe.
