Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D6D512
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713161282; cv=none; b=QDdgO00lRTP6wTd5Cg7Jnbb0NSHNp3pK6U5LrK6l3FKZ/OLIw8gUfILOCeDXIWAguFGogbg3SetqWKbzUdFEQK+AZfpipDAbar+ysjjnkClEZvUyDi/MLCrvMKIGh2Y0PUaAUWhtoDdg8G9kx/q1j0auEwOeYCHouiYJ8Q9KRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713161282; c=relaxed/simple;
	bh=c7uBqIlqxc8EB+q1+8wjP39j05/0pTfzAZzFqik9e+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL7rJtY4cHqL6m/WDeUnyOnNLykvbffkP2yT3RJRvNFB6n/FATxL9vDZe3FVyvJbDQtYnrjsEhA4cfLDuMSXweG8WCrIme7VmVIkpkSBzJJAaPf3ZLnFFB293lo1SOnWasPFssZ5HXFKhpkHYrNixCVVgS7QJSMaVT95H7w1gWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J66ht1IS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J66ht1IS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso4232504a12.3
        for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713161279; x=1713766079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73LhydqsMgrjIBMP/2ZqAtd7p+VoTyZYOkWO7qOnBJk=;
        b=J66ht1ISX33h8XcnsO7SpqS/F2c2707Ri3VLzsrMXlFL01jH8C2DwTHsfmn1ShnJn3
         YcclZqPqlOFWD7StIvwb+FDT44sEhI96nj5L9mpVc1PF4Nsf5mbMPO1TXI6eUNrFu09D
         LAu/qz/88+mrejjv1v3C9pwfthdHKDxIHL8/u++UxI5IJxgWepeaiNbI0XkrGR0KKi5t
         A9mCS1BbkXF3Lj79uMKaupfkGsOktYFE7AT97gyrHAR0Jc+QYMvZo5J0iMrR6QhyO0Zz
         E76PtUp96+FC9TS8SmGKADXIPQDtncTfrMG0FahTd9RDKz347dbPFkP4goV9aY8/g7+z
         MUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713161279; x=1713766079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73LhydqsMgrjIBMP/2ZqAtd7p+VoTyZYOkWO7qOnBJk=;
        b=rL675auWdLPUci+epqraTWbqVLJ5ch19icYXeC3xh/q1PT6hKEnrmhaUZUn/TLnu9u
         o5enhpklhNYuXiwoYIoVmV1P+B95d4SNi7ajmfi4ea+F4gzpaTnOku2+KM+Ge1+Yo4Hd
         nRrnl3/mIL8qQypKaOS2AdJ0W5n1zlbtmabUQ2t1aDWqYh5I6G5FGBbKXcXSOgN5Bi9T
         7RSC4VtskIVel6KX3yUIruY3nbUzAZel2/JFSK9gi8iOtIEwqyhjbZbf/ujFQp1ROP+U
         1toxHxL3w8cPEa/CZgvI7EBgJhx802URnl/hVGtYPXxAFymrCR+szclSgu1hUA3TfbN3
         fXoA==
X-Gm-Message-State: AOJu0Yz7Vqa6rJ/F8VErm5yKySnSTLYPESGm4ftu6UIqPgY5cpwBRIbB
	9ToM1AoWta+HcS49MvU6RsNsuDsbAWocb5IMufI2eDt/YAeLsjauEkeEvM/Y2WhObV+N9cbMTuA
	W
X-Google-Smtp-Source: AGHT+IHmITPax4f4YySVTT5+4VdYth+661F0LDos4jMzkmbrI7jOh4X2xN6MhMQ7iwLoybhaB4n7SQ==
X-Received: by 2002:a17:906:1389:b0:a54:d3aa:64f with SMTP id f9-20020a170906138900b00a54d3aa064fmr150727ejc.62.1713161278500;
        Sun, 14 Apr 2024 23:07:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l21-20020a1709061c5500b00a473a1fe089sm5021475ejg.1.2024.04.14.23.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 23:07:58 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH V2 4/5] staging: nvec: make i2c controller register
 writes robust
Message-ID: <18f8a452-083a-4764-a039-437d305277eb@moroto.mountain>
References: <2024041156-renderer-shrunk-6da7@gregkh>
 <20240414150937.22621-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414150937.22621-1-marvin24@gmx.de>

On Sun, Apr 14, 2024 at 05:09:37PM +0200, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
> 
> V2: rebase against staging-next
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This needs to go below the cut off line.

> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
  ^^^
Here.

Greg applied all the other patches in the series, so sure, you're
resending 4/5 but probably it's less confusing to just call it [PATCH]
and leave off that it was part of a series...  Just put that in the note
under the cut off line.

Send it as a new thread as well.

(I wouldn't have commented on half this stuff except that the v2 comment
was in the wrong place so you're going to need to resend anyway.  I
think DRM puts their v2 comments there but no one else does because it's
weird and it doesn't need to be in the permanent git log).

regards,
dan carpenter

