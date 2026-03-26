Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462533B585D
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506493; cv=none; b=unDJL0+BEPayFwMQtZL0fmK3fER+d9PrbIl9pZVrvh/8POWoKllh+TMzGQnAe4sRGoVFhhRUCW32H7XX1syNM/JNcYk9ELFayqpwPMCX28suMSaavfeX4dZ85B8As8Wfb1VGwEP/1zCFshuuu/fdYCOQWkY8E90BgQdHzoMzxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506493; c=relaxed/simple;
	bh=F+qgbLJeK/mZyW0eAoJgONfbmmXiA/dhNJR/qEvQLXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjBhKJCGshIdGHt/w93L5YD4dg0zBmpuwqioSOazftN2Wji5GRC07ltBkTXDvz+u/8bhXD+Kx9y92rdfX1TXYNEFt0ziACyVYA2Rl+vNnFUxxtFnUBywak9O+GirxMN9Cst9Fq/BOl2Phwf2zsAhvtX/Iwl2jIJgv3XfkvrYlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6452ZcR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6452ZcR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b0603ee486so3876625ad.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 23:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774506491; x=1775111291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgfn7bF607W0nu4oP4iVmN1NneBMEf1vV+dFphRkIQ4=;
        b=D6452ZcRjX5gKlS9dtYXG4SJvSdCarBBZkhf8IWo1PciXMOs7eUD7gTDD32CsMeBUU
         HChBe3HP3KUzx2GGXs4L86VAuAJIJB99Wembr4+VrYC4gSghHjcMquZTBcwazBcP2c33
         YhsquKfUvc3Lw6J+iBop4qeKtYUV5MfAfU1QAYg9/zEZyFdZjQWSCzAMQtw42wxHfcgi
         yFIXVHy0wbvi317CBfKI8Mvnj7aw0p81iEv6Yvt/1ZwKl9sp201tPY6t54ru7mTPP8ca
         2ZU2VGW1Noy6mwlEsuRacmHe0KphOeDiZiObLrmPcuoEOezFj3Bv4AM/soP3RbBR/r6c
         t80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774506491; x=1775111291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zgfn7bF607W0nu4oP4iVmN1NneBMEf1vV+dFphRkIQ4=;
        b=h5Q0ielB8KISRz31J7q3Om+pB1l2tRiqCU3d8GG9bWGXdNNAyqEiJrCAq8DY0Nunuy
         6otgZRTvFiFqHRjhDYUPkIFuNrdy+pjUugFpCwfUyoUOejGXCMQx4L5lR/87Yo3Q5M6F
         KfbxgQIzn5xDACvkL19p8qt8di9e4dSez3j7tmUzx35fFfVaStZhdYtkKnkcemVjgv5S
         cB+pW+ghb/4Ql9iE9G/Hrw3lLBEoBnwL3at6SGBCLpA73tQjIyyK+/oo2uB+rDsru/lM
         3wjDPtUPG2F3zPgRr9m1d7iqoZnz1XIbpV+UiGQeDAUBNmBMRJsM7Mk08bGUriFsp5QP
         x/QA==
X-Forwarded-Encrypted: i=1; AJvYcCWmvsu3exjtqfyo21JlfiwwGt5qRiw4et8GdcOgRRU15H1FTbF5OdjuzdVHpC5rIrlun/WGHa+z0zdk/2Z2@lists.linux.dev
X-Gm-Message-State: AOJu0YxvdzMqIiQSMLzywz+yYiR8AGN/RjkofIqEFxGtrhc9riWaQ1wC
	i4nf9mhn6PdPI5k2kP1RuGmPKHYmNoIsIUW5iFX604INnIQlJMscb5Ay
X-Gm-Gg: ATEYQzzuOnmF4WMOXfM+sMXfKB/sAXyn0GAHUhMXge5zDSaG9f8ml8k1lPA1Q79f4JM
	fiM+0Nj8Jvzmu7KPnKaIjgatxJqdEfPHMsCNGhkp2lpLmdMRkZsAKiRwQ1vfnQSKmujCj4Rc9xU
	C1jUgur4Pp+4DxHcirv0MFgBxouJ3E51t76ux+B7HZWru06TD5OeNZfmhzS32g2qRWQO52i128/
	XAASw9iNlZ2b1JkPnOHjogv8a9RANAQayd3KPKRGoBMi4jQfG7QRAsM8ZWvEQt4vYnId/lAPG/2
	tt8CR0HxZcuw6+D+yFGTAsjEPk8E3jJUDfQoalw1m1O7SquWzb+vr/CY78+6CxgXpaPEv11skNJ
	uduNRyavKZZ7u4yiAhMCNxchxILz+StFhjKWmakJ3/Sh7Qm4nI8Hi3LtI1kkv4LFEgLwMwWiSn+
	jSyanZCmsVe/F6pq779S0HoiB8cVoOYf8nN4oFSx6klhMa7jScmJlLfbX85Q==
X-Received: by 2002:a17:902:ce11:b0:2b0:65b8:b5b4 with SMTP id d9443c01a7336-2b0b0af3cd1mr69453485ad.39.1774506491524;
        Wed, 25 Mar 2026 23:28:11 -0700 (PDT)
Received: from xufowonmvnism.localdomain ([2409:893d:dfc:c0d:7400:1a1e:2833:e706])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76bbdcsm18803525ad.5.2026.03.25.23.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:28:11 -0700 (PDT)
From: Lian Xiangyu <lin25001x@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: gregkh@linuxfoundation.org,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: remove 'U' suffix from hexadecimal literals 
Date: Thu, 26 Mar 2026 14:26:28 +0800
Message-Id: <20260326062628.2498361-1-lin25001x@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <acOgMi9Ww0MjPAnq@kekkonen.localdomain>
References: <acOgMi9Ww0MjPAnq@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Wed, Mar 25, 2026 at 10:43:30AM +0200, Sakari Ailus wrote:
> 
> How did you come up with the patch, is it manually written for instance?
> 

I used a bash script to remove all 'U' suffix of the hexadecimals for
the header files first.

Then I generated the format-patch, checked the modifications in the 
patch file to ensure no impacts to other files in the directory.

Then I performed a scan (using rg) on the directory to ensure no
leftovers remained.

All modifications are only on header files because I found that modifying
source files will change the binary artifact in my initial test, so I
limited the modifying scope to keep cleanup work safe.

--
Regards,

Lian Xiangyu
