Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74B1DDC33
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771835; cv=none; b=eNvCeSXDBb5ghAb32AB6fzjikqHLkwOWUlF0fkPSbLr4M2OZthav486VIoW0yVU2tw+YPehYMORQPnoLyhPJYxsydPcXoCQfaIhC/rRBWhOX2RCfJ2Zok9hSkdaPHYO1w7h8q6d4HtdOHFb/Bv6EijLpAdC1eKgZ+hhaO11F6s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771835; c=relaxed/simple;
	bh=x144MvYSBZQEYs+H4vfY8a1rB2ww5lsMVVfUzakY3Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWSccEwSSV00HJRJsEt+LftFDkJEkxovRmq63W92jkk5DDhm4HhoWm1q9+mILRK/ldSIDbmBg7DIs1a29CzFb/P5MuyfrJL0jQsrVOc+uOpvrxgJpkqczvXbqLAewL/Fk/2M83JTK2KE3Wk0x2cNWUaAt4rtF9T1jxMtutKPjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqyuv1BS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqyuv1BS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacf197759so51751955ad.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771834; x=1786376634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x144MvYSBZQEYs+H4vfY8a1rB2ww5lsMVVfUzakY3Hw=;
        b=Mqyuv1BS506pRFCpwS+BvkPP3rkl1zysUy5HimeNSdUbx4IqWDEtcZfMQqueXyW7se
         kzNFN71+Tyrt1RXqIX1QWUEjeSBC7huPw9KgMPpvbyXsKbNWbKsjun24GlGVs7yjdzUg
         2afLXiDY/NBsgVnAbAvhACI1DfHErfqJhhzSks0VgSRpuDULwyox//I7doSKwra0RhE3
         +OPNX04nenx8R+taT7F8xCKR/CnFjyEPdUZqcrpuYq0RteF9vYsUjW1g9ZLNEXVQAIs6
         Q9u8jb8TShwawZjZ0ZEjnqB6Vrwukx0ck9jtrMEk8nVIIrC15XzU43FlIMj6OEXI1/+u
         kuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771834; x=1786376634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x144MvYSBZQEYs+H4vfY8a1rB2ww5lsMVVfUzakY3Hw=;
        b=KQq9ws2+8uGM7TQV318nod5zpMvreYMxFVo6QiOb6eM7nP4uGEau5kgHVtpAjl2H3N
         TuiOOSlgZBimtru7zGEHHdADeF4NhUb2gKsG/VLfBXjyiWBNiw06BTbo81/ueC+2mgpt
         l2cpd7zqqOTnhqhLQRZovSbJOTSMnfLLSF9eYVKxqQreYwPY8N4dgDkV0lJ1n3y5agfy
         cgzYgvHptNW4e6M9S5dmQfpIULRctbwOPcxrlYUpS5PwM3yb5pn0RjjFKFLCLezmGq+1
         TqkMQjR44cRFsZwFcIvM6kALmT5EW+CRbCDiml0Jcey5n1Ls/xaQ7LQn48X4qqUPCeel
         5z7A==
X-Gm-Message-State: AOJu0YysFoJ7tIR7NqnYj7Rbl7JGmpGncFl+4Ehmv+W+zSYVTkucklpg
	i1vY0NcP6WgrEl6FbahNGRJTHmuYBA2oPImZJOM0LjhI1mDYtSQi+MXa
X-Gm-Gg: AR+sD11+AfTOFJz5E116k2G/XZsb1FZ7LR3yVbO8kj/GukRFhXxfyTMQ99esR90JKAH
	CdtxSwoGJpAD7ngbLhvPCrD8U1bhrFsFAUUqnyMnMmjLL94ByoJYIua/rHWXKfm1ulv0sccNuBn
	NzqEuH8tUvC+lSbQYa3Dq+dbtJetX2SM7PGqOvcC+KQmCtf6heO5RQf5EvrlTEnGz3/HrQVY7ew
	jF+XpZsGQ4Gosqast2rXCtDETv1Nm092y5Js23XwJ71v2Mwk8aLYGxyld7Db96wu/InE/xKeQpP
	PXhgcQLpq1SSiZqHX7zwB3Ja5y3fJm6O9AaxWKeMWOtTAsLeDTWdNmvXeqdNJ0gBWa47lv5Cs9V
	wcAtXKCH5gUqh5TCEZ99ZJmiHoHquZk+zQL9nOk+GZhZ0I6K2lwrQuxPnpkI30FVrzKYbBCJjqr
	YfprMYIMEUS/GjNrGOdY60NIKyPUBIRhsOwth9IZu9kbxQXHMmzkJRc6/36C1rcHQ4od7hoRqOY
	6l5xKxUx/vmbAwv9ui27oFZuLEm/x0dCDg=
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:46ca:3339 with SMTP id adf61e73a8af0-3c92a85eb6cmr10210670637.39.1785771833729;
        Mon, 03 Aug 2026 08:43:53 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e1886e7sm44149361eec.26.2026.08.03.08.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:43:53 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	seedandsyntax@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
Date: Mon,  3 Aug 2026 21:13:36 +0530
Message-ID: <20260803154336.17636-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2026080337-geologic-vertebrae-b68e@gregkh>
References: <2026080337-geologic-vertebrae-b68e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 03, 2026 at 05:09:46PM +0200, Greg KH wrote:
> Where was this suggested?

Hi Greg,

Nikolay suggested adding an intermediate pointer in this thread:
https://lore.kernel.org/linux-staging/agDaGJ5UKndFUNPY@archlinux/

His comment was:
> What about adding an intermediate pointer to traffic_stat? This will
> not only reduce the length of the lines, but will also make the code
> easier to read.

Thanks,
Mirza Ishan Beg
