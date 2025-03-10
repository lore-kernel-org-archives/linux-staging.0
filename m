Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9822FF40
	for <linux-staging@lists.linux.dev>; Mon, 10 Mar 2025 18:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741630503; cv=none; b=fqf2U7+vX3P/+rrbAMqGDFcl9swKi9XCc09LIY8rah+C/ct7WbuxCiQQaSS0DBIUVRgIEvUTY0NKcJBdpr317T+RcQdh8myM7wmp3Vfzq7JdLI+ysrHvZuUNXfTz63KGK5k5BYc7qFKC3SSgrXtydh/MmyoYwjYCmO3srFWphk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741630503; c=relaxed/simple;
	bh=JtQ4T7DUXV/4zbw/s9ZH5QQTnRitO6guKWphr/3ZL+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxgxBMskoX0kMAAzBMs5WSjsoKDYIx5XGU4sj+pXmF/IaMIzZz6QEofM1QweYO4dSyRBWyaFBGb/leFyJlmYBFhQz1aSoamXPAGVVBwPa7uDkqru0MWvB27k3Iozgsi4XKnEHPD+oenhf0qUz+Tdf1l6IceY14s9v7/2Qofpmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JlLxRHx4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JlLxRHx4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso20613795e9.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Mar 2025 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741630500; x=1742235300; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3RzlGFhAvuM0cuDF00eJyPgemDXX9EL9Mn84ikQ4pw=;
        b=JlLxRHx4H7/8bRGwJsOga1CIw0Cs4JrtXI1i/7nPgp/LUQkVauaeMZczcqYFSc7rLS
         pdMHaTlRNYUzb0fb4YuvuHxeK4x164VBaJdHt/7CcTZxuWhkmMWSbB3XJSzaceHJQ6UA
         guT4b3V+8EFDYiVIzsXs4lmnScfyzIIaGOm4JWVscbADFlDToEA9WvzIlgggRpMYlD+o
         NzUgl1mgXNlpLIg/5SZFNAlopJ88K8wPJugRJtLQX0+SkJLNzIAkHQVZmzYsN4XMQvtp
         eLIsvUtQZLGegDvURNDOe+JmX0fcGWxSsmxqEHH2eqliuRhMF9AH5DNfQ9ppEINhaO3X
         5/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741630500; x=1742235300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3RzlGFhAvuM0cuDF00eJyPgemDXX9EL9Mn84ikQ4pw=;
        b=ZL2aiPd83nuzjMqDM3vrhX9gZCTyOPt7gsaCBHsYuuRa16wyumUUYZErngPuTONAj1
         5eMyKFxS9L0hTpdmepzINGVWNlhOvlXK+2D5IjcqrwF0/S+vUWt6x7F+pDE1CsmxCJvy
         LUxaxGg8Da0VVM4Oqt4pfG1WSX1jlTEZ6Ujof3Ckv6nIgie2dUxgdIV2MiDYKJxuTQvd
         igdp/Lv6w0r1/cfrEg3yrTLYpZdk2u0Vu6Jo7wGU1PPL9DvHhBkqtxtzFoDOb5qmOT4D
         axF3HJItgRiI/fz06pXDbgJMOt13iyIlH2WUJNZEva0YaBAhpI4S8/Dv1OqPrapcAsAh
         i7nw==
X-Forwarded-Encrypted: i=1; AJvYcCUY/o1F1zNTdtcp3yn54l8hV4lp3ND8mtBGs5a7teXupLvppAH7+VVgbNNVGwyCGGA1x/+GswC81movdCV1@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5+XgxghwitAWcvt6JHffouT4xWZcjwG0dPUwasPLN3ZsFTrV2
	9AB64tVTY+0AaX8Urr/AqQxcDcG5BfsQVnjZUbImT+h1omDL933DcxiSTqrOlNYjKe9Ah//in7p
	H
X-Gm-Gg: ASbGncvKD/m/o0efK8gWqm3ybdQn70vMQUnKqmZloLNuLV2jvTqWGQO5ODMGm7g6VjT
	0JZP7JbHpxjl3z0LFdtuGMVEsK9/i6VUHg4ax5GBPnraeVBWZ5+9nvl4YJ+8H+tyTYhhV5E1DOV
	+CuVB/2MdM6jJw/iMeqNQEXGbMrg443xdGl8jBQgnjFD/VVXGlDEEpFfsUoMJ3jnvCdqjj5JrCV
	MyfcN98v9V/s7ZO1C/1lRTvblu7xq9YyMy+M2fOO+Jz+TgkjhG0ckm5nTEAt0I031tL4w2kxF08
	Nnk7Uqn4hot0gQ6VGI9iMokxBTVuyWaNTfa3SxtCfHem6c2wf4f2+0fJYmNY
X-Google-Smtp-Source: AGHT+IFt3w/t0krndV7nu2YZ6CAjcoMbnNHYnSPvnNwZG4aH7mpi4yFNuonaavUpPD2h5koG09zTWw==
X-Received: by 2002:a05:600c:3b21:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-43cfee32d16mr19567085e9.26.1741630500212;
        Mon, 10 Mar 2025 11:15:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf7b88494sm45446875e9.0.2025.03.10.11.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 11:14:59 -0700 (PDT)
Date: Mon, 10 Mar 2025 21:14:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: Don't use %pK through printk
Message-ID: <eb4eeb0c-7cdd-44b6-a9bb-11133ff55925@stanley.mountain>
References: <20250310-restricted-pointers-vchiq_arm-v1-1-dd04f208ee55@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-restricted-pointers-vchiq_arm-v1-1-dd04f208ee55@linutronix.de>

On Mon, Mar 10, 2025 at 04:53:33PM +0100, Thomas Weißschuh wrote:
> @@ -2003,7 +2003,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
>  
>  	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
>  	    calc_stride(size) > VCHIQ_SLOT_SIZE) {
> -		dev_err(state->dev, "core: header %pK (msgid %x) - size %x too big for slot\n",
> +		dev_err(state->dev, "core: header %K (msgid %x) - size %x too big for slot\n",
                                                   ^^
You deleted the wrong character here.  :P

regards,
dan carpenter

