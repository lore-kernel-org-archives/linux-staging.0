Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C652C3252
	for <linux-staging@lists.linux.dev>; Mon,  2 Jun 2025 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844050; cv=none; b=kZ+C+HVoneTvuPfkammt7aYLWGh0ZYW+HbLPiUUdcN9ft4v4XmLr19OZWbEH6i+yLH3SX2g1xLdeQHTbn8k6xizFgR5+qcRd37wmb6VEMX0rdjP0QWzUKoydekuzv5yGR50hPOTMFwGYf4tCWJc2P4wbiL/F49pp7DW/NQt+9cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844050; c=relaxed/simple;
	bh=ZUltAtR07i40pgJXXbIJlpOQg4mwbvuinwqOenRNbWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV8WNkksCRQy3cY6ebBO56GK4GNUIP2RhD/D35m1r7WFdXie3D6jwQe5CN4aiuYsnJ3XJB4UN0oZlcUVngVcqIahRsgdmaCDXBwtsRrdwWxF1JMhPh1FJJVP6VrnPqVeFu8rc/E2bxdVBVKbZsYmRtJmJNidl2WHAlSqXXP2Vl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oab/YfBe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oab/YfBe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442ea341570so26113045e9.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Jun 2025 23:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844047; x=1749448847; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUltAtR07i40pgJXXbIJlpOQg4mwbvuinwqOenRNbWI=;
        b=Oab/YfBeKtFP45UZXmDbPblPybuUlf0QZwpKyTMMT3w8w9Tp3iJkeWyYPi6rZGj70P
         L/hVT4nRT8ietV5xWcDUKOTgrLN/KHJvQFY2gNyDWolLstGNb+r99ewjgmX9wvFS/5gF
         /CPL+I7nGmOIPQOrGXfZpwP24XvZCybHsgm2cCehQQMOdPE5blxlUSw0+gp9nj18DC+u
         cWB6UDRk1jYshOy6+kj+wefoZa3cyuKoacRrCu+FyjaKcrxg15uhXjQRMKXSWExUjkk+
         LWZODQM02wOfO9xY/BJwcIB9jU3C26yMGvw0Dpj+1AAFdwgUhVbJeatSBMrHnYPs4anv
         kWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844047; x=1749448847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUltAtR07i40pgJXXbIJlpOQg4mwbvuinwqOenRNbWI=;
        b=eFl2TpB9IRNk+ymJhg1JyvhPSGIKAjjgwiTi60NMDMmslnH2tCb/4mzwnYPQk5VvHi
         zW7GpHN79gbKtBKhjHdF+e9+n30G1sge/PTJSnl7RoaKpSgn3SLsidXDuK22Hn8mMfyg
         vJxcCs2HuBLaHY/nA5dBT8T6Xy5Ahfzky9v6lS5MbFx180/vesPZtJU5f/tZC/SV2xY/
         7imngZzC2CsPK0pTlM4PGI1VZ6TW1MRz52txCpmEpac7IWGATjIE/QawdMtRM5OSbq3K
         bkd0zOPa4jf4zG36WQ6Al76WhGCV/38gNXJeZUCYVYRzlR6YZaVvgRZClq311csqatUs
         7g7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIlwomlPsMfS1x/sGf0HZzeqctWS74u1iQbqSPBUq/08U7cdkpY56WlGtSIBuQRkzaeY8cG1Brp8s10R8n@lists.linux.dev
X-Gm-Message-State: AOJu0YwI0ZK5uUxWH/vSpYp0TZVuddS9cPR0hGFqlWPUHMnqUhVpVG0o
	jdmU1Cl8/6G41oAvLlgZCIO/CO9Tmccbt2zsmbX+ZVPPzYgZw4bMO2TwsNtSaOnDiIAK7JFRq2Q
	q8hp7
X-Gm-Gg: ASbGnctr89NCSQe1U/sicmQe2w4/gbNX+9Jmhn4Der33Y56lRi0ABfKnNhv/MXB7fcL
	Nu9w0UsfMIc9RcTiwyaj+l71I8UiaVRmnXEl3j/sDLb9U54fo2L/Vqofsu/cZ+rFqjJ5equGXzL
	LAwIqknaGUygoffJQK3kue4uZp91VeRwHM25wn49YTTWeEk0O03FB5YQGx+8YTWB7Y8PS7Dm/pS
	Lis1P4bvZ0CQXbtinqZiKVotk2YSJ1N9iYT2yW9ZF+gIP/Q7mhe3HPo2AacWNIM6xGc+2hc6bHM
	OZu7SgxCF+krgNrU8vVoq4JbS9VZKIYl9+ydRoNd2D9exgFyizajusj7fZERsQNJkA==
X-Google-Smtp-Source: AGHT+IE4Zr9Qtixv+/C3Qb+X/JxHGQ71ImNqXM3WL3OQKOC8eCLWpkHvUD/xQmb3j6c5zEB7cL/nTQ==
X-Received: by 2002:a05:6000:310f:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a4f896ec04mr8654673f8f.0.1748844046754;
        Sun, 01 Jun 2025 23:00:46 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe740bbsm13691263f8f.54.2025.06.01.23.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:00:46 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:00:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Donny Turizo <donnyturizo13@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: rtl8723bs: rename _Read_EEPROM and other
 functions to snake_case
Message-ID: <aD0-Cmc089r4tLLH@stanley.mountain>
References: <20250527004327.3627-1-donnyturizo13@gmail.com>
 <20250528211533.DIM_zxnE@linutronix.de>
 <20250528213139.QHPG7Pf1@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528213139.QHPG7Pf1@linutronix.de>

You invested a lot of time into reviewing this patch...

On Wed, May 28, 2025 at 11:31:39PM +0200, Nam Cao wrote:
> Please mention any dependency in your patch.

Yep.

> But I suggest waiting for the
> dependency patch to be applied first, before you resend this one.

We're not going to apply that first patch.

regards,
dan carpenter

