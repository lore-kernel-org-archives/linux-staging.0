Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22159373C13
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367895; cv=none; b=ErOcQMt1vBSxut8BZiliGUiEPK+J5X0qxpx+yy2zA96xOUIBYKsmk1PB3wIzfDJ4l0Y1wiDcHOv49P+LOVgDrUOwbaZoggiwMPpqmTCPYFD53B6T6yXYyE9dVJlogzmtzA5HhBnQg58OidvFL1SrGAcI2DjPy3LQhcAxUgYCgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367895; c=relaxed/simple;
	bh=97tJbYbsiKi8ra9IdHTyMgOtvwBgiZ8kh0liNOQUKtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQrfDzeQiF3mYxpFvsl5p5F21Kl6zbWByMTwuPiKr1P3GPzzNUaI3So/7Fa/E2jn83HXQRimz6SJvvxlg85sp1x/45j6AwNJWYK2XLnvUUdlsj02bJFUVp+6Z2yqeUveRQwfCg/KXhTZSJEMfYgOX3Rx3qJnGk9ueR1K86ZT06s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7xCDBK7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7xCDBK7"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bb662d56b5aso186048366b.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367892; x=1777972692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBwmMLPNQ+H+KXaf6i4qmcxy6ypy+2fZxwTq2QX9Qnc=;
        b=P7xCDBK7OfvBqLBr6GIwQtsZz+Lrpfxo0Hu8WdZxCTv1UXgSrkifO7hgyUyVPaRZuE
         dAwG0fFlsifeRXTdctHSut1tnSfk0/ZZpUX0d6D0VLOHKyJCm9FzJa46VXGBU3VjTmWR
         qJjz8OHqeYizQz/dDwG3GhxW1MlYnsuNFOIiWLMQxtMbzrNczZ2PMzfV1iYQ+iueusIV
         tlQ+QIi3LBPXyNpYNzyZKrQuxlF1D4JJWSt6pjD8llBcO++O7TfuNagPmwYV9Sf+jNEY
         EknDMW8wVhxVQQRI+PUoHo2ehmjopij3NFESDVyeyLWTTnwZ/Lj90WJ8a0LtauNj5YDW
         sXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367892; x=1777972692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBwmMLPNQ+H+KXaf6i4qmcxy6ypy+2fZxwTq2QX9Qnc=;
        b=O6r9CFWpraH+Yc88sLM50CQJtaV7wvPwI3uVVLACSqENQuf1Deo709DWUwXsxUU0Pg
         57nVwY6tvRwe/uewHbfhejeD9+eHSCe5r17fEClxhU06n1O5FCcMRaTWuZr5aqxLcLiY
         4XhV4fSZeccA2qP8urRAUhf08yOuayQsHFkweiKg63d4NqWhvhPQ+DbSZ+6iWdREyyIA
         K85uwo8rG/10JU51v+uY3XYpc90zSWUpMEYiYZCW3naep8njU3qAYsCP9lXDb1qwC5Jw
         SlznArAmUJfPeQnv1T/Bc4X1+Iz84wRa2c1qMwz9T8hyy2Oh0fVITSlJMURoFF0rBL8s
         T+cw==
X-Forwarded-Encrypted: i=1; AFNElJ8tAEbAyyffOi5FLotrZq25YzM4scvkv4EY45m2QrYUcEKua3TsOxXOboQvYZdO1cSd90GLBCXqaMpdtd1x@lists.linux.dev
X-Gm-Message-State: AOJu0YzBciPrqqYXiOOlEqvCaPbG8EL0xEm7W70G4+oYhVWeJvTw+V3P
	83Mc6mQs4oRa5G2/r1icX6Yzx8pj154c/plVrY38k//rLInXaxICGnmo
X-Gm-Gg: AeBDietqMAlBXyrxqQNRFB0ZIz1VB02QuTIQeae6jT/biunMES9rKkiIWasAh8ILYYw
	XMHbLXqkp0rKTouv7KAo2vBAldwta7J6q1eLmQzD/ur0bSfCHCpOiNZNrxsoTg82+OXQ1lqrjAB
	YceSkVRLAFGB29C3qtAc2sfrf3aZ6jrrTvfRaF6x62nrK/OAeAgoSYFEKEh/bjmnGjTneK5vBoL
	4wiM4TOikS9SXtdbzPbMNoRLyLpLSkDuK6Nt8Tn3vsdqWkibLtDINDSNiAODa73lFhT3yDjq0LM
	mcswqh0hHyNxB0AY6V1LcRZhTNE7h0ubJHo4x265R7fJVjpJWV1XxjVL1a1AqbURU7jxP276Gbj
	oRfp9i2Y3rKWglcHSUp1UjTripS7I2Zjz901rKA1+fLUOWPRkB29rvf1xMNzRDmJkMeG4Qq3JqU
	i52XYeWNLwnB+a64mGYuS+xWYQds2O2IImdKTSc7HhVRkHjvhOumReiOuVURPPrO4izhRW+732/
	o/4S8aQ69n8ufk+bjUWncfQY2rzirAF+kJOPeFpZP6v3++wiltstNqaW8B9W1VCdrrLG2Q=
X-Received: by 2002:a17:907:97d6:b0:b9d:7b9d:df02 with SMTP id a640c23a62f3a-bb807e5a305mr106386366b.17.1777367892128;
        Tue, 28 Apr 2026 02:18:12 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f6a1sm4902502f8f.13.2026.04.28.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:18:11 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hossu.alexandru@gmail.com
Subject: [PATCH v3 0/2] staging: rtl8723bs: fix OOB write in HT_caps_handler and OOB read in OnAssocRsp
Date: Tue, 28 Apr 2026 11:16:19 +0200
Message-ID: <20260428091621.739680-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3, addressing Dan Carpenter's and Luka Gejak's feedback on v2.

Greg, please drop your patch and take this one instead.

Changes from v2:
 - 1/2: switch from min_t() to umin() (Dan Carpenter)
 - 1/2: keep truncation approach rather than reverting to early
   return; early return bypasses HT_caps_enable = 1, silently
   disabling HT mode for APs that append extra bytes to the HT
   Capabilities IE (Luka Gejak, AI review)
 - 1/2: expand commit message to document the early return tradeoff
 - 1/2: add changelog with links to AI review and Greg's v1 reply

2/2 is unchanged from v2.

Alexandru Hossu (2):
  staging: rtl8723bs: fix OOB write in HT_caps_handler()
  staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 4 ++++
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.53.0

