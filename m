Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC7224CC
	for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748011; cv=none; b=Z4UuBTIVzIhziq/mtRhAwk/Cf4M93eyzMexcPkffBtv5R8/CipSGT0UAjcwSL2AholKccETQG009flzqanLFl2bN7s8NAbJ+21jPOsC8QzMjjQXEPa+ZRMPQJx1chWI/sHt8BJ4m2JEd93Zvt047snMirSQ3oshrDLdCdA+aqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748011; c=relaxed/simple;
	bh=UTJYMf+NRe+rvxB+RF4YgiuMYkKlsh1f8OgGGwkdlwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz1wPMSC0uOwnZZOEQVsONg8+fxVAvTijDu6lClQFKFMxLjWB+Qm0Da2vQTnvMu5+2oRHnSoZBnNyPGFAm29C3e7bovm0lqiu/OYUjJwxC/4XizBX2HI/dS+ZdUaz1uU57CEll8qDxvkKEUydeTeQSs2LdUypYYjHRp5UJLk1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nq6hXL0A; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nq6hXL0A"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5684ea117a3so5774090a12.0
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710748008; x=1711352808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1S8gaPXAtnKdawB9vZ5HJ600QW3oApTxrNP/2KihUaY=;
        b=nq6hXL0ASB4vRdPX2z13bII+r7U4lZJrWapNyuPLx1RI9IbBzl8Ni26Ym+zzcIm0Dq
         9ODzpCwgZC9YtzinDN8PzNOtulldPCxTErVWcv9y9eMC7KJCx91qdCLr2tIVhsXg+srH
         a6aKuOfrc3xXky2XaqJbnXvuqPfEK1cWuleorW08jVI7jl8dS83IRxGANW5WD/Yuy6g8
         o5xqo+eLb1doWOjOnTx0UxCo6pWGXKMYh9Nweql3TZ790ZilZqNOd4tUVQgErMxS94Cn
         ICDEyKPn1+2Hhzxa2bgmzrpm53NpImKleOOLYI1qaDA+llQyrTuc1uHJmJWNFotZlwk1
         t+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748008; x=1711352808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1S8gaPXAtnKdawB9vZ5HJ600QW3oApTxrNP/2KihUaY=;
        b=krCxo0gM+nEIP9scztdkkpsJC9uyCXmBjnwA83uOhExsmWs3z0L0jJL15AkPnfnLSt
         A8x6fcYzYrMv6PDizHglUB0bxI7DwlOIJV3Mp4H8YVvccDjm1LMxg9Bt2f+X4pcezjGp
         DUbjJIU+zUpM/fJmVnqK7AsmXurzPqbje78MQjOImmD3Hbymo+lqDqJ7gt5dsBeMNl6s
         kC9CKfDkwGa8vRd06gYBz5UWqQax3Xlh9VstuPlwzpPzcD/kFLuIB23zXqNav5eHWnPP
         Tzf6Die2EyEz/X19m3p3rw3c9HnNyfwrmKw2o+PUaq7++HRQaMRpVkMt6UYhHNkX7OKr
         PW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWb7eGk8KA+7MlNO1HPjjwm5/xIStwWBNGmzQyku2N2JeEyr/qwczf7IZ3qa0ZmsGSG1SnnCugxaaQMsQ/b6IApDBzG4p3Ekf0is2f5oQ==
X-Gm-Message-State: AOJu0YxdNj9Xe5l0jZjgUWEc8FsuSo3FyVpi6Xyye3vulp8s/5ZonAM0
	r7D/qTXE6LXwkfwJHaDcEvLJfWEgJnLbqEPoFl1+wQTm+LjDOgpDDEXBzUaP18s=
X-Google-Smtp-Source: AGHT+IGqDPxJV0DskYtRlE0rM526L4YfePoEYEQmPu+WGA9GEZOFbtgzqJ82dKbHS/Fpr71YqKHykw==
X-Received: by 2002:a05:6402:4581:b0:568:bda1:9630 with SMTP id ig1-20020a056402458100b00568bda19630mr3449092edb.7.1710748007599;
        Mon, 18 Mar 2024 00:46:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p4-20020a05640210c400b0056b0af78d80sm431346edu.34.2024.03.18.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 00:46:47 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:46:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: aggregate conditional statements
Message-ID: <1e45558d-2a89-4cb7-a855-2682b54bbf12@moroto.mountain>
References: <ZfcxGebTKxVUJONY@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfcxGebTKxVUJONY@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Sun, Mar 17, 2024 at 11:36:17PM +0530, Ayush Tiwari wrote:
> Aggregate the two conditional statements into one conditional
> statement to reduce code length and simplify the code structure.
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

I'm not a fan of this sort of thing.  The new code is fine but the
original code was fine.  If you were going to be taking over the
maintainership of the rtl8712 driver, then you could do whatever you
want.  But if you're just sending drive by patches, then it's just leave
the original code as is.  You might be right.  But it's not worth
debating or even thinking about for more than a second or two.

Someone was complaining about my code recently where I tend to break
things up into separate if statements and they were like "You could
combine them all on one line", and I'm like, "Yeah.  It was that way to
begin with but I was fixing some issues and I deliberately separated it
out for readability."  So that's one life hack which that if you don't
like someone's code style, just find some mistakes and re-write it.

regards,
dan carpenter

