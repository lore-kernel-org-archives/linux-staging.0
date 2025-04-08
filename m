Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282172594AA
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151125; cv=none; b=qmgAO55BZAuFcJZNlYpX6ruslaYMeQtc2t0hnZYQ+0wwHV0IPFlNiyoR34vFamMl8XrgxeJpelt4SzR0U9Exhyhy7Z5ESCY/P5r3gG/NNE9INQ+14A5H8OygnSmKD8Wxt+OKmJfvvq6i3xbTxPHSJkSQRsr2zYoRc8hAYlG7Tes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151125; c=relaxed/simple;
	bh=ywl14+VR0rQwTc8R0tz8Vziem1U2C1o3dk1jlyk5DE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNwQ0CsvKktGgdUJukHh6XitIYLn43wPJViFmZU5mvtZolVm8cTUXVw9QFA/v+fhH91CrQBRviG2zVxMykquwc0EfhEDIStTHWLjTFc9GaeCgIaEj8eyrtWpGmM1QSeztk/owu0zG/etIQ2X9Bo9T1iKmeWFZ+BVyqdIAGoKtPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OVXYFupl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OVXYFupl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so5288859b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151123; x=1744755923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvVYl1QVax1j5pUd57ASVBJzAMz2KKqzNiWOQ8Iq0P4=;
        b=OVXYFuplswebgayMyDY5UXwj2e53RDoMx3dJuM+xj+zIqSUROkWuuwXaZ60slQkCWP
         0ucYpnkQcjH8srHgcBpft5C8Z1V5RJefZ4r73PdsOine4hZqQEqDMDuZ5oYlaF9eGdtl
         TFkb6kMn6b25bCe1S3EjgjY0XP8YGLSeoIT1ver+msC6RecAO60v9T3PdmkRz3tvmuKj
         DUmJvlIUYmP5CgrDTYgo0vRlPfoDgYq6X7thJkw0uW+iYGYS7sf1Rm7wo2OrIeTnczZB
         msvlkz4gLH9Y6o0VN+4qUK0sNOtXDrRomeBWb4O6OSiYxqYI6QCZB2pwCmfJjakOQ8zp
         8X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151123; x=1744755923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvVYl1QVax1j5pUd57ASVBJzAMz2KKqzNiWOQ8Iq0P4=;
        b=nxKqTBKTKl3PAuN7bnqfnxCcazNlkCihYb6JB83VJwqu+AMspIZYToeJQUTi50vmu+
         15ghlfDulq6TlI3CgZikfsTaIgEdPMUejB7TPW/TvQi6XVKuHN9hsdJZyLOQ+wasLWlo
         Rmqw+lCzTNpYR1CkH4zstl3NQlMLyA4rzgQjDmySHUiXAJ/KvR+fB/YWTbT4VzkgSCqw
         F+7/SLVCz1rvN8p5a01LcLIA5i30pbG65OZfr61PpuZFJH8PAlZB/MarLeraqoFdNqUL
         /CbdNQeumv5zA1ZFTEbpZGtHYqoMwuo0yoYnsPkYV7y1cbiNu9a7KoZSOSaGhFz9VDXc
         +jGw==
X-Forwarded-Encrypted: i=1; AJvYcCUOvkInItuUXSqVF2PK0/b1rvK4kKH9jG+gyAE6MU9YM8iDUpbvHDu3R/5f1IEICACIgMLalum+M4yvddq+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+AQsaStaf5qTQPk1ZSu8Qraf0Zk/A53n4fOn4Ymh8/nZ4KevE
	x5eRDbTiUeNko2JFWSuvVFvxB5TCn5allyfdplPghbcWbjtzu8l8jCvHSneYvA==
X-Gm-Gg: ASbGnctjsywm8iz5+pnRcXVYwTDqxB4NhjWOcRx/wy5bSSgWDs3CJb75x9YGtm9Tmv+
	vQ2UfS7HdGImmOG200TkScEI7BttSozwqFq9YykeLrCp7c+sSS9p0D95dwxM8/KDL3hQf4XhBpQ
	96ZgsgKJCXQN0kTLEEpK1MpvTTiF9p4eXClfql6p9u8FSfTAFBp+VmjHkHOxkAWHCjOdXzbB7B1
	8BgINsq8oBa5WQJRx1TOeMqXgQ4Q7IyMRMowK4cznQ9Wb5ykNk482tPk/mcYhqNcy9d3k6bOloc
	SpVcPs/1Uv5085yFvb8YxhW94gfgyFqmN8EwiGxQMACc4UYh/krEmm7NFqyMf6Wq9cSm56zMBmf
	OymxaIxRxvQ==
X-Google-Smtp-Source: AGHT+IEJFm7YyHd4JvHyy5TwKXxWEM5gOTs98uM11nmzNLPeSawj7eF+IRJv8cTyjxveJT1FNyiTZQ==
X-Received: by 2002:a05:6a00:1941:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-73bae4d12a4mr754636b3a.14.1744151123476;
        Tue, 08 Apr 2025 15:25:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0801sm11117438b3a.119.2025.04.08.15.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/18] staging: gpib: gpibP: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:58 +0000
Message-ID: <20250408222504.186992-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpibP.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 0c71a038e444..82627ca838e2 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -18,8 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
-void gpib_unregister_driver(gpib_interface_t *interface);
+int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
+void gpib_unregister_driver(struct gpib_interface *interface);
 struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
 struct pci_dev *gpib_pci_get_subsys(const gpib_board_config_t *config, unsigned int vendor_id,
-- 
2.43.0

