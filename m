Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F140D561
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630107; cv=none; b=S0lxQ/Az90F5lVzWMMiNBNUet9rM0eLJ2tnQSiwNvZlufk3psXIF0f+3q0MgrsWuZOA7bIL30SK0Dcz7Sz2i6/9XfqmyEHXTtndXmC7M0WHzwe013tpC82GT60pDgLQiNPTQ0VoD++3sRb00hcGLn8n2QFmJbc1rQuwo/Yrz6Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630107; c=relaxed/simple;
	bh=yRCcfb6gzCUYAlOhUKhiJn0xpFlhZN6+77apDBYmQaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JRXO2wTvgY0a3d/Yn+taTO7Y4C0zyOHSQngr2saw2rCNyWoxMe9J2PplSUGSDRpI5xj9Rt/LpZXShM9mIwL+9+e3d7WtUiLHjYLAfd4SMFWWPB3kT+bf1QyCFN9q4L65oT7Bt3LM6dyK8YDNYWoEFj07MO8UZ1X/K+VsBMzWV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGNHsZ8F; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGNHsZ8F"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so221377eec.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 00:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630104; x=1783234904; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1kFhzQ1vV/uTKUMcLW22Qp/rdMXShnvpF435wRzJbM=;
        b=fGNHsZ8FF6zIh4wvAEBXudFV2DUzUyGH7IGHNb/Bmwi4j5qOZ2nIPNjG4u68m8cuNA
         CeS7pJbCr5He2fKkzWxQX0kHWW7dNgPtZcocpkqp0OP88JGIJeYzNjVAG/3M8JKPoJ6J
         ekpKb282+5oqdATSRt54vGQNEtmIkSRlTAqVIhKroHj6lcGjftMwtBDHMNMObmEd44q7
         E0taVEUzgplg3mI2LG6XebUOdFm7zSdmb128g0fe9e0M+bCNudK6egB5LwMGHnVU/Aof
         YNvw8naKaS/q9PqKIB5Jq1DkX/MmUDoBr+k3/OPeXt6gIdsG4IVH/w1thFn79gFP63H0
         3d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630104; x=1783234904;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1kFhzQ1vV/uTKUMcLW22Qp/rdMXShnvpF435wRzJbM=;
        b=Ym2MqHqHFUqSF5+yz1XCcS8i94uGLybfXlhzg71YuRvu6/269w8IL6dXVGxfEMRYu2
         7dxEZqYYRhbxU99OJ2Sd/2+t8Wmv/xA3UdEAE+aLDt7StJRdwckADSHvI6El8Q0GBmFC
         cfhoPx1h9tZRJ+qoFIYqpa87rA0aY8/HrhdKiCxiKFI2hdO3Pzy8qcuiP1tf1FJWqBtp
         c9dNltpohuh7NomcKnmYNRXEPYLkb2oNRY8zem6O2mB7REBof0rx4nJOeirnsOAO6skf
         DVvgRhcJ7r3GnEswRh3pBIwOPVDeQ0uSinrHZU2ZWYglrHyU08WZa8FOkHEtjNPhVuV2
         R1Ig==
X-Forwarded-Encrypted: i=1; AHgh+Roy4xzkXqQGHhbQMVRt7UTg3lJ5OHiXejCmVkU+CgzBenOaVIIOCCwMFS56dhbTOycWZeXDc36hSCb7usB9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh+WVZ0HkjM9XpnsPQ85PEFQeUZKd1EJcCg0PDQ13d22rK6JYX
	kJmMo/g0NxaQXxVWz1JFbJ/NluYeDdTuZWFbjq31SbBHdoFYYGq8ZWIQ
X-Gm-Gg: AfdE7clGsJiiNQdv9L43ZbhVWiWmBtS920oivOk/RopPSxVUKaNB341R1/rqfbCIN9N
	GFaGSitVUsc0wcqVhOWDUH+JUMJnhpOWdD1oJxGwh61xHVnCMe8YnbTC+N8yh/dX39mEsJxYl9Y
	XTXZMuB11hHF90ljgH/9A6mw8ZSaD1+6uwce4IEhFPQUJnKw7j7eV1uCv5DOFzkoAQRS1qD+lw0
	B2hGJ+JJIxFnNK0DdDBvn9RDZaEY6/9b8kcLIpRHvbCl+U8pbrxu2xMTBgCjhRBG53xSpWMzVoW
	zDPQxXCRhzidAcZFqrRWqSC3Xc56Gm6VYOuOJ6wIgobaAWmBR6SA4dIRNZXXBkI1Dxc17DRKkIW
	PihumQxgLD09ipl/xSTm/u3F/WbLMQgsSGEEbDMdeRkgiRH0C6doTGxb0NndsfDA0FwauHr/jL/
	fGXlr4Xgq7cKAEud6JLFHehcL1+MtzDxK4RTgv/s4Brn+P+WJZ1vp7K8bAEqsGsZ33uqnJTMRV6
	cKa5O4fQ0E=
