Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDE33E9584
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203442; cv=none; b=hplwfAkbOG6q/NDCmgRMIH6mQUpuhc9ZSK/nY67RdS/dzYuw+Ct2QSNTvRD3nrz3h1ZH8j2RmqI6IMdjI92KFY5s7/QX/Yxr5VoSzB36j5HWMzyfLAleDrj95jdlQo4ojKeWlGE/SuYknnz7JLLeItAy0Qob5g16rPau+iafofw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203442; c=relaxed/simple;
	bh=ZKSgW0O+qa5eygGMy3SgZ5TmviiTwJ16vShc+eliAsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+SSGNYHXXitquykw3NUciN6vc51vQyE/RCRImao4WxXt7OkpjeaKlS54eV1t+0eD9sd/g3oyWUwQJjmOuCs19cdjP38568hXc2sPLYKuNtRmMOPeQBrkcLGUgym/XyhWP3JvLIIwe+t9zDJRfcDt5of7Njtvhc9PHP8/Csnx/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d96PKqss; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d96PKqss"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee0291921so63524175e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 03:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770203440; x=1770808240; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIr1YulAlgobkWRt4PikUjH7ZPuHX71f9MLxBLtW45o=;
        b=d96PKqssD0mub6pjSoKiHzBWxR6AqjgIVP1X3ycNUcLQWgWG9MuqFCB4rOurIeWBof
         HWfoRvWNgaeaczlscRpD4dimC29pTqWmbNpHBZlhk85mYHAMi970VJuqUNorzT1atCmx
         UaDG9Es0N2/FDL2LE6/zdsLz1KD5DnU05ej1u1ztZIEaSbZ2cV/QapNcra2ejFSNuPjH
         loESXoDIRKgSXa/iMVvBG2SxbKO32zEAUT4k9aiTKDFNzaRP52MtOvxb6OkBeQ6HCyyc
         h1nalWv/Q/LWpGr4fEoCeqfxXaDtmuZj1h0bj0fupZS9Doemt6LsGMDnC9xgxhhZY+T+
         UUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770203440; x=1770808240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIr1YulAlgobkWRt4PikUjH7ZPuHX71f9MLxBLtW45o=;
        b=LouguTMb9jxFa6o6/+s2GN1IW+h9R1CU5S3gUyve/vNEY1yGz+6xX2u4fcBTnthYZi
         tQYvAvJbKe1sWNXUajr4gSLglZ34hNEAY1sGZ5CRpJZuSjgXM5PSMKjztn1cnaEEXUFK
         gXpvX9D49yPNenaRcqGaaOxlxjTKsenuMxkFA4qc1yM48AHJRKcJG+y1EOv0SPgMY80o
         6uv8lWVJ80cYrOEbAP/zApkEkXyJG0RSThQowWKmP/TEr+ghUameWKRKCRTavI2UMHRA
         Vx0rB3V0mldynh96zaLhby8mSi+PQKHeBYX8hb+7MykiIbzSyRMl1lLN20GqJEqsCnWe
         P7HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgfAmEI9i5iDqCPwu33FdZKWeG62bqDP6jHJJvAsFrnwkZlu02ZWSGcM+4V5a2WvaFNPRkAsg6JZNr+5Ja@lists.linux.dev
X-Gm-Message-State: AOJu0YyCgunt8dDMaLDfpXsjJpgENI4l5UWU9/Xt7kOvHCAAAh802okf
	U94w9VDkFbZHtb4C/bsRUNGlDDjTmg2WMk4/Wqaew5r2b76WAwa1I9CsImUgal5nrj4=
X-Gm-Gg: AZuq6aJFyL3MOXNR7Y5aiV9srSej0va8Je1VpX0smR/5AcrcClN8DBhAr0Ql2uwpywC
	9hxdvB78RTHOJZTSN0Tjw4qUXeqUd2aM6+5KTVmahPzkMEuyhpIZc47E9AYpULewAY/Ne2wqGOX
	9BB/W9aDWKjEnaVdorpYCtqmYVLk9DD5MceeCOYC/9Pg7pTjFI1+P6UAiZdgqmUs8oIPH9Rk2gf
	SgK18/5vwFK1sn/pE/UGZ3e3Baq3gzDXfdIUd8UP8fb3Uljg0Q952amAAKge0mzqNdyYOzlMpAJ
	BHhTG6S91+w+aOLlueaNNdhOiBty4SU48BqUeTfGliRwJ/zDY9aT689WoX9aSGRZO0B1spwdCz0
	LY/mf/+sfcpjuJsmQYI8PYi47Sizr0sVb65sp06TJSXVQpuVt+5y0FP9qDw9WhqsQ6ExGlpjp5V
	ElmQDu4tCa/8hFiqfF
X-Received: by 2002:a05:600c:4e0f:b0:482:f12f:f35e with SMTP id 5b1f17b1804b1-4830e9310f6mr32222825e9.12.1770203440211;
        Wed, 04 Feb 2026 03:10:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831084dd88sm37722245e9.6.2026.02.04.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:10:39 -0800 (PST)
Date: Wed, 4 Feb 2026 14:10:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] staging: sm750fb: add bounds checking to option
 parsing in lynxfb_setup()
Message-ID: <aYMpLEM7ZfXglGbc@stanley.mountain>
References: <20260204101536.3311-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204101536.3311-1-iprintercanon@gmail.com>

On Wed, Feb 04, 2026 at 10:15:33AM +0000, Artem Lytkin wrote:
> Replace strcat() with memcpy() and add explicit bounds checking on the
> remaining buffer space before each copy. The original code lacked any
> validation that the write position stays within the allocated buffer.
> 

This implies that there is a buffer overflow.  It's important to review
this sort of thing and add a Fixes tag if the buffer overflow is real.

In this case the code works ok as-is.  My main problem with the
original code is what you explained in the v1 commit, the strcat() was
just doing a memcpy().  It wasn't concatenating two strings.

Just resend the v1 patch with the following commit message:

  As part of kernel hardening, I am auditing calls to strcat().  This
  code works but it is a bit ugly.

  This function takes a string "options" and allocates "g_settings"
  which is large enough to hold a copy of "options".  It copies all the
  options from "options" to "g_settings" except "noaccel", "nomtrr" and
  "dual".  The new buffer is large enough to fit all the options so
  there is no buffer overflow in using strcat() here.

  However, using strcat() is misleading because "tmp" always points
  to the next unused character in the "g_settings" buffer and it's
  always the NUL character.  Use memcpy() instead to make the code
  easier to read.  This also removes an instance of strcat() which
  is a #NiceBonus.

regards,
dan carpenter

