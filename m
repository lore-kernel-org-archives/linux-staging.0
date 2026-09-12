Received: from mail-qk2-f7.google.com (mail-qk2-f7.google.com [74.125.230.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FAC2FDC30
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224725; cv=none; b=VIGIugG0p5v/gSdQTq7lPz2VB568u98jhZ/x24mhx19xR6BVD0OirA4H0DbdCpkc2J68SaIrbHIMjx0ahHE87sQzok8BDSCpd3XzD/UyPm+5FIfdnMOwqqAmLxqQYKcYvvTseT2nGoEXPTSuR5JHZTF/nW7dnTQKnRotIi1DN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224725; c=relaxed/simple;
	bh=zh8dHW01c87BITuP7ex43rL4cqROpdyb4lP2uILz2Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/08lT488H4J3QZiWDSVqlIK6NOq4+Xfzl1ol8blCo5qztFcYWtA/hf31rBn1+1XMroaiOGAq1s5uGX+VDMZBpuIrpB9hHuQz1UvfGuHYzwjPLqT3evhsnQhvpHSaTx3RXWdD2pJR0NNUX+kz432NIkoW8WpzCRDkAo5kEtz04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matthewlavine.net; spf=pass smtp.mailfrom=matthewlavine.net; dkim=pass (2048-bit key) header.d=matthewlavine.net header.i=@matthewlavine.net header.b=d6oT6DqO; arc=none smtp.client-ip=74.125.230.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matthewlavine.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matthewlavine.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matthewlavine.net header.i=@matthewlavine.net header.b="d6oT6DqO"
Received: by mail-qk2-f7.google.com with SMTP id d75a77b69052e-52f64eb5a48so8242631cf.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=matthewlavine.net; s=google; t=1789224723; x=1789829523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ujmQL3Kj1s7lhq2MzNKXV+x5e8Ji17sNWXaHh83QnX4=;
        b=d6oT6DqOpK9zpnf5au6B6SQSIsNYXuSM6WaOrpoV8dFDM7R4Mq9fR6WymC12hpGlMV
         VAVKcnrPL/vgo/M/gfDsXhFRWkiI3zXjBO0s62OTcBWfPXr0ww0ymW80+CksMDDfDycE
         464WZkVJbYdVNTuEW/2EWe0S8h1kUGTpzUZMm92TiQRJZZbfH0fbzmd67/rTLnIMF7pa
         Mh0ELBGdyfq/nWdh53JPeSBUQSSQYAs2wEFsPTju25qKNAacxwMKprN5701XXqFTD3vr
         QxT0PWuQS1rd6h1awkxFTr3UkVgHd3f+/iuXFd7FiP46ZIKwJRlKjlm8PV5753UnvpNu
         Xuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224723; x=1789829523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujmQL3Kj1s7lhq2MzNKXV+x5e8Ji17sNWXaHh83QnX4=;
        b=BCfNQymWvwttDk2fY60mkF4vmu0JYDgq3xbCDYwetVFLG6G+axk7TTqSh3DspyMP16
         jw3CV2o1Aeiq+YbGX9cambRJWvkYoEGZmGIj9wKmhNKm0+BXit5ty9On0cwkZq6+mDOI
         n1jkPxqiZDd4/vJPpBPd2IvuWp9Cb1nipcoaJzsMv6xUzdJYhPWUzRaYIu9EqxcvgOyL
         6xBtX5GhjYP7J/N4zePe6tiSrNKiiGkEjo8u55l390o9J7380kV9sZAi0Qu+bAxDgciN
         cPM/HmasLcTB0/5y5Y0r+oBh6EjP3DDif9o+nQaCIIsciMR7/Hx/2SJb6iI8gKhsayFj
         jNxQ==
X-Gm-Message-State: AFuF++nMcXuzMkaXHYDqqnlH9c1yGegrtwumP+nbYJet+LSveFw8gKq7
	GceOt+7jotwxNZ+zw6atPscVaG9ZsBbdfdxA5pQbl1vT3lOA2vV5RfGtyRhBHiI42DA=
X-Gm-Gg: AYBFou3pb/EOGKQ8z3fk0OQetApTJzGA8CaIVsrmEZru8d3NtErU3Lx7gfTM4QpufVg
	vabbIBZL8OyTVlRPqN+zzvMQDM+oEcmMKBsU5hmjDsf7akNu3CObi57jsRLYgNCiVq5rgMEFycC
	ydtwTjjPcdgicE1h3fKPNj6XJZCTrdl5faqM1kL9tS4dfFVONdA0mw8wy8mlDx/0427LFrzRQXj
	qZxu0CEEfxw6Cd/rsu5LbZ/d/swZ5XavVg8DqbVJlvOG0EdWLWiahLDPZRTAF+4iFZGg4XOAqIr
	FX4Mk4xmeyC3CMbh+HFS9burTrBcrFQ9DX/gkZ5f5YJugUgWGhBqGh1zYbdiEc68cP0Oy60ACvw
	m5/N77XFT0vWBDT4ZLsfyon45WeiZgwrKI6gKQ3GH2+jjU//vSvqxiC0neHJcl0KT5i93hJpN7j
	o5Pif1ZMrdrBvmh5CKfAvyXDKHlk3G2eiq+btVJ8Feu0YGTr3u//1262v2P15ZYWccDI+vQFE1j
	R74Bpo=
X-Received: by 2002:a05:622a:13ca:b0:52b:4e1f:941d with SMTP id d75a77b69052e-530c84d6123mr143245091cf.6.1789224723200;
        Sat, 12 Sep 2026 07:52:03 -0700 (PDT)
Received: from trantor.lan ([2600:4040:974c:2a01:dd09:1051:7923:6fd7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530e64da059sm20457441cf.24.2026.09.12.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:52:02 -0700 (PDT)
From: Matthew Lavine <matt@matthewlavine.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Matthew Lavine <matt@matthewlavine.net>
Subject: [PATCH] staging: octeon: correct parameter alignment
Date: Sat, 12 Sep 2026 10:51:26 -0400
Message-ID: <20260912145143.186527-1-matt@matthewlavine.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in cvmx_pko_send_packet_finish() while
abiding by the column limit

This addresses the "Alignment should match open parenthesis" check
reported by checkpatch.pl

Signed-off-by: Matthew Lavine <matt@matthewlavine.net>
---
 drivers/staging/octeon/octeon-stubs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e2d1..935ce6495f3b 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1386,9 +1386,9 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 						enum cvmx_pko_lock use_locking)
 { }
 
-static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
-		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
+static inline enum cvmx_pko_status
+cvmx_pko_send_packet_finish(u64 port, u64 queue, union cvmx_pko_command_word0 pko_command,
+			    union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.55.0

