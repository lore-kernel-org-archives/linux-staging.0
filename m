Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A77249FE
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547541; cv=none; b=Y8qlM+ZOSal3YotkZCx11CvzFqqhhjdxQOTMcr99tj5XLStMv2atud3pvhoizPXwPecvIqOMAMWJqd7G+UdoujpieuAYTJfxIYX6p24ynLkqKju8xTcZwxoogznAYT+gVdRcqzZHlsmFp2vaDyUrkudxYvQY8pySw8okHKKeIlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547541; c=relaxed/simple;
	bh=L8Yd9aivs1y5S31tf+SgGvY1CAv2qBofPRQcyrKZogA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DV+qRhvUJ3QXRUtgQsOrrFLzc3u80cMphSUtFOpLDnFZGPxWS5+dxTe+JSIcwVnabNf5gRTOh5OPSauive7+Y1lru3MKVLTicDFNsDTKQXlETkrui/t4qHwjnz7NaIQ4T2rPDk6xpKvUPF7AFxPT4YW/AaauVfOEyeXSUtO18oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XIb1o5To; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XIb1o5To"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412cf3c5cdeso15832365e9.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 02:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709547538; x=1710152338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmW5zcFPe9YbXP0IPxGliLDGDmB0I6XEzcryOh8vMLU=;
        b=XIb1o5ToQc/zVVgKxQYxMGiKmYhVT5MoXwjsywlofId/sAXpQz0p04McDZIxKJXOSi
         KEHKuXZI3KW8WOBU37XICMSbjxpmp6C/V+GoNlKfTgnG04VmO69F3itRGBIbHE6yJbNJ
         nmXcsIteBt1giJ6RDDgoSdMcarfe4JVyc9Mt6bzisS92QLftetaY/ymEve0pN6g0tEeW
         VWciJR9G1W9j6xciGl/3S1dlr77iwMRan/1LJbazjzM/dT/jTFoyTx0zYOwRpRVJORLU
         IQQnqbAnimMQdOqaGiVBnBLvpPELN93SJGcX1RmuRbqebhQorMmG/Lx+pZWRmquk6zv8
         VRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547538; x=1710152338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmW5zcFPe9YbXP0IPxGliLDGDmB0I6XEzcryOh8vMLU=;
        b=j6zzq2W8ZjCzU6PTSwS0w5KuJ5HLfGRi2nfpjkznbHOLfCJVg+D8hCn6YFsr+ztFCi
         8cj/cvuEHLWtgCtsfppREzTmBxh6/ZyKn187zBECtfy/2Cup/ccqHQ7POAlrCgUw2ODC
         UcauIG2Z933LMkjCa1+B+k3ykKL1q9HRnVw6ymt+Pt5V7MmBoDYhTYVQTCvu/nxYV8lA
         e6KKMyX8zZbPuvdFBlpO2LiNt/Z1RgoAzC+j7rxhTtXWJH4pJeHAGXq08lM1IU1ycvTN
         8xJxTCM2x3UVNWeajTixs90VLaVCqF78EbOxALtZuJ1sM4ea9D3YTqNNNa154Gvcch6w
         qDAw==
X-Forwarded-Encrypted: i=1; AJvYcCWnEpgq8isPC/Ca70/R4zRmcF6IevzugkhmbCr1D2zu84dnjCO6PhNXkX+cuh11XFkoHXIW7tHt3h/YNP4DGEWoFAKS1b6/P3Cwdmqa2g==
X-Gm-Message-State: AOJu0YxeKSrc3ncpjrwlEe+dyrTXm+d+DtCscfa4Jc1oUnWxmhtNxm33
	hXPfIWyVyBKzQ5VQXTjXE6SIGLYmsQNpdZ8ovJJDWqqs5X2+mzDFb70X/rXn7KI=
X-Google-Smtp-Source: AGHT+IG7Ov7Kyt5GXCvjUp+CIJ4MuPiibAQif/bU5BPfLZ2jv6mBHOrOSrzTXlmjfbxDND2MEzFxPg==
X-Received: by 2002:a05:600c:19cf:b0:412:c219:6206 with SMTP id u15-20020a05600c19cf00b00412c2196206mr6630691wmq.39.1709547538248;
        Mon, 04 Mar 2024 02:18:58 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c1d9400b00412e795f270sm763534wms.22.2024.03.04.02.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 02:18:57 -0800 (PST)
Date: Mon, 4 Mar 2024 13:18:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aman Sharma <210100011@iitb.ac.in>
Cc: Gregkh <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Staging: pi433: Updated bitrate range from datasheet
Message-ID: <835bba82-c144-4674-b8ec-a6bd6af89daa@moroto.mountain>
References: <91454ef9b4a12f01e13d69b675d81aff@iitb.ac.in>
 <1440d44b-c16d-4307-9457-5c3ae44716ff@moroto.mountain>
 <74ec69941cb67e3a351ebd23d5ad4a5b@iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74ec69941cb67e3a351ebd23d5ad4a5b@iitb.ac.in>

On Mon, Mar 04, 2024 at 02:04:08PM +0530, Aman Sharma wrote:
> Tbh this is my first patch and I don't have the hardware to test this. I
> thought updating the values from the datasheet directly might be a good idea
> as it would be the correct range. Please correct me if there is something
> that I missed / need to know.
> 

No, patch is fine.  There is no downside to updating the .txt
documentation in this way.  I was just wondering.

> On 2024-03-04 13:55, Dan Carpenter wrote:
> > On Mon, Mar 04, 2024 at 11:23:40AM +0530, Aman Sharma wrote:
> > > Updated bitrate range for FSK and OOK modulation from the RFM69
> > > Datasheet.
> > > The values are mentioned in Section 2.3.2 of the datasheet.
> > 
> > Have you tested these as well?  Sending untested patches is not
> > necessarily against the rules, but it seems like maybe you have this
> > hardware and can test it.  Could you please talk about what testing you
> > did?
> > 
> > > 
> > > Signed-off-by: Aman Sharma<amansharma6122002@gmail.com>
> >                             ^
> > Missing space.
> > 
> 
> I'll fix this if I am allowed to submit a new patch.

regards,
dan carpenter
