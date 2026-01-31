Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D037B413
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 21:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895842; cv=none; b=mZAaa133ifLUOkXB79Y9Zy0zGtTXdnGVS+Gyn4a8KloyhAnbcYjQEV4pW3NhMLkQKVYhQdEriYA/o/EIeoG0HH2+fdIzP0anwuLEsK7R8uGFJCrL6W172GiCDu3w7/dXYdUsUBKxVOzbtDGlnhapnNNV02hEeknrYlTHxzyYfpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895842; c=relaxed/simple;
	bh=AGPTPcwrb687NtYsygq5IOx6OZcC1f8rQRvj1Evts1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5hqGcOmRzZcbYn46UoRF2UsMBJeasCvHFAAbtwm8S2gh/Y8792QQReYbOHbZOk8mQpau/gSXjY/IQn6TkioB7+GCdM4GVBUVb/34QEI/E2UaepcRkArqN89A+mmRw/1SiI4bvjmw87Dn8KiGj54X9+4G2p50/eoyK3eeZkzKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnXQMk7R; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnXQMk7R"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-505a1789a27so13631631cf.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 13:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769895835; x=1770500635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QhOvUqB9RMCT6Y5tfLLGuyBQaWLsY3WEToOABMHTpVw=;
        b=lnXQMk7R9Az9dS2uWoNBFib0Mr65ANrU9R8voePKs4fOCjxy91pZioisiIwZVKRymL
         gPUCTCFnDuvZwIpAqVxjgpw1FCuWtwPsLjwLRNdXvKWGs1k9zqKOEFqGFQc5lSThTSor
         esiJbZETIihXmRcOOiZMYwx3DYgJJVJL5EnVKnfM6OxPaEL3Ngxj5pulOwWH2sFNHwNk
         PhBfDtDnKJnNBBYSjIoirVXa1jjSmpx33Mgnox9mMkKJu7tOrCuWwvbiu1oZdMEGZVwx
         Kg2FILKcn8yiFHP4wBROGL2z32FEVRbaURISlTzGfsgkB3bgIzfA1DUvA94x5ex1fYFq
         jI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769895835; x=1770500635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhOvUqB9RMCT6Y5tfLLGuyBQaWLsY3WEToOABMHTpVw=;
        b=bEYK/xjZGaAurnIz5lLVpQ8WmGuJyqFvuZGiL4cU7/NIjvN2ABczvMKZYfbcX38gDp
         q2dwgMyVQxXS3s4qoVcD0kjnXPt7wfpmPcG4xng8v1iAxnYv2pXgohoexjsILievPt4L
         +Vdia4jh/7A/+LbexJM04/xjQlS9FGqt7pq4tXu2s5QhZsrQ7wzHfEM3qsDbVM2lED5p
         k7EyaV6hKhbaczfZ2jtipsOFhiIT45DWzKVZG0fDTmu6GkSGRcxwWEksQFh2vrpac/sI
         ZCaKdUEroJB5Qa6aOyebWTa8SLI9JbimPszmIjWBzsG4NjUiDqeRDs9C5laZ1wJUpjn7
         Kwxg==
X-Forwarded-Encrypted: i=1; AJvYcCVI5X+BYhLotmVmvn5AFkcHAzwlWjyajwefRo62r7UKKuE6TdDgc8zYWX0W+OqhJVxhd+NuNt8NjVMfhJcF@lists.linux.dev
X-Gm-Message-State: AOJu0YxJt9Bn0QyIhpj1+pU4YrSThdw+NUBI5i2XhJiQLF2BbVYXQdxv
	XEq/WKBBL4xlydQBqB2imniQJ6Ff/J7e5MuJtvqA6rMvyPkpNVttSnTn
X-Gm-Gg: AZuq6aLKV10S8gpsYigFZfv/iAUAwhVLmuA3TZ1t1xgggEDmu+S3asMO2DeEstMxzrj
	iMf2PbP/HjgyWGqhXek8WNNPnc78bNV/AEpo4N8s5mtv3E/6pgu8UhLrePui/xtNYjjB+5wLuLt
	zEsKwhavppVdNohV6edUpVFy5yfq2lDaPwnKwfWKN1VayPArnGkCYO59g0ycwuYrMJhtsW3Whci
	/viuCCL3/JCA/2rzRN0Q5YI6/buuYNi26EwytyMVqli0VNreBb9wAGafnA1v5RxkDyNi/qvS8A1
	AtEkHWzSHOzwFU/7ZfLk3nHs+Adepzy7BAfCUDop4oColM4KOC+Hxz//amIscHfkXPJx691pdHw
	qA42aRAy4lc8y+w9hV8keiKSXyUqAQlbRWMu/EgO3t7mzh15tx93bNGVfCsvGfVdvpSzkSba8WU
	FaSfWnPtxqDJouoyoe9NJ/tqbR
X-Received: by 2002:ac8:5988:0:b0:4f1:cd0c:80f6 with SMTP id d75a77b69052e-505d2264f6bmr88071081cf.49.1769895835528;
        Sat, 31 Jan 2026 13:43:55 -0800 (PST)
Received: from localhost ([132.216.195.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5033745c4e3sm81882931cf.6.2026.01.31.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:43:55 -0800 (PST)
Date: Sat, 31 Jan 2026 16:43:54 -0500
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: David Laight <david.laight.linux@gmail.com>, gregkh@linuxfoundation.org,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace ternary comparison with
 min_t()
Message-ID: <aX53mt0cFlcz_2VB@william-fedora>
References: <20260131133146.8174-1-william.hansen.baird@gmail.com>
 <aX4U_vhLXX0B12DS@stanley.mountain>
 <20260131155525.05e1645e@pumpkin>
 <aX49e37jGXj674bq@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aX49e37jGXj674bq@stanley.mountain>

On Sat, Jan 31, 2026 at 08:35:55PM +0300, Dan Carpenter wrote:
> On Sat, Jan 31, 2026 at 03:55:25PM +0000, David Laight wrote:
> > > > @@ -1024,7 +1025,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
> > > >  			pstat->flags |= WLAN_STA_WPS;
> > > >  			copy_len = 0;
> > > >  		} else {
> > > > -			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
> > > > +			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len + 2);  
> > > 
> > > Use umin().  "int" is wrong because we don't want negative values
> > > stored in copy_len.
> > 
> > And the correct way to fix min() bleating is to change the type of the variables.
> > Using min_t() ought to be frowned up and only used as a last resort.
> > 
> > In this case I think all the variables declared with wpa_ie_len can/should be
> > unsigned int.
> > 
> 
> That also works.
> 
Hi Dan and David,

Thanks for your help. After reviewing the code, I do see a few checks 
ensuring wpa_ie_len is never negative.
Therefore umin() is safe in this case, and for v3 I'll update the patch accordingly.

Would you prefer I leave it at that, or is a broader change to 
make wpa_ie_len unsigned worth doing in a separate patch?

Thanks,
William
