Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77120FAB9
	for <linux-staging@lists.linux.dev>; Wed,  5 Feb 2025 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735249; cv=none; b=AQhy5S+l8O5qUll4v6jjbum0t/GNh5rn8ZgUihb5OYKF+72zM7f+VEZdDYbPSbwqiTTlF6mxCRBhoK+usN0NWideD6LFIt4uWwLo/slyjFM9/tfrd+FN6siTwzVUoUDMyYZ+yHU+HtAGM1kZal4iIjuLrn1G3zjxtov/aBTrAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735249; c=relaxed/simple;
	bh=NBRaSD7EqLnT+cNWbYhjzag1hsHn4NX+OyaSkwAKLlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwVqs4/si3+ryp/NAGTALeTzbptItcSaWXof/s05mDAm9/lgyEXjx7N/UEcrNwigvYgajctBxJ07mYPDAXZU5vf+/doBVuPLc4SIznxx7DeDOs1sH91aQUX021ocQp3eoZ2jLIMZxi+E1Wl9r2VSmY23oJx40PLcV9QSJaungIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SF3yPzQN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SF3yPzQN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38da6dde4c0so720053f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Feb 2025 22:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738735245; x=1739340045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNlXudGlTk+y6I7fRQAl7i28jnOA/Bs2ncG+/V/GbQU=;
        b=SF3yPzQNtw5N09Qk4fT5bI7JTTBoc4nNxJvXs21ipCYXSPuRgQc2ZK/7HYwsnlL1XV
         86wxgGqY6ONlGRfA0qcqWcMd25paS6LE8csDuM5/e3fUWJoP2AbeBL7yCxzbP6NihViH
         cXlhbsKmYOKqYd97w9NMZUE88HQ90JC7fSlSoidW5NyoEuVkC/fthir2r9QUxE1pMYJP
         anu/9eASxcBPyRaAzgtGHavIgGewTUplcTRVDkBgY/zMSKhTq8gll7Ebe8EPIZwXmyB8
         pI14glRgHKJhPN6epP4SIvmM/NZBIO6kDlorfHfLyO+n8gy4R8ud+nTdrtgGK7oLfdb5
         K7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738735245; x=1739340045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNlXudGlTk+y6I7fRQAl7i28jnOA/Bs2ncG+/V/GbQU=;
        b=W3qhxk8bz39tYNZ9YkVEuL+ttDrH2OWKsjjxVTj++2H25ijLPF4DUvc6LuLEp6yM+g
         TXSrHY+yIeFhkI+22Nf/dLLmsFWbFChLm+qaxE1WCcwY3vOrl8nZVzyPDdOjO6QPoYnK
         brA9CBFfJj3lHPJgFNjIN0jqkkQlscU/MGGuMf+bwE+l5O6cdUAwhb7wuYtfdX1Pn8Bb
         tJArUKHtuU4ZRO44ZCqG955sHR48esgscfvKU7O9jb8fhOHV9DkoQegRtWrk+Q/fwoXK
         E2j8JO0SCMEGQwuqoQ7jYlqPA00RS3sIv3d4vkxv+AJ2f64mr11Rz08/Qw1AJ8LhuePv
         CBFw==
X-Forwarded-Encrypted: i=1; AJvYcCXMVZ48hlOlXaEKAFA7rD3RMv9rjRa/K+CFRxLAP/HDt0ltw/q27AlrO+ij6ih3l3xRR7lVAN9ytHebImnu@lists.linux.dev
X-Gm-Message-State: AOJu0YwEs8IXiUQr7IR6yR0FpEMEgggM/JacHrHJ5ajvEzP3/Fh64w7k
	46iA6IHIXveXeCAicxw/1q0MSenWJWzeBo20Bex5PaiYjCImx3kyIuQLoa25Eppz49wIHhXWhvv
	N
X-Gm-Gg: ASbGncsG6s1+ZNXIQLj+jp2NnCYahJWM5NFRqtjSn0yU6cINOsFMHb2YcAiuiRnW5L8
	JrdgUcSLlxFDHMfqCIX+Pww7IAHyyaAwTpoYL42SZLHzyIYGdGa3/1zsNaZJ4oqKN2VsJcpe8RT
	g2UIuNYWj2ogeK67/ooTSCb8Gt4sxbx0B4+wbUehOnwMAXGIEVu9S5VHcEQ1xKN7iMOK64BLhnp
	+adLpi5T15RRtJBQMKnkLIkgW3hAhiepLA99phv7T8z8hxAfnhdLJFqyIbXV5ck+87Jva8l/UZl
	IKHPLqX5nUQXahkWfKCf
X-Google-Smtp-Source: AGHT+IHnXn/0+sVZN5phuuTMWLExRHIl5mlDiKCt9L49AJLiWu+ymeOzo7LpZameVlX8MAniU5iOkQ==
X-Received: by 2002:a5d:64cb:0:b0:38a:8d4c:aad3 with SMTP id ffacd0b85a97d-38db48bdac0mr791322f8f.18.1738735245493;
        Tue, 04 Feb 2025 22:00:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38db5b3ce3bsm656007f8f.44.2025.02.04.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 22:00:44 -0800 (PST)
Date: Wed, 5 Feb 2025 09:00:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian To <onlyian4981@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <e831420d-77cb-4ff1-9c13-1779981988f2@stanley.mountain>
References: <cover.1738720049.git.onlyian4981@gmail.com>
 <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>

On Tue, Feb 04, 2025 at 05:50:16PM -0800, Ian To wrote:
>  /*
> -Caller must hold pmlmepriv->lock first.
> -*/
> + *Caller must hold pmlmepriv->lock first.
> + */

This is unrelated.

> @@ -1745,24 +1746,24 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
>  }
>  
>  /*
> -Calling context:
> -The caller of the sub-routine will be in critical section...
> -The caller must hold the following spinlock
> -pmlmepriv->lock
> -*/
> + *Calling context:
> + *The caller of the sub-routine will be in critical section...
> + *The caller must hold the following spinlock
> + *pmlmepriv->lock
> + */
>  

This is unrelated too.

regards,
dan carpenter

