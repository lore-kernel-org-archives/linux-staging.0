Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D03435EF3
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786089; cv=none; b=ppAOuauZ574FaYxm8q1YOdeZgti6qmvBwuHSQhZ4/hzICzydFneqfTsRGcLyIR50Q+PJudQknlbPdV6X5OHz2DSZCj4yL2RV0moCSHsFWtn+XS23v+2HsFq/DCTdpQCEuI2WHf3+fSJiEKd/6xJKaf7Aap0/hDJnAQ1Ptvi4A2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786089; c=relaxed/simple;
	bh=3W+dLDnDS1EUy5LPi+VX0Hl1AUX65Rhrr3nCsF9I6aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1m19TrV544xHnuVTdBjIHlndmC9FjiHZwE7u00IH3VxkdBVuXVtqYvY0+y7hewxBzTst7vJGM0zxiVKI3zIhEstaDYN4bt8aB1Iw3LTYeie+S6Ke4YTA8H/O+q7FM+j0SpeESUYiJ0aZ1QSU+WbHVojBnuja7wqkvohaWI2C80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnWb3g5O; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnWb3g5O"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84830c774a0so3666008b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786086; x=1786390886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=25CUOrNXx74WmCDVh2GTHaC+rHtHiIp0JdwVP7dUxi4=;
        b=RnWb3g5OSEJwSJ6H0shqndoEcZg9I18B6LLU71UaNYjgywW8fML2jxSHDT/4dngusV
         /7cKKH/sVJtJXaxK0Y5fZKuh4cxynQfs4M2Xb7iMk39LOO74NP11qWv/t7Idv0JVA3RO
         cMsk2Svfa5UqxY8z8OIKuiEBg8ucDb/43hogzLcGjiGWG0S68Y8EE8Hx3WGW3+CwK+BO
         h7dlYRoVLoa7BrcuA3/VlL4b1z9cmUhru3iAJi8MKl4n5C8IY/qXCW1PzyyFFgH5oHWT
         1GdR+Rx7IylDZXSd0ObecyPf1eTLtmb/KTr9rZ1EeYkZWpaPRedFKvkHxJEuZ5TALBhN
         bJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786086; x=1786390886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25CUOrNXx74WmCDVh2GTHaC+rHtHiIp0JdwVP7dUxi4=;
        b=TXaz5iNHpOY3Hd74C/ePc2rbtUkguXR8kOHsdT2kQ/TblT2cr0AapJ67FSvikCo3U4
         qRNWyQtAYAY3KuehYf8KYpUpXcg18sGRQxcOktUXhpMncrB67cJ59/+aPBf8uVpNMr+4
         pZwUf8Rdzvi/utZh6PgClQRRlS902GT8uzIlTK1RXcFwqROnlsOJemJjmY+aI5yO1AQ4
         TXFCfJbNVitXtYkYHQjfUHzLiMMI8SNqfrCDx08EnzNkTavKeTjeEFvQ5SdJY6AstEFL
         gBwmOMHjnSc3qTCFQSd1vPbLDaXvoIobWOH3KBFUi9A7G/sDQ0B4DWUfmY5aiRwVCJXx
         5dYw==
X-Gm-Message-State: AOJu0YwfYcC3AzQdDWaI/RP/wH7YSAQTh3+cmdDcxpByeZrY8/P1xwqZ
	trkJdlS6IQyeAw0VBC69mRGjEhFQaLqFccnsXuzdaDPLK2m32R2fZWLE
X-Gm-Gg: AR+sD13WBuDGpOQvL4qooEVWV+w6cOQnP5+rMBS6lE7ZA+7HP3JrTnVWgUsMQO9Mbr6
	A/WAPonWL2ZzKvcDMlApFOgUOIRYuKOgFsfQQYxR+k6iT/utpOEtFq/0KVETSYpEfnRngp1ilRe
	JApGYX4+nDZDWtivOCG2SQ1r5Rq7x8AQm+5xL/5Yvwctb5d9jubt+KAnf1gk2PASEfTRBrdLhSq
	h2WfpX3I8bCTArIPrn1SGy02pEisqklL9DxzR98TFNFtpxOIcHXL/K7NyzH84f3yGA6til8r5kg
	5Di/ZOz1TqHSxLa+GN+wq45MJs56nqUabfsZaarVr2VIH9sf4FQxfrjbQSrA4pgVYEHO+c6lK5M
	C26do7vP+QI0Rhb3lIke5NjG8cAOa32n+Y75J+IEBOsuxuLU7D9hGed2CJQndKT/PS2H058fMAm
	dXBxKPZ/TUlAYEoJ5gWcqUwcbGSRVD+pQenvb799UmQx5Zu/qWNZVFP6B2xqU7Vrb7V2EIsv563
	2YNVJzt
X-Received: by 2002:a05:6a20:b7aa:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c92a89cb75mr12196717637.41.1785786086493;
        Mon, 03 Aug 2026 12:41:26 -0700 (PDT)
Received: from Vicious.localdomain ([106.211.56.189])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm58533977eec.4.2026.08.03.12.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:41:25 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 3/3] staging: media: ipu3: remove unnecessary parentheses from return
Date: Mon,  3 Aug 2026 19:41:09 +0000
Message-ID: <20260803194109.11714-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246f..84fc98dd352 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1400,7 +1400,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
 		if (!list_empty(&css_pipe->queue[q].bufs))
 			break;
 	spin_unlock(&css_pipe->qlock);
-	return (q == IPU3_CSS_QUEUES);
+	return q == IPU3_CSS_QUEUES;
 }
 
 bool imgu_css_queue_empty(struct imgu_css *css)
-- 
2.43.0

