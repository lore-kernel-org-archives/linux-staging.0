Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41E751C4F
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716279923; cv=none; b=s1xTOA/9VzrPCxdlMzAcYA6OQsLSPfKxogzo3iKdm4nFCtGlVo4zc+f+PXvQpti8I1tcb0wWZNWvqDp6wfi0k5BVuPtF0fWeeYT9DLH2AfCFqqWLVv45NrUBG0tB2l55Ziw7lBqEZOqjH+vgBPk77dw62almIhCY22wrk5nGSmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716279923; c=relaxed/simple;
	bh=UMphL9CtM2ScYjcGliWymvECddVRUmfMh7T/9EmF5WQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o+JZyd9MXt9U0w71QxTA6+Zim5LtR7yBjiSDwB3fSbqMh7u/3TWyZn5lTP10BslTEhdDCLCUJCSBJcHPJBjLL4jy3XoqBA5/Dncz/GXf7Ac6eYjaUoG4h0VTwN+HeoVh54zLkfXVjNb+SeV142ZvIu0vrvRUZ3BsvdxavPVmpbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0c5/oSk; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0c5/oSk"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6f264d5dadaso927296a34.0
        for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716279920; x=1716884720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQJiOpbiO4NHr/WijrCrZ5Mc4ZByvlfcBypTMOSJ1Zw=;
        b=m0c5/oSks3WjWttspVqQVy4Z2dniUB4DzeBUQanCr9C+ldQwKhTWhfYsrRgoKJMJYO
         ZS18MzlsCA+VtIDCPi2aINYLM4V+/FNS4KVQFViL4lPNBu9d2g3EQewpHs5mX/+OuPHW
         pnWpxdB6MR+rXVatGvrrWSDFsEAH+km1lMAtmg/SQz0NFjGj3+mQCyEZgPWDFjc0KOkG
         CFiI9PGgsyBRVf6d/I6S3pcO8HAn1CS9vjtZ9hbQgqU3eH/pjvGC62epQQjitzqhK0p5
         ECNoYdp7k707+cMfFBnDYHVK6P5KDo+F/n8pD8zCQwzqDfv8sLoOCfARdeaipVuwMjcC
         fYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716279920; x=1716884720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQJiOpbiO4NHr/WijrCrZ5Mc4ZByvlfcBypTMOSJ1Zw=;
        b=m7ibWxGUnjNgVplbcCQfNKZ4PqK0x0VHz77GNuazumJb3nVUEfl6mQrkTNUm7WoUL9
         29zgFE4vE0D2kr8sbOSDfR1lqS/zv9StkVNIqTtcnym4rbP7Buvb8HstPwmPu/xUNQmV
         fQgspSG9MJK5nDn6DJp3fPDExNuHX4atmTQMf6gFnB5nJ/mmQ9+1KEjexzDRo5v6ur41
         I9xK/hPW7938Q0pKFXMgZbS/Ivbz9RmtwlprE3gRMnhJrSMkxmo6mk22MxDqjDAznFga
         40wHA4LGGIuEFAnno4Vv9MsEAgwxDOhQBkjzWqNoxroDATi02ILbqlZvz7Of83b+DRm8
         sesg==
X-Forwarded-Encrypted: i=1; AJvYcCVu57JkCrm+zqRNrlA1uhSalalN6tQ5fNfU+VmHJyDeDDcirCFFKKaPiYw4L0vop8fJ2v+QttUZ30Tt96gYpZPd1RjCYNJcTPfjqxeMOw==
X-Gm-Message-State: AOJu0YwooylYwCvAMm1z5P7CjOKJNdDRUnWKwMh9IRaWIrxvQrnCg7S5
	D/PWVYgqFO99Cx42cSxzBSZywiUvrILNMiJWR+Pp0ikgmOQiArm7
X-Google-Smtp-Source: AGHT+IHVYDNs7w2Yoqut/Sm43G2/GzmjV5kGt8Ep7yyMndZQaKQsuYD45AcJ624BV58bp7l0bahQ7w==
X-Received: by 2002:a9d:7991:0:b0:6ee:21cc:ac91 with SMTP id 46e09a7af769-6f0e92b7f10mr33915071a34.32.1716279919779;
        Tue, 21 May 2024 01:25:19 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae2fcasm20265503b3a.123.2024.05.21.01.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 01:25:19 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	ayushtiw0110@gmail.com,
	dan.carpenter@linaro.org,
	namcaov@gmail.com,
	linux-kernel@vger.kernel.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8712: Fix spelling mistake in rtl871x_event.h
Date: Tue, 21 May 2024 14:10:10 +0545
Message-Id: <20240521082510.50422-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled joining in rtl871x_event.h. Correcting the
misspelled word improves readbility and helps in searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v2:
 - Changed "mistakes" to "mistake" in the patch title as suggested by Philipp
 - Updated the patch description to reflect why this change is important
   as suggested by Philipp
v1: https://lore.kernel.org/all/20240520064750.48912-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8712/rtl871x_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_event.h b/drivers/staging/rtl8712/rtl871x_event.h
index 759a2d27d8f2..0cc780cf4341 100644
--- a/drivers/staging/rtl8712/rtl871x_event.h
+++ b/drivers/staging/rtl8712/rtl871x_event.h
@@ -37,7 +37,7 @@ struct surveydone_event {
 };
 
 /*
- * Used to report the link result of joinning the given bss
+ * Used to report the link result of joining the given bss
  * join_res:
  *  -1: authentication fail
  *  -2: association fail
-- 
2.34.1

