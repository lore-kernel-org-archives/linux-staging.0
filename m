Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F7C1ADC83
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770024890; cv=none; b=e35AeRNKqY1O30pl7TOta5GA47mUrZXmnz2E3nO/4TOlZD7CUQwQ1Cbv7DIv/4zOmaz3Pt4mujizaNdyLaDt1q+yE8imvpi8iG5UaSnsWrfIQfSXk27GU3gfpI0un/VsXLvQ1tFsfiV3xxTVlerSBzTvQH4Z4uBM10fSp+3xHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770024890; c=relaxed/simple;
	bh=PatVX8IjqaNkqzoQyfen5SMJ86BI5A9CzOlCk9a40Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wvf7bcv4hk4VKAwSD0lCwZ7RJziq+x48BufrEwilsCKIiFyl1keholE+P7GCDq4U+n0TyY5E9RzLEiaKOQrdW+SvG2UV/mlvv58aw9eKMTeRncqPVfzl5Q8ZUCEZMpNspFf0nm/g5dlVFWqwuSuBQYCnDbSbDB8u+GJwMtZ2mPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOq0LV0H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOq0LV0H"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so46913885e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770024887; x=1770629687; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NX4yvDULN9gI18lY/VaDyzMtLorJ/p3bFtl00/SN8k=;
        b=WOq0LV0HHKIjTk6MFRWiO+P1NaPTFjOiEEOfLQ4F3LRO0dai99hV2hcaPeTTUeLTRD
         iHnWtujWal9Tw5NBd9SENVnHN6QISEOSXi0x5hJpNtxCTu8XHSBwODkKq3sOHTxv65+9
         EYFmrnUCinU7f7KnjCKwW60k7shxH34x1l/stIrugSqznv+MFYw5QbcTQ4I5tAnBLuce
         UTVN8f2wx8PSmHtw+nTYHPhf+Lv8jo6D6OQ9wSdtRMggCc3WNXeXZLWE5c8tDPG8nS9E
         EUoMa+3N3fWDxM3xNNS/M1p4+73epVUdFOJ20zE6rzYIRpInmhazrOxu3yXNnZBQoVQV
         4Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770024887; x=1770629687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NX4yvDULN9gI18lY/VaDyzMtLorJ/p3bFtl00/SN8k=;
        b=CDzJzjoiqKM/UybSHXSU0WNnkJaQ7M6xKWolqUDEjIZKSn+fQd9b1WgjAtrPA7qyiY
         St/740j7JwlRedqofPeixsA+ThT6PV8Jnt4Zcvc6DsEHDBhAvV68InRTckTC2clRoFR6
         5Sv+dNL95kCFDCPCyccJsy5AS6l9/TYnwwVLmtNet5zEPQrBiRqqR0yGjIgomtaLTjxe
         sNa94J12WxYbY9CRnU70WPTJfSsGdiTAgWwRqQwzvv97e1soMwVhQSl/GIaU1dJsZBUp
         tqwl1erBubecLra8Uubw57rjWs5a+YV9ugGGF3H6urzLQVr6DDlXARO9z5GcEEec8fff
         JMBw==
X-Forwarded-Encrypted: i=1; AJvYcCXxkN0C1NQwLPevErs/QWw0YTW+asN7fBRwNrOuPC6KWxU3WIWtNYKGDLQxh7OZfE+pAkd/rNYggAQhxA2w@lists.linux.dev
X-Gm-Message-State: AOJu0YzAgOGMsvxGnIL6lRp5PPJvmSWJjBlmCA6vTnfh2sPnHhUbNVKr
	76FRsGuI4lPLnE+/3LoEuu8277M0m1tYfQ2eIDY4hFOJNWDwlO6nSSkhPucHQ0r7ME0=
X-Gm-Gg: AZuq6aJBY23kVs6pWmWCwl62BeiflfNaCNZxnA8u3ICvxbu3H1+2uuune7J46WkP1LH
	KkUu+McTsA/E96hcwocCyx7VCUKVV4G+V47hPX0OdsgETGm8v8X08nqTOYnjBAGSxiWpkC6C/a3
	Nc9O+j37GSZ7ZPgVi/ZdOFfRCJkT/14Hrw37W/gBzwwdabb66OO+durk5oC9Wto7hj8aJKTMKCO
	/OYoSzrnSqeFsAgngJznBC36V2K/O0lWiteqPxVx1EkyxlXfnlmb4hw9SmfgipDW33G22USB5AH
	9frbtD66lQakdPnZ3cGLYSxo/50r7maaNTS8d9zMwQx42omzYvHBTDma2R1PFIiMEn6FPHdaS7q
	9C4MKZKTrt5N8eqhbMNK0rBYRsFBqBJyhb/8LJcQQY+Uco3ihQFMXzmgFpCNdZr20JIdE/DDs+T
	Wl4wfY2z5cMv2uaS24
X-Received: by 2002:a05:600c:4ec7:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-482db46b04fmr140762335e9.15.1770024887016;
        Mon, 02 Feb 2026 01:34:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482f748a9b8sm105603715e9.8.2026.02.02.01.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:34:45 -0800 (PST)
Date: Mon, 2 Feb 2026 12:34:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Cc:  =?iso-8859-1?B?1i4gRWZlIEQu?= <skylinesytbe@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	 =?iso-8859-1?B?1i4gRWZlIEQu?= <skyline@noreply.codeberg.org>,
	=?iso-8859-1?Q?=D6ner_Efe_Dasg=FCney?= <efedasguney@protonmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix whitespace issues in hal_com.c
Message-ID: <aYBvso52Z_-83lQW@stanley.mountain>
References: <20260202021845.265051-1-skyline@noreply.codeberg.org>
 <96821010-58B3-49FD-865F-E9F420E4699A@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96821010-58B3-49FD-865F-E9F420E4699A@icloud.com>

On Mon, Feb 02, 2026 at 10:08:02AM +0300, M.samet Duman wrote:
> Hello Ömer,
> 
> I wanted to share a brief observation regarding the patch titled:
> 
> “Remove spaces before tabs in comments to fix checkpatch warnings”
> 

That's not the title.  Why would you mention the title and then get it
wrong?  I'm so puzzled by this review.  Is it AI generated?  Please
only use AI if there are bugs, don't use AI to comment on the commit
message.

https://staticthinking.wordpress.com/2026/01/27/no-ai-slop/

Line wrap your emails at 72 characters?

regards,
dan carpenter

