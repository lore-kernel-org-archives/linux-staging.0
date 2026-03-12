Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD62C351C35
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 17:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337176; cv=none; b=QBYSaQDMr9wCqDviq+hNOj+hlgnlXMQynu1Z3NhXa1mgBRGsAESv9B/R1Zo2s5tM+u5Rc51tNfNV+KnOuPGLfuPe2fCqjFC5PtuNbNWsES5I+1qgyyAKaT72KxxuEnKfAsxCnWadHBrQkpalx3eVHMNDrCzUO09bt54h/cN7Ap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337176; c=relaxed/simple;
	bh=+Nkie/PnzDEA/BYTSHP6xJWgekVQ8tzI/w3qGxD7c/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiFOIGugCd/TLPQpPKAi0ZIHUiCV9C20RjQIUvwB0N80jA1Rnx3n0cIG5/TuaOOgq2ZYndEux0oscYylEMJgXiyONgCDtknWYemqzKxcouynBay5dPtO5m53q8t4NR6dSMqwfSYqvVAqqLKVd7/kWGo5O8kBaSKpAVTHgaXBdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi2OarVy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi2OarVy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so170601166b.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773337174; x=1773941974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmSFpQGzdnw0Ofaryu+0F6eZMVDC6/V+6cUe7NT7slw=;
        b=hi2OarVy7QS+j5BO6o4WOLqdchjZ1HiaIgBYYcCrL9AFoXpgSzT0U2tytHXjjqxfpf
         aLfeBDe7DvkYKWEMdtRSTQJ1vSFgbFT79grGN8556wP7qeKuDhgd27+Ljgkz72S7/HDH
         dVvsTjvPNLHEzvnT77Z9A88Y/LVXFbFenYVEGyWInzeszVPqhWEbhcqQ6I44CBE7TiCP
         uBqm2N3nKvzLoEcIWNaaif4r3uhELgkqyWiHkJDzi0LOLLYkmBsndp8R1WARL8Y4d+3e
         VMlnuJMUS3mAmNlb5ShAuJ0ekuOL34BMVx0EKbSrw37ooDxt4/GF6hYsaD5T2WKqNKHd
         Rr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773337174; x=1773941974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmSFpQGzdnw0Ofaryu+0F6eZMVDC6/V+6cUe7NT7slw=;
        b=U3vz3bLvpVurZ1M+yi3iESQ6wqZQWeUGUK1cWr0xqjdP4B2u36pkkVbFJWgJbQDzro
         3KjSk5naS2iYkLw0AO5dwpNG5QkyZc1eDm6Cv29ne8mC1FN/0KgHqiZCLNvU2N12X6XD
         BP8YhX2IqvqjSEO9OuCWUQm8wTbc4sgKfspnJhUcITQgeCYi/wr5IIc4P8quPjlKK3tS
         5i9RD+HYarFxIUW1szYVjj5qpwFp3B7SN7bJlsQZ3OaDf51tQs9IjSgszU5BNNXux9tf
         jkLq3Qqne0XHjoQEPbPgjS0ofsxHa/VRJ8e2a9s6RYtO3yLu4m+5TbhCHLUuZaBWCXZh
         uqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE9AKwnmQ8EgHW4aevu3xuBmbplrK2Ngqcw37cN4oPtb6DriVteyo5Tjaa7TVec85wosVJ8z0DM2/rtr9P@lists.linux.dev
X-Gm-Message-State: AOJu0YwxljfoC0pi2Fu3nRFW9qumi4SBXq1+/RHd6MvXtejb4P80FAGf
	EOEjejAtDdsrU/qwZzmCO4gZRbf53i9h1+0a4bdo/VxP4nmovQd2WLxM
X-Gm-Gg: ATEYQzymRAEh77HAhBnuZV2+l0Qz0sH3UMXnOOtohfWPYGujcCcuLRbN8xPHAovlnLH
	5TMA010WKKKlGZ77N0aQ8O0kESd0U0Mq/BdqUflBFqhaL/o5ZiRy5e65LZ195y4ZfK/CYD/j1RU
	s58ZBQ8iMTS9jOzjX5t7Gd666NEKu15nsASGt0CsklWAh1boLdcCZRjYCBRJsLbHQbIrwGErwpl
	jvKDx9SMoYZKX/pqJIWtT/ilXL54lBLpn7AHUP9HSHIEEGhaShMqNoGHQ/uThrvtYNt1XGVHuV4
	M7LJ/FqLssXT5sl/jrFHJ69w3PzbFrgr3fjmyYWJBQmDDYSpLqmAkQM1mn0o5PJwbG8mPM+iSEs
	OLTznT8dh8OosDY9aFqvB31y2/juaPZIEOzt0/gBf/uy4zpJHaDqt0/jX70C/jQPTamgKe0Q9kB
	y3Y23HqMTAl5BQcKw6TGn82HGm19TCMjweO/smW7vW9bjZAQP7he0KmhGpw+VS3Q==
X-Received: by 2002:a17:906:3895:b0:b97:112c:f24 with SMTP id a640c23a62f3a-b9764fcb274mr11715666b.8.1773337173658;
        Thu, 12 Mar 2026 10:39:33 -0700 (PDT)
Received: from X570.shire (p54a776f7.dip0.t-ipconnect.de. [84.167.118.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de08ca1sm164801566b.10.2026.03.12.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:39:33 -0700 (PDT)
From: Lukas Kraft <rebootrequired42@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Lukas Kraft <rebootrequired42@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix blank line style in rtw_io.c
Date: Thu, 12 Mar 2026 18:38:59 +0100
Message-ID: <20260312173903.19822-1-rebootrequired42@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch style check for blank line placement after functions
in rtw_io.c.

Signed-off-by: Lukas Kraft <rebootrequired42@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 965c3cfea103..cc00ea80daae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -75,6 +75,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
 	return RTW_STATUS_CODE(ret);
 }
+
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
@@ -88,6 +89,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	ret = _write16(pintfhdl, addr, val);
 	return RTW_STATUS_CODE(ret);
 }
+
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
-- 
2.51.0

