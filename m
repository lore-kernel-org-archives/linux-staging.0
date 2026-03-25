Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956AB318BA6
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465581; cv=none; b=kEDY0B38vTf7AfReFTQNvYOm0zqgVMTmh/sgd8mT966U9Bfe+a/JrouwdDnbghl1wMTTUCdCfye7T8R0sUhFAFqlAw7+MCNJv8CWXTTN3EUZgA1UehTaXhU1XrGm8QdWq0oTYA8C0WC+J5pN+i/9+z0RgloPPIdHYBkkFfMEZZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465581; c=relaxed/simple;
	bh=Bd/5OfzV7Sarf3QWBs7/bSDFPUaIF5mzDS/I9XfZQvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkJs9hpxYLk62vQHawHhtuCetoJHh3wzWO35noYaR2EidjgAPORn6UI0iKBQPh/sW+i6JU/qyd0vxnGUEtXJiXhB7uJa7TYsJFqC23AGXMwo4oJNKyEDDXUeq78W+hiA4cFD0wEzslNAsQJto4j8xcMTrm5e1k2/iB0K4MJuckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqApBdml; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqApBdml"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso1870165e9.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774465579; x=1775070379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXqWD/J7jCnsXdMGUm54CWym6mF6LX/bj6037DcUiaU=;
        b=sqApBdmleR8oIof2I8WLPG5jVwZAG7F4FK8TvdO1nBMZFBqd4s51ymuxAQfI765Nvl
         svx+WmjgqDbFqu+8tuf7xFhDrhIrL62//Ira8AyblPoQ4KegKSSxFn7z838VBa548spM
         CHb2BHxLmSmBa/dR5UcOsCqb0qXCzVvyVmhmSlRtOn74lMDewkkf0YVfpJW5/T80ukBi
         cng4nhYIwBWhYCHco4uMe7aFzvtlj7ldYJyjhKsw95d9nCMLLIm3emjWPZe0w/TEnkh+
         PH/zLOFAqjJGkOFefAV2E/kZ3wyOJ+WRxjBoXNAfbOpRafTtipzyKq7DRmh0qLjIQTk/
         I6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465579; x=1775070379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eXqWD/J7jCnsXdMGUm54CWym6mF6LX/bj6037DcUiaU=;
        b=pj2yVJJOVcSpuFkkjvwmYdzyVd2+0iQdGBcT8lNXCyASmaFCHF9X7/IO941RsPUskq
         T1HwlGJnsG1wMbV2fhzZaKJjPV5u9Dg6d1R2PjYzjlYC0yESk/Vt0q4IbDjWYSi0B/a7
         jYpU7cy+1a1We5BML+FrYMXJXmAOgwVdQggQ6JKxpGZc6rIfzrrNQm8TFe//U+z51R+X
         wTpWDoV6hjF0zOcAJzr6pjQYVaZPKbvtDODRj1RLdMt7gv5BFXoU7y5voX5q7fhD+eJf
         qLe5R4poBXky4wxvsZjz/xPWo7yUXiLMbfnS7XQmMscYwQq944xI9LlNRds5RwewAWF5
         Xxqg==
X-Gm-Message-State: AOJu0Yzum4Gtf9dD3IBnckfAROid/eZYAaC/e4SACh/gzqVQObsxZCGE
	5iEDpCibZeZW5ZBCLoy2XR/QSf6czSXlNepC540+3EtC/TgzbYijF2G3
X-Gm-Gg: ATEYQzy+/MBhdyGwsthaHq7/D0YcXUEPLGEiytISNP8o+vSQdOboJsSMrdfZpOBRTQ1
	DshjrwVXWQ3Xo/RWMRawTWcpcUHIXM+cTzGjXdFvdHumg/Mgav+JwS0mJGWNYTmCtY/Zvx5gdJ6
	AHqVphPJU3WM6qTHXUugMtq8Y7qmquL8YEL98gJDSQtp78zJYXKoGOB2vFFRj9KZxr5IUPShhSV
	f0XCbHhhrMWnBX54LaGj9KOnV/JQRVvLpZvqfWlB+8q+g6W7DSKQUmlTczN87GhGoG6SSI94wvQ
	+kHPaonHLckIfvw5ly1bGMXKehtrOJnJbCBCcZPDANgClXb6kCIk30diu64IUbfkv7YYMIcOU7f
	TTsU1cnIvpfvEACrFY+EvoDgrponG4LYEPVUmT3KWio9uacmoJfKnNeEi4amK4uygk88ZRYsZ3y
	MLhe1vVtWvaPUMV26estRdvNI=
X-Received: by 2002:a05:600c:4685:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-48715fc38e8mr72717625e9.7.1774465578884;
        Wed, 25 Mar 2026 12:06:18 -0700 (PDT)
Received: from potato ([31.176.175.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm2090294f8f.27.2026.03.25.12.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:06:18 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: clean up callees for sdio_init function
Date: Wed, 25 Mar 2026 20:06:00 +0100
Message-ID: <20260325190601.7906-4-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325190601.7906-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260325190601.7906-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let rtw_resume_process_normal return errno returned by sdio_init
instead of -1. sdio_dvobj_init returns NULL on error so leave that
as is.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2dfc8..e943dcea1a21 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1135,10 +1135,10 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	pwrpriv = adapter_to_pwrctl(padapter);
 	pmlmepriv = &padapter->mlmepriv;
 	/*  interface init */
-	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
+	if (padapter->intf_init) {
+		ret = padapter->intf_init(adapter_to_dvobj(padapter));
+		if (ret)
+			goto exit;
 	}
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
-- 
2.51.0

