Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120F21859F
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 11:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617098; cv=none; b=HWp1bc9qmMluLdCtMy4tXyqc75p3AKWpdpr8WIAJ3JR1TngJNP1PS7QCAerx4Hon7hzCqv46rt3xSj/knGWANE85IsfixV/J+wRI5tQuiv5/XO10lgmSAbUW8+No7I4ft/4ZZzanBje/4R9uIUUptPecW9uu86uNRM77sv34NT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617098; c=relaxed/simple;
	bh=oar+Bhsai/tc/GaUVtDvAbqWQLjDSDc4YeBGhvA8YjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQzCiKEpuTYKjCJnbTir5A/R4s4kKzPhEgg0gt2BCYP2v+nvDk8E2VGkBIWV0F2KDQN471kE0wICJp00wOwqh9iwQmMN8qr+qKd53wpTaTVAOq/R5cIqWTZkJ9FRIshRaXP/Zb7K85F3GToeirt7cHG7sYiU+RB6vIgUbQmWQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTowcR2t; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTowcR2t"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441d1ed827cso11381955e9.1
        for <linux-staging@lists.linux.dev>; Wed, 07 May 2025 04:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746617095; x=1747221895; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar3opOrcf8YKrqt/F9Ouy5r6VUjzl1KJIEQkTj2liqA=;
        b=RTowcR2tUxbHmgiwgmsYNhAELT872+qgIIIkan5DWZX2l182G4XgbXts7sV+AmCGiZ
         YKvwTLmYzsMamx9eRZi57Qtu4PSFMgfEZknZp9lIrlo7Mb2BI7+RyYLQtW1aHKWC1IRS
         APfs//XHVNuSTZPGjbTXcXYpWdAk9l/nlmM0Hrcb6E+9PwspYBFkqxZOa0yRAO+j03gL
         ANgRCuDHtrv8+FSXnKGASGsSnp9cnCZi/7jjZwrZrehN48GNPRWIbGcO/xA2HFDWjtkT
         JFixLrVvtCuHJckIGN2q4VpCVdrl9c/s+8dx6sID70s/1bv15hdJ1Owrn/t/mdYwyGhK
         HB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617095; x=1747221895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar3opOrcf8YKrqt/F9Ouy5r6VUjzl1KJIEQkTj2liqA=;
        b=coHywcJsAq4IH82p9xhHJJzJr/uM83CnvHP2EsR0m/CzKjCcmT9bRD7fsRwHHSiraf
         XO5zuFQZ+m+ylglYjSszZEU4FX5/zbABjyx+eqJAGrK1wa8iIAFoqTDbZc0CqKl5l7vV
         ccU/SuDV2Zykn5cPbbVchUMzCku6YU+AKhrLLwrDQIC4h3C5Udd9QDalM3iqEjKBB9kG
         aorHZTJRC6xd1wjUEkckuFbbVCyHKHwwubP5k9oIPlKBfABBndoFAf29aqIWZ+QT3Fnu
         ebQli+iS4jJrQOC7OaztX3m0ILxZfA04p2pGvvGl7w7qUwfHqBiSkgy2tAu61U6jCWZ9
         cIZg==
X-Forwarded-Encrypted: i=1; AJvYcCUUdRWR//JLIQ5Gv5kGSkP28PkcRXIgO50hNut2zel/7a7kki60hmE5Zn+SSv+vmYHFiA5ru8MjjWEpxZfh@lists.linux.dev
X-Gm-Message-State: AOJu0YwoVOBz14v7eZTk3GbzLc32i4dyEZ7oDvecY3B+zSHXhIkpCyfQ
	J2UNwHPFWVT90/sNOnqFU9aFimnTnvrihnalO3fH5s3pSPIX293TymLoEl/7tUZBHypcR8q7Gy0
	1
X-Gm-Gg: ASbGnctL4fzxNLlcOIotm6B6XQcWDvVjYQKFLS/h3tEKT6MK6eujilVCGa09cnBbDjY
	Wey7jQGApO+Yuw9rA8gl0T8jxaVAgZXlJ39y5aBK8H9qT+/sWlxX5hc98okfwYLWZe1uK2DQ8NQ
	dL+U66tsMkzRc1+YikCQBkfeFyRIBx71stQ9hBKWSP2XDRFnJEWi3bM75Ax0TBQIQxnc57ZfIlf
	T/8s2ZKizVcChdepW1VNyZwnaqbAMG6BGl3R/iMePvn1zl2+uY++fGMT7P3qpiWzYrPFJnectlR
	/zQWmk+qTsWSFmW6HI3Jeaahkwj8ccTNe7V8BEtBnXoF/g==
X-Google-Smtp-Source: AGHT+IHyJ94/xudBhc2hVks1GmnieE9BCHBaAQyYklBR/tJ0BTUQtnhG2e9qWqy0ux6mdoFrnCGZhQ==
X-Received: by 2002:a05:600c:46c8:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-441d44bd46fmr26000975e9.7.1746617094808;
        Wed, 07 May 2025 04:24:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441d4346542sm29214775e9.11.2025.05.07.04.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:24:54 -0700 (PDT)
Date: Wed, 7 May 2025 14:24:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] staging : gpib : agilent_82350b :
 agilent_82350b.c re-checked the sizeof structure, also checkpatch.pl has
 shown wrong error, hence now applied the right option and commited the
 changes, this will be PATCH V2. earlier have applied void pointer only so it
 will take only 8 bytes, and not the whole structure size.
Message-ID: <aBtC-78bNYtlNHPe@stanley.mountain>
References: <aBs5MeEdCCwiGE0B@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBs5MeEdCCwiGE0B@brak3rDesk>

I think you sent an incorrect patch earlier and you're trying to revert
that patch now?  We never applied the patch so there is no need.

regards,
dan carpenter


