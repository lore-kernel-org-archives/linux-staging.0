Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7D28EA72
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822669; cv=none; b=og1+5q6ULCU1DffTPcd/fZD7DDmOYvRuH03tIt5AAU13YzDyE4Zoq9+orFaKPP4FSvlPKFIL0otXLoFqZur3rZI5dXsoIadMVrEEWy3ZT+ZV8hHoIjNdlqPfPaKuGwKEA4xK7WPji+9raBjw0NxtPol7JXdlVBGVIJr2Tjq/1mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822669; c=relaxed/simple;
	bh=qBo1NVVfmIRUMI3y7c1Qj+U2VBN49jqloyv8Gl87fUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dagjlK5Jc4pBeglvXqCeFaUsS7f5GtkcaNlsk1LUBDKLq5MdJEKZ+ve/fgPKgY3wkKJrl31kbahUCPVaN6d5tDe8Sq/Hn6bw8glFwE0I3CfyTJ9K0Tq66+DkjsCO10vwzsqyZTaS4zIzyTEbbuOnUawfNwGHFlU03NYjnDWIybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2ehrA0a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2ehrA0a"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so26853955e9.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 07:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770822667; x=1771427467; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1ze43IOX5RFLoNmSfwTTp0YNMSx9Sbi2Os44rYWPTc=;
        b=y2ehrA0aYGq8GVP49lmTfWA2R1517hmpj7pdL+ik9qqbGDa6fumy4rodLQDCDhAbxk
         3iJLtN+rPQtssuFYOlQ/x4cEXXQxpSE8ptluxsenD0XVxWiuiyljaImd1aIuGxjzXAZL
         fT1QfioHIRUvmtkfQQDxsbqvjIe+9FGRrpdxAYcghAgUs6M8RXUsiViJAR/1yW31qPuT
         B2W/MD8XQBjex6YIaaeXzFadb5YcD68CfFGgP9UBWxLa5CtHo0qWWsaazadIOhKgawz4
         ZoF3YE/jelZNoAohmdBe3fASVrDJYp/QC89CK8EcD5bTGxBW4AWpWZGiGVJdMwjnhh2v
         Kk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822667; x=1771427467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ze43IOX5RFLoNmSfwTTp0YNMSx9Sbi2Os44rYWPTc=;
        b=HvU/aOytH5NAT7gikPR1PjZy8FOuARDRUgQdMN32W2clH26xk4Vxrog5IQQ1wlBZYq
         BQJBIURyA4I1FrC54r8Fzl7OLGxuGN0XY3QIlynaIYmYuIwJqWUo8ljDf8A6QuMXWpUS
         28YyugxEvs7IyutPgmkpxBXIspV6GmQ4zcW0Cm+1Is9mpHbi5dV/h6PaDGcF2aRaROV1
         3UaXW81cGmkx26ql8fb6HdD5PDJHfhqnYZLjSEql+IWEMqJ8pvxEJkUqSWpWcwp0Hhi1
         GOjeHloiYshIxelRer5ptTLqZSrOt5vZ0HTvEV0K/YjiTXGFDco3biRsj21VdKrqrhu2
         oFwA==
X-Forwarded-Encrypted: i=1; AJvYcCXMzwXgO/O2wMPRzBSoxNgcOrQaLKvx4zODeInQrUiyu6j4PWlqWELHNdRu0NgdsibXKio1dNVcgGkUNM1p@lists.linux.dev
X-Gm-Message-State: AOJu0YwhipoQxgR0jixie9FeNGAjHLs3nznoTY22uTqDqPwdJv2pTmBr
	Y0yREz+LBwekEXyX17/+XW4mjU6W4QMekrkBThwXARiXnhmkFWdLlm7O+NbEcD0XodI=
X-Gm-Gg: AZuq6aICMWoMAGQKw9CYb9xL0sawLPjVotTH6OiK38n6VDR/iVISa89dCsLUI4mVLyB
	r8u/e11anWexw0Rey5N/Z+UG1ajiPu5/M+L64s9eyswXQKHT5IW/gy+8WeJxMece/uAVwmbICvU
	VRPPQ6dEPhM1W6xDis048qRCtAVbF0EogQiwwup9qs4MoTA03/UZGwurEhfEcsXRnSiF1ZePINa
	KvYtClcToYX/+pXp32NxWS5ogDvbyI0yMTPNnzs5evASPio1R32tSokWjNvxQ2EAHeWeb/znLnJ
	lWH7iV8GP/zbusZi+5Q64SiZqAtWq40Gey+Y7tNhqicmg4QggvXVokkrh3kTGFCmz3Ed8sEv7lL
	n3VnXPLt3qcDxLLdkk1YT1TMBKwcjxxXZfDBaytNTViFjoXz7+ldBuHR0T3kmipzZZaWZvzXbYd
	TrePZB7xuIf3SFFu3owbE3mo7FbX7y
X-Received: by 2002:a05:600c:37c3:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-4835d4dda7bmr41751545e9.13.1770822666573;
        Wed, 11 Feb 2026 07:11:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835b958b6csm59016425e9.1.2026.02.11.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:11:06 -0800 (PST)
Date: Wed, 11 Feb 2026 18:11:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: RachelOvrani <rachel.ovrani@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: convert nDirection to snake_case
Message-ID: <aYycB-fAZn-uTO6r@stanley.mountain>
References: <20260211142423.4922-1-rachel.ovrani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211142423.4922-1-rachel.ovrani@gmail.com>

On Wed, Feb 11, 2026 at 04:24:22PM +0200, RachelOvrani wrote:
> Convert the variable 'nDirection' to 'n_direction'
> in drivers/staging/sm750fb/sm750_accel.c to comply
> with Linux kernel coding style guidelines.
> 
> Checked with checkpatch.pl --strict: no warnings, no errors
> 
> Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
> ---

What does the n_ stand for?  You can probably remove it?

regards,
dan carpenter

