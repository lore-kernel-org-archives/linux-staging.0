Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153AC2C8
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 05:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302450; cv=none; b=KRrnSc94eWkVx0nIobe452LdLQKEm7Cv71BqBwAtMH68RHFaku8wZ/97HyMKfmOvi5hrF3bo3p9a+l1vfLOnlDUT08JQM9iXTlgV35dBIHz6nwYnxC9ZpJ9u44xik+X2oTMFKF6LkkzavY/U+CyH48giHRlA/zRboS/SJzzVAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302450; c=relaxed/simple;
	bh=7ycnY+QFyhhrmBU9D3KrVPHqDoLW6tZiB1yGWFsDSnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnU/GLqENyM+f6E4FQ0zAGJ+O+udaKhPmo7mrWiDRPrhd7Lm9FY6dR2g4DkPGxbCBUZd/AUWQ8kZsE9UuM+br4st9dmWy3P7y/8EXyj+aeXmDFl037kgq+gNfPolF7vSZkorjiReeeWYaFry7g4rFCkIJm0q/RjlhEoewD3zP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hT/WEnry; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hT/WEnry"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51e4ba1cfb4so3441061cf.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 22:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785302448; x=1785907248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jag++Suh2iAHdugEf25lQ1W0AtpeYmQLLiEc8wtzC1c=;
        b=hT/WEnryzqHvshPTU/eHJMF0Kq08QlEfGfz53VZnwcd3CVvFPh6/vjqwKQ5r+UdFEX
         oa64LAGK+PShPwa+KM5OyU6h53FCBl6VwQPdur9KwlqgdX2ljsBw8lpLLc0vE+YodBqe
         cmUjuUHkY2pwa4vLv/6vra4s05b1CCnou4uclFeYWhZdAHd3VTeyTM2H495gkD7hfDu4
         xevzIGn5Lp3SeB13ibj3150Eb9KMJmA/h91oRa7h5AoGYRAsLvaTI/4IIu17YRy52M4f
         JkJ4strhH6L+Oie3lnFoHSAVfAxYXpD83gFxySpoMyh+gtBxy/+HXt+HF57qtgLHBv1P
         bZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302448; x=1785907248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jag++Suh2iAHdugEf25lQ1W0AtpeYmQLLiEc8wtzC1c=;
        b=a0ekV//rUT4zdnhiuSnNor0GLibBimpFaaRHPbBXdnRhkpXhzvLPwHp9hViz/GN/Gq
         I7sw4Z5AJhjZOo2F5ooDEBWAF8a/DVwD8RAZN2Kx77Sp5vtG2Q+jdw0GyvW1xctTVdMj
         XMJps4rhXBLGSRGAFFbzxtfiECA0BEjqAK7r7YVdE+K0gw68uU1P4ZZA6/Xko2BNsgjf
         +BC02OhzHsWbIAYqfSuFS8f+dL8G2J4zOxKZnrPaFLS17uSTgX86c/xZy4TEfY4FvU4P
         fAttquVk0t1H7Clg8VsObnCj9Be805GtkZJX155oOaotYT0QAyZzB6s0b2hrryJuifjd
         tAJg==
X-Gm-Message-State: AOJu0YwgyWhRXatD5XYshNF0yOKbxFXGhN34ZpMPO9BEXBS77tKSCtFS
	s6ru9gEnPmd8jbTkOfjyPtT1kcxZkaFKB9imOJC4zkqZzhckuQ5DgWxnlMUh4UCa
X-Gm-Gg: AR+sD11fvzH9yElrEebVOKWVGkz82dSkAt+YheSAyyLcaynEo3Wnh6rHV1k/KxCR/FS
	NhR6ZsJ0jd6qmWHiNGsX/5t42FuDbFmv+GNmPx0EfAWdR+aa9M8/+5SUJI3h+OXUEXivQxrT3wP
	e9GxuLDLXsNE5SeM+c1ZNURJp0P0ivdTWEhOlzwzJOqYCI7tDgYesbTf71O+g/1frKobGOrsirK
	auCc6eYCV0gKvNVl55B4U9jlGq8hG1Vas19fyF2ea3h3rWemJ9SlJPAHraHc117iM2rDt+2BO0Y
	IQzqYbDGsJMDOQjDUc5F/WxQiZk7cATzomh+YPyomYRe13hR/QqG/6Tm7vYYzWWrJQouVzaQRfY
	/0wVUx4OzppkD5t3v74Gcprnyc6ihJ3VPofQwV9uCy1HeD9ip0S76RN54NIUnQcJ0d1e3KA2kqm
	2Hgkm5kCCUwT0Sd7wK2BYYtghndzKmutqL+zVKuvONwTz79hN4ZRf21m8DIa9gYhrCeJMTlHomh
	A==
X-Received: by 2002:a05:622a:4203:b0:51e:4e87:3c4c with SMTP id d75a77b69052e-529d716548amr47314321cf.68.1785302447893;
        Tue, 28 Jul 2026 22:20:47 -0700 (PDT)
Received: from xenon ([2601:5cf:877f:4960::9a95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2d832a2sm12034821cf.18.2026.07.28.22.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:20:47 -0700 (PDT)
From: Connor Sample <tabulatejarl8@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Connor Sample <tabulatejarl8@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
	Adrish Bora <adrishbora@gmail.com>,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: rtl8723bs: os_intfs: replace msleep with usleep_range
Date: Wed, 29 Jul 2026 01:20:38 -0400
Message-ID: <20260729052040.249972-1-tabulatejarl8@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl warns that `msleep()` of durations <20ms may sleep for up
to 20ms. As per `Documentation/timers/delay_sleep_functions.rst`,
`usleep_range()` should be used whenever the accuracy of `msleep()` is
not sufficient in order to avoid jiffy rounding.

Replaced `msleep(10)` with `usleep_range(10000, 11000)` and replaced a
1ms polling loop (`msleep(1)`) with `usleep_range(1000, 2000)`. This
should provide improved scheduling tolerances without changing the
minimum delay expectation for the hardware.

Signed-off-by: Connor Sample <tabulatejarl8@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..ccac4c2c3269 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -992,7 +992,7 @@ void rtw_dev_unload(struct adapter *padapter)
 			if (cnt > 5)
 				break;
 			cnt++;
-			msleep(10);
+			usleep_range(10000, 11000);
 		}
 
 		/* check the status of IPS */
@@ -1092,7 +1092,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	pwrpriv->bInSuspend = true;
 
 	while (pwrpriv->bips_processing)
-		msleep(1);
+		usleep_range(1000, 2000);
 
 	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
 		return;
-- 
2.55.0