X-Received: by 2002:a05:7300:503:b0:30c:a943:ea14 with SMTP id 5a478bee46e88-30ca943f3d5mr8156907eec.2.1782630103622;
        Sun, 28 Jun 2026 00:01:43 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm39878489eec.16.2026.06.28.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 00:01:43 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Subject: [PATCH 0/4] staging: octeon: Improve initialization error handling
Date: Sun, 28 Jun 2026 12:31:23 +0530
Message-Id: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNasIpXEYfSxJollVREEO9uc
 Xzw+Q8UNuECc/OA8SVFslb0bQNxD5oYharBdc533g1YzpBEE5LJxYY5npwVj6ASsSaOaaKB/Aj
 1cBhvcv/3ZX3fD+0ZsfZtAAAA
X-Change-ID: 20260625-staging-driver-octeon-panic-2602ed8d5d67
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=yRCcfb6gzCUYAlOhUKhiJn0xpFlhZN6+77apDBYmQaY=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqQMbU14/8C7jz21w91Bjr5geSOjkTWV+60qkcb
 +M1I54Sgf6JAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakDG1AAKCRBsPpGo1/A4
 bR5QEACSkg4bJ3ts4Uac6/uNq0ITah8myM+2hZdBnllljnreG7AUbokJR7Ed2TGiF473eCmWRmq
 nrJMoHkyoX9+GA7iwdQN6orxVBW9p7y4+I/G0oM6wJ/1TF5Fz3e0DVUuOot34CthdsisAvVrL+8
 WyLl8niKsML3+piP4m6wciNO5jCpeKsHDKwMBAHu5G1ZPdlYbxox5qdZICKCP5tXOeso9oKmqj6
 FkJPHGmuytvRXKnIfqzSFiYUv3w7IeKxQbLv8QwtNsOiSHFnQaUVDIL+JBFssgHHk185gu6u3mO
 Xf07PJPuu9CtopqlP57mJbqra1MKX0jMdVHSbFYk3mn9oU9beE35tsLZ1NX44yUpAWHrNqvnPDu
 41SifuDmeASCJceb8igp7PVI6vKCUIWNeQKHgesIvV9nZDEftrfY+wM0z0x92t8dCSNkPZ3UcRK
 dVRQC+d3t4f+f5Cq1O0q3KiDydOGqm+5f2bfTvl9e1NBcFTtcLh6t8dTS78RD7u2gYU9AomCPq9
 v7sOxhYPhoSW3mzI6urlcYF7dnJUI6NrxLLlXUDOglWQg3okFm44lwDVw5rD/CE/mZbTN9MX6xk
 deVuzmZ33WHtvH4WagFkMNXick7B4MScNnc/zb5SuRU7BVApM/PqVXk/2iAaB7uWxr0ducbWLHW
 ceW1a7LI9wpJ6eA==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Hi all,

The TX and RX initialization paths currently call panic() on some
initialization failures. Instead, these failures should be reported back
to the probe function so that it can unwind any resources acquired during
initialization and fail gracefully.

This series replaces those panic() calls with proper error logging, propagates
the errors to the probe function, and adds the necessary cleanup to avoid
leaving the driver in a partially initialized state.

This is my first time working with drivers, so please let me know if I
have made any mistakes.

Thank you! :3

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
Prashant Rahul (4):
      staging: octeon: factor out device removal into a helper
      staging: octeon: Propagate rx initialization failures
      staging: octeon: Propagate tx initialization failures
      staging: octeon: handle rx/tx initialization failures in probe

 drivers/staging/octeon/ethernet-rx.c | 18 ++++++----
 drivers/staging/octeon/ethernet-rx.h |  2 +-
 drivers/staging/octeon/ethernet-tx.c | 17 +++++-----
 drivers/staging/octeon/ethernet-tx.h |  2 +-
 drivers/staging/octeon/ethernet.c    | 65 ++++++++++++++++++++++++++++--------
 5 files changed, 75 insertions(+), 29 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-staging-driver-octeon-panic-2602ed8d5d67

Best regards,
-- 
Prashant Rahul <prashantrahul23@gmail.com>

