Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E753CF67F
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181981; cv=none; b=PfaLCw29PFQS7GsWFjEmRxd+sWh/Cer6PHK6RF0BSqW9fWrbT2gSDkwuk8wiRSYkq5UsXZGVHomzuF+oHgzerWcGLwyuQ0eF7qGgN6tqiBSb7JAl9x1xldY/6dQahLJ5K6dBCJGl7fvnEVJZQ8aVDAXPvtT5StCIwjV4mFy1t3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181981; c=relaxed/simple;
	bh=OFjmmCAdVCnNLi9sqGj4/5IbahIIYpKULO/PAOdSaRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5n9ZLGtb9aNSHtsUC2CvQbK15q2hujCbweClhqRysFS2eiCfQAhLY/IQg+/LKjWfrDv3RzG5ZQZQQa1aQSMt6Yx6HVQtKDbHq3jxQ5IwA/87YZ1VGhbFCJLOF2Zb7MQemTuMzxBto2xNhhjHHxFvZvrScrAosl6Qm1Zsi5Ej70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6Yl4eoS; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6Yl4eoS"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2347798a12.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 12:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181979; x=1785786779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUhS8pUGxVK73l2jmzaVX/4xoesiuavR5rUePoeMQhk=;
        b=r6Yl4eoSGmkleXSd8/j5sjE1hBLQo2+L+Z9Q81bSUCQUfT02pTyZCEMCEQAysRadNH
         iKNRsgczF0dQo1UFTpzVJsDkh/los5wKutXxRZsxNUjQ9gJse56R9buQBHFMngusEg+5
         Sgqr3AqSQYz/NIMBXHK3wQp9wIimcLanMs28B+C8OerJejAD9ReO5hEtVxWhxrZfsKCh
         fvn0IipCAWzbXl6+qMi+sHmFvlGUNvZYRqP3IVkTHVv7oi8wngcySD0MPV4uY6ShAQyV
         GSAca8pHJdnX7Tztb3qJgf2Hh9cBq7aDYZcrWfDnMBdcOZ9v8F9tbAy8fdhxvPFkglSI
         NBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181979; x=1785786779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUhS8pUGxVK73l2jmzaVX/4xoesiuavR5rUePoeMQhk=;
        b=V9LmY7yL7CWgGBjwWHjfwGsUjz2wERhTIymzPwvbRbRA0d9zeeKrdfhbv7/M7mv6Y4
         mpNwDS4Nr1DrqaZ67xW8pDl1Vgy+monV2Z/305dZC26Du2W1cG0YqwoEpG8GqSTd4wtY
         8qqImaj5JAFWFsGGx8t4DxHitB2xfpS/qmhX59tW2c6cTlp9TJJ1WwmASkvV3If+aPEj
         Lbp9HtGd6hC4iJKeTkJt+fYrQK9RMKFcij7bWfPMiFKu9RSkWF1QOrb5mOROhRuFUQHz
         hZwNKBEET3amFU2jGJntcMAXajhnDa1TUCW+wVBPsd0EnTNFFHYHQX9WPi7d9mEpdoZ4
         lsbA==
X-Gm-Message-State: AOJu0YzjSnajSKZ1XiS8OzFZYGhAkuUCofbVt0Ya3pEe3FgiJqU5SWYN
	SMOourhuZdKPWc+lBws8eIwWmjftDbSBPHbm2xMBUfYa0ZtD5drpz7u+
X-Gm-Gg: AR+sD13zv0nstXjuPyiIVlUsN/C3M4/yn8OMsZTa9V28H7bDKcKSr9VTdhziRK0XiJ1
	NmWwAMWBJa8L439KiM18TMpbSl0Q1ImztZGwWN2/ke1D7Z1rtJB+AJt8aAsHv0MNwtr0NhmnlLi
	ocetHevfm2KirE3+vwOQW2h7JCEXAsdR716IEdDF/bgxVuZGG171qplXzqq0nNwlyZ8x+Yfj/vJ
	kdnEMxWparX9Ep3xm/bGG4HrCDF36ZGk71+ETcA9vVUeNLH22Rn4wrpn4cfTXbErFcOSRNnlakk
	d18KRlcs+LVcUSox58HItAGvs8jTbj1ZqbQnILusTyILCYJ6sLyjmYrJvs0Z+MT6Mj6ytNlVMFE
	C5mv7EBZ0Cs5E1chjqcDs/1C7pQpESsN7pRLi3rhqftRwOel/y/0I+p5ONujDn7NKsJga+KQncr
	MeYVFnfAMDOSGA1QzHEcNU7jAz0H+aQKmHQ3SMpYPdwaZrKFmBm/HYZ5zwTRALRXwrRa9vYAfw7
	eB6Bs0=
X-Received: by 2002:a05:6a20:450f:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c6c7b05b3emr1000087637.2.1785181979419;
        Mon, 27 Jul 2026 12:52:59 -0700 (PDT)
Received: from ArchLinux.taild01bf5.ts.net ([115.76.55.213])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e261fsm39100835eec.6.2026.07.27.12.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:52:59 -0700 (PDT)
From: Dang Vu Duc Hien <dvdh12707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dang Vu Duc Hien <dvdh12707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: add blank line after declaration
Date: Tue, 28 Jul 2026 02:52:36 +0700
Message-ID: <20260727195236.663392-1-dvdh12707@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning:
"WARNING: Missing a blank line after declarations"
in drv_types.h.

Add a blank line between the variable declaration and the subsequent
statement in RTW_ENABLE_FUNC() to comply with the kernel coding style.

Signed-off-by: Dang Vu Duc Hien <dvdh12707@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index c837157404d0..99a3e28319be 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -389,6 +389,7 @@ struct adapter {
 static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 {
 	int	df = atomic_read(&adapter_to_dvobj(padapter)->disable_func);
+
 	df &= ~(func_bit);
 	atomic_set(&adapter_to_dvobj(padapter)->disable_func, df);
 }
-- 
2.55.0

