Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D513546D8
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206486; cv=none; b=bJA+OkcdjpAd4xen/T4Yp72ubn2l2zRrvcmhu+zH8gOTm98L6uvwWF4nG/hZrhhH4Mnzr7LT9ifoK0svPJIxiAqQsZh6nX8j0F/sLpGCJ8A/JkHPUdv7k/YsQtmm77jHfWn+76KY22ZL5KSKiGSkokfSWY3/ZvYCWlHFBhNQ28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206486; c=relaxed/simple;
	bh=osE3qagr5FcKZE2toUUtmmnk5ATpXhdGUezurwCAjo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4Dk6iPfODUuF0Kmb+RW2vDtkMtmdKDQ0ac8pSPAeYFW74sNF/tDMDcmo4/xe4m+jRkIPy6u358gdZjM/BlOBGbEkQiblwXtjnjMsHSPuIQCb0F8ea/3JsD3Q8DDeROuSxkXfH44E2upfr5Emc1WPaTUTiNwGyUznktFka38Oro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCavWTna; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCavWTna"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so8331111a12.3
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 02:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782206484; x=1782811284; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJF7qadIwvpKkc3LLQI82JwFytXwXZHhNGR40Z94OnI=;
        b=HCavWTnauRZUeVi0plC9WNvjSCsNXgYPzQAkRCr25D8wz6SVDRbG/Qn5pdEWklmpzL
         1NHDzgv4eyYCHpxQC6T5kk8Idxra+Qiv5Kkxq/bqNNFLywmAWSYSmEND5JTDzarMMnKi
         E5qJmSY+trkSFSUI6/TpdXCDk53rAdl7dDFwFyHinaaqvxy/rmCX6y7LbOMTZlg5e7WF
         H0LD/l5sjxRv2k9qeI8M8qZvH7dcBvaDYkfFFA45A7j/KQ1B4BYtWjhwdSUyW4uqRTYV
         0VuSo/v2oo9DGLTAXqkFTbIVJ1oVze40MO6msw8b3Ku87c2ZjTxi/ZQxk/dT77luD5N7
         tXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206484; x=1782811284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJF7qadIwvpKkc3LLQI82JwFytXwXZHhNGR40Z94OnI=;
        b=lRUJ/h9FflBxIox0MfcVKjuB27YS10cz0l6kKa4u8VSn87w5fDVp1msJayvFvfpTGr
         ZyOI0Pb8vIiZODbGkO23ocliDi6O70BmSx198RqAOUZtl7DosLYYAxqIo1SN7usdU6IN
         EfBRhUtG/wIvNYQMbAG0xVrl0mF6ivPaU89z6YffchiLtILn8EZFJtYvy7P3fPC/DlvA
         CXvnyDEXsT4samHlCBDDegvb/ArZAvuytEzU0BAYfiZ2gKTab99CrGTGLsA/bhOElh47
         X736ekXjNJdkNoUSxeZjTZOu7vTpmCOc+HZDO9iO88wKes5rXuORFqpaXGlqBy9wInj7
         sOzA==
X-Forwarded-Encrypted: i=1; AFNElJ+YHPvw3wTj/dlDxzdPGiNVW+2mGb0s+67DFM17IQOi1SbPPTXa5MN1EsPj8m/G+VlaffMIRl7OAQEZeg6u@lists.linux.dev
X-Gm-Message-State: AOJu0YxMMx0XjEQFavNjD895W99jLfypMx7ZzzTtX85NnV6pYwQy+XVd
	BdY4J/9cZMblopqY85EfU2OpSo9/Rnj/2dHVO3WfmF8i5yjmgwIkESD9
X-Gm-Gg: AfdE7clVrKsiWlJa8uwbAuUkxWKBo4RjNsG2U8S/FPGlXoOxzJylbK7L50bpbYXbZxE
	G3uSUc7Bp3OSxEq34AXpGP+k9WES1Cu1AouBIH0aXksmaGjuXc+zee5v1rL0g4oMvLx8gNjncMB
	rqR/UNdtKl09+9ROK6oSQ9vy5KACzZcHvzPGWEd9JlavD/bEU6PS8taWo7uWZZ6Ek0tOvExIApp
	mmfJ4QYEPSO1cYmf9NKjj2rPzAuH7YYeN2DW67E9CUrlu9KMUhCxtT8aDFCjYDydhIzIb0mDqiG
	qE4NMyCKHRlqOD0vc6uLv/69OvfL1sQYc6Fih9IjWFEnCLuwLDA/GqcDa5oJtgxAbcrW3T9AvwY
	n0myFVbhRk0cRtuaoHxqggb/Btfpd1Ch5DziooZv8PUmhXFtdLxiRuw1Xv8Habkjgi/ihffQVyW
	2zbrNoo1gjcq8o0zmrUQg=
X-Received: by 2002:a17:907:9348:b0:beb:f79a:bc20 with SMTP id a640c23a62f3a-c107c729fcemr105988866b.11.1782206483724;
        Tue, 23 Jun 2026 02:21:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm482784366b.7.2026.06.23.02.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:21:22 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:21:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bruce Ou <oubruce1234@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warnings in rtw_efuse.c
Message-ID: <ajpQD7LyfKNopii6@stanley.mountain>
References: <20260623075507.6157-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623075507.6157-1-oubruce1234@gmail.com>

On Tue, Jun 23, 2026 at 03:55:07PM +0800, Bruce Ou wrote:
> Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
> ---

No commit message.  You're working against an old tree as well.  You
need to work against linux-next or devel-next.

Please, don't send a patch at a time, one by one throughout the day.
Send them as a patchset.

regards,
dan carpenter

