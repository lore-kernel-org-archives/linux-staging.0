Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565633AAF4E
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787511965; cv=none; b=nGc+TGP4JsS5vMZ/HVYNEW3tTy6j1Air5AMxomTnjf1vgoCyDmx5jKXWiui1hiJe094AVbs6ppuyTvYV+DwIvGMQjTI6965MmkRyOtoaTvS++6q21++HRwsW3MmDqMlrGwq5LREGsTzjPwnrqBebrbgqjiPBsXtYmnZJ3tULk6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787511965; c=relaxed/simple;
	bh=XfsGXjPYvOgBH3lgJ5Jd2nbLvT+HBHOu/4LjvVeSYJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRU2npCNb6vTBjmwC2+EsTjD3g2ZfGsUeQ2q5FdUBT1kDLJnK9FgTluruhJdVEDzeU3ybinkDOncNmsU8Z6J8QSajWDDjHxxEYE+W6axFkViWk/lpmCjTRtNhBOFUa12H12Fz3RrABfM2K2Tp+h5idaJfPoXcIOZNgu/WdRtrEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH2EET9r; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH2EET9r"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so23728845e9.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787511962; x=1788116762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xaSj+uAc4OTrFwl49ZStDMK7/BnhtWkBx/ktIwYkmSg=;
        b=gH2EET9rBP9e2YhkhHYFlhcoOvX/FnBuQbyxwV+QGoChpHza3QRTJX3n8Brdh1BfUj
         oiXdE7wyw8575hPXuJqe/YWRJRwWXbNhXNElqMHnvA82RpJO+b5m5lFgDx9SEUz3TuN1
         YnAC81N5zN1u4mgY8JkUAZrlvY3hMu4M8DufR6maxYf18MAWXDetbG8A24KBo/MLGhMJ
         WAhUWRNIps1M1BnSabA92I1oPdQlLexKRz7Qs7CGGJ39YwvOAPZX2goOClMBk3W4z666
         to0UoJLrzM6yGdI8OACwmYOwuZrmQpZP4HqtolnNyC+Ji3bV4FeAX9g0UV2OX9L7Hrsi
         a8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787511962; x=1788116762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaSj+uAc4OTrFwl49ZStDMK7/BnhtWkBx/ktIwYkmSg=;
        b=G4oVTACbmKojOsLUGnZCj+KNyqCDqsutFne89055Holt0+8e25Hu6g9WuoKrkqqoC3
         Umak6hQk/KgPVYXw9m0SslK84urRqrDr8jfkR+HH5wl8M9vs9qTSFGNRMCXQxEFtt5/o
         YDeuIPy1yEPZhvU1nxUAk6ptNadzDlqaUAMlB7jKerE8yf+eaOva4ubzugYzyXdYEssf
         rkYOGdUdduGiAt4JeFf6jYfF58Q341U3wtuQ99mgigg49QTA3MpjIXKXY/IEIuEnW+3J
         rVuh7J56LnIGrwwOPt3pexIlGxWGPH+zma2lAi2hTxOiHQnjp24mz1x/Vw2gTMROJOTP
         Gb9g==
X-Forwarded-Encrypted: i=1; AHgh+RoY5V/LCjQ5hsYBKNBZJhu/SE384xThbnRI7GCxkLu3FkI/YScApdvhYUiB7w9kmtoj5dzfsRI6nr9BOOYn@lists.linux.dev
X-Gm-Message-State: AFuF++msQaV06lvu4L+0C0ugZkYDlD7AN/HgUlGofXyVRRz7hsBlxaxh
	CkuJwG+O3a6t9CCQpStTvaUUIpgOB+HzgTOh/9+t9K71MVSbt46VYnv9
X-Gm-Gg: AR+sD13YPr96MtAgKgnGgjHOEa/IAx1gMeXrDlM6wm9mvyBvEOoa7nZ76csfc6/uBsi
	ptM9bNjSppvtp/R9rb9wfJaC/oM1WZwOU9GvdXlU1ZgYHLuhZB1CeyKlkMReVrM5cq8o4NqEYML
	mUR9IaQCLeOLYgCIXWnJRiL+9wbgTAnsiJnoUwIxJx1/Mrchf4/G12lK/DBIx1FEhkoUxfuFDDx
	foITKAJcxuI0nhKyUPGftG2b1l7Dh5aZjm+/e693PSMAfsDu+zMTV3LP6iSl189CTFPgXmVIM7j
	Qs67FcOfCMwZX2DNiSKmgXeugf2rFmMeUcCtjDY61k1rYluie5PLhYI2eIBYOanavFAKhdsWIV7
	BTSYXY0h+UWojzQYWHPZZXy1PH5kvWFrCQ7JgaaY445iWur3wRpl6VHOp/LGsarO2adchNHMihj
	SAqE4Rs8GwbCQMggU0TAeCkfc+d0Ezenk3raH/kEqM+y3pn+B4ddFzWzYX
X-Received: by 2002:a05:600c:628d:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499c19bd51emr127271045e9.8.1787511962469;
        Sun, 23 Aug 2026 12:06:02 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35a1e35sm56743205e9.13.2026.08.23.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:06:02 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:05:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in
 rtl8723b_cmd.c comment
Message-ID: <aotElu2WPROFZTl0@stanley.mountain>
References: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c.ref@yahoo.pl>
 <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c@yahoo.pl>

On Sun, Aug 23, 2026 at 06:01:43PM +0200, Tomasz Unger wrote:
> Remove stray spaces and tabs before a commented-out line.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no new warnings introduced by this change.
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index d2b44ad60a4c..d39ddf396f64 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -895,7 +895,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
>  		DLBcnCount++;
>  		do {
>  			yield();
> -/* 			mdelay(10); */
> +/* mdelay(10); */

Just delete dead code.

regards,
dan carpenter

