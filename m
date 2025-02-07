Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D481238D5F
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940812; cv=none; b=HO+GVfs4LU7Rxo6wmtqAjhVzi1ycjNUjJdsDnwl7Ka92XrfTHhaNGaf4VSn+BFYqOxUtIZhydu3Y0LPtjDOIHYO+20zFNj7aLuUc9DnwxZBN/rL9HPodTnn0ehCWtdkAx3A4MWib+RM2A6Zf83YQuTxb/ca5bbas11akUHRRLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940812; c=relaxed/simple;
	bh=+BED1zjhttU/x4Q+azgCmxlLeaM0If4jCDXrHqEmxTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zc2XhmDE1clDAQqIg4pLRehnE9tGkm8cXc/E0d4bw6u5wvTqr7/AyfZ/7zkQvjBHRsxDFaSM1rnmvA8ppjHxj6LpgfuBxFQ7/muoxVSLgGzXGc+uhWwHrKtzIODXu9N4MBINy9pQQIoKLzBmsSKyS0WuCSvC/N1tSbD/QKiYtao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ3jJEiy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ3jJEiy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2162b5d2e1fso4948885ad.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940810; x=1739545610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQMc8vD8km902bdCWkfekYhqGdyiSxRELEICgzxDFSE=;
        b=lZ3jJEiy+wAzaPSL4eOnHoHNJVats47UDHdO7wzmdJMalIMS9op7umFpjMe2UO1P4H
         FncVRJKFZOnjZpkfruskbtxZiGcxHxG04gh41rTPKMA6UKVuSsMyxTa3DIzQlgiS8KLX
         yxR5UioQIgSNVd+fcedhwrBnaAl5zu1Qb6WhnTHFK/l5HdGUMfrD/2UdkeckyiVYQ3Eu
         qozsRimuABTEMHn1UhMp2/vBjdnkfdMPt4iNxA5sKA4P/9Mx7gZNmHs3jT1Onu5GwUlI
         HjMUJQWT7gxlhj9xymKf3smHaQMLXBIIcb2/dwClASkasvI/PfGv7m0RHpwqV3bYjaEy
         UmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940810; x=1739545610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQMc8vD8km902bdCWkfekYhqGdyiSxRELEICgzxDFSE=;
        b=oVa3t/4DvbI69n+Xs4zJZHeMF1wicqb6+fSQ1FKwqfTH1wEFkO6Tj+vq5HKJj22VdN
         NeNvkbprcV/DDI+kOUiRg4S+PFQVYbvoomKdWZ6NOvPcltcxz57dbncl5j0Ev55u8dV6
         NC66AR7ENeMv6ARvIhYQnyIjJq51VLNC/Kz+BxaIAp1r98KWBH5AsbScNLuEuMyQXmIV
         hEXMmaOATmoevF0LFt8FZk98BLP2bn0Mq5/RpSUvE3W3yhnxr6Hhy3y9F0/OkFXa8zBV
         AqVi/NQLlnwtR+8xGDIluIenpT+XgyZvcBezSnY7A/2wlaus6M72MqXCnAt8qCU48mne
         tkiQ==
X-Gm-Message-State: AOJu0YzERHjEbDBeinhaxWQisg+DyM43qNtMklPXM3oROG9MV2mCY6pj
	3cwrL8GcSW0Mca0Knx7D2wQtTi17V24L2vj0QmYy0KKpcow6tFKr6K0D8zBe
X-Gm-Gg: ASbGnct6RRML6Xh0vwQRHmoeHjBzKmvJo+7eKgAwm4snVb93OsGaTHaWYxqIe0cRjJK
	epuPc5GvzYmKjAm5bPtAwe3I8Lweu4TubEkkT0vRIrgokKPBFCYjFtwSrOGHwt2FxZtjIvrpNG1
	oksiwgeEmaJ5jli3byDkaOHrx9MJ8Oy0n17R0txJKjVCaV+SjlH/8wFlSI2spplFdCJ1AXnjCUJ
	MLgMg2WWysJtjhvfqK/+ylM6P37aHev1CGBt9LdJXzBoyKJbhNW2eGigHJRkLKwjxrz5wuv/CBx
	ZamrSkdDn6ccF8DF/gego8I6L0qk
X-Google-Smtp-Source: AGHT+IGBDJlKN0DY1VF4om1iheLjSRpsYUIOfGKNZ/wqIcT4HB2axzTOeDZuaNC2EYDK96dQn4ymXA==
X-Received: by 2002:a17:902:e946:b0:21d:cdb7:876c with SMTP id d9443c01a7336-21f4e6a5403mr21483705ad.3.1738940810327;
        Fri, 07 Feb 2025 07:06:50 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:06:49 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 5/5] staging: gpib: ines: remove unused variable
Date: Fri,  7 Feb 2025 12:04:13 -0300
Message-ID: <20250207150427.153982-11-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'nec_priv' in function 'ines_line_status'.

This change removes the following warning:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 22a05a287bce..ba07dfb0697a 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -26,10 +26,8 @@ int ines_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bcm_bits;
 	struct ines_priv *ines_priv;
-	struct nec7210_priv *nec_priv;
 
 	ines_priv = board->private_data;
-	nec_priv = &ines_priv->nec7210_priv;
 
 	bcm_bits = ines_inb(ines_priv, BUS_CONTROL_MONITOR);
 
-- 
2.47.2

