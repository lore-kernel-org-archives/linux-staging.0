Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD3C5FEE6
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715769089; cv=none; b=dfcVJczkt6tnbcNbaAVP9mPZehdwNQ7zjtpGD1bfCiMS+DbjPjLKfYqBK47d3spB24oz3KDgAOxG8SWANpOyYe6i/OBmMqoa/7UD/8ymTc1e2YP4i2WimUk+2soH2Qcs70mXAx6GjXpv0gotJFKtPU3sx5IGpuOI/tH2qbqozm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715769089; c=relaxed/simple;
	bh=qpCiEdvxKqwdG+d5y1lBs4jc9rD211BTocGCbHNSQ64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/cuPQ9PXK8XWXg7K9A3gs6jcmET79PXFLx7cKHblK2q9EoaCzZPgdAWKIHqau/2M76dJo7VweiLOt1eWOEo431TAgqMxxXekJKZtUccl0haN/4JaOVIWW/izSszMtIWFRUqZy+I1qXWVsXBl5+MlJHSfrTQa37n23foJfxnxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t/abyrd3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/abyrd3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so65902955e9.0
        for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 03:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715769086; x=1716373886; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjV4TTUb0QKx080PxSAg2NHcluzRf9bueF8g/pcjOOw=;
        b=t/abyrd3QR0qf+11QNlNBoKlMyjT1S1zs6yaIqUXNQc9ydBiIFss/NwvOrfCC5kniO
         tREs1tC8voGekfC3N0Eas+F8G/gtG+wKtbCxiAjVe/AnHGZV/BtkiQlDXNjXtA1se13W
         Tr+4G69jHoB7/gr5cPRF3JxQ1H3jr2arrOpYSJZXjFB6IP31oI3uxTMFEQcKoxlw4uFt
         IxHH6SNRSmwkHfFcaxbe4D5Q+KDr6jHGv1WVMXPvtLmZPLrwhVTOd9rqkjlg0NPoPdWu
         xjXO9601JHQbD52qQKzvMtQpzeodEE1/WW0xU9R22H77ED0q5z/+vMDOH0feJLzX/Zgg
         fW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715769086; x=1716373886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjV4TTUb0QKx080PxSAg2NHcluzRf9bueF8g/pcjOOw=;
        b=qS0XXJJMzwBSWvRvX6HzhvvQ2/+zGluaAmKtNLMSRUzHYKhmByn4PMyznEL0ri3h6j
         JtiTw5r5yJVeuhE/t0cMEVDcQIKvCcirEt1ziwA74qt9RIsSI5OvGg+wnTfHTmEMA/Qf
         6Lo53wvUajhwgyaYsyIgzqtAZrXsdmwICWamorW4jcRVptdlV06nDJESUeVLYu1+8tns
         45pJU/nhqm//MXJWWBC9i+80IvjuiVXZWk1eSuN2//8JXXAiLAwFo7jeUdM0EeHBXQ7t
         kWwPU6kJGHXjQUGuDWXsXT6pcoqnWMOjpNpJ4CUMNybJs5STCL4bmwimlHRbEXyr3ZRW
         o8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIdx7uc4y0vh2cgyg0gYcADJ31VB3cBsWdIwBCUiVlw1fliJ1qWFyfWG/AILjJ19B3sAWsmk+k24Zitm37mvsPKNbc4KNQL8znj9QpsQ==
X-Gm-Message-State: AOJu0YyJZch2E3UIxJ3SliHMhM0vyA4GYi8EcLhj2g7a15l3UHR5+j/8
	OTj1t7eO7Iv6h6BCkZAFVu+wpWKqEOq+4QRAccTiA5PdUs41Ils/Cg7WhVULzYk=
X-Google-Smtp-Source: AGHT+IEvZyAZR5fcKV/6P27Ha19FRgf2etS4fJ9dWsF5pMRgDiPHAq/ZIvDQFUqeYItPSUTI51Ovdw==
X-Received: by 2002:a05:600c:4707:b0:41b:edf4:4071 with SMTP id 5b1f17b1804b1-41fead64731mr141037755e9.35.1715769085768;
        Wed, 15 May 2024 03:31:25 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad0absm16052659f8f.69.2024.05.15.03.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 03:31:25 -0700 (PDT)
Date: Wed, 15 May 2024 12:31:20 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/31] Staging: rtl8192e: Rename variable ChkLength
Message-ID: <2624273f-3589-435f-8bc0-8ae6514916b4@suswa.mountain>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
 <20240515045228.35928-20-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515045228.35928-20-tdavies@darkphysics.net>

On Tue, May 14, 2024 at 09:52:16PM -0700, Tree Davies wrote:
> Rename variable ChkLength to chk_length
> to fix checkpatch warning Avoid CamelCase.
> 

Just use llc_directly and delete ChkLength variable.

regards,
dan carpenter
 
