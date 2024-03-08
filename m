Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1AD52F89;
	Fri,  8 Mar 2024 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709889024; cv=none; b=JZ0zUPtl8i2fR426ZG3RTwrO8xYVIO5/+nvBguP1Y9sVRMje23yQMnpDjnZKiFQ8gfNTzSklHp/Z+I+6NkH6v4C/iu8m3dEC/RmnN/bZnD7xdms3BdUAsKPBzXqOUPa/qU1ju1nlXl0okNwD+4gT9D/E83k89jKyeb8sNuJI5qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709889024; c=relaxed/simple;
	bh=UNDCeg4Dpm8uipaUYfGgtRdthszBUXhI3wu3rtrL9JU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A/rGH7HosUF9TvcBgNTpk9BtnVVLTYpy1qjMVm9x/rdz+IFt7ayba4Og3pdU0sYbMDex0952zDu7CB3G8Kk3kdmvWULlzk7ElKv4a9e52hp4s6hkR7cAZ3CMg9zqwtfWE/lJ+hieETlY4DcDkYY//nkgozihRzq5P2dJsgvzFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bwf7fmrL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bwf7fmrL"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a456ab934eeso275739466b.0;
        Fri, 08 Mar 2024 01:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709889021; x=1710493821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNDCeg4Dpm8uipaUYfGgtRdthszBUXhI3wu3rtrL9JU=;
        b=Bwf7fmrLp2mFbKjofi9z3WG0f2/wZge/0LP1BYpNJbiSeOM5/6bBa+GI8wZGGnoXK/
         N8LWZc+qnUc35ODx9dIFfmyEheP2qMZIfVGFO6pOG0q8X7j7FAHlBykuhk5Sp3ifsEzz
         NSUzlhyFIz9fsk88J6xoAnrbuINeJaZVFKS906xyg+I5GDQ6y1Wugq0B0IS/P6Um9Isw
         kS4aaPE0mJecwR4teRYAOKSdiIzeCIwc7bz7uQ8FMTAoUCa9iPbfzSi62WTHIryZIP+q
         MigpTJ0whTM4mQJAIzVrCHusrvNN85AGQ6MzUMm8xKwzXrvS/w2YOU0zTMgXlMH635U6
         j/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709889021; x=1710493821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNDCeg4Dpm8uipaUYfGgtRdthszBUXhI3wu3rtrL9JU=;
        b=vx4p3SJGsuevuTVSTzdMrYQ6XdZclr6B0zg4fpmbVSspmhWIEDi8XzUOGH01XEJrrM
         dbB3oAe8AZTN6xYzSPnX9PUt+MjkymwQOGYaplMtUTCCGoXLajmLtQ7h86aXOLcMcUto
         AYfK2stzGSszlQbLMwKejOgGa3TP0rAh3smJbZ7aG2A9W2NvqXZMnX2q7w7SG0z4B0qf
         F1mrJGIKPJlKgkbRrv1O04vN5/DhjkPuSHA9Oqd5PBjo2oP2ty2zzaGO4JxG8KskGmjG
         4wGEUmRHoN+C7mVAjxQwEdQfP2okvNdGqAivjL/x4ZQ0fDeoTdHpGpK5ujJ1pFakRdQc
         PXkw==
X-Forwarded-Encrypted: i=1; AJvYcCWoqNZrpYkpz1K8SXGkuZbQ+9nnfhDyRXW02m0HGh4GIB+MQ6GssszE8y2ou0WCnPNi4vVLrAEOQhyepZwEAc31HUJSZ2QGEt+YVsDejd4JDr3OW1hlq3PP1E8T3k4mzDUApJ8Q2nLeYQ==
X-Gm-Message-State: AOJu0YzIY7PuPFT6+qXK8CfqBwxmeTRmrlm3xekihl3IiXhZtZCvyv4a
	b1kQ46HQknYb65aeOhowXbkopA+hsy14TYGZbhL85Od8zmgAh9ZKpC3iQGvzI0A=
X-Google-Smtp-Source: AGHT+IEhMTXhPTCEQzHL2SwliBO4O+AxgTRXfRq6WvdJ/tj/uSKVlyG8EeBWJhNNplhGA8Zt1pkzcw==
X-Received: by 2002:a17:906:7809:b0:a3f:6513:1489 with SMTP id u9-20020a170906780900b00a3f65131489mr13518551ejm.55.1709889020647;
        Fri, 08 Mar 2024 01:10:20 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id n18-20020a170906119200b00a45e04e3ebdsm1038222eja.83.2024.03.08.01.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:10:20 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Apology and Request for Resubmitting Patch
Date: Fri,  8 Mar 2024 09:10:00 +0000
Message-Id: <20240308091000.36978-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306054458.102288-2-dorine.a.tipo@gmail.com>
References: <20240306054458.102288-2-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear maintainers,

I hope this message finds you well. I am writing to offer my sincere apologies
for the frustration and disappointment caused by my recent submissions of
patches with unresolved issues.

Upon careful investigation into the issue to debug the problem, I realize
that my approach to addressing checkpatch warnings in the code was incomplete.
While I corrected the assignments of variables to resolve the warnings, I neglected
to rectify the corresponding declarations of these variables.
I understand that this oversight not only failed to meet the standards expected of
contributions but also created unnecessary work for you as maintainers.

I take full responsibility for my actions and the impact they have had on the project and
your workload. Please accept my heartfelt apologies for any inconvenience and frustration caused.

In light of this, I would like to request the opportunity to resubmit a new patch that addresses
both the assignment and declaration of the variables to resolve the issue effectively.
To ensure that such oversights are not repeated in the future, I am committed to implementing
stricter review processes and improving my attention to detail.
