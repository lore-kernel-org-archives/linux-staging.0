Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689325B31D
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079214; cv=none; b=LFi4zuIPKX+Ky13j1PIbW1WN0wDWTCXRUHnqtgOmSMFbMt8MMTls3VKSzZ2ezMzq2bmiL5trW0viXtngzFbmFZinCejy9CSJ9kKClQfkIBbsXfzaIr7dt4mlFgJXM9cN5tV5//sCzDHG63mcOMPs0TxsINQ7KDILMNFzXgFNrZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079214; c=relaxed/simple;
	bh=p6yx8lVUTF073ZPW8VGoM15AxO32qRR9RZi9yjS0K38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R90XfF75UegHTk3uyeHnl6Idv/5buTSwqOJxKl45v2W8ItOjCiKqIeVbEkCU+FIwj0JBTsTiwk+RGbmd0KZ3TNdk8KhYQy6QIRj5AWh5Ju7mcFmDUP39YMVTkn6T2phRwNSW3QNz8Sl3PKlxBKShm01Pkw7btSpGHazDdS6TaGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0UPEdkM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0UPEdkM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fb14227cso26329115e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 00:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774079212; x=1774684012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubEwMaEuXbkyO+Lyt1mqbUhXR8pB9gr1IB+DXkw3SYk=;
        b=w0UPEdkMHcSjdpGeIAw3MxXsp72bDur4oKSo/BESl+X1nZzo9Z7ebLw8ULaJ7vP6dB
         Nxd77XOBNze7JFJarU9KThzupA26Y6aeMOQ/F7utbCHQYCeADIZ8DnE3T1MwFBU3npUO
         vs49Yq9uSWoZWD/R/yR01j7Xs3TYCNvGV93U9ppTPdeGngyPcjhwSCxwt+1SN67GBPb2
         65mM6Ycb0Iw6Opg9JjibPXMRpetHPxBaiNSgT8fTboaWJaMVP47i20CUR3Ti7UnFRzs0
         B1jlQva8zf97wbHYx2px5+mUSmp8obSWJxBU5FXvzgSHpGjkXg3npJIVHzOYB2nwyj+M
         9prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774079212; x=1774684012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubEwMaEuXbkyO+Lyt1mqbUhXR8pB9gr1IB+DXkw3SYk=;
        b=qvgWYhYRWVGSuxjkXe8AsX9Mfd6bmWUfrPnRsnqT7QODWKIA4Yshbs8j4NsQD5QKlw
         KLc0Gc9RwzvtRrtjOKDTRv5rUNTKl5ZG5g6JeMRH490FfW+R9vr3rPlEjUNQApoX4P3K
         wqxCaMlHMrF/rKMLrWM6O899cotYE/GYegsPi6KM9C3gw4mivQGvpi8wG+6Odex8OEES
         2tvqlfxqAwpXef1Id9SGgxN0vOKRXfrRTF6BlomTFhvGfdHV/NC59Tuf6CV/CVCGyVrr
         MTaqiAG7XfZtEAwKm+7qwoTKBeVTwicGPDoxYe2QBvU6WhQp1NqGWMsqzwEvSbqcHq5F
         VaYw==
X-Gm-Message-State: AOJu0YzoBAcilRSDtxSH057C9tVlxslKv8g8AdEMmZLb6ulpNz9SWtGZ
	7t8ix/ld2rUSAuhIlGFkOa+H5XsD15Cc339Mq2D9evnCZTCw5pGhrQZJZR87dY6anm4=
X-Gm-Gg: ATEYQzyYMCl6LhuE0vaBdLcb4ewgigR1gNq1XpDvPLDwdEpsn6yCGzdA7h3Z/6kqQam
	nP2J1W05KgZubIvLbRrAAnJ4sQHI9FsqfkbeNn4NrOea/VYm61PWYB/HwXoTPVPe1A0pfxHHWls
	gGmXSC5Zcbi1fRGkRqt7BnyPbvP8CZsJYkGCf/QgvYtuIhWcMhpfkTKM209hHOBtRj2ur9dvWoW
	Id09PhEsxU76hxNJIxTwF2APpALO3izi9VwX81qmrA110OU5hy/vUXahiJpa8bJixKqRJRCEkLb
	U7KN/WAVsDcOD0MVz0yw0/A5VTPhsbO6zQI5XUai4hJ6bghb9oPpeGWYA2hYdJOw4XW0mV3m+3+
	D9z3x/dCUb/nQasN6+pG8u3JnIB1R43J8IzM28bIu03nSHlgt0cJBhpVpdDJ6l4aNyyNUY/draE
	IPVfWZ0B/cKRIRODLQr4hMDPlNAjGb
X-Received: by 2002:a05:600c:3549:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-486fedab866mr76426165e9.1.1774079211920;
        Sat, 21 Mar 2026 00:46:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe032a55sm223880405e9.7.2026.03.21.00.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:46:51 -0700 (PDT)
Date: Sat, 21 Mar 2026 10:46:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: refactor
 rtw_joinbss_event_prehandle to reduce indentation
Message-ID: <ab5M6Hvs1_8noick@stanley.mountain>
References: <20260320154724.603847-1-azpijr@gmail.com>
 <20260320154724.603847-3-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320154724.603847-3-azpijr@gmail.com>

On Fri, Mar 20, 2026 at 04:47:17PM +0100, Jose A. Perez de Azpillaga wrote:
> -ignore_joinbss_callback:
> +	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
>  
>  	spin_unlock_bh(&pmlmepriv->lock);
> +	/* s5. Cancel assoc_timer */
> +	timer_delete_sync(&pmlmepriv->assoc_timer);
> +	return;
>  }

So close...  But you can't end a void function with a return statement.
It causes a checkpatch warning.

KTODO: Fix checkpatch to catch extra void statements

Checkpatch will catch an unnecessary return statement like this when
people use the -f option, but why can't it catch it for normal patches?
Surely, if there is a line which is just "}" then we could just print
a warning if the previous line is "return;"?

Test this on commits in the git log to find if there is a non-obvious
reason why it only works for -f.

regards,
dan carpenter

