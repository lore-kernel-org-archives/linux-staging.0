Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319AF3947AB
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559679; cv=none; b=MrpNWnLSx8bNe3PJMfvcefUOUz2YJTfcWceikhKleSpzEJqmQQm1Ma6ibNuOItdt/RZH7kuiRNHr6/nR+oEz9RODwpqz9RU2dQ8fdxTC/PVw0pghrv1ZicW/M+0JJZUVnsi2jUQ1EZn7YATDQksqoBvnCNVqKbVQm999q+jwlCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559679; c=relaxed/simple;
	bh=PVxmen+bYmM7qoldOKUgzjpQJR5H2ZvpeASWrcYATc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4M0T3cKtwTMz7OkA81gKs3NdjAg9M9qOOYCYpb1s6rzY7iVR2JG6CeI5ruYOsA6BSs3vGgXGORJi5GBmLh7bzZ90C0IlctMQjVIm1if2aXWVc/6pEaQlIt9LZNawSmX+kXgV6FAX4dBYJcSSqU+tgknu7A1hs3Fp1TPJXGPQSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WETKGVnv; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WETKGVnv"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-516d0db9372so3342441cf.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 00:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559677; x=1781164477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOlcBZYHQX5Abwo0UCHHT+CLoF6eErYHJpQG/xW25CM=;
        b=WETKGVnv+SkpO4UpnFCs1HwtCSE0mcCV22EHlGqnYzrODHZZyPJEuZvw0CcnG3WJHa
         4duMRD8bwL0VmZcJzpyw52QZEHKNFyPXFo6eSfMWowo4b3PVk30D9xEqm0Tuw7dCUri6
         znVangCst8SW+Yih9FmU9ionbdPxTTI2xZ5LEciiMZcK534Zw3924iOw9I9xH7QKm9sS
         cMG2H0ctX8a0s2GF1Yfw+hd4pyVqXp4TBkNeCpD4rC4dm9Zq5RvGv8NHiWZ0sXA8mWGA
         22dtsmIGeGwpT7oWKsV0lYhni13BBklZllOdKRdCbuZ9UbORcKPb2rAPsS9EcAcuYEcm
         2ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559677; x=1781164477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOlcBZYHQX5Abwo0UCHHT+CLoF6eErYHJpQG/xW25CM=;
        b=PT55T8TwHUxKxaMp2Wujv/PMO9RizuqQuRGfkHonniIaELN7xj3o4gTmeRGzY7IZHa
         ZpwLEYX2h17RS4BlHmttBk1uNjvSEGWLpbM+CU8nGkYY3wwnpGHqhZiLHWDhHA6Hofg2
         yC4gtYUrAm0x8uqlJcIzL3/df/Z7kxpajcvHtdV60rfG/+HPL5n9FgscV0lNtzlPECB2
         8ATXAwr4pFAS7X3N7a51IYv9YmlI/he1R08QIUm7QnWKDWasr4ngyTcEbkBcj9mTxvh0
         dceOoRR4J/KyjhgrPS1ORsKHHUfwi7AQD06E11q1FHROzQ3QAucfC+8De1JbZ3BkJuTp
         zlpA==
X-Forwarded-Encrypted: i=1; AFNElJ/5WdYEi+iBA9Qmkzm3Z59lLHND0I/IAZARpKZ6T04dEsh4R0DpaOuVt839uMSOgq7xtQD3Kb5H6JNSLIwv@lists.linux.dev
X-Gm-Message-State: AOJu0YxeliaypDQf/hixf4IjTBcyfUTDlxKdkdZWZ0Mno4DVYsVp9vj7
	MtbSZ1pBwLJOO3iFAP4o/q8+mer0mDbCDo6H3loAhr6NCdCf5MYq+kR3
X-Gm-Gg: Acq92OG0lgD831sT2hCE1EvMEy4QerZFJ3rrXxWukld6nQtpUpC57kKyfW6+mtEKEJc
	Musk6rhOQonXmVa3NU5xDhRDR56TvkUwXqn3Rr9GgpLkeRWP67T8tscg+GZtQDPsOWokENNepP1
	RRbvpJcG64hXyNUndXwZJoOvnwktlGd/aCBvA1YWZGgFP6inEA74vbSzOxEovwWB8sUNiy4pPse
	BCKwYR97aBD12XL8xUNtEMlbBmbN9QiYKOi1zjoWlcTiJqQXG1Gj7nn1c5MpKFUVxMdzGLuOYXX
	S4JDt+m8ZtaofxZStWT5HLYlIFNc2GCL0q0QWk0eZVF8y7Big0gBUD/b3+gHz/rrfqtoWYLPdZr
	+j3DPlbgjXpIELIyxe+OCzIEWKe6syGvMFS2ZO9WnEKT/XQB3tJkPaoA+OxRDOzZfZ1nSoXeL43
	aZz5c4U/xhA5sa6lnZ7+f77f2IO8g=
X-Received: by 2002:a05:622a:313:b0:516:508b:bf4d with SMTP id d75a77b69052e-51778789b11mr103486471cf.56.1780559677286;
        Thu, 04 Jun 2026 00:54:37 -0700 (PDT)
Received: from localhost ([149.40.50.195])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm46401871cf.4.2026.06.04.00.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:54:35 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:54:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eugene Mavick <m@mavick.dev>
Cc: gregkh@linuxfoundation.org, khomenkov@mailbox.org,
	ethantidmore06@gmail.com, m.steinmoetzger@gmail.com,
	tomasz.unger@yahoo.pl, arthur.stupa@gmail.com, jannik@jrehkemper.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <aiEvNg3_j4xtiLSN@stanley.mountain>
References: <20260604045112.830216-1-m@mavick.dev>
 <20260604074923.841460-1-m@mavick.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604074923.841460-1-m@mavick.dev>

On Thu, Jun 04, 2026 at 03:49:23PM +0800, Eugene Mavick wrote:
> Remove unnecessary parantheses around &(foo->bar) type statements to
> improve code readability
> 
> Signed-off-by: Eugene Mavick <m@mavick.dev>
> ---

From my perspective I'm seeing this patch twice in a day...  Just wait
a bit...  Remove this part as well.

        if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
-               && (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
+               && pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD) {
                pmlmepriv->timeBcnInfoChkStart = 0;
                pmlmepriv->NumOfBcnInfoChkFail = 0;
                return _FAIL;

regards,
dan carpenter

