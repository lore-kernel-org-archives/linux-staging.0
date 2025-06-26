Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473620127B
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 17:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958931; cv=none; b=UPSE4HVbZAUUDsoifTWJzLNA4WFQAZLpbtT5xeaA4fdo6d12ghDceTTBTSk04vXd3GkXoml5M0M1CYbFmE0Tn4Acn9E2HR2EFNRzM3SM+nDjcMaWiZquBtbEZ2zQxonciVlthZvGbU/hIV/6Mqa0TH6uHN0JrlL1eQaP7eAAAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958931; c=relaxed/simple;
	bh=AQiq4z0xA88o3HSFvbhcfQRTGqMXtRqE6hPl7TrS0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQs2yHjD2KAt95LxUXzrOuHF3hITifa0cEUhpuHJ4SzhtwZgIJuadNV3aRHZrKRgKhq9bpT4ISjYr0AGcJVcizPwOgfwBVOGZzutj43SzGd989Y30Y6NE0+jlzczIwBeGEW5ofHjUym1wKnBqdxYmVdnaAeN4zJ6fImOm9wd0Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm2bcABI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm2bcABI"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c7a52e97so1358324b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 10:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750958929; x=1751563729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=Sm2bcABIPVG9ewQgXqhmG7hWbT5uaQM9IbhLh0ch+LC+REyCMtvt7z6mHdQ9BJAQGy
         vrjZN3TJS7WtiQBU0CoyTD85SLn7PlafSO+Ic/5Knr5hbwQ4qnzi5nxdLH91m7Ql9r6g
         GMEu/g5x00jYtvgxu8Q+XPA5Gb/l3xbDzpqDYuGFL2snIqMCEy8EmCkgvkWiJQ4Blhsx
         cA2fK2C2Dz9nRss7pS4NDGmD+sR6SpN4Sjp5u+fxaEZH1/1OTqFEkRnIfQlMg8sNwZHe
         G79ZD6D9rXxbDt/WhIYtSfOTSxZGQ2oT0f/bHwDVPi7U8Au3OdW6R0s4O2elJGzcmi8R
         wHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750958929; x=1751563729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=XNDrug+XE0/qotf2cJEfvthHgGE3sNlQnq+DL5rLGlYpVVy1I2XigJQuwkPlNu4YqO
         e+SC2J0EJhBvbVWoeQtO8s85Xyao8OHZJZG/yAHVKGz7dvlNI8oYE5huDxS2zGVsh3bH
         vKcGw7rfZMrLczI934ZnE+QYHqbpIT22kBcI4EICgNjtpMnOGT7nnkuKnclfXMh0AOsH
         qFoY1CpiTv4o2GWuTtMXi1zXAhWPrn5uEMYbZEDChm12B55ANbyRcTEY2xCxCs/Ae9fQ
         nZvKeepmtUrpZ/B1bCoeW3tOMOBUd93XlL2hdSqm2CFC95NjeA7kg2LmEsz0084rT9l9
         zN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrmqFocHEFGWEFiHyRuuaYSt79CrklZSZd63W7P/P/9T9opa9nsAPzrPp82RbgsF/tixYPJWKITQ0JDVEx@lists.linux.dev
X-Gm-Message-State: AOJu0YweJ9HgWiHOvJge0e9PEyXq7qONMJzK0RDFiilcGt6uI7zA2Ib/
	++apXBPmE+7WHrfPv2jORkTtXpaVgFeE8WZvvPUMSuZXL+98Ag/Cujbz
X-Gm-Gg: ASbGnctoSw0ZDZggNiwaREWLyqc//FO4XWKhrnxjvDQ49LEI1CYfAzba5e8BwNNpWYs
	j9u/g1lfNvf/y7R8yL1AiFfUCyblWNjtPrS1MWxvWm6hmbAyfN+6stB8ZvKGHXSPpPu04DTivtR
	BT8vx2xSkE+y1aYyKmAIxMQmxCR46j12hcGiHA2elCCYF4+1l56NrO4FRoKFfYBkXXmWxHXKnXy
	MXInvbV7nZbTUpbdiTI4Yd5oCTab1C5AhnvYRC8k5lnOwRPZmkK8Kw6WTz1SUpowWPnNlORTdYd
	mRqhnGCVR/wLysFGQ1dECJOtdP0BtfOAlaGagaGXzsJaqBoszIhMV5hKrNBvKBiXvA==
X-Google-Smtp-Source: AGHT+IFlz1ISeSqJdOROistKjbH54/ytAzE+OyIesUVOCzXGCvK+a1JEVnGW+DkFHANXqkfgFdM6oQ==
X-Received: by 2002:a05:6a00:3e17:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74af6f2f9d7mr50135b3a.19.1750958928731;
        Thu, 26 Jun 2025 10:28:48 -0700 (PDT)
Received: from icarus.. ([45.64.160.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bec8sm226888b3a.39.2025.06.26.10.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:28:48 -0700 (PDT)
From: Pratibimba Khadka <pratibimbakhadka@gmail.com>
To: mchehab@kernel.org
Cc: Pratibimba Khadka <pratibimbakhadka@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: av7110: Replace msleep() with usleep_range() in tuner function
Date: Thu, 26 Jun 2025 23:12:03 +0545
Message-ID: <20250626172707.10115-1-pratibimbakhadka@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
waiting loop of nexusca_stv0297_tuner_set_params().

usleep_range() is preferred over msleep() for short delays (< 20ms) as
it provides better accuracy and allows the scheduler flexibility for
power management optimizations. The 10-12ms range maintains the same
timing behavior while giving the kernel scheduler room to optimize.

This change improves timing precision during the PLL lock detection
phase without affecting the overall functionality of the tuner
configuration process.

Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index bc9a2a40afcb..7f6c610579c8 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1827,7 +1827,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
 			if (data[0] & 0x40)
 				break;
-		msleep(10);
+		usleep_range(10000, 12000);
 	}
 
 	return 0;
-- 
2.49.0

