Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D123CFF5C
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 23:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453640; cv=none; b=l8/utgcE2RdXBg8yB3hlhHuCAFx4w1zR9s45K3usTKsHjqMuHPF7MRigvB62stqRID1WVKSUqXpNA34d2F26HZIJeMieC+632FA7+8klsLci5zY43bbWoy+oZ6ueNIE42CpTd5dHkQjRO150Dm2lxqAzTLhLMNG34r57BUpAGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453640; c=relaxed/simple;
	bh=EgABQERAhR/kn5tIoo+6A9BnW0/pEBPIcp/Nu23W8Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSXkJ0Zkv1yd7yw0KAy/rSaThKDBz701PK/0n0PtXb47ifKO5vCa0iXsLKOd+Tj31Iswosf1gwoyMaOHOACUGx689TaYITg8j1QZlIs5jAAI9gSJxIzTsHOuDL/ePyjWiTv5l6esXyzhzJqwuToXrQA+PnoPdcHdcKVJRPCCFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3ZwuvtC; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3ZwuvtC"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e7391839cso286832a12.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 16:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785453639; x=1786058439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgABQERAhR/kn5tIoo+6A9BnW0/pEBPIcp/Nu23W8Tk=;
        b=d3ZwuvtCcuBRRyKMrq2WAY6qQyPeW4sbCuACAe1XA+Hn8WqbGxYJamGBYXLiXw8Mzq
         p8Vy9JN9PBtLKxHzv22kU/aqasYy0/pSaDwWgqTIXKKoAylg9hTfzSL69BJM2bG6rsp7
         pVTVvCojSHkRC62ECFIE8vgR/9/usjsuj4AM1jbBaBIEOsGXa7IVgAJY1Yu1KoVvnfam
         YwB+92WK0uYJpFrQDoYTkuqzwD2Kh9XvPJVqwj8SLnfXNt/m6vDZ964gcwbyD6JPOrg6
         kMbB9YKE4jFQuAtwr0lwQKEgcXm+iuCXIlRbuATdcZaDXAjmiKYTL/sFBOzZTSpT2yBk
         CZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453639; x=1786058439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgABQERAhR/kn5tIoo+6A9BnW0/pEBPIcp/Nu23W8Tk=;
        b=Kf0/Z+ldaWUYpIJHulU1hRH2ui/ooY+LuRyxoqKKFRLM6z++QXmzoKKEV6fitjn/r2
         K3bNdGawN/8Lf2ZTH7ouUUOXxvOKWf06yLvBxeCuv6zPgmiSWV/9GBcJBI02ZFIW29kG
         3HGkKppGvtnSB3vREbq3lfZKjhz0e3xJpyC2SaAvhM6hjsyYKgI4+DsGYf/47wJpEmBt
         hwitoOZJIcpkwJUheILSSD6Lgi15kckfCsT6ks8lD7kHcr9scuJ+czW5O24w4GNzM+lv
         t/nQk6hGbSPlxLNcNgvVqgNecyo3k7ycLiAdR3Qu7f/qqwEhCal61TOgnXeMNW2eXeQC
         Uleg==
X-Gm-Message-State: AOJu0YyNpbeZ0ppcGqsBT+OIbAUAwo59U2GCIp+Gs0Wu9LeqoqMyOFHH
	zXegL5ztGD3Z7M1SwOSu0hqmfbPlHA91mda4VZGlZasW63OAf+I4T0ZL
X-Gm-Gg: AR+sD12gKSfCIl+syXEme85U9HVTxkrvN3/O6cOmWY65ehWAGaEHaahpV8tvxIRXC8r
	I4Ecwf3wvkVWy2qum8/eXWmErZ23lh4Nh82zhiVBMxPd7V2a/7Ppq3ygI5y62FnxARfSDP3Vf51
	6k4ecjAHRAQR6IFwQWOdvfNTTSQcesrCTShP22J3lLkK3AUMxKOZotTYQwNIhVU6oyNtGDH6IoT
	azVAQqjHwQybiVd5KOzvWSndpfqQobGXUkV0ttrzzRmmc8H5kwCsLLAizMmeT/5HhK6Foqk6hhv
	Vddtcoo2KgrWyTYUGJNsi/L3SHc9BpkTv9Bc1GsTqzdDSZ6fEEJZWw2Rm1PuYEd5mYlaP3cJbTJ
	LBYAoIQzCdvVJkg5oivmQ+GQ18vraNl3k8GXJcwxkNXwU74LOXE5KS4d0V5ZxFlW0V71OUNzLzH
	JWWPWQYRXgpSrSL/d9bvpx6uATpSxI9IowQQHaTr3Tp84ookmAFwxCEMdStiOdO3gJFK3DMPv07
	GOZmSi+8y3hQTXOByFcPi7H3aIrqZbkF1Iim45jeEOW2KUdexpkzg/FxrNF
X-Received: by 2002:a05:6a20:ecc7:20b0:3c3:7427:5ed8 with SMTP id adf61e73a8af0-3c9004a0849mr2455141637.8.1785453638853;
        Thu, 30 Jul 2026 16:20:38 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb8250daesm2790109a12.9.2026.07.30.16.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:20:38 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material in rtw_set_key()
Date: Thu, 30 Jul 2026 17:20:29 -0600
Message-ID: <20260730232029.83304-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730231714.81977-2-skunkolee@gmail.com>
References: <20260730231714.81977-2-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies, this was sent twice by mistake (duplicate of
Message-ID: 20260730231315.79688-1-skunkolee@gmail.com). Please
disregard this copy!

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
