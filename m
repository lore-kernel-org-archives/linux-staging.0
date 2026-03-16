Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B735E933
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649345; cv=none; b=mijN7NlEFWQTgEEKPzyor3hKowGCtYPWybUE2bMhDmyfeO0y/zO2Va0P+epLTxkbgV8hSiyqGUnt7hh9uQaIP7SPrSCVh2VBXoS1AKHHR+tE3s1b9XgvDAUJ6Bt4tT0dQRoi+27SjbB9OUuxg/+DRPxEuM3+W/RnzOvEg9RALNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649345; c=relaxed/simple;
	bh=PCJsEz+J1XE+XBYcCysNc1i8G3nfjf5crAsgjEDE41Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/99jVdJj2wVpBlbJhu+X3T12bxPn6jpIrlYHf6ph5Nv9d110bp/GNfaD2Z9v484Lsr5WVFP6tdkXPmFn9BYBNLBJkV1bEqbPufREy8uZ0F24nJN2nvro4N2sHk2SI8fTMrCPGLcUZ52en2ovmH6JdFiIWZvA0aX86pKUnUF66U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzEBh1C3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzEBh1C3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso3314381f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649336; x=1774254136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=58zReeQcnxWpumjl9fmQoxf1aEM9cKDIz8JX3YceXSA=;
        b=WzEBh1C3Fk/dAzNpmRoezkqz1djCgWT/iQbrJHiCXGJc52LFLgz83gjf4eDAjzgOqv
         tHIlYP8IjPls5jfKV+wRhVd/V9Oc+kjjaza9gvH7e4bfDicoysjodfjrOeWRswooOIzF
         /DBQoej7zPsj9B5gDkNwVVe5J9AkSkwPKOptm5VIxAeWJ2/qLmbHnC1+fWP8hQ1IOqWy
         tTQt+gR3HbAbos37eoJbtycZp7hVVvv0bKjwn0CtGQf+MDjTGPnwZPcEnn0lBq8S214g
         y5Ed7viuCbfVH/934yXzVPVeYZo0tWpeRKc4mkNi8xqdJiaOxrPTKahv+SV12p61+gAK
         SCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649336; x=1774254136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58zReeQcnxWpumjl9fmQoxf1aEM9cKDIz8JX3YceXSA=;
        b=kw0uA5lcT9K4da/fua8kYwx/Q3VLWqclqCKr9fxEyjhK4nML0spqGl8YiTazlZK9/y
         gpgT54R9BKtNUKIvvNgIsiLOnjAR7W1DwcK6EVg5HBM8bfQ0HgfzqYQiV20KLopLYJ/+
         ejoxx2oqlf2HwCS6rbggPqWAvB9HS9ISEPdTfK5TZxIzInrNzanZ+ctZ+FXNsCUnlAAu
         5ezK7YCOD0myrVAmkE1GZh3hX/y79Sn4lI/QQ2PRgKFZaH88qBxr8IRax49j/4QiWvcR
         CC18rfbQzhnzdRJX2+jzBU0wy9t6WDLkb7W7YaU+jY+Iajhd6Akv/jrnAWajyGT0miiA
         g+lg==
X-Forwarded-Encrypted: i=1; AJvYcCVMTmYtCc0eSWGTDvJH7heaVimUyB9hYx2JskSPH8yX1tzyHcOkbRTq2Ntwk0UiDw2fQ19NBnjsZiB5kwsJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7kA7WbBCAvQE7obkk1B+W2PXrxuX7GssPHpvAAA1r3TNX9Z2w
	K9kWT5ldJdSmEPanxj2BpNVqaCgPnd0HDhimdeJ1o9BjHYn+kqvt5jQ4DF+LrxwiQuY=
X-Gm-Gg: ATEYQzzw41GAgudKRnvaTL3SbVu76vM1Vg8L+FvERuGzCZ5vW1atnbYwqvTAlOti0V1
	poMyb7mnPXC2yzYbKqxtkk0PJJd8SFHMHJ7fLOd2334RmbWB7vhR1gkujPYQdcUpgwW9WNZRcui
	/RmPFMESpSLyBBK5rGzifoeOZOSApdKDlwi1XPht3rCDHpF2pLLkEKZsNvHg2UTTojJRdane6E8
	T16dCB365Gj9yPQHO/Fk7xrsqwlOIQJGfUAKYIz1AytjFT+yWn8VOK6eVJ0ZmqU499a4VSkSpLq
	1GjQeUyXa0B+s3cDIMS5kyS7hVhfT2r/LOuR+5nEeWs3WfQWcjzr6iXp4YyxIYsuhACimsLFxg7
	9hrqs2AY2aGUNoPeOeBZ/GhwyMKqd6IMD4HBf8lBWnM+eb5vMfX7TfC9dhWPpSXQMGyYvE4Ig6C
	1S2ciuBF/GEElJfI76IyMb1vYDERbM
X-Received: by 2002:a05:6000:184a:b0:43b:3f2d:7d58 with SMTP id ffacd0b85a97d-43b3f2d7fc1mr7707116f8f.52.1773649335679;
        Mon, 16 Mar 2026 01:22:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2617545f8f.12.2026.03.16.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:22:15 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: replace C++ comments with C
 style comments
Message-ID: <abe9tJq8F_lx6767@stanley.mountain>
References: <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3.ref@yahoo.pl>
 <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3@yahoo.pl>

On Fri, Mar 13, 2026 at 05:18:48PM +0100, Tomasz Unger wrote:
> @@ -314,7 +314,7 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
>  	}
>  }
>  
> -//#define DEBUG_TIMING
> +/* #define DEBUG_TIMING */

Delete?

>  static inline void print_time(char *s)
>  {
>  #ifdef DEBUG_TIMING
> @@ -762,7 +762,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
>  	u16 buf[20];
>  	int ret, i;
>  	u16 handle;
> -//	u16 mode = 0x0320;
> +	/* u16 mode = 0x0320; */

Delete this.  You're going to need to send multiple patches:

1: Delete dead code.
2: Update comments.

regards,
dan carpenter

