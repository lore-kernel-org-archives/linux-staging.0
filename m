Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A4F3D3BD
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710327382; cv=none; b=TRNc/9kW6AeWLfXGqKQAgOIHR1Dk3TMehOIUEx+Z7R1n8j8BNFRn4zMJ5YZxpKBh0VCTWy4yKec0i5KuMzep0j/7HGPoSq4XRPYaakItp7CJLxjdjwi0jmjgOeyZCuEiv0HSkwO6GBMutZSAi4I+4NiIbxlJle5QQ11v8JxTukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710327382; c=relaxed/simple;
	bh=eo6Olp6DkFH1hTS08SAUUTwMlw8ID8eXArpvrsF8OQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Chjp/sTc37J8zlEKHGyUv4WTxPaIFf09csA/z7NqwzRzHuSbSipncgkW8rDi59AlJ9c1Hz4ou0iAVdP3jQ3N5r5NpDN+qdfIyuK4R4UtxSrq175KfE39w7LU0NwJQUuNnBGFu6A2TPastsZ462gcHH+kawCrOekGttrLUrzgDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BImc49d2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BImc49d2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a4645485da6so228332266b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710327379; x=1710932179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kp1Qu7oS00nm2b4G6O+KsRITn8FkEaWnzYBogvV+lq0=;
        b=BImc49d2bCWcoZrK/z8gRk1qyJaaT9mnfTTnkFmZdbDqpmO3TVJ2xqev3qlDBoAqWj
         8a0OX6kZlQD+2sLhIKZ2JJpikTwvYPGY0VR0LDst7kTj3YSS4Bas/XnqyFLosWDuJV6l
         d5ZSnNYiAkm+USL7F3OfE9Q8C5Iwl7pRs1i9CJEnVbP1lZ+zINgMAZ8hmQwPAOLhePkA
         UmYQWKn+GPWdjlmE94bGBdh4HnUL4wX9h9+/dKvKMuKEvY6G+En7cLzUI6+xWLanrLkS
         JHC8F93XUGgA7Ud3lUJTjP0Z7+rRU+LnjUpNtEWK8XrHSc3ty9swKygX3okBtPvOg1KP
         GZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710327379; x=1710932179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp1Qu7oS00nm2b4G6O+KsRITn8FkEaWnzYBogvV+lq0=;
        b=Q/sGqQ4GtJncqor4H0nkbyGBLX7IaUNN+efyhIuQWISS4g+8DpfjsPBa52TquQd3Bo
         r/P0GsiIJtbg40qJbS6RS3MD3yVC1wAyaBzVtSJpCQ0a32rrRjZvbInGM+yMfMqR+0li
         vWsQK3NYmji1mFy/l+uZqu/cz1Uv7lFRfKfR7WhICcDR+iXxtMK5aBsVjPQfF60rk9hp
         c2LH0wIbU5/hc5fOG3DBL5l+0YuKzioB1Q/hnoxym39S89fqCOejwxQ4MCCLRcBX4QGj
         7ir+rGMPYYjZIs8QKurZdb2tB/ysoYly/5qDCGG+QcCSkT3u/a7i8DFEvA6hqzl7Zuz8
         EhhA==
X-Forwarded-Encrypted: i=1; AJvYcCVcMvbT77Pud6hdFB9LHHzJP+JDbu/a6l+sa8CB2jFS/I3dQitKbyQcqN/vuaRTQe2wmkOFfedntXbfnJcmbXL4duL/30CKkP+FucRnpw==
X-Gm-Message-State: AOJu0YwmxEbz8VSFCdBG0Wy/L9O1dFg3zsio8zoQbK3heVXE9S6c6nAk
	nB04SRMMEMOOXjseZirrTn/jhykaF/0sjvoD/hfNKFQ3QOYK0Cm22v6qU8w3C3g=
X-Google-Smtp-Source: AGHT+IFcWQ2Zi/DdKucg2E3du26n6+4lKJjQpV7nddGbL5B8Yf4ZoRT91X84suPdCHuI9Iug7G35gg==
X-Received: by 2002:a17:906:6815:b0:a45:98f3:997e with SMTP id k21-20020a170906681500b00a4598f3997emr7285651ejr.7.1710327379218;
        Wed, 13 Mar 2024 03:56:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n18-20020a1709061d1200b00a46478fbbbesm1368893ejh.153.2024.03.13.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:56:19 -0700 (PDT)
Date: Wed, 13 Mar 2024 13:56:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v6] staging: rtl8712: rename tmpVal to avg_val
Message-ID: <b2044a45-e46b-4215-9494-4864cd0e7eb5@moroto.mountain>
References: <ZfF+qu+CGHlpHrtY@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfF+qu+CGHlpHrtY@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Wed, Mar 13, 2024 at 03:53:38PM +0530, Ayush Tiwari wrote:
> Rename tmpVal to avg_val in process_link_qual() to reflect the intended use of
> the variable and conform to the kernel coding style.
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> ---
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

