Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70E19B5AC
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 21:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724708941; cv=none; b=TqVQnAhxgillI+IrnigmRXWdQoUrvvUpyxc7gOyjM1yO+qoFQX1qyZb73Su+Xs9X8I0AfYd8iJiAKPNyz2PD7klziDvO3iCcMiPNTNW9Kao1APRVYcTyPB+4FCEyrk1sQJkfkL541MuhHEF3kvHekabARNZBjkMKTfknsLd8dOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724708941; c=relaxed/simple;
	bh=xdz6JSkn2AEuVmNz6w5uVIoARWYD3VBI4VhoF7crCAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IMEgsRa8X0TM9J5pQzuCfwOHN0+c8GZ1IR3p9ZG9e87pu78WPGm7NvEPmf4mt+DR656uNw/83XxDhrUDdA9t4+0FIF5ZyxsjPh2RCSAI9bouSCzio1cSNU3dZGU4U7W+Vl5765zt9YDhzdzprjGcz24K7wiJnZtnUdm62/AwJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZvMeolN; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZvMeolN"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so3369888a12.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724708938; x=1725313738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy8J2IE41q6zia8cYCGqVYSEyhsGRBLlE3f/+odahgE=;
        b=EZvMeolNy4OXi9lrhv+apPD1cq/Y53hA1mCqT/9zikD5ifSs0iLZTERWfkx678JVEq
         AWb1eSaLsCVygqQnvCRW9JHR0CO+X6RG+jjZ/PW+CMa2xkEiEfG5v//6iMRDMv61IKUj
         LPESfjJ+H45nyqGEHI+GTkDhRU8Z7qCkOYFuUp1AHd4NTuXALBmJlMEwQyC5Q0wtQSNA
         UlHnk9n5M26ahXrOxdcCrmlybK2Zlj/qwHXP9BKbhs+bq4TERn/yed28Tiq62gy700xQ
         Ewjrz/Y+lX53Es39sxk1BVF9hD0LDc60AvLTChegMiMNIOp0YqRmHvbuqLbuyXeCJJLf
         YdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724708938; x=1725313738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy8J2IE41q6zia8cYCGqVYSEyhsGRBLlE3f/+odahgE=;
        b=RkUUX1IJv9xTlukylg8Q+qoJi3FBAgj0rRAEK81z+qXMKdjSboMYEMFw7+CEdp1gKZ
         iNW1jI+B+/Rr9YMLUIudzDUTpAwxywgwVAjfiJ4ULpMmontYlE8k2cyjfJx1/dAn8Cvi
         GP1f2LzRaeLaYvyMWP+CKdjVnfOVx1LjVNjeU5+u/lZALk/nmJI3Z9BQjBTbBGZfsgfK
         aC8ugNEruFR+j9c3PvJGtDAA+FFSWnKw5cpr95tnTVZbVd2WwdOtNmQ6ZmTWsAaFL005
         wDuDpzmEaZ8N5d3bx3rhJm82ujYKzidMB0xs8Jf6KwBel67aIVMPcxuwLXcZvTG+w974
         xsZw==
X-Gm-Message-State: AOJu0YwUrkcnJ5jsoTGV65peXgBB8qtaj35dDC01bv0RlxFBXWe5iCPC
	5nwqhr7Nxg3PHJPjRcuAKRgoNC6E2/WJXdIMcEYflRZGjCU5N8/N6dTtRSbk
X-Google-Smtp-Source: AGHT+IH3ihqt8I3Yrxd1Jr09igMRh1xBOyJkSngSBh8WiYzs1NcJ+XJK1sqyLAEPGBIVSxiIB7qvYA==
X-Received: by 2002:a17:90b:1052:b0:2c9:5ecd:e3c5 with SMTP id 98e67ed59e1d1-2d646d38277mr12648440a91.33.1724708938371;
        Mon, 26 Aug 2024 14:48:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:4b0:1408:4900:9408:c7b2:31:3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb1726sm12621151a91.37.2024.08.26.14.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 14:48:57 -0700 (PDT)
From: Gabriel Tassinari <gabrieldtassinari@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3] staging: rtl8192e: Fix parenthesis alignment in rtl_core.c:325
Date: Mon, 26 Aug 2024 18:48:53 -0300
Message-ID: <20240826214853.21003-1-gabrieldtassinari@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
silence checkpatch warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
---
v3: Adjust the indentation by adding one space
v2: Include the modified file in commit message
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ad21263e725f..75192041008d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
 
 	if (network->flags & NETWORK_HAS_QOS_MASK) {
 		if (active_network &&
-				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
+		    (network->flags & NETWORK_HAS_QOS_PARAMETERS))
 			network->qos_data.active = network->qos_data.supported;
 
 		if ((network->qos_data.active == 1) && (active_network == 1) &&
-- 
2.46.0

