Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FB132B996
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749803; cv=none; b=JgjwdV6XaoUwpPH7f2XMeJ2aVnskcexQoGL7t3fdwfyM56ToOvD/+tZrk8xQ1Jf8qaoBWUSr6wRdl1ZwrRJcZBvluc8zsyz5uCZ3DU+jDzofEFYFxmLR8sfqPt9pKvvLBosbUxxZeZMCh/TdydU16iJWitBsB8gKk3aCEn9oxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749803; c=relaxed/simple;
	bh=ABvlyae2MlPEweeMTZz0vfbAFZFM6fkqgTeO+cQ2S3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7dUkH37ouA8gwJTQmcoQJsU0IjyOfWdkBkCpOH2Z16SAv9PWvc5kqwJ5iO6XkZGvv5KgON0pJIxwf43snG4RIC+n1mEIk8oaX0ZYaDf4rtscBODG4t0fEWEP3pdawvlGMLDbI6r1kZFNXHSYMf+9psQzJxMjI/oGcbK+14O4ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GPGdNk1V; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPGdNk1V"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4376de3f128so1703437f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 10:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770749798; x=1771354598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RmJydaHiLh6n5RPYJgTi8IL7eje4FP9OsyGcFM1QbE=;
        b=GPGdNk1VRjLfrg86S/dKiVtK+pmLLEH7/PqTh5QA/NgMXyYQN2dZqjy/ProkvaUT03
         m7e9Y62AJGsuc0+hH2yrmPZS62bM+Gje9+1bPvysO85rrYIXmAqWvwMBW++XmEJg0q2r
         YI5i6XdpvaF3wwJv/StHnj7c/lyyjmZyDbSBLgKf01B85gv1bWcWPoPtU4hUTvynebXV
         A9zRRqn98uufyKNerOtFHMT2kZEmC4vw8wu2XV0AcAmC+RrtdQqOx/NuUHaHIGBBDuQ0
         ueM75cfYRfPv4tLt4CDFWkczsWpUE0W7pWG95cyDCmq6MDC1ILgjXL6way61uFHoOQjc
         P3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749798; x=1771354598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RmJydaHiLh6n5RPYJgTi8IL7eje4FP9OsyGcFM1QbE=;
        b=vT7GP+m0QUBMl5gbHEB1Cqf1oyHPcebW9eha9vj/QG/AgBTUjLlj+Jfwzob+1GUWuf
         QnJlAvO0v9d65knjxXKGQfjm+3/7o7qVojfG3AxTe0csKGKyBtAP8Y8Ztkwky+mQdgvp
         Sw4aeWIfUoBGJvw0qr37KWX5kvs4GTedwEG+fUI8TA2AKlDcxIA9TaSU6WLhzzmwtdD7
         HlKUWZFbRR4h4IujDL7QdNLPGT7JhCXjLREHAzIOxBJA2mZBYOGNAC75OpNoHa4f1AXY
         TL11/qM1CM1o2B2hxrxKjkzUiQVo1u5aeOEb+2fqX3NMN1wa4wYtciK+/eb7rHcTGzTV
         H4/w==
X-Forwarded-Encrypted: i=1; AJvYcCV17ndrvjeiv9LpTBdg9SmDxwM293cTmwZUa316q41b2HmcRm+AbEBX9fRdjboAQklC/YS7m8m5ICTwZk2T@lists.linux.dev
X-Gm-Message-State: AOJu0YxACrunHGRj9rWFgiWs84IdMRcyVqVI0+2Jcfq3VpLKa4U+ldu7
	Lpz19DwaN4jRN8Xjs604rNd0yjQQNv4s9WvLRcnuJKTxkHB3rjIcLxNyA3XmRPGEd1A=
X-Gm-Gg: AZuq6aKCb5J5O9178ek6V5HI9ycId5R/sGknt7BEQBs0KSECdlpQrVVQSXY6zIadooS
	R9t6MpbqhqDYXVy1u0DaLL/T0u1DAb7uc/ABSUjQrEuMCtXbZuwf0QcHtfuAALUDmZmepcFQ51W
	XW4kLTFWk1kbCLZTKu4r5iwCAc7ZX7HZnC6roZ5j0kzN3mbDiAc88QYoe2Dt8czLuSs2WoD0gSe
	hfmdWkpvhdxEUUisuRfmCroFjUBuIiz6GisU4LOgEY+mtn0hhbaH5Tzz1O3zceLQBuU1/rzXCQX
	tQneTysQh0M54UjK74fHWcZbPlwmgL65A/GCJ5d1FyZ6C8+VF3hSABN85O42voxf29ej+cC/iWi
	ohA6YRPHIoR32Rswy+U2frwmeFmhHk5wdY9RLWneLGMMpYFtLcVrwanU/EC0xtkvpdKzUSFyKY0
	iKzBPdjQaSvYsC3rHJHBi4zrrsdkk9S/LUv6pJFUo=
X-Received: by 2002:a05:6000:18a7:b0:435:b755:c67e with SMTP id ffacd0b85a97d-43782cafc5dmr94474f8f.49.1770749793651;
        Tue, 10 Feb 2026 10:56:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm37247623f8f.4.2026.02.10.10.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 10:56:33 -0800 (PST)
Date: Tue, 10 Feb 2026 21:56:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: soufianeda@tutanota.com
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <aYt_XvGGEnnhi5MK@stanley.mountain>
References: <20260210-atomisp-fix-v3-1-b2efe28a6c53@tutanota.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-atomisp-fix-v3-1-b2efe28a6c53@tutanota.com>

On Tue, Feb 10, 2026 at 04:45:23PM +0100, Soufiane Dani via B4 Relay wrote:
> From: Soufiane Dani <soufianeda@tutanota.com>
> 
> Validate sizeimage against the allocated frame buffer size before
> hmm_store() to prevent out-of-bounds write.
> 
> Signed-off-by: Soufiane Dani <soufianeda@tutanota.com>
> ---

Same review comments as v1.  Please slow down on the resends.  There is
no need to rush.

regards,
dan carpenter

