Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC23BB661
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629589; cv=none; b=i9ZO5COzLNoZt3pdFQh9HzUkmGGTxtNrMAWr5wEZgA14zVzmYBCUpyzEBwWWmhSytR2yxki1bxiywYHU/AP9F+M7yMNFaKngQ1dExZcp29YPbAP7UUJ96YPQnrh+GjscAB1FSgT0lhMd13QN3Xlx7v7JAZz6vZxrx7pBC2h1QSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629589; c=relaxed/simple;
	bh=mU5PtjMmV4lxfiPkXIaDIUNhRMnvQ/eS+f/tszi1Bno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fa9Dk5M+jqa/l9qPqhUKcUIynQ//5el1U5izs7iCmPnDCj52I3atUf7wquM891sOr4jre7KVSjxUWCnTTMGLWyXG1eN/c+kmnAwuv+7lWK5L8NNfY10K2WhtuiaQSRWDQ8PviIzT96aD5bQBk0OWFH0PuyKSAiNVD6onrFWlWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMUQorTg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMUQorTg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso3958295e9.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789629586; x=1790234386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsNOKUmy+9wwtirE1XH9Jsj581s6JNQM8IbXZP/ifso=;
        b=AMUQorTge7VMMGM8TiblcrV/8f9BgfpemYzS9sp56a/SQrheA0/UGcawJwgY+0kfk5
         XOf4zdkAv8xkEQLfMPr97/oeJoBdPvYZeAcx77bjJTPG59Qh1JAZZ8cfRLETrQnPgsiB
         kpCRXsmZ0zAoZOLCnAki5uwHT8IRs46Qi5L0kwManvu12aZbB0eH7xbY61cUSB/xUAdR
         /97phyg0IkAw6sil8ONdOZRgpSzf+YXPdoyK5u+OSa8mOdaK4T86rsUDXznDcU1HkhQj
         YIpo7eHt7ExQKurGiMfOeGUqA7D2f1ACGmM6z68axlkBnSXuGQXgbbtS/qRI2uUlpPvd
         jU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789629586; x=1790234386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsNOKUmy+9wwtirE1XH9Jsj581s6JNQM8IbXZP/ifso=;
        b=i/cQdz4JHhx9GwnxAoxXbYZme1xetR2GBUX5lsKx4GYJhxwbxSOuXvVLa8GvEcbTle
         WdYR2+fluvxiUNTDJecE8PS9FCCbGz1Y5pjHhj5CJvycI8sfA3ujOxE5a7K6E+79t9PU
         iiD4yUE44VxFMboidkuIZpgdXavtaOjOOh2LhQks7LTZniAd0DVeI6E1xdypDxbx9AIZ
         DtU+hSz27mcAhD7Q8AMvueWiAO+w3+qg0zWHY0Omo7PXhSRWbBwlds2gyRJ/DmmzcuOC
         HGqY4J0CpIQ/mlQxjrpWB11N1MDJHmHx28j3P46t9FYfEbej4SkJ6Dmu+CBeVpghEWFN
         IunQ==
X-Gm-Message-State: AFuF++lOpMRswUkVbcq3q0RnUs1kOau8Gscr4WY5iy/72WIolgUnwNoD
	ARarRxpM1SUwmPvJKpXFh/HZE5T0ut1/knlWS0FN1veYpshhsDM99ZbvS/cw43+IKfM=
X-Gm-Gg: AYBFou3U0g11H1aHNZX83gAxGxx6mni7Bksw7AWlaugrvXZi10Q1cU0rrGk4mbnvIO9
	85kgAfe8FnfwDpjxHPPqy8WhwUdLu5b3f83qMSfrc2ul6BbsphjzlsUFxWVa5U+zaOxOm2TpYQa
	nqRZLywDaWQ4nUCrOUYoiG7wqgCaKdTl4yy1qK5pyUdsgz02WDJlv7ygY5XVMAhzTBbo9/N1iyC
	6U0jYmn58MCLmL/tDbzmBrsRMHdMNlKNFm7k9aS5KJUZtkywawfqk+QawNPmCnr6d757wAaj1T7
	pzqDqLh77rLZzARO1ZBf3IXVZG5b/NI1l+WEt+O9U1RiuBTcAy5idzXZkUXLJWPf8P7c14OHk7s
	/6FqhTU2zDS+d7jlKy65IQmiGcgR9+BzGmRkV4cFOCl6YjL9O8vOJtbMZ+L8Pf2GYOeB1UCQAaw
	QNCxYzdMFAnCPIyGMf2OoxXRd0jKttlFdxtWmTo9MqDjl1ZQhVY/N5plMTN4YO5HsHyLYd
X-Received: by 2002:a05:600c:c168:b0:49e:6b55:22b8 with SMTP id 5b1f17b1804b1-49eac463871mr64369645e9.4.1789629586166;
        Thu, 17 Sep 2026 00:19:46 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm50324175e9.7.2026.09.17.00.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:19:45 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Thu, 17 Sep 2026 10:19:31 +0300
Message-ID: <20260917071931.8063-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(1) with usleep_range(1000, 1500) because msleep with small
values (<20ms) can sleep for up to 20ms due to timer tick resolution.
Using usleep_range provides a more precise and consistent delay for
hardware power control operations.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8..1d3262413 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -561,7 +561,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 1500);
 	}
 }
 
-- 
2.55.0

