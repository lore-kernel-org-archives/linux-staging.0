Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D93B4E9A
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910221; cv=none; b=B3ncNxv5eVhtULHqYVTiGvJzfbtZqfddqZ0Xo5Bn9ecNH4wj9Gc1O3aPamardMnvUw0fyjPZHNnyR5bk7MKHbWDOIvAGmMzB3leqrnilrGxTSuQUaaLkHPQ+YSXUrJpWyA7QAMFIzyW80f+gs3MD/H+Gn89bdJNek+Z/O+kcqm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910221; c=relaxed/simple;
	bh=aDfN8/s4zfX+U+oRqYBBi69jelTKiu7EYm8vL0GKwxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwzhKqxPRYJWtvdeZ21iICFTPOTLvFXy9whQBPmVOGwqTrQ18hGxEbjkoGXNsA9RuhsiMpptMx9DSig7Hi7Fky27ggIFqI2gcSmMqNfoe/Vw0jIcYJWRJ9ozL24xbP19OeidsZiGKWPr6WddPpnMtjXXClxFDlPmPNeywxO933Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYf9mSGc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYf9mSGc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f71156e1aso243996f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787910218; x=1788515018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDfN8/s4zfX+U+oRqYBBi69jelTKiu7EYm8vL0GKwxM=;
        b=VYf9mSGcVeR4C1FhrbYDWX9uF+z962M1zKyK+qnN2zrM9kac44poSyyqiOyVUwXd/5
         hgzQTk+yliKzQd/nUcd7M7BTUZIVBl4NN+7Zni+Wznn0qvVn06jN43ZNnmQUaSMWejRI
         UJlzIkoacQ194nnrucKKWmhcy90ROJObgMFiNRNWcMl0T7OPwsJApcAf5B0vBKf5AM9a
         pWwM6g861H+Vqz0g/TFyLz8SJYflVHmO2WzLGJpkeA2AXtn3akO9QZ1OpKhF62s2dtlC
         Bbqt904GovawSmkprmTdxPK1fDjE4/pwRLXS88wNRH7qz2QkuHT7cycwUoKm1RIQB9Xd
         V3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910218; x=1788515018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDfN8/s4zfX+U+oRqYBBi69jelTKiu7EYm8vL0GKwxM=;
        b=TzDrtXd+OPQ8q7fGthxjvtDIYxv01PVORbeu4ir3sC2HRrvRArw3SqBA+kk9GBpcQl
         1AlUrO0JdJXJWmryR6uljIKef22Gx6tgvaiuGuN18Q6XZpPF2RqVNduOnuD2dnn1iPs8
         DUnQ8vFSUA7vsfBZazoRaNr88hoytcJ9BFGtx+eAOsPAZ0xzs6si+2ImEs7FADVCf/8s
         EoKL9AIcCNWOsXvauRh3nihpZG9uNKwyKgBH7f0PDIBBvzx4ZcfxDCJ2EEku6g1ybBK7
         jM9CCkpPiTFmSvlmNvlX0APJKl3p5Equ4fBk1at/Nqcal5YdeLQ5Ayuc/2U5sEDRlJ7a
         x4dA==
X-Forwarded-Encrypted: i=1; AHgh+RrdXcn2sA414Lzvo+YrOfAr5J2zTuswsTIrS4S7AlOUxbieTzwdo1KjoqEwaO6CSjL4Mg1ICApb4GjBuI4M@lists.linux.dev
X-Gm-Message-State: AFuF++loNB7H7d9e8Tt9dvEbd3EGgjbC+uoCVeiMSSsC5rgb/F9P2rcC
	9dFd1zqgMEGNaFW7UoVAsSYtIeQt88jp+0NxAUkgp15nrR6rq8jQjH/D
X-Gm-Gg: AR+sD13ip8xasYFpLqiKI2jpg+ZhjtWeTvCjXEGxapXAhQgQ/jomM0wGAs/NtV41fH+
	1f0IarwUxWVFHNFuIgPsAFz83t0Qxj76QHqet4D360n5t8Zj7WFIUcPnxeXae6fItcE431OCycb
	R480pmi+rqeDy5oAuBJd2cRkpFSTlCwfBIkssibnL9pqS6nnYOVFMMNRdaqHkbj46/eYU6YaHgR
	Gs3qM+56bNSIqW/wrniq1EK4Xe+W2ilB87rgXSOhs8naXN96L1g31Twu51D2QSgMiy8wmhZcfIT
	VbA5uvmO6CRN++1MGAqCUpHzAuE6kCb61ySFU5CD1HSe+bfdgq1DG7+wRQtX2ZlWvUTE66SQ9aC
	zOjAqbmQGK6e6c0rkCQlpS0eVX5Gah3JjwCaQEKh2RcI7iPMo0glDLXd6Dho7hLrx11bAo/0yKC
	wAXXedjvl71GorHwv1wIJpAAnyGLwhf6WBJTiSSv777RFMhRb2AcG0rR1z4Pp3iPg=
X-Received: by 2002:a5d:64c5:0:b0:47f:f3d4:26da with SMTP id ffacd0b85a97d-482f79c1888mr6743142f8f.11.1787910218168;
        Fri, 28 Aug 2026 02:43:38 -0700 (PDT)
Received: from xerxes ([2001:8a0:ee6f:5800:65bf:d008:6bb6:cf89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb28492sm2633696f8f.31.2026.08.28.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:37 -0700 (PDT)
From: Romeu Gomes <asm.artisan256@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in ioctl_cfg80211.c
Date: Fri, 28 Aug 2026 10:43:36 +0100
Message-ID: <20260828094336.13299-1-asm.artisan256@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082812-award-service-889d@gregkh>
References: <2026082812-award-service-889d@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks. I will resend this with my full name.

Thanks,
Romeu Gomes
