Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201A2FD673
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014620; cv=none; b=YzF3w+IuhAhVNUZZG2mBCcS3CVw+1fEOcVlo6/JQpj3G9Q4Ig0J4B/3qMIwMhOM6bOAaYPu8PP+Aq7kjjucRREL/sWdPlSTJFVR/buaCPngQmgnn210frynfsph27qumN3QRXVtoBiOU95WU4tQYJvFFsv4vga4jkHMg9SRZ2z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014620; c=relaxed/simple;
	bh=IS64MH+VyK+IEX0Wf5aJPipY3Lzti3TSwXWFwzFeNiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGTet3M3kK/HQGSt42oU8dKQQ7f87erfZONVmhhJ2pwKsafY5aKsuBp/qMqYOLX34X6PoqYfY+5dVaGD09Gu8g3AJ1U9EBuChSk/vZB8fwm7oobt1/rgYsnnzW0RpLePh1mq0rnrv5rK2gQr2QCQqUUis1NT+KT6ScxDItslXJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF1VxK7T; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF1VxK7T"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so4123129f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772014617; x=1772619417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS64MH+VyK+IEX0Wf5aJPipY3Lzti3TSwXWFwzFeNiw=;
        b=HF1VxK7TgkUv/l/7pavdUgotIOaPaCAag2N9falOQgAkpCzBbXZuPs8HDj1KeZyh/h
         ckeDfUTcQShKWV3BhC8Mv/KAqPuCfOuCSowx94ga4kX1hor/W8ZiAGmsa8q7/iGRy+g0
         DNDbuvEltTwx/M2SE9SCRqHlqC3U0zU4P0crnoNGXyJ7580BOqWDMcRJf9LXYEAqOKlf
         R9IEouRsm4LIpGWat66ZVmhj9rOL+8ZjZCt75oO1FKuK8TZyL3tSSTgHvq2q8ayrIhCl
         +8swVSrBnrdx/6C+vVBhbyOPqrYEEFbXtFmwAY6T64cbns4ezbVLTcTG4wdHJ9ndlqxO
         kz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772014617; x=1772619417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IS64MH+VyK+IEX0Wf5aJPipY3Lzti3TSwXWFwzFeNiw=;
        b=nBUSLWtmfpQiqiEAtn+Rali2c2MbLA1VUh0BKCs04sR+Q7BcTnD9iDpf4DVK8nhqmK
         S//VGRsBfFxZESCxPlY8+C5CuEkpi8tFJ5GvNWPQxLDp4jqefP6iXNr2bAiFJn3bWDKq
         hP5v2hlANAafOCJP1VTfqWTHNA/uBjp/vEuOAPdEfh1/R/X7YH1TpErrdzREp5aaGaI0
         orp64VcmxDmK+fcpUd6CGvJNpTdShuk6LvjI/5WdzUEkzIm3yo0/avtFKn7XHAQph1E8
         UAkvVk/BV7cN8G72U/5Mhg7SzLBvUOTG5Y93HIPGFVUyEiDVOBUOhwdVLiaXMB7NycnL
         aq2w==
X-Forwarded-Encrypted: i=1; AJvYcCW8CPDrM4H5zSVRIXetI3LQYH3OrhwXsqc/xrQPyDwqXU/Jm0EAB2551rc3HiOMcpJejEMCT65DJ695d2+v@lists.linux.dev
X-Gm-Message-State: AOJu0YxRYbH5kkazmrjWBF+SNg2q93Mst+Oezh8GJJTleHnappAjKOfZ
	+YrFLKidITZrazzlb7VyyIIz2WNCJt4Kb96t+qi1VYP5uJbhBtRn8oiw
X-Gm-Gg: ATEYQzxgOXgJKfeTO49jkvMIJRixbTPJoUL68HpzBkd6vY0yHozQdjqfvM2q4UcuDR0
	7dr+BFYGJfeI2osqDebfnmnb3So5sc2GkO8q7G9bA7fnQGE6EhmVSRhh6msOIoUIZq1MvYVh44U
	xmpOVMF894+TN3Ld0kXhGRkmn88sQpGdhygvlXVdz4/ENAk21rLbjvsBs1slMKuf0jkys+eyPKj
	Q8q/Gq9R+J8TSPhw8K1z9h/5Hqa3XEraLJWiTDaq4W8yqLQi0w1kOig2Q9J2Ab1TaHiKpxJ2u7d
	3qOyWMfsCdoVJvS1dns0PGH1aPJHgqeeJn5/5okmdkol6jN5LRhq1jN3CvnY9Tl9ZZSkp57VpJD
	yj6cK7IQHSAI9P4LQGUQhjyqBT4oTOBgQabobrDRHaE2faGyToYewcvrA5DbAY2XilM7+etXi8z
	HOgU5Vi7y4pi65yfxSWRTvGlS7h/rFTH5SHGWWR+8=
X-Received: by 2002:adf:ff89:0:b0:439:8e2f:689e with SMTP id ffacd0b85a97d-4398e2f6900mr3720558f8f.43.1772014617250;
        Wed, 25 Feb 2026 02:16:57 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c95dsm36287441f8f.33.2026.02.25.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:16:56 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: gregkh@linuxfoundation.org
Cc: azpijr@gmail.com,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: move topology allocation to codec probe
Date: Wed, 25 Feb 2026 11:16:28 +0100
Message-ID: <20260225101630.99302-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026022448-sprain-engaged-3f7a@gregkh>
References: <2026022448-sprain-engaged-3f7a@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thank you for the feedback and the guidance.

You're absolutely right. I am new to kernel development, and in my
attempt to satisfy an old FIXME, I created a clunkier API and added
unnecessary complexity. The original implementation is much cleaner and
more efficient than the change I proposed.

I am withdrawing this patch. I'm sorry for the noise, and I appreciate
you taking the time to lead me in the right direction. I'll focus on
finding more meaningful improvements where the logic is sound.

Best regards, Jose
