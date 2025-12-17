Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4B34FF48
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986145; cv=none; b=Z4cHRqpu39XpS7FqFJcIdjOyq03A4o8xKZP8vR3fdD65HHf34NAyE8tJiq/3INdjn5zPfsynF4+NVVffI9fdanPiZCJvckE8wIaZxSMcU7fFBPK5mVNNI65Sz7SsmA6eebH9Tt1GtI4DmCFXR77Our6+S4y9J8JxlVHPf5pPG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986145; c=relaxed/simple;
	bh=ZIFxr3cPkbypTedSJ87FyUlnd3SUFK/9NVjw1QNhSws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N47YqwlBFq67KqojaFhwR3RJsTB833yfBZ7vypCN7L4+5ETf2IHhSv/797RFqjw9YMemjQjuOF/fICEzNkNre36LBQ/UBggT529oMH06b71/E0Ln6LpMjr577GjZLyNV/Xy4d0lH4/tcquUGwUNofMcMkwdvFsh2KWTGXhucmNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7rVmSNk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7rVmSNk"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so1684796b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765986143; x=1766590943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+YJsvh3cjhyILFUso1VF8aTZIvo+5pZ+aLYD/fRLlE=;
        b=f7rVmSNkaZ84IcAn/SqXF9S2duIa9b0HnphZduxryTWPssN2HeEPAEiRWLP/xy8weV
         mIPEwdaj4iuwTya8GjWaArIABbv4/+o9CzJ/cU8yTTb0nRrcWdGXUPZfoy/Jg98o/VP9
         FH+j6tvrD0iffgX0EvrIl4SwoQrHyuc2b4BNidd7tZ+7DCMIBJCCqCqwoGa9rlWWKft8
         Rpu9D9dQ1RzPgk/+UItFq0MX8nxdcChxQR4YoIjCl35LWHUYbNlq0yaHY0JNhnwB7ysX
         9AFljZY3hfQ0E3vRsmB1Z3tQGHfjc+ARm0BNk4cyt2Mhy2FTsKf+Gpex4swoQY0Lt8pt
         rqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986143; x=1766590943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+YJsvh3cjhyILFUso1VF8aTZIvo+5pZ+aLYD/fRLlE=;
        b=Fiyg2/fr+i6fYMV1XkFy2NtQ+9P3PXSSa1tS4ZOmgGPxcH9xJFaTujiqFtDvwv6wH3
         KzjIndwAcg/G7FSYO4uufdjNP6d69ssq+n2KcnSPyMl9ko5Y+g4/FAdjjbXcvuhvc9s6
         paaDDPEP9KQNrjlWc8/fITD/IKM9f1yY6SK66WwMpltZY4zWKmmOGz3cRdphsPgGqaVi
         dRpAt90xryKHtJRF1UCeAqSCJp94CYk657JLWc58JZVu7ZEFa9ZZKe0HdYc2LA/clbdK
         abQhdGqYY32yqWla1u0XVAzY50w60lU9q1Gw48gANTjlC8NC6aMdt4ffpZABMU4z42zz
         ga5Q==
X-Gm-Message-State: AOJu0Yx1NH+CDRK+4O09/TQ5qG0hIxuEc1MgC3wrvKeD5jl9SLAZzhvb
	YEFgmC+dP0X7H5N6VMIDlxpfNZrgt87f/RsGlHS3+GKAmC9vOpqYvlFt
X-Gm-Gg: AY/fxX7B61hq1sYHPx0AFrzUXD3TeaJCJgZlIkC9L9ocQWwfAyVrXpBUR9N9NF7+C7B
	dwmPcIMs6Eyixwgk3KobsFCWitfWK9mrFcIae9cu8tXicjxBEG9/WBDHU+qqxBolAoctNMiJCvh
	+tr4uIw0Jp1JN6yQ580fyHfj/upYMKl+rVdL79oQGadEBw8j3W55tgoll8MgFa8k0kTHlqVGb3n
	x6kWhjZTV84NhTBpRw4AUuCWt8HasZ4znPq72lHu4XLuDwV+fUbsKx7GViDtSOqBeQLkOwoNK6Q
	r9Tu7teovpSxCgc6jqvfdp7uxbhZs00OGYJBfxbYPDcuHpEGr1pPqwEusaq/sr7umU1PRqdJueL
	EI8htR89la2zXtVQAXsPAvUGXqQqqiC2pEzggmovL+Yr7CcDdSS2pXI6Nl/r0AB7opusbHyIdo+
	yNEe4bP/Y0
X-Google-Smtp-Source: AGHT+IHxQRL5vNucXYa0ZPnSaWhjiXtgA7+SG1qVoYhjq6BTpafKpMUtBrrruQ1/n3T/iJIZA5orKg==
X-Received: by 2002:a05:6a00:8683:b0:7e8:450c:61b5 with SMTP id d2e1a72fcca58-7f67156b796mr11119517b3a.37.1765986143136;
        Wed, 17 Dec 2025 07:42:23 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc0bebe7sm3097978b3a.59.2025.12.17.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:42:22 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8723bs: coding style cleanup
Date: Wed, 17 Dec 2025 15:42:14 +0000
Message-ID: <20251217154216.8921-1-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces and else block in odm_CfoTracking.c

Changes in v3:
  - Clean up commit messages

Sanghyeon Lee (2):
  staging: rtl8723bs: remove unnecessary braces
  staging: rtl8723bs: remove unnecessary else block

 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.43.0

