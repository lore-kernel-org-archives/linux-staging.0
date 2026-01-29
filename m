Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C23783B2
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670309; cv=none; b=hgUCJseLhucz6dNNmVFNnFax/gNUSfpsDs6p/vcwZr3SG7n/3R078+j1SNQt0hv9nO4gmUFXq5xsSnfT6S891RCVWZAD+zPIeWajP3ZhY7ZlZnAasCbEQMxCA46NkbKzO7snY6KBU2bB94A9+FXGH+NZ6MUxsPqQdm/Oq3bV7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670309; c=relaxed/simple;
	bh=7cD6sv+qqmtIcQeBUVJ/3S1WxJ7raHe5Ra0m3TKuxcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKc+lXiblYjlGrvNz/uW0WVCeYF9pq47w+HgJDRvE8LoAtXD86gk9i5ORmTYrq9H4RTxl5U8En99sIIXdNfxRr/EsQlgf4h7KO/3EySyxgDclCbqBX0QQVU2B9DvJkkbSVdzNBGjr/VBXt6dBnCCaYwmeT1CPUcjI6FvGtt8AFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fS9X+4/V; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fS9X+4/V"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so6299525e9.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 23:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769670307; x=1770275107; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9iZOKKqf6KRyH3Q53I5mI3DNCz1MvvDltctEiG+6tBo=;
        b=fS9X+4/Vxv6ZxxSKZA4CiRcEtXxLtsrHKuGpR7z+uNqHiq4R8QYBfc/LXSATcdMwt8
         3VJw+ukmjwUe1XLLsNMzuvyorxICOPXEzk5m0qsw8iipUljrDUNSCpm9u5xgBCJM98m5
         XF13g+RvlufEOTFBJgxtj22QDwC75u4DhecdlKPQ6qUBoj7X7qG4VUXRuyELr2RXqTCd
         lQvefYyYaah136ikgy9bh1PuyIvXFB96T1UaMZcpHLxJDom7i4pa5xE59xNnLoMF4pD5
         iK6PukhF+QHmyWoxLotlrg9u16+vgPbLYCnB9jxiS6RcGgSFiXxHKs2EDXHLJ2wRvFyT
         +mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769670307; x=1770275107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iZOKKqf6KRyH3Q53I5mI3DNCz1MvvDltctEiG+6tBo=;
        b=s6M4tSmWTR+SjBIAuoUOuC/4BzK7ORracFvgQ53rM7FR+gjQuExCIO9qidFI48iayL
         jpAbg3vh6dcSP8g59GLuMCw2q85vh3z5+4QTiCwBRl9mzoglNLdhK4ahqI1SKCWuWXl0
         x/J3wwFihEEgKtwCgd5jk5pRhrnH7oWsjgByEzuSQRJ3qcsHuKscgaw5HJjDheXVUVEi
         BKzpkWeT0F8ftjAi2rPEDxDKO5zWSBlKcMBb6pteODQWWQcmGip0PV9Q4j8PATSzrxej
         iOU1Te+ck0GFWu+UAU8vCI9zec5O0jjFHhicMmkU+KHUBa0kOPrndmTMoprOwxz2p939
         jAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg3whrcdNTMBXZv9ArOnI4g3NfXDVXSggn0eVH+dYaapgBkB1gMrprY1iiBo3pKWPoClIjfEUpPlKt8zOA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6gPLoxMfnThub4f3oy40rbCrQ32TAU1F6elHBOzj7qCghvDL0
	del374ouVwYCRMm3zHK95x2wSt85q5GhlZX9/J/sm8Dm6TFVUPOWxp7ScUMGC4cX2jk=
X-Gm-Gg: AZuq6aKIYpsO6y8p1w+LAnGustIBh4qYBb2VxtkMdOsiVyQev+Dvx7Ta1EzpWjyOfxL
	hrKj8d3/S87Q3yLhW1R5ti32Wu9NratPWTSc/aafen7pEGsSjNtCc683oGpE1qdNtsIE8/bmlGL
	ypgNKCUmweBwkNlgDeDdbBnbFrktkJzGHU64Zm4KhBrF2uXiJI4NKAZtHZUkXE1Kh4mi3KI3tEL
	QUXeTBqNX6VobXscAFy+VIytXkrgHYyjWUsfj58+kh+TEdyFC/8DssnyXEggtPsw8c/WA1nHr2Q
	O8nXcwr7Q8GTUK8POarhjWfE1Frmrk7GXDpf5dTB8xTDNjN3ztFejr2fenjYcpFrVzMxk0jjl1H
	fsfUzj3UffySX3DG9QSMhbXsfIsO9lIABHtYAd1t/qAC1CkGMfpk/pvcTCbqaUVy0e9WrLK+kmN
	JaJHsWRTVIKRPe2eeR
X-Received: by 2002:a05:600c:6748:b0:47e:e970:cf28 with SMTP id 5b1f17b1804b1-48069c60743mr98052085e9.30.1769670306620;
        Wed, 28 Jan 2026 23:05:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm115306305e9.6.2026.01.28.23.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:05:06 -0800 (PST)
Date: Thu, 29 Jan 2026 10:05:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, bqn9090@gmail.com,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix potential race in
 expire_timeout_chk
Message-ID: <aXsGnpQ0RpsEebfu@stanley.mountain>
References: <20260129023214.1149822-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129023214.1149822-1-s9430939@naver.com>

On Thu, Jan 29, 2026 at 11:32:14AM +0900, Minu Jin wrote:
> The expire_timeout_chk function currently do lock and unlock inside the
> loop before calling rtw_free_stainfo().
> 
> This can be risky as the list might be changed
> when the lock is briefly released.
> 
> To fix this, move expired sta_info entries into a local free_list while
> holding the lock, and then perform the actual freeing after the lock is
> released.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> Changes in v2:
>     - Use LIST_HEAD for init list (suggested by Dan Carpenter)
>     - Replace list_for_each_safe with list_for_each_entry_safe
>     - Clean up unused variable 'plist' and fix type of 'tmp' iterator.
>     - Remove redundant "free free_list" comment.

Sorry, you have gone overboard this time.  I only wanted you to clean up
the new code which you introduced in the patch.  Please don't clean up
the existing code in bugfix patch.  If you want to do that, it has to be
done separately.

> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 27 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 67197c7d4a4d..d0a26134b67d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -172,45 +172,44 @@ static u8 chk_sta_is_alive(struct sta_info *psta)
>  
>  void expire_timeout_chk(struct adapter *padapter)
>  {
> -	struct list_head *phead, *plist, *tmp;
> +	struct list_head *phead;
>  	u8 updated = false;
> -	struct sta_info *psta = NULL;
> +	struct sta_info *psta = NULL, *tmp;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	u8 chk_alive_num = 0;
>  	char chk_alive_list[NUM_STA];
>  	int i;
>  
> +	LIST_HEAD(free_list);

Delete the blank line before "LIST_HEAD(free_list);"  Don't put a blank
line in the declaration block.

regards,
dan carpenter

