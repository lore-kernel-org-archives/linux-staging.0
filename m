Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5615539A;
	Wed,  2 Apr 2025 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614224; cv=none; b=MQU4poCiKhqEvteoi/4nDG1TjRJUT8PN1t1wR4s72zqlf8ZXAUvkl7Xmjpr4310+RY5nnyWYQPLgs3lhk5y2nyT6DUWQFleemy0j0cUe7n7ECr7yhlUxMJtbDIud4FrMlVPe8ZzRWp713XUS0s2lgQd4POXTCdVdZAa7oayUaGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614224; c=relaxed/simple;
	bh=k9YK+X3azKj4clAIgj5V53g4uah9aIU8AMWiWLGGwZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iCAjtUN/PNuoBd0nz0AKfzQhKb0TuRwADyQyDwGLvX8A+rbdHzLa5FRIY0RsWNfQOL48CLxJSG1h8YEqVqbofXr78z61KbAHJqqqdrfQPcoJ4e1/qrsZltjgrU4O2ZXjcLdR9dALruz6LkycS07BmpBGuZeS3e+MxMP/Avotw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO0VJSeT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO0VJSeT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso32848475e9.3;
        Wed, 02 Apr 2025 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614221; x=1744219021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbACQ7BLnEl+BnTR/u/TanvhtFFXbzt5go95fESQfSQ=;
        b=ZO0VJSeTvFUeyJHpphEpRHKY0OVXI6cC19Uy4fSGjh30tYnDYFiAhLf7aGoFSGbY+a
         auch9zd6yeCoAJKk1eaimsCDdu/6giiZQKRuKsPsb/DyeV7kxtRcwI7pOxuHyYFH2IP7
         xS+7NQM4RC+XpdeMOc8+hprQGSVcUVAcLYCpRsd/PorAi0HCIwUTzyNQEY6nCQxlM3si
         r1If4KosjBOpdZyWcZItKWXMsINFSReLAKwDqcXgO3jaai+5dNnQQEj3AQet5YvlWSF9
         sQvmFlPWHRYXUZBV4uZxj5Y28UNCkQksGgJEvf5B/UGAGk0fWHyedx9eTDBGvT+9z1nP
         MwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614221; x=1744219021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbACQ7BLnEl+BnTR/u/TanvhtFFXbzt5go95fESQfSQ=;
        b=bvG8qPtRtNjBKsB68DUAi5orR/y+/AIAwsnZWF7Q3rIQW2tuc5wn2h7qXtCSJ2UBtE
         UGwLMTxcyhWQK8ONYUo519RMM3Qq4XYXwYCJnM0WfBMMjsn7Zkl13Hj0D4MxY1k08WPn
         Z0QXS++gYIUtXc961godWhghzM6oIzIInjGUTA6AjiZ6qOmoo5RvMtUZjJ6E6y5IU9l9
         9WLZrGQnFsd3jVssr8+25b2ChCnTqUX7+734ad2fgL7JLrN/xujgmjL4R9NNS1g+/E12
         OUfS7qVVluLI12VLbp6rZOQIdYXFGY0BuxclwvcYvp5F9ELVAWhBa6kPFnCRa83rzXFB
         bakQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIFblWj/ARlPWUWQjIswEW/8FHlX1t1fuvSIby3TxRBlppUuUBm7TJjD50AVAdq3rQR3ZizNWCzGkV@lists.linux.dev, AJvYcCWZqFZNV+PSagnhZ76tSONqLeyGuHyAK8DhOJIhFBn6EMwUEK3nFEmhTBfavWTjvHQ7jpwqfSnvxdUu49+J@lists.linux.dev
X-Gm-Message-State: AOJu0YxTMbD0lxIeW8llRfB07bxQE6h7p/1w7JzfzCBjIRATwrDce0yd
	b01D1rgXwDKpCDjF2CBa9g1PD7IcCZOWJ/4ImWuE90evTnncHIqq
X-Gm-Gg: ASbGncsgubapTMzRlbnSrsiVD+kCH8ZTWRthi8pcjoBLODpw020qEwXinmxxo0/H9Po
	AXSftwNVhXR1OLeiqOBUsjEFN2AL4Ykbf5WZ/fpLUSxuIQeJV9cXBHp6vM/m/BjN/iQX8j0TCK5
	JMKURi3DqBSGQDFq3Gi68HXalZwWM5Ppmo5ZgWUcc4meqxM8ZjwQtNR1Stimkc4Y+22NrB9biDp
	dkhBxYuCEw6wRlC0AJksRj/l4T5555p6Ffa1mk0xtRqFKSr0IXpvAmJhrntqPM0GcKEKlDCiERS
	NNKpEOqdhfD3ZNdBbyO5G0iqcHo6Rioyla/oIuP13g==
X-Google-Smtp-Source: AGHT+IH0XXgRcay1/TXbCvKo3B5wwZ0vOIzKabPOAte83IKh7GsIf5L2WP9dh4uRCk+VihOT8kUz0g==
X-Received: by 2002:a05:600c:1e85:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43db6205bf4mr210102735e9.17.1743614220614;
        Wed, 02 Apr 2025 10:17:00 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:17:00 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib attribute bdecrypted
Date: Wed,  2 Apr 2025 20:16:42 +0300
Message-ID: <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743613025.git.karanja99erick@gmail.com>
References: <cover.1743613025.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by ensuring consistency,
replace instances of 1/0 with true/false where boolean logic is implied,
as some definitions already use true/false.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a389ba5ecc6f..fd04dbacb50f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
-			pattrib->bdecrypted = 0;
+			pattrib->bdecrypted = false;
 			pattrib->encrypt = _AES_;
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 			/* set iv and icv length */
-- 
2.43.0

