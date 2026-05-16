Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B8929C35A
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946675; cv=none; b=RiRv5b12lOFzhxSuCa2V7BhYFvqwIH7T7PW+mpbXb4txWSK7JYLclM5357tq//QMUlKadTt7R554PelCEwzPGqg8XzWtxP37hCEwiFbbSpf+2gnBStmmrB3hs22NX62JW/C9MTpfOSObdOIUk3+emU9KKVxepurOPk85OtaXgXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946675; c=relaxed/simple;
	bh=Fu91N2jxIUlar2r3noKwIFC272LfOheGkHXAiRmEHKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sha/dV/7ZLR7W3xwoCngZrQZSUg2qhznI00bBGGyhNgIYm7mb2EkXnj8PTq0L3T3TKXxmfIE2Ga/A+S8j3FRQZgGW+nvC09oHS9gbGwn0YUxETZUGudEhQCfftoZ5HD5ULn8vl03x2NUXIueWTe7qrCxOEvinNAC+FSBGDpvA5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjEVWtEX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjEVWtEX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba4efedbeaso6927105ad.1
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946673; x=1779551473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx7EYDNxwgasJvb2OpkHv4uTI7mHiOkUmdSNb4LZOcM=;
        b=sjEVWtEXSQhEDKpiV1mNnrda7KuxdtNNOvt2MpCGNel22R1DOApVnZK68ZtiOU3HTF
         fA5b15UDaiHV/vN7Z5qo6BMc3H5LUCTG502NPjfPNvJOBNggDg3xTtDCtyUfjaIUS7SH
         n5C6SprMbOfptX0CDq+m3giXjVMKCl3Z1exh3JOhyj+NE0iIgQnzP4WF+UiL7qCJVmh0
         6vBXAhuOm0Gkv3JE5Om8Rd3Np8Dve+GtquZ6Nw6azwzDodCuTaZpyXjnQ87qgW8D0kHF
         /UqsF0IrF6gJ+kLgM+ZNPSyIZTznQtyYFuVEmvzMR4y3Xg8i4FsyhZeBXEDtA8Mrbwmf
         CkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946673; x=1779551473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cx7EYDNxwgasJvb2OpkHv4uTI7mHiOkUmdSNb4LZOcM=;
        b=qrT1xSus+5R7njPg+35KUfub2j7xr49VrfNBJKXNc5vjsPQP4I6nlBfS0yp4CXM7dG
         AoD0ugQLpgZfk0RbAHwuMzmNIeCzVKITLt5JmT2qSQLFvnp4bQiUoDzoaiT2BhNzHkW5
         98+ONdH+5yTn0hFW775y3oFjmj1QlF294+DEhLBzJKlP4wh13eA5Y+Oyc5t4qoY3MMn2
         USvwqAPGu+uiqACACq74sWWZp6Vm95tbhHk466J/PKtgKafWk+IZgKoCR0CuyV5/2maa
         JlQQneBZv9VMq7t4nxbuVqOkq+NUVNc51o6KYEYPLQSXZlQAOVJs0QFu1ZPNxC60XoeZ
         9NDA==
X-Gm-Message-State: AOJu0Yw15195frKXOTvAlQwMy2lLaNhfxyBPLm8jJ1RmdenweUcbuEAl
	8Hfy5Z1VtLkOB5uHsNYqZAXaOTdICA3n0jfmZMqKG5/CdmWHDyhmtdAMrRF7pP89
X-Gm-Gg: Acq92OFioF4JMfQYFYte1h80S3j+Vfh7/kagRgKFoCht6vQZVdX6CAzh7YISxcQnY96
	6Ja3rH9gBK/fzQTjzHg4DtP+OonGWC2IzgKaAFB29x1GMJVxNuOSzNILwN1rUCD67iK4DbWjHAe
	ywMabLqpGLWj5jcbIey71kCIT3bSnbithdIH4498ElF+q/OHG7XjdM/WvRbhiXhumci1PmtxfCC
	LVBNZ2DSjTsq49fAZFJm2kYaTaK0nntkCG26WTC/6p0o8Q/G0Xg9w3MzGQVz+KYG6R4aYEaKg3R
	ZyrPnQWGZN3PXOij7cwRjBlaOE/ty13c61uBme9PZtVlcI9o2sr4H+lJzeGjF/xcHFuzfrnDe46
	s4P2JQdPV63/TWgcrgPo8to1Xim4xDj3F6tIFONgFXe5HN675FRBXqkqQmcW1wf5yxEcq0VkysU
	m8KEdAyKOMq/rB33Z9wG5B68qRiEPGR3EqQcufSYJVFnhFTCWptJJ8Q0TcPTbwz2nKiqTY+RiFt
	k7hI1g4y54Exyhi46xHFJUKFV8=
X-Received: by 2002:a17:902:a515:b0:2bc:7eee:200a with SMTP id d9443c01a7336-2bd7e8c31admr69192225ad.22.1778946673284;
        Sat, 16 May 2026 08:51:13 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:c9d8:7ea6:1f8f:17da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm89346425ad.30.2026.05.16.08.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:51:12 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte
Date: Sat, 16 May 2026 15:50:25 +0000
Message-Id: <20260516155025.230865-5-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index ef0cec40d388..a9bbfe2d6fb2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 		return rtw_read8(Adapter, EFUSE_CTRL);
 	} else {
 		return 0xFF;
-
-} /* rtw_efuse_read_1_byte */
+	}
+}/* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
-- 
2.34.1

