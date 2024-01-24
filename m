Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E1013AA50
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136309; cv=none; b=NtYE5QCSWZn5O1Ztx9l680lqnmoqyu0pnuoUb9sgZ8zlleT3KDZcMgNsghyQRz/MjT8N+kMxQemqqjbvGvYe7uXCIPer50GiNl08cimttxL3viptDGuOWd/UuzbaqPqjCDCdBkIpX2Ddp1WmD5OzYyp2+Nvd8dkRcqCBpYMWWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136309; c=relaxed/simple;
	bh=NPVebQOC1RZfI4g42YE6iK03ZSKXA93yaB3EGLvfYik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9dfhBdSfW2xDg9goyBGSb/3bZMIfZMe1UYhlykhn9PIUjTqTYfdFhDbAw50QF9ti5O9IfwoB74nZg4BSC9ftKvNnHK0o8I4HpFkoWpCIuzlzKVpPTm8GVPXUvWOA+Kf6L/79cA3AdO8T1oOvefzsU+NtRirC0PMgNxr5kEDLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=J4sH5LqV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="J4sH5LqV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d427518d52so1290355ad.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136307; x=1706741107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/3JpBe0UCY6AdN00u9TsKTn1ffof6dRRWPOfIjAUaU=;
        b=J4sH5LqVemNlqTYCzkLmpQnI30KlOgCGd/QYF0K7X8Mvie3Vt+pz48IHoR8aZ9iXSt
         QWgMvL4uBOFcqj5gzP6OnZWLft+ajd5/HJPABpEozKjfs6Jx52m4dwcC3r3b5me5q1ri
         jmsnfnUY6WYheS0dcPtrVtM/qg7uiZusGVZL3istuTAyNht5jxQPCtPE1Z+jzoGOXmv0
         zMGmgmcgxKQCtQTkIHFi2P49LGAFwiHDfiO/EjWO9Yz/xHfdZh5s8mXdKq3yivkSJ5IN
         YUluyQRdgp130ZZNjG0f73dv6Ez4EnSzgdqyWBSxB5l1TyW89F8tz3yv20Rohh8EzMWx
         7APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136307; x=1706741107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/3JpBe0UCY6AdN00u9TsKTn1ffof6dRRWPOfIjAUaU=;
        b=XDTzjxbTEt5U6gbGIygfHFeWc318e7ukbebHDSsxEUHrxnWrG744etHHeiU0BYrF9I
         JCpmb2mvRqdu630rZxqnirrMvTXT0SAQHT92kpqdjf9R6zXRu3afV3wfOHi2FCm3qsCN
         Ax+txqo/sLJP55ZGsXWtrL4HRpXIQb0RCfOheHnBeNOKYvgf1t3dvR7axYyyY1S/ZiDQ
         tFuL70BvZEcnxERnT337bpqetA0sEKGb4RyW5bZpuL+Jst4ff097TcNUBWxw95hEsZoT
         KCmHrEGeRdX+rejGk8ja+wuf33RNXf2nF/uxqrkT6vcSCddymiw3oAaRY1fIXT4sRRho
         1HuA==
X-Gm-Message-State: AOJu0YxW2ObTwsjudqlvdyxt4EDi2UQNmpSNToME125MUTt4hKfXXa7m
	WvFS1+uL2QmkWtMka2lDckyFMTOvTuT6pKFnQiLBX6ifACMZIRMwNbG3HO+50Go=
X-Google-Smtp-Source: AGHT+IHFi9mGdDi1bGwPoQsVaVI3TlGgY93bJNWYhg5tAZYYb28+lDr+QTJ/OooD0YUxc2EnOYI16Q==
X-Received: by 2002:a17:903:298d:b0:1d8:20ea:4284 with SMTP id lm13-20020a170903298d00b001d820ea4284mr89116plb.29.1706136307562;
        Wed, 24 Jan 2024 14:45:07 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:07 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/18] Staging: rtl8192e: Remove unecessary blank line
Date: Wed, 24 Jan 2024 14:44:47 -0800
Message-Id: <20240124224452.968724-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove blank line to fix checkpatch warning:
Blank lines aren't necessary before a close brace '}'

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ab41632def7a..dc91e59f1bc2 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1081,7 +1081,6 @@ static void rtllib_associate_complete_wq(void *data)
 	}
 	psc->LpsIdleCount = 0;
 	ieee->link_change(ieee->dev);
-
 }
 
 static void rtllib_sta_send_associnfo(struct rtllib_device *ieee)
-- 
2.39.2

