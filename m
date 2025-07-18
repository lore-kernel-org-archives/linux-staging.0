Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6B818E20
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752873129; cv=none; b=S77RjPaXqCSyF3V6tEB7P1RDqKTE2fueS3fWhA5LP1i1Hawtlb2lcU2Qs56gpqr7jm0bb5l8nwslcVyzH3xchmaDZ6oyRVElix4IenAqQVnAJTNNrJFyZ7VHKWGOxZr7NssN/iOd8+3mnGTTQTttT9GAQfjlgl9q5lZID3oBBUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752873129; c=relaxed/simple;
	bh=9dgfKP/iy5R9KcD/n7TVWQtvSbAp2EUBG6qftKhW+hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuZpA7OxhRmWsEFBrTnYxwzXxnLuLZ+rBDoi/wo7fiFnhcen3N5vUWDsBnRTCWEQHVYgra/71ej3s1Obm3TS5JYsubeO7ztTKoqTzXuASyJdkn8D0CJ6fw/lwoCceFRFsDsNLioO1JFdOyA6tf8OoHjYZtdslAwM3M+2BwtmhFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fG43fz1Z; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fG43fz1Z"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-73e82d2eb6aso620069a34.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752873127; x=1753477927; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUtfg98t453I6/7H5HyoflaxgBnLbiL3E3jIi0OyuQA=;
        b=fG43fz1Zrl3b6R6ks7QcRrZsmAYjPQ5bXCIn44gwnbylx4r9NBPDFH1qny21tp/R9n
         3s3sNRP0xOdTTJuJvPRGYMANMmAUbCJOrxuuGUhvd2Z8e5r/A0p0NsJF3KdFrdsx+oFp
         LLL4x3EbyQnbdZJSrAIqmB/Xcaq6wva/0ev4tOcn/Z0zTkal/uNinEEXI6hwXsdiYpT9
         2Y8S/YN3MbQ265jbmzFZ2C5tlRDQU8/yJ42QvZ+e/tr6bw9WK1DUx4jauk5WFiXjRJuq
         hRMDejJmYA5cXBmMI5HM8XBORCZh1sH+EMfqmILRIHfUgKuE3veoAXB/7z8IxaMROJJT
         4nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873127; x=1753477927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUtfg98t453I6/7H5HyoflaxgBnLbiL3E3jIi0OyuQA=;
        b=iyoxm9uIVnKpdDMMzPJPwaxUhaFDWEJ6YPdEaxUsmCtsnUWzHG+ZgkN2DJT7A+otp3
         LdXVmqqcG5yjYn/k06oCVE0SRhD2oPqyfLOj7ZmzNHwP7aac4AXbfBLQuKLxGldkElAY
         hxebjQDdiV6DnnsYPrQtQbghhh2gp271zMmXyGD/vDZAa2kXGitTiwIVOX9Wxz3GQTpP
         ZphTksWv8qJMuz1NBIyy/J8rl+6PihHb97wiGO+DA0ro4k6eW1TTSJ1X+XuqVWAE9i/s
         nQnhkYFg1WwtH+P2nmMXMficqnFAINfQfZBVtRQlmuHKOEUCRW9PPNO5e1alBp/WEakE
         DLyw==
X-Forwarded-Encrypted: i=1; AJvYcCXCEbqKkCmKHk73rI8/bevEhPv8ZJPhw0iQf1Sv0Cl61G9RVxcYy74Yo+yAcst0oqGMXLLw2PkoETCSySxJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx81dD8qCqdxwjpOzmFRHBNKEILhAUd2ypOcUAPTmRQyR8gt3CC
	bNU/arAxm03SRlF4TdEMHn2Pjd7WqFWGvAePVwG+W1QK2NuOoMO8JaKZfvEpXblex9k=
X-Gm-Gg: ASbGncvWLTGm+OpdSbcWUVhPoi8sPQSYfaKWxN5oSTT2doIZiI9YZQttmgKFBm/xpQ+
	enmx/kdnyVPC63ECBdtBwgIjzYeWsneJsRXzO8JytvNWOabV2+5lnmaFFLh4/C5lA58LQ64gQru
	5GzcCj58hoLB5r8/u75+eCfujOXr7GAwhAnsy3DhiE0vrLoDBTAJMqbab77WSQLh6o+7kc0izSL
	vySOnmLnhv13jVhqsBInirDxfo+tclCO5Gq/3iaqnUowdi3rKuZ/4xhmYq1LK9M3xrqQ+v4TeVx
	rPRcTP2t66IBqUtrtEgySi/A7yJ3RSb536bryT2W64UXngMeOXGRSVGnSJZc9BzMZ0mqPgqFxvA
	ZJJpQXuk1I1TV57krLsIkgtOQEcejPZOrDukP0/hP
X-Google-Smtp-Source: AGHT+IGRM4r0A4qeTWIEM0Q1ZLaT7ecpPl20SkJjChvcxhfMeFp5A0MKAP/uo2amAlDndWCGrrlp0Q==
X-Received: by 2002:a05:6830:64cb:b0:73b:1efa:5f6b with SMTP id 46e09a7af769-73e661b524amr9973424a34.14.1752873127035;
        Fri, 18 Jul 2025 14:12:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83b0e55esm933388a34.42.2025.07.18.14.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:12:06 -0700 (PDT)
Date: Sat, 19 Jul 2025 00:12:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: sm750fb: make fixId array static const char
 * const
Message-ID: <a3813841-7639-4686-98e3-9c43af2dd287@suswa.mountain>
References: <aHqzFn6CfgWLNa0A@MacBook-Pro-de-Ignacio.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHqzFn6CfgWLNa0A@MacBook-Pro-de-Ignacio.local>

On Fri, Jul 18, 2025 at 04:48:22PM -0400, Ignacio Peña wrote:
> Fix checkpatch warning for the fixId array only:
> "WARNING: static const char * array should probably be
>  static const char * const"
> 
> The g_fbmode array cannot be made const as it is modified at runtime
> in lynxfb_setup() and lynx_alloc().
> 
> Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
> ---
> v3: Apologies for the confusion. v2 accidentally included changes to 
>     g_fbmode which breaks the build. This version ONLY changes fixId
>     which is never modified.

Heh.  No.  The patch marked v2 was fine.  Either v2 or this v3 is fine.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

