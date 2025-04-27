Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A8C24EA8E
	for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745032; cv=none; b=oAiAFcLhjptWyCBzFcII80OiRLwpiYoUhDIdnaWGNzZialrjsvVbY77lGTdKvLVsfqYNFtPzVRKxugEB0ROmbmNWVXE5HO6GSXc6q8MMfafne+/EUdRVTuBCSgiG4cTZonlk8h84xzq3Z9xpg5kx3e/6JzuhfigAB8wfYOHZEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745032; c=relaxed/simple;
	bh=EnC5cdHF3TbsKUEY55JwJp8080ea0nqVvuu+9SIRm84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+K6Mii/kQxVvEzWQiP1YwxUzAkmfM3yu9QgkTI9poCG9tlxpevW5vN/1tcYsSuZY4ZOX3sbDWDZ5nd/FZSUaVxKFJWfOZk9fU/nTN2yOzA9bP+dHrVnYkcSROyqZO1TE2SazKyHsURfjvb9SfiACbRlLJd+wBxEHdh7k77Bic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZQS5DYF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZQS5DYF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so33942015e9.3
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745029; x=1746349829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=AZQS5DYFg72Nzo7eQ4klY/b2xj0I2asA7ehDRc5wnsDE+0S9O0sKDLUQ72MPyHCMOo
         pg/okXzYoerqe0RnAWq+bZPHdpNpw06jMsxhqOFN6iBEoPArMZSqqtu/OKkRamPInOE3
         7y3qlvaQVUHOWC6xYM1syIBc4goVMqYE3TeKY1zBhNSNb1dt+Kbm+hR5l8LmGudL2sPp
         1HkCjud8ZzAdqjfJiORJmT6oKLRXmcIxrIq/ghgyS4m5abNOBFZFYWi0FOuAwl6H082g
         VFvePiWjaLnRof0vMwvdEGD+iKhHgrtDqRPJFNLrFQpesRaYo6KeBAGDtLjNzIwxLnm8
         VtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745029; x=1746349829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=sC1y5MESiLZJrfJSKF/AUTcrbtwDn961R+DYDP5m75x/jprrnEYOUUQHh1DgzuAua0
         0RHNscRW1pwSh8ac82vZzxNMwmGPtrJZAyBdFKhgUrHssyBpQSKaa1Tc3PfNJhcHkOV8
         RPiRUR9JMvVx4Z/UQwUDqBNc2HR9UzcpY6qy/HCPAc39nsMNmGSq+fXH1smHOBPTNxBQ
         +1nEZpp2IED57xYpPKk2lEiCOYqcS5Oz7HvdrW5X9FDD1JfMnblh3FShJqfREa7WRVbD
         YwnrBZVv2pLYU+3hc5R8RYUyIvrI0fBYV3fxD36OjSn5066W8LRYrZ/jKM4QJIPPHHSw
         U2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUH33Gr9llISHQgJM5WEytKU7kRGl7BwJot26ee2C1EgEvb/3n5+/vJHAXxsORjIJf4NG8NE9k3CBFqo493@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5CTLsE/t1GEMnz8AV+aoW30nmepKSq5Yflv1yoVI1ijccksxb
	K6nwt4hs/zVVYYEXRWRpMLzEqe4lN0KGaq210iWIKhBRAG0kPIgSqQ7+tsO/
X-Gm-Gg: ASbGnctigby2wqzBGsD6h2lWQoK7LNQSHJ/cf+XU7VhR0iYnr1LQfzG8pkklRkVmv5R
	pLF750CRCGK1X1riVO37T6W++zj6wSoL/9bAFLJ27+eCaTVtR9XaC5Y0C+8rmJU70iTOyNowwh4
	qGALuUp+AjRAWxwRiBRhixhrvHB9EOPGiBSamkthSiL6J2yo2npHFaH09xn0bNGYPT210Kfw/AG
	8UC+95mkO4bdUkuoT6Uady/+LwjOHgozvW5OitpsSHRxrMZ44d8vY56geTE7qRQMaiXcfl7Q13i
	OSxbBe1KmNkDaN0OgifzOlTnvlZCRlyqq4qaQWgYqnWHaa5HJ1qM80VCHe/zuDyrK6XecN3l9X0
	t
X-Google-Smtp-Source: AGHT+IFjT0QtbADZJwmJkM23xNAEU7wyxJ9Xcu7JImBWXzFnNESTaT0IxeVosdf/WiBpaJrm2A4WMA==
X-Received: by 2002:a05:6000:4284:b0:3a0:836e:4a26 with SMTP id ffacd0b85a97d-3a0836e4a7cmr456728f8f.37.1745745029249;
        Sun, 27 Apr 2025 02:10:29 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca557bsm7925805f8f.35.2025.04.27.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:10:28 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/3] staging: gpib: Fix PCMCIA config identifier
Date: Sun, 27 Apr 2025 11:10:16 +0200
Message-ID: <20250427091018.13705-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427091018.13705-1-dpenkler@gmail.com>
References: <20250427091018.13705-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCMCIA config identifier in the ines_exit_module function
was never changed because it was misspelled in the original commit.

Update the config parameter to use the correct identifier from
gpib/Kconfig

Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 49947ac30feb..5168811ee850 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1487,7 +1487,7 @@ static void __exit ines_exit_module(void)
 	gpib_unregister_driver(&ines_pci_unaccel_interface);
 	gpib_unregister_driver(&ines_pci_accel_interface);
 	gpib_unregister_driver(&ines_isa_interface);
-#ifdef GPIB__PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&ines_pcmcia_interface);
 	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
 	gpib_unregister_driver(&ines_pcmcia_accel_interface);
-- 
2.49.0

