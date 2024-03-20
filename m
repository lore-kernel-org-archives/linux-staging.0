Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089912E40
	for <linux-staging@lists.linux.dev>; Wed, 20 Mar 2024 05:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710911302; cv=none; b=Fg8WX7V9mjSHNkqoPze775nqRSVGG5f+NzN0gJoC1VJZYqW5F/xUNcUpUTYDsLlWljkTVJWYxFS0n7dOv06fVntr/YfXCCbpeE7P87i47OHckZc7jyN+LygPesIrv6+zEAifaqlgxIVh16EK3MJVU85A7tJRtfk98OQ/9Fip7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710911302; c=relaxed/simple;
	bh=A1dK1FDTClBBeiIDvehBrkcgKHtbJHgy2lmHel3n8Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBF2YDOje21/W9mGEzLFQHj+itS7h8rq3sJVUuvaW1ypVvsgeI8U0UZgVAiYc/k2KOB84iPjgyEUoGxv/bg0Hq8YIm7kEw6B35R3wJaTRY9fMDFKRz71AFSAL4B1Nn9MV4KLe2CF4JM8x4Zxd84phW0BKE6DLN5yPyZv6ohgzdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbaaO9tE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbaaO9tE"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d46c44dcc0so77172281fa.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Mar 2024 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710911299; x=1711516099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDbezmp48NlomGRK//vO3jPNjuF0l+ROTMlkX7vEssc=;
        b=nbaaO9tE/AwG1WdgApKXvDdYzyd2wkTZHqRevce5B++66/mZTylloPXIcZZNvJJKtk
         1cebeH9CKGioimD3FoWUTeSwutjCPS/lCLjnAe/7OXeDS7x3faGTmui23VDihJQ6fJv/
         /cQb86ZrfKJFv+nxLt4S4jScfLwShF71E24WCBEc+PDjzJ1cIoLR1w+Lt6RM6CuqK6nD
         DuqYS1jCXwQ1viWTViFc3TIlkPsCwHp7YZcxjERdQWO08eEJHxEIL7g9eJa2lBzPPHNU
         50CZttBr10aGYoxRxFMZRpd/v5PoaWIs2EvPZpKZUbBJuAvZej4IKFhfOxj5jxH8X4HC
         9/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710911299; x=1711516099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDbezmp48NlomGRK//vO3jPNjuF0l+ROTMlkX7vEssc=;
        b=TFnG4HLICeySsyJLEMPJzoH3Knvm+AKiqKeYKGqCWbnXgMTjbOcb6BO1tgzffdzVNu
         sgTwfGYr3dWeL726QmAmBOOmbAKqL20/uNnlMW316mIIOJL6ZoUNvwBDpmzF4apABPPK
         l4MdXkwxq3Su7dn7EJy1QgOiTtLGLbfw7S6Puk2W3gYZn0OANbV6CHEAo0XPma2PVvj7
         D23WVGHN8l9bxh7dGD02dJSB3PKDOH6vHb6XLP3eFDsgnCoHgbo2zZFkj9ugoOK3fidt
         /ntLhPGEueEvFD+FjjkdwpV/WFc4imbvexrrW7BYQDLBSxEYZ/fUOLRk0aloUJu0sDx1
         Dcbg==
X-Forwarded-Encrypted: i=1; AJvYcCUDaAYaHPUow3zQFctjXTggTQtoXEDUv6Uy36jpoqMAnhg44GNOTlv2hyf5CqQ7iVf15IT/5/yOjr5BIKfiaa57qNGt7+ET4YalSZ/mfA==
X-Gm-Message-State: AOJu0YwAuWxKGwmeQGLpo6qkg2XTFSzyIdKUyQRSBGBCK0ZpvYF5U/hb
	e31SYYbZsH8FZjbjOUN243r5AP+UtY59/F3N9tCW3ddk7JRXJPOK73KE/aL1J04=
X-Google-Smtp-Source: AGHT+IFHREE/lnhx8SjTOBAgPbDyrtU66YBCV4semN7SKN8NIdNLbGqeziR344GPCdUdj1AZEkyvFQ==
X-Received: by 2002:a2e:a724:0:b0:2d5:9703:263c with SMTP id s36-20020a2ea724000000b002d59703263cmr2766745lje.4.1710911299145;
        Tue, 19 Mar 2024 22:08:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l13-20020a05600c4f0d00b0041409d4841dsm912164wmq.33.2024.03.19.22.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 22:08:18 -0700 (PDT)
Date: Wed, 20 Mar 2024 08:08:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chandra Pratap <chandrapratap3519@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: sm750fb: Replace comparisons with NULL and 0
Message-ID: <c4a5e9e8-214a-4ac0-b8ee-01a9e7a1e5f9@moroto.mountain>
References: <20240319181735.366565-1-chandrapratap3519@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319181735.366565-1-chandrapratap3519@gmail.com>

On Tue, Mar 19, 2024 at 11:47:35PM +0530, Chandra Pratap wrote:
> Replace '(foo != NULL)' with '(foo)' and 'x != 0'
> with 'x' to adhere to the coding standards.
> 

In your commit message use "opt" and "*opt" instead of "foo" and "x".

Removing the != NULL is fine, but the *opt != 0 should be changed to
(*opt != '\0').  There are times where comparing against zero helps
readability.  I wrote a blog about this, but I had forgotten the case
with the NUL terminator...

https://staticthinking.wordpress.com/2024/02/20/when-to-use-0/

regards,
dan carpenter

