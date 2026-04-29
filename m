Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC91482E8
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 03:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777433964; cv=none; b=qrSS1HnMjq5nLwsoUKwOyKTh7aMyJSTp16QjmCdQCamGNyo80oTPyzD3DI4LnOx6BCyyJyXW6RuJmbm8gulkJKvyKf77LL+e5UoB4fdzxPf20jS3Gs8DFSRBpzvvQMjd8IqyAcXotjcx7X8s6Hjfyhrwxf4ktJcV+YgdwyOIUGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777433964; c=relaxed/simple;
	bh=k1uRK1JF8VAbtnhGeWaxfug/VfM/4kK33DIsUrjSOyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ooXFoxe40ZiUvX04FxBE5ap89/2e3Fer8hSLKsdlmbSplCTdrfTcuKBCgSkCU0X8SOi9ge7TPyzcSEj0GSOtbx/7hW5idy4iPVTVwUw0eq2rlfYzsfU3aTPnWQ24uOKAYHPCb5gmzvv2YDAmrwO55UEVWHwinybERr4TUhvFstI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRfcJXmB; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRfcJXmB"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8e0a768331cso48397385a.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 20:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777433962; x=1778038762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+L1a7jyZYhhK5p542c3awu/J5rGSKpQ5in/Psz4Xqno=;
        b=YRfcJXmBiGn2Iq8sItcL6Cdcr0RW8HN9dy6d+yEVgA0FxzTCswLm4raRM26mFJhHeV
         JNlNYhibhpVVA77oJMFIA6Eed/yogq6v0adMaimaW7+aLZrTjlyhp3Lvy+3BYNX3oPL4
         raHvVt/PNxC568bRBaQ0ulGLUR0Vj4uD2YUpfpnhdc5GNyEGmrlSKClcOE+lnaJHo4+z
         +fZfP/qH2j81mIGfOmxPELNiscGr9HoAei1rWLKVswuK/D+6f7hjetY0AzVtlGRcHiOM
         6ZmT7PClhV7nssi6tDcsGLoG3iWi8FRiZDwNP1lBDEhOY1ZgQiIdOkOnyFN+ZBkZ1spO
         oRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777433962; x=1778038762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L1a7jyZYhhK5p542c3awu/J5rGSKpQ5in/Psz4Xqno=;
        b=JP2UTWnpoC5NFrYU/qaeJQ2c0lEfBdLj7l7FKUdRu02uzPTpxfDp+Xd5gbHuZ801Cj
         rAzkfifHycShOkOMx/26i+eujKXsOtKMPQnxPSQ2GJ1XprMAPeijMFy6ymkzEHtsbo7W
         y2+Cyo3sZkfYPTRYQGEOsOQtV6VsO+NO8ysO9iYnG1yLo2T7w/v/IrPtjEZBmeueb1qr
         yyBgvLEPjum5e+bmN0Q/TE6jWhDz8NzplGGzChZ/4nl2LN/RSRLTHT7MJELNaD9I3/Fu
         fTewM7X0200aR8pJi9MUDnpUg4IRBlZuNm7wG9WGc/seGYXrpidbFN4XtXSYXRUccH93
         gZ/A==
X-Forwarded-Encrypted: i=1; AFNElJ9hoWDFBFVrQBpESSAsCgmTXKVId153yepTHKK6cXMm+f40dFzApFJFEvvDI1SJTARmkAv0g1tG/1iVdXB+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb5WT9CWmQgwvJOWoE4GG8VYAZraOWWyNeUEXmYFfh52h9cFRf
	3El4h1x5rHzZzk5DD+/ICSWJGGcIkwrf6/7YbLZjAGXjwqGX0w64qH9olxulhJPF8+I=
X-Gm-Gg: AeBDievcdBg29LABCDnf3pSv1j/FPJD1aAkL63MoJ20FbO1Ga/cbw/hhqoaMYv74sFu
	3LR2J1LszKGUw8w6p2iv9WFagl3+ebWQRGPqksseDWOYPqdmt/FmbE547P8HzysYYUl85Kh+BJq
	6qfCdh/x3ttVCphUM03GeNL8nLDwMKR2TJheqd5csSdHbGCv9ipqkzqG2KrTKmB4O4EmaX6u+Df
	XIKLTcdRfav6AmlKaCofPpa5EXbdw04KDUmsnNRBEomBT8MMdC4cx96W1NEF1whKu+m8N88hsm1
	h5o4uyBRLAVjhbXtF/xxlRoi0rNg/4WOWvgXxc8a43cpmu9T6ZiqXaVtjWHv3FXPrTFtm20wboj
	osxKUIzdRugMCwjoGnm92gIqkHNkUkCPVTt5cIg8hcu/7ag6nsBTYWEXcS7bukztyFBvKgG3fCE
	zOA42Z09GNtzez9r9ywe7zSPz1cLePj6oLpF6JIxZbHl0One83INRRvuo3ToKTn9/N0w9b
X-Received: by 2002:a05:622a:2508:b0:50d:6fd3:421 with SMTP id d75a77b69052e-51019d925abmr21360811cf.6.1777433962516;
        Tue, 28 Apr 2026 20:39:22 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:d695:5459:e421:6754])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ab30033sm7739901cf.0.2026.04.28.20.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:39:22 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: johan@kernel.org,
	elder@kernel.org
Cc: gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: greybus: fix typo in sysfs-bus-greybus
Date: Tue, 28 Apr 2026 23:38:16 -0400
Message-Id: <20260429033816.11282-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: attibute -> attribute

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/greybus/Documentation/sysfs-bus-greybus | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/sysfs-bus-greybus b/drivers/staging/greybus/Documentation/sysfs-bus-greybus
index 2e998966cbe1..feeffe54a59b 100644
--- a/drivers/staging/greybus/Documentation/sysfs-bus-greybus
+++ b/drivers/staging/greybus/Documentation/sysfs-bus-greybus
@@ -26,7 +26,7 @@ Date:		March 2016
 KernelVersion:	4.XX
 Contact:	Greg Kroah-Hartman <greg@kroah.com>
 Description:
-		Writing a non-zero argument to this attibute disables the
+		Writing a non-zero argument to this attribute disables the
 		module's interfaces before physically ejecting it.
 
 What:		/sys/bus/greybus/devices/N-M/module_id
-- 
2.34.1

