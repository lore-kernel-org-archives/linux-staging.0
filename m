Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429191E7C20
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741218641; cv=none; b=BRr742UcL1cHwmkwbRRCJHYgPGGmb7ARoitwS30WbtUofJC5G1NEhZzrdtfow17bEbQKZthL1bPKI76Y9LUU1mdp7t9V5pM526ot8JlCOIJ+/W7aJSNvZyZ4+jnYrBTHTomThZO8m9xOT5GEmheJpm+PdmZL9uoWJc/j7rFj31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741218641; c=relaxed/simple;
	bh=Drrr2Zu7hQ3OgsXqSg6RRujzqDzMNYci98Mv7nKaP+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V346Jij9SW+pybaw4jze1LrfW1FJpRRJqKeQPLHS8tZztkKcGmQr+LChqEBKnrcSjfFCJQifXIu/q9mmzdmzz1OmuP0nEhjajBYm/u9b17Rp7QMYO+A0BKXS7/V1QtUb4ZS4YPGjl2e+gbobfOFByUCTAGLtqLfe1tATDQXz99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clom62/8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clom62/8"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fee05829edso207823a91.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 15:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741218639; x=1741823439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Drrr2Zu7hQ3OgsXqSg6RRujzqDzMNYci98Mv7nKaP+8=;
        b=clom62/8V1UYxN41tbrRYXRwD47HzWENryt7zDf+Pz8bDWfWda/rdzCdDwmaao9vCy
         jI0dhRS5OHtic7x5FBnvOV2/ayXUiy/AwwIMjN5NMdwwV8ofykYGCn9lmVrCIqPDnCMT
         e8Fjwra+BRvWTJyxk6Gu96KBsSkP13n6wNqa0AQUEJyW7jDLiW4/Xo33jN914MuC8UCq
         wrzMAjMONQMthMxEmekb9qarZizSADSc99oWP5e46htL3PU2mwS/NP1iWCArF+NZCWGX
         oHRaw5u4BF3+K0Yvjh25GICwWrmvnYnEdQAClJYkG1nKEp2keldOCa298ViCxd5zDUV+
         W5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741218639; x=1741823439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Drrr2Zu7hQ3OgsXqSg6RRujzqDzMNYci98Mv7nKaP+8=;
        b=p32UTChQiDRIQ+P1EJBaOBvGdMNLQZX7tBLhUY7y1Q5bNJtn80xMRD6up0gbbc8boj
         x6dlTNI6Pt0KutLrSau8fdZGKYEQcQNXrwGjwJHc+f3I2l/a8QWCdb4rRjZGODRhWqZi
         UaSrTC2uUD9kRt7x4XjHlk7hDTR66BovHQEeEcL5K2MSOZNn6ZLtGgl6IfP/JUEf6ypz
         SoOPxb6rj/C6E4R5nPO3gfndYqd+ifP9A96nZGUPJmZTuc4N+Dr+Pns3aRg5xtAiMDy6
         /M7f58hxQuEfgQhQ/+6YQXgxvqLCNUPfKqN9cAYk40TTdvyLUbd70xKS0a3dva4xI1jm
         bZVA==
X-Forwarded-Encrypted: i=1; AJvYcCWjcjMKqPgGJOo1rmeP3KWR2ef/ytKoFc9gSmjYnVl61Hu43+NcqgxwepeFbEjjTa1Wi4ujO9/M1uiJZAUW@lists.linux.dev
X-Gm-Message-State: AOJu0YyG3194doYMhoJyD5tDv7xQUoh0Xs2bpk2DCthhSumeWOCnmHu2
	Wz91ulBvpsdRlyZhcGSzjePRz6P4GtZvWdsDhXIGCWQRdw56YJgk+UKytg==
X-Gm-Gg: ASbGncsTPhJpiAg5+uQjaEOj/ePu2J15X5aQX0Yyk4NLaEVvVXjlyiVukk8EOaUbn5Z
	V+mzhXHOqB8EQw896lZXrDKX353HLxJcmrofmj3LgnYGfZAlkLWfLER29TpgFGXKIhHCCf5PniH
	V4Vf0cfIjg/EcBuk9kNyDmiVmlPXTYFnCGNxypfi8+8cei4cXEOK0gofwwLlzWYHpXq1uOhbSPX
	HUpKQx+H1PHvPDYW2qSgnVkE1lY+FE5uJhLkZ+EBc/DH0nOp2XnvQ2mK+HCkMvFqaRl/inyoR2X
	r7EnNpH50QpM1JJHkdmLvTZ/mXqWx82yYFjT9vD4oOfStRQgRwhfM6ozoPr3o5S1Wro=
X-Google-Smtp-Source: AGHT+IHoz+lf460cNSoIaOZQhBjzMQPTXlH7YysMIJ2rgNlpSS+X5znxdoE6LIbrBkEBdraCcU1Y8A==
X-Received: by 2002:a05:6a21:6d9a:b0:1f0:e893:409f with SMTP id adf61e73a8af0-1f349496b41mr8807677637.23.1741218639522;
        Wed, 05 Mar 2025 15:50:39 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:857:3077:7768:d8a9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281077229sm18349a12.12.2025.03.05.15.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:50:39 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com,
	danascape@gmail.com,
	gregkh@linuxfoundation.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: iio: adis16203: Remove unneeded spi_set_drvdata()
Date: Thu,  6 Mar 2025 05:20:34 +0530
Message-Id: <20250305235034.1548822-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304143230.6d91f64d@jic23-huawei>
References: <20250304143230.6d91f64d@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review

I sent the patch v2 in a separate thread, if that is alright.

Sincerely,
Saalim Quadri
