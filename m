Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A439901D
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098172; cv=none; b=kYJiounkgwsFKOLk2OFXKAs9SlRCxB+wn0GzAd5iERpt1yR9r4mxlrkuBXcKvp7HGYvt1+ETEXgQ1Es+ajJ+aNUz4rSoGclWLKJ4Dsp39UXIZlqQ4ZRTODOFd9vi3txKkNGQGEoSo2qS/EbXsSAbnaL5Qi/73MbhHVarJmSaV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098172; c=relaxed/simple;
	bh=Irxnb7Px1CdiDpiCHg0OA7UUlyGHeHynLgeGSJJTNnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8VY2J19GRGjCWoMoQ8crfnkSyMM4B1OAdPD+BPKwXLDD0QNvywpzjoGi5/ncXz8NwS8isJZMdtbK4m3ffYG/IlS1i+oSHMRWM7QBeox5AupZ63lJT4wC1F9nMessE8tj+cW3Rv70msZwRt0GWbWElLWLFZmxP1+3HPFhghEtWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBVplKoP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBVplKoP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso5521765e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 01:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772098170; x=1772702970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps0w77eoJtCh1+nrBgZrKJWaWmd1BOvQ+nplYIYeBpw=;
        b=jBVplKoPsR/RfDR0cdHScKY/KD0N6ss984MrFyJiZpcsh7eKPiepM8GVpSnT90tTxk
         hlyCUjO9VyqJXEftGy+hTYsgvNPbJnZVgayMPy9qLHihZz2YSFIGrq61zvfCCCyIrhAm
         ngM1UpmQc4w1DBdsVNRpfpSj+R9V/SHltzh+61R27l04E7vc6MEm5rtULUXxCxdQ+TBK
         A76Gu7H9qoelIYiMpHXXAkNlSYgt2ik9i1UBhrBevmPJ1EEuY7thAG6gL+IOz1lM0aAD
         0MrwZkh/5XLXjDTBoLUw2dfmwpRDZ74vzkdsrzS/jWFT6FCbApZegInh/cL18vn0EBZy
         oRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098170; x=1772702970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ps0w77eoJtCh1+nrBgZrKJWaWmd1BOvQ+nplYIYeBpw=;
        b=PC1fQ7lPA+uS6klFQl0N6TNY3g/sKL0nqIQYI3UnBU0+staOv3U23m+TShqBR0q67U
         94/KDw6Gvi9hx8sOt4itfHWYJ/sBL+pDaMhhUMIH4BtqeWL6jM37M8xTBCxsarZxeI/J
         JZ6tis97TtAoi6czbuZKpg2arjskQkQc+t8LD0rvOEsc60JKqm5qY6UWfWmKtsLmr1cY
         1SN7W9Jj0+9KwrC/9rUkngysF6Qq6AiiqzW6vJrD5J0PaaBwyNjC/nMNrPRO/rqWRlVr
         AlrMpgbyJy6CinXKnSwY4ZRcSbOmexaXp1RurvH63WjdpKMvBY2bYmr5BE9s9jV7YXDP
         3ITw==
X-Forwarded-Encrypted: i=1; AJvYcCWH2D6zZzu5Pcj+jUIPSAGq5ASk7fR9TRKA++3feLgKim2E/KvsXU/zDu3lRthwCYaQhn5QFDddrpgAJuU3@lists.linux.dev
X-Gm-Message-State: AOJu0YxjuoQt38dw7jxb9DYzZcgqWRnU65Zgzd93sSlQJY9OrSGY7BKr
	ilXtvSmEr8lIqJcLB5tpbXQnLLl7LmSQx6CkdS3j6z+23AQnU33DnFh34h1p69kZ
X-Gm-Gg: ATEYQzxl/vBL4Z/x70dXav/XuBtfXLdFqvV638M5KhboGxPreywVO2y1t2CzrC+x1SI
	Xo2WCeejXVS/Y7gZ0xaA/56AHdgawYzTITBE7abUWEDLLNbxJwsFw+H+zYvEQ5BA8LlNJaO7LnR
	ms5lTYNtBQ2pCWXmXjxdLvsyKgU+0sXZIw9Z68J3Qpr+j5b9trYrzvGTHuzcIBDKefX2IsqiUpP
	HjPEKA0Qh7mbbvmiIoO8OXrqmjozAKPm24bldsmGkk2vkLtW5uXg4Rtmf/maKnJu6imgmXiZo6J
	G7U/3OfRFmdRT0K55Pgsk+GtKMEliS+i4lWmTsw6o/fqewlgftIBAZAnh/m5e+SKe5YBXgFs7G8
	br4+Yx781E7viDNzkl5DB3AxuX2BilDY0nPSZ2f6xkcE5Ug8Uc9iz032wFYsGqfEYWRwHj+0TSG
	PAtzsfPyYB
X-Received: by 2002:a05:600c:c3ce:20b0:483:c12b:fe3c with SMTP id 5b1f17b1804b1-483c12bff86mr50611595e9.4.1772098169492;
        Thu, 26 Feb 2026 01:29:29 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm76482175e9.4.2026.02.26.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:29:29 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: add timeout to busy-wait loop
Date: Thu, 26 Feb 2026 09:29:28 +0000
Message-ID: <20260226092928.72639-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZ_9x4q5BZRJi3ue@smile.fi.intel.com>
References: <20260226052615.65734-1-linuxoid@gmail.com> <aZ_9x4q5BZRJi3ue@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Feb 26, 2026, Dan Carpenter wrote:
> So this is only from reading the datasheet and the code?  I had assumed
> this was something you experienced yourself in real life.

Yes, purely from the datasheet and code analysis.

Ruslan
