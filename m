Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7B361DA0
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565170; cv=none; b=XfS6Hiwe2KwQKFyj9BLUTFfNKwiXD96ezt7dicwjKz73ehuIiRqEQ4P6EPD1D4oTtKS2tkvVgOE00+oMgTJXn0khTMFUL17W3pjclGV8D0WMHv/7T82kqobkt/jnS8F7dRkJWj5FbuPn27hgO7rPfgwupykcIFu5mIf5h9oU/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565170; c=relaxed/simple;
	bh=aHVTWAqpccsVgS8XgeonyT55jal8X9n/KLUSUH4H6QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYCJQIdfy6/zJ8MzhUwWjJulEekHap/LhOG7L8mZrFQ0wHBgnypE1U7Vm9Pl9yPN/6ndYDtboUenv69RN1WRyS6hSSLPuw+E3gy3WkOg4FJIsc7/7YovJR+a+OnYLmQk0EahKP1KmI2a1ElXS7IhMoZ05IsA+xlnXNutpm44RIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/jdpxKP; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/jdpxKP"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c363eb612so976944a91.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565167; x=1769169967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtRoAXhhYBtkakUzex/rl4eUCMXrlVNn+BrBjahn92s=;
        b=I/jdpxKPDzhE/M0FnlSENNWBvvJxozPVynTNBCvyGGd576ph4wUE6jK5iDe7qHQXW6
         bYd+Uuk4iQyKa7bLMxCaQMGsBG3M7jGSd24//3e1pwkt//CpkMZ9BKCn7volBNukRmdS
         +/oFtsfwg7YfP2kXPBwaZXeg66L9h8yz4Eh0etGZvSlr1H59i43hgoFQVPJUoD46dhKK
         R+9C7enZ5wRE3/mV3gSbrr0h3KZAsI7ww/rybylW0amXXc6VMZjCKdIOV/Vav4PMxDCG
         XTkrWdmsQi6uWrctRtt5F29l6xRDIN2FnONZJc0RKIJtGAS+hIW/3SN0VnU49c4sqg03
         XN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565167; x=1769169967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtRoAXhhYBtkakUzex/rl4eUCMXrlVNn+BrBjahn92s=;
        b=J2zMrenZaVmebsYEuK8+xoG4OoqXnVn9q4v1HBoiWEKRpeCXev1FieSkvf9t0zrxaX
         fbKdY41jiBc6fsvTgRz8SzxxMpX92UJarmiW4jjbvi4QxiMbXwk7wjjkEe3XnzdPYan4
         OlF0KnATGwFCt0nWYBRdBdsZugiNs93SNwk9267WwEeswNf91XQswXwZM36gbSDzpran
         nxYDZ3wmlBO4wsfzlp8BNZGNNG9+Fe28DOERkJaely3e1OAb53wA08Y1W103p0nrkdpN
         OcEyRoaZcrdUej+ar3d8wRPFbwQog+oAkSZGW8owVSpA8bpuo3oflWJq8oQmCowsD2bM
         o6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVANRuHP2S+iQv4c/Thk4rgxRT+KNcRnMB1EPTpLtdtBJXf05v6Gc5/bL16VKlsZSshkhCwahuWx2UwJhkc@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ8kofzfsTz7yY2Sg2E76w/YAYbaVhrip4zC54rUTHky6Y3pRE
	IxzofssooRD5DS4LRH5FiokE/6j8GTvs33l/rAXQo/2xfxOvxSn0CCeC
X-Gm-Gg: AY/fxX4h8uH2dJmZ9g59uypOYLgkKhMHG1VbiIosi1lZsJsB8ZKCyiUzwCMr6dNp870
	4coxoaI4BHpkayksYvUtijJSlNztVWjM2SW/iVmFbj9KNnf8gb+G0RdVutYzZ/oIu4fZT3U/lgJ
	EWEF8jxh50wk+sRTy2A0bfOh7iJOzX3atAwn8gDB6oIHi/ADmi/ocEg+4Qr2S0ZGrZbzg8/n1gB
	109KSQQVUKMpDN6JKibiD7hmAVWaZQg5AIMceZBmC5YignjbkyX0sJVIEFNr5MVsWVfJJNcYEJp
	0vEdwqFneoNJ7k+42s4KxhAQzZ2EC4o/efkHeucqVmYipWuTr1MuYkiWkaG4ZmFfoMNThRl68Xd
	9Q64FUiOn6iNKXwdDeTcWDlCHlMMe/Di4KlWFkWAsYrVi5j5UBNGUyzFnBxh7rQCgrDual1uuCm
	dW38qGRNlonTA80fsMgA+k
X-Received: by 2002:a17:90b:58ed:b0:340:bfcd:6af8 with SMTP id 98e67ed59e1d1-3527313bf59mr1855336a91.4.1768565167470;
        Fri, 16 Jan 2026 04:06:07 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527310202dsm1992539a91.12.2026.01.16.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:06:07 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v5 2/4] staging: rtl8723bs: remove extra blank lines
Date: Fri, 16 Jan 2026 12:05:09 +0000
Message-ID: <20260116120511.48272-3-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116120511.48272-1-nayana.mariyappa@gmail.com>
References: <20260116120511.48272-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary blank lines in osdep_service.c and related files
to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index f2d9c2240c9b..4eff0cc955eb 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -149,7 +149,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-
 /**
  * rtw_cbuf_full - test if cbuf is full
  * @cbuf: pointer of struct rtw_cbuf
-- 
2.43.0

