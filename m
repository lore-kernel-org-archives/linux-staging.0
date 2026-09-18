Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06D386571
	for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 01:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789694223; cv=none; b=cOoFBXR3RwcKVjQrBpMrVXbmOo/39A9zvHphiWXJAZWsdNlRJbF1YIaAmczzR/hXl6zuCcOxa5ci/DtzZUacnhXJDk5rUPNbGtC/vH8jXkU9OlUvUCV3n1UJ9Igkn7ZQ6V/d+iDlm9dhtMV3szDiU47cU481lv+MCsKHpIcyFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789694223; c=relaxed/simple;
	bh=8tP8JgnjGEfzMamaj5L4yLtpz6eXfWkpAkGum4gTc18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bn9g4SxluCruoDCzgLMpY8taUB4HZNYsTtn4Dq0c5eGhADjlK1EDbOznUGCMUa56hjw0+L5Fg9JOVE82wH/woHh3rm0GsHwi9ulMkW03o+8KrQZqol905FmQa8x4IMfNYSQyYIMkTVynji0D9gI8nRsrWoo30Fc4WuHIFeLj0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fp9nEBG6; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fp9nEBG6"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso1729245ad.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789694222; x=1790299022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ag/J+h7/D5WK6Rt1rjOF+GsXKTFVVxLt/lidAGMMU4=;
        b=fp9nEBG6AjHKbJZCBnfTEgbqIdJMLhOSQeelyXPJ+ireT2Wpi88ZzA2aFAEWW6Ajdo
         JaBHk2nYKrYyEj/T/k/nK1QqoX62mE0NnBAB3F3mZlZcXsrVENJuyrsFEBwque6Pl/Mu
         ivnud+Bum1V90un99IhHxyrvdyow684hES4ZNCIeE8Z8F3bAUTiqD3JorClox0DeQJU4
         I7Ey7JR42B4y3KtrnK96Gd3dZB81TLNcyaH/buNdob6edFNK8+ekzENRyJPcT57zAOm9
         7IeEG8cFad1veOE8Ie4qcazj9YDvM9a0DH9spmL4U0riSTgFgy0DMEdAIKE5rXk8TkU7
         yLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789694222; x=1790299022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ag/J+h7/D5WK6Rt1rjOF+GsXKTFVVxLt/lidAGMMU4=;
        b=doW530RxvTKADyPK5ZQrxJM8SJJ6TyxYI4biclnVYCjDmSEQeZl5zx041Je/93yiBJ
         5DK/6vZlo6/IxYxyNnBsckZuTreFd3K/d76eha4ubvD9Uh5mG4kEvUsFMnhbRG3qjpTd
         C+BhIpLZZXZRMjuj2Rs9V9NyMLUcYqteNrqtxhwCWOdsjtkphidWtpX756imXMsbBTPz
         Y4KJv91zAgWZLWdn3C5GwVMUYu6wxWcX0s7uc4b+7H0WOuWiqRKbkiWJPkDCbLEk2dXx
         fFrumgManh7s1XEj4jt2KemYVVO89YjlUBxuHtQr8UwUt5sP2f+GPMLd1wy42Z5dp4zN
         v8cQ==
X-Forwarded-Encrypted: i=1; AKwUvByuRLEZ0ul0FdoME+v3n+bPqnxbsn8tQXiaMpxjsOJABwrBBcbXZQ0KgbpUtDSsYEjO2+PzGUdHe61GhtED@lists.linux.dev
X-Gm-Message-State: AFuF++lszGctiEmnHIY/t2RonTryAg0oRV6bkjqiv8lLbDU5tC7ABWtM
	8tIXRbD/6KsXIiNs/+8BMwB4aXpmz+vEaUc5PBbSyYCiQvs9JZnYhCqG
X-Gm-Gg: AYBFou2P4gvi6S5N6pPMiKx2TyTPaWUtyVKp93XPIU1nWntGBBBTHu8Iaws/ICPiqTV
	Q+CByCa+gL27+15UNl3ZsLgJ5h+2W56B1CrZZvkpKfbC9OnBQQMCM91W0xTXWAdqIpFtSDuNUHQ
	CFlzB16yy02P7BFJPI0IICR+BJKXiTpO8TCs1wHdtU1VkteuWzNLF4B/qKByak414R/wj8aqGO8
	JyIUPYe4/R6ExfhMfrthn06u81EnePNq3cQCh9Z1Dv+7OD0PrGVza2aiNAMfQvxEuMk6XytmVnC
	Y9mVkCUXzUCtF1kAuE5Y19vm+J5zr5kPALr/tgEEEFhYzgpqPiAIf735u84puKFEXtVK96940un
	qXiwhptfs6ufqTLMTBsAv8qRcMZw/LOOPuGRPeV2zec1yUrmy1BvfpWr1+TnqSk9+3e+0TS/qwj
	oMMx4i1FzMtfOGze12KJXOnbNJ33ph1ATsxoSAuPTPV+sD46x2uxqSTT/3GarRut/1dKQKbAAUn
	ygeIIGmAvFnUveQtfnbzfbDdEJ5rn8/OePkWETZPW7lhkskeOnlV07B9Pje9uniYfirP8L92fhR
	Kq6UWbgnQ5JWQie9S8S8nIss887PaZBIBQrDbzuC5VOEq05ARgV9vYtOR2ooeoklQQ==
X-Received: by 2002:a17:903:32d2:b0:2dd:7ab0:7313 with SMTP id d9443c01a7336-2ddb1c17059mr17007645ad.18.1789694221593;
        Thu, 17 Sep 2026 18:17:01 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm19491276eec.27.2026.09.17.18.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:17:01 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: greybus: remove empty TODO file
Date: Thu, 17 Sep 2026 18:16:54 -0700
Message-ID: <20260918011654.115001-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/staging/greybus/TODO has been empty since commit d85bef159923
("staging: greybus: remove completed GPIO conversion task from TODO").
Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/staging/greybus/TODO | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 drivers/staging/greybus/TODO

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.43.0

