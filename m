Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E318E050
	for <linux-staging@lists.linux.dev>; Fri,  2 May 2025 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171352; cv=none; b=Q1GQZz5Bq6oZBxUebQxBEjuga/h0+vIsIc8MJFxpzz/5S8QSNwOHyZmH1ei1WqKCHdS/Bev5I+2RSXwyaqCjMc1B2W+PU8WbraCAh860Rvxj3FNFlJnWOSru0c5/aUgwRm+FTquvrGZklP5wCmqh81AyDTOiIJxqywvKOSHRX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171352; c=relaxed/simple;
	bh=hOhh3gEilCO3bcXc9+T6C/ljAGT1BE1jLApD9olwcxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kxmbVF/CDRu28pMahTuJsXuvDI1OwDOScJB4nLnxoGKD+hKwBpJdNc+9J7lHOYBgrvTUcSGk+zc+cx+8UBSQXCFMSzWJsRgc5/k9VtGNvq8ocZeDuN7WhqJwqaQCuYTwKHkUUXxwTVbYGcBlN+znXSs9glVoYO1GVkpekICPEDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIE0o5Ag; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIE0o5Ag"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so247323966b.0
        for <linux-staging@lists.linux.dev>; Fri, 02 May 2025 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171349; x=1746776149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOhh3gEilCO3bcXc9+T6C/ljAGT1BE1jLApD9olwcxE=;
        b=lIE0o5AgtVxKG//pwg/lOJ3f+Wu7HB2cVo5d7XUaR5EOy3wGMGllgPKdN6pguE1+3t
         FlqwgWZc2FVIGSw1tq4tOiJkGplQ/KP+6VfkhabYoh5n328npw9dK78hEkwClDNmi1Jq
         hshd30DS4k0yvOfl/+o8YFDhcB15w0j/3jt2d6SQQci1JjgmET74WFZbLGmzdsRBPOz1
         95OaOSzzL7KbWO1DYhvIeWvlVi2AkMY8Z7lgmROKMHxgX8bILionU+d4lh2hZCDP3zhZ
         ZRpgytFk80sfpAjWQM3QssmjqsG5FqmBTAKtV5oA5gnH09Qf8HRkCncaLpmMeNXg/5uG
         vhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171349; x=1746776149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOhh3gEilCO3bcXc9+T6C/ljAGT1BE1jLApD9olwcxE=;
        b=aErgT9mt76QtSDG2hvLzDxX/o4zAQqeIew02n1ISNKmJKpAB3FNtC+Gg9oMMvpGqZB
         KpDQS8hbAb8OOYOvHp+zmt2+v4BVqg/TnEvBAbpHbe5mnVICpIAHGNmJcwo201IGhTQY
         f9gVX62QxWgpCc/96BS7eCMjqvJebY+r0wK13tLH7/+dDjbgOGDY8XwyulbBmyo5MUEY
         quHbf+8gXm6IizNV/vpXDHBa0Mn2i+57IZ8OPsErFUbTLLfahUKNE06qTh3bXTaPRDfW
         7hT0fD84E4x0N4cLCgihN0a0qtOqWcQZQHBK99oPYNXtXk+5Z2HfErkjBJg2lDhKBi51
         J2CA==
X-Forwarded-Encrypted: i=1; AJvYcCXUI2yilUfPxzjhUt0pGN3cZ/0LKx59fDlJC5KlxyYcODjgQML9s44OdiDdUSrKdxV+tY20MTykQWOSJJ+k@lists.linux.dev
X-Gm-Message-State: AOJu0YzyxnoyRBgM7CEZN64QW/yB+iI0WmRArZ7YyPtiIEc59Blu3pQE
	EBe48ZyAanO+FDL6GWm5KZ4ZNkKk3x8BvtitCpnewnKYzVCptQbc
X-Gm-Gg: ASbGncs03befSdwJHo1Sg5dn+7d+PJRI8eSYhGUDLXcYI7HEBLqlw0E/W60zE++9Yjw
	6cvlbrdt6hH8CMDpigBv6R1XOrg+kb2WzX+HUPDrs022NRz5US/Cme7I420dTJHDxQ+zVyuIR3a
	BY6yNLDfIP7YRderugGrU+oIMo9LzUc+RXKJBuYBMgYZfhJ/rBRApkxJcgKNohgR9Nsx89qEAjl
	LsjSqQRkkxnBA9SjL1AhvXlPAcTUnLBG3joFmvSnAIzTWrM0SbGH/UBdIdEbNSveL7+v2VPbfKU
	WOIcx9+eCqM5zMDCUPX/I5Qdg1KqVyiisUZcxL15hA2Z6rXGp/7PZqHg4soHRLhdqLZXlatL
X-Google-Smtp-Source: AGHT+IFmMkOv/J65q6St3Eqyd/NtN3HZGXk6Qgc025AViPhYRjkJUNoBSU15Qo5gJTx9+pgeUU3iwQ==
X-Received: by 2002:a17:907:7d93:b0:ac2:a5c7:7fc9 with SMTP id a640c23a62f3a-ad17af4e24bmr180816966b.51.1746171348852;
        Fri, 02 May 2025 00:35:48 -0700 (PDT)
Received: from chimera.vu.local ([145.108.89.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3c1esm7807066b.52.2025.05.02.00.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:35:48 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dan.carpenter@linaro.org
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	thomas.andreatta2000@gmail.com,
	thomasandreatta2000@gmail.com
Subject: Re: [PATCH 1/8] Staging: gpib: agilent_82357a: changing return type void in int
Date: Fri,  2 May 2025 09:35:48 +0200
Message-Id: <20250502073548.32948-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aBRxQhLxs13zuFZy@stanley.mountain>
References: <aBRxQhLxs13zuFZy@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My bad.
Thanks for the nudge!

Best,
Thomas
