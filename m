Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A32D5923
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389469; cv=none; b=I0E0TG2+LfF+Ri+zpz1M0RToSKWvtj9ri54zt/k0ImA0+GDTIRgrdMXi62ufpnnrqM4myPND4DZRsnuEsZ/7w/8Nj3fes7l9/EAPIjittny/MHFiJtzVdMQ7O70koJlCHM+BEEajs4E9dIZv0dOVF/EfRB2c3oZyvCDymf6gVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389469; c=relaxed/simple;
	bh=cgZY4JYcYNuxKFJSK6ipW5wyPi1mPE0bqbjnMORWqN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpGc7owqagauH5VMLWyaQCSKW0pdyCR87d2q4EdoiyqpFmdnELeE0ZAasmtjClgOVAViMujGP58tmYVWnWq7niOWGQKPI+l/Vzo1v0q9R8RSy0sXukW9AatzFUeVWMGbSbVnaApojWmTLOz1c2Kw3VymL1rkMEs9u/W11BF4fAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW7h1FCu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW7h1FCu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82cebbdab08so2308467b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389468; x=1775994268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=FW7h1FCuf+CpeZwtqJACNKsJ/ZhrGuWT22ENnxuDnfCLbi8NUuamKn8V3Rhs17f1N+
         Bs9pJ51umiXHC81hFINK8AOxNDG6NpWVWXub5AgPb1MApsR0TUjywrVLzTuoPwRTqu3U
         nlEw6M21uePWTIPUW9dPRufVG8PyUCN5eQfUz80dDqUoBMA7ElMGVU5FsIIYgcRDPoHH
         mdsYX5CXUB8PpLTxepvgWfwgMDqrcxsDh09aQn48CdmsWUiIuGwzHElSSXd4+XpxrDY6
         wuRuqDLZBUODRZejUVX5clp6AJEvuI29eajp4fp0ryyuSSm8IEJervjWoRwz5qNXgSOu
         2QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389468; x=1775994268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=M9gubpAaCwqiJxU8wvG9B9zg6nw5chS86i97x4ZhfbE/Of1YsmItG9VTDuVJri5A5r
         C7nTQKFp13hZdVlkJPvAcf8Z+FSxigxl6twlCtUTfOHGqhqe5BX/0R3R7CUy28ASOIC6
         /V20ZaYMsUUDr0Xe0A87s8HMHE9KtSBmnWkDt5SaPhuYKzpu11etx+pWaJdwlBUBQ1yB
         iMd6PQ6P1nnlGujMZ9kx0BlUrSxIAvAKWziYV/eJ1m3DN9/jcQKm5MgOxe6oNZXCCswd
         drBQ5gM0SWF34rWymxlOtefvFqXbq3NCf3eXJQpSlebEOLaCRMlZXS3J2EZOlut9PUZQ
         mo0A==
X-Gm-Message-State: AOJu0Yzb4TOlWdqEKKAUF0wUnMMgvvutXMb38Y2DvLH0YjH5xJgjg9q7
	VfdU/mr+JG23w5fPWUa4s5KZSFhQzwh3+UkuyBJ0b/f24gA6fK5LD0zO
X-Gm-Gg: AeBDieu/j2AufCdg+YccxibAdsBjYwVnI79dQHbGjsO2T+PKF+8X9Gge2WTS4DVbCGU
	V7qgP2UuU7nsr08LeUBlXP2BNp3nauEoE9hCMTUBMcW1zmeHckLZ8+6vYv3P70AFvcc8pkzbgvs
	VlChgly7Hoqiauvl5qPWKRf/JWOVxgGz7Rj7XgzaNEyN5ZTaKt9La6GTw1wUY1pya//YbYloASi
	5YC7fQsQlzHIr7m6ZgVGKaekz211gWKPckPPlnD2FruzhvXs32uD+OezpOyPKY6MB8TejOfHMW8
	HwYLNplRvWtMNZxkrD/PV25p3rxojN+nLttLuqDVpnJl4m4tPJ/9oJ99TVs/bTCXJZ2s68fWuEi
	PBcDF9EM2P0ATVGwOFX8L3vbsCjCiWxSi6+ojU1YISKHvwJxh1hIJlQXAuP9nLN/CCMUVn1YfSL
	3vOy2Z9bUV6yQ9USuMRFy+0KkbpALpgJ2lOk3v4iU=
X-Received: by 2002:a05:6a00:3027:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82d0dba9c6fmr9220951b3a.43.1775389467970;
        Sun, 05 Apr 2026 04:44:27 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:27 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 3/5] staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
Date: Sun,  5 Apr 2026 17:11:30 +0530
Message-Id: <20260405114132.310774-4-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the simple if-else statement which checked value of
GetFrameType(pframe), if equal to WIFI_CTRL_TYPE, function
IsFrameTypeCtrl() returned true else false, with a single return
statement returning true only if GetFrameType(pframe) == WIFI_CTRL_TYPE
otherwise returns false.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..2876f15f13d1 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -275,10 +275,7 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 
 static inline int IsFrameTypeCtrl(unsigned char *pframe)
 {
-	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
-		return true;
-	else
-		return false;
+	return GetFrameType(pframe) == WIFI_CTRL_TYPE;
 }
 /*-----------------------------------------------------------------------------
 			Below is for the security related definition
-- 
2.34.1

