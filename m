Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82813A1D00
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206765; cv=none; b=H/CpCz/keS0zv1vF2YAjyDVtvtiEnsCpSafaDvoPgROivSi+QmxtTU3HpKFO+33VnAnjdwBAl35Awr99Prdi8HgB3aBXlSRI0iWNgPUW8a8PyJxC2FYzSNaKr9eDUrQMvdEF+z5EunvqOWFbdgaCXhB253tw7XGyX/r7e7pTVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206765; c=relaxed/simple;
	bh=eQyRA3zK145ERS+0VaG1fqXXSzWHRu1UuG6UzNBeOFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjezjVFAoEh7ORWP2ztYDc74vAdzKm2B0W5ir8xiSw3pF+CwJjrgVYkut/Tde9kLYxX/yjDKp8xz4yZ4Am6pR+/mhEVtpHxoHE1dolw7yCSizCnLyI9yWMCVd2Q80LzvoH7ixIFaASaDCIVQL6/kSI0znubacRyLgt+RvDjCQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZD2Tkow; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZD2Tkow"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b885a18f620so1023297266b.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 04:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770206763; x=1770811563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhoP0pPQXzFMYeoL8mgzc0GAjk9Sji92Sg8sNl17bY8=;
        b=JZD2TkowvWZK3AEyHdTK3Zdbdb0GA9rufoK7f43IazSRZlf8s4p6QiCJWbhL+U5Fjw
         pG9GspQnu44753EoFtlMWnQ0vyZwCbKpDsjGWEeAKlIP/wvMcI8zpjWfHzD8vCh9vB5L
         q4xP6cRIyO80s4saSMA4jInBb1hvEeFis7fR11kOSBMhHdubT+meoxT5gY/wOyxvmrBV
         sgXbEwDRm62jsGmOr3ntpMTVQXyfCCnK+6ssS8+K2nI2eYaW64wm6MKFQP8kQzA+Jjaf
         M8SvtfNWtGehp6G5A9c5hltiQ1syaXQhUNcEGehzZC/trI+YZ2DHahUdX6dLtbSw9OXF
         771A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206763; x=1770811563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhoP0pPQXzFMYeoL8mgzc0GAjk9Sji92Sg8sNl17bY8=;
        b=lIfqL/pM0Pd7LICYl9P/jekZlPFdSqv+66axCMsBUc6Ib/ok/yVm5fY1tTiaDJB2tT
         rH3AHV6aYrBJAbn0gauYeyO8pQy9YektJFnzUc8eGpwzR4YdCXR5w0jjhObljyrgSLZI
         Nd+pnydZ7peIxOR98lENuuMGm1agyYt4WNUIj64hJUOWdv9a8cm7HqMivgctFrtq41Sd
         kOV9va1j74YImy5mq/uMqpZWgm/q2WA1y+GjZBMo48E2eI/6P4xuyBEzxze3huz/vSQ+
         y+SQdJAcqK0jQgtkddU6z7Mt8vqXnIge5rJJ4XszUbPneicy9ruBXbIHJzB0Q02Yz53h
         RFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQT/DG68fAow+AKws37xqQ0GWynMp+DN7zemHh0SlTl5Q12O96vKHbJQ+mCSOP5YcskurO8APSrm01kch9@lists.linux.dev
X-Gm-Message-State: AOJu0YziTfSr4fh84E0JIyH8VmgpCnwwAW1yZ1P/MjnNouQ6H94Ca78S
	OUCcb1fjvdDoXY9mhL8mohkNf3Y61XGB03QRlMIahHAf4UFSOKszNiHX
X-Gm-Gg: AZuq6aLfCcpkq5WHl/Kv/6FPxBaXopjAmgW1JdQpncFq0CKY05jDG62kBIMHsw11lG8
	8EkPL7F0PDpi11gpUEZc4W2WcVQyKJq+8z7Ju3QzRlWoW2ApO4zJxOvfLYzU2YiIFvu3lEcM6Ph
	Ser0IYDxfRMQyzTnaQh4LO9pAwteNNBz7JlYtG/dv3Y+xiTQup+lufd9v9NqNnlUIvUIko7xd7m
	PwjvO2j0JTsOwhyT6kTWXMojg8EYFsKOJdLx02+x9IEKod+zq9/ThNtSIU/bsLr6AN1pOuXRtpS
	UmhN9vlPD71WUTok3VYAzgU8RjYzRKLhpMNi7f2v5brynbAn8TORglwgCwKR4WxO85YQHP34uPx
	O3sYwrA4XP2Pnj09PUC+IvBrCrHik+bsHLcmaSQ19wh2jVz7jHZj5bPVzUitANL+YEBeZdpGqoA
	fQSLlrHVjjYRkI/5sr2HRwoLbzvXwTiiiRyJOJWe+NMrZm0mheGyx2h9cI5Hb5D/j1EPPTtXsAj
	9AxrMepu9D7/lNCTSSVuefzrSMoLQP6Rs/82ow+7axMbSnmQ2T9kmUzvG9B9vlCqqlkJQ==
X-Received: by 2002:a17:907:26c2:b0:b87:1eaf:377c with SMTP id a640c23a62f3a-b8e9f3966b2mr203944966b.38.1770206762944;
        Wed, 04 Feb 2026 04:06:02 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.79.91.34.bc.googleusercontent.com. [34.91.79.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8be3sm117979666b.10.2026.02.04.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:06:02 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 1/5] staging: sm750fb: replace strcat() with memcpy() in lynxfb_setup()
Date: Wed,  4 Feb 2026 12:05:58 +0000
Message-ID: <20260204120602.6715-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of kernel hardening, I am auditing calls to strcat().  This
code works but it is a bit ugly.

This function takes a string "options" and allocates "g_settings"
which is large enough to hold a copy of "options".  It copies all the
options from "options" to "g_settings" except "noaccel", "nomtrr" and
"dual".  The new buffer is large enough to fit all the options so
there is no buffer overflow in using strcat() here.

However, using strcat() is misleading because "tmp" always points
to the next unused character in the "g_settings" buffer and it's
always the NUL character.  Use memcpy() instead to make the code
easier to read.  This also removes an instance of strcat() which
is a #NiceBonus.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..4c6e84c03 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1163,7 +1163,7 @@ static int __init lynxfb_setup(char *options)
 		} else if (!strncmp(opt, "dual", strlen("dual"))) {
 			g_dualview = 1;
 		} else {
-			strcat(tmp, opt);
+			memcpy(tmp, opt, strlen(opt));
 			tmp += strlen(opt);
 			if (options)
 				*tmp++ = ':';
-- 
2.43.0

