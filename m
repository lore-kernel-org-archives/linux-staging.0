Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED73A9DA4
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262463; cv=none; b=hLjdr3MNOaLm8qPPdgHV+UjTl5YOOxouPUh9IEoDRIenv9I1pMR0ZXSgZixmbEyp6TXK9xy5Q7gLNb464kgawnPtVfKKnd4c4sP6eheBlxxdd+hWeMzt00uxTM6Y9C3qCaA5b9fJVphm2KZl6sTDCXUa+VZeElRdK/W+FMPYAaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262463; c=relaxed/simple;
	bh=vjP/0B5Z6LG/QXx5afeHEO359/u0+nbjzzOHWieW/78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qX1jp4vjKmNCbNeCWkeK+SW0YTnCBVBrO1Jez0sp4tG3jxBV1u792i2wupCWnFMkjVwJBHfgoGPoRwIOifx/cDqBmy/P4uO9AcPJ9vIuhBi4ZeVHK/x0haJqbmQm9HhGxj1pf/r6FXGgJoQz0HJDK8iIi4gmg1w2f6XCwI/M9RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KflVPX/F; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KflVPX/F"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so27508a12.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785262462; x=1785867262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKIAXrRuurp2LiqN00IwEdlkdu0k1KHVGW3lgQWY3QE=;
        b=KflVPX/FjJil8oWJGWza6+5f/MJO1eWW0hlN8qeY2MrGquoBVnq2ZlUumOGqQQ68Tw
         GbdHQX0TpyDxK0K0qlPytJU2FmVhHSJNrv5M52j8361nydBNcjUN5KRITZmJZrE+fYk7
         olpBkqaJ4n/83rx8LCrvpoCdZEhCPVHeM6GlJSFq2Nrof9esmWwvUeWbEyIuEQAXtYZV
         ir5hNvdKVpb8mbWRZH9noD/bIGXBXgN6ZYew6jnDiOpWhksnGAsbC6y+/pTOBLrMkybG
         t0HF+FbAu8XiVPiYBe8/b5agMNxdUdjBLpsGtYHWi1+gGte+/YaBwJDgFzAp8OUF/cLV
         IDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785262462; x=1785867262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKIAXrRuurp2LiqN00IwEdlkdu0k1KHVGW3lgQWY3QE=;
        b=BY9HyITB0CM28iLhwFzKLFaDPtOHeovAPQ1gF5lF5/pux+Qb23+xN0J4JdL+EwqpkR
         uGxb7DhKctpNxkP0RFjrvxJdlhshIc8EgaCHhqsGBLr4zWPVGs9H2jK5G9+2D9pzDq8f
         wp4vxMvAxPtUj6jHMdkJCLj8Zkr+kb888bbJA1tbidKA8dK1PMV9MxUdni59l99J/dWr
         470G0h8TKJLRZpvQ/ZitJKW0R8oleZ3PIu3Mpq0EIFNHNiBQrPyj+7lNPtrkKX4yWR7c
         WUNvSLmQT6eqNWcQu6HYkCYreW6NIUZJMT2EKXpzDKO+hTJY5IM5HH8ga6DPypo5DHSI
         HvhQ==
X-Gm-Message-State: AOJu0YwDu7M9ESFlA9nmp2l/OmaB7HdvJXK2yitCxd2yw3nDaIHHgrW3
	bG4mO/q8BJQXWaH8mEWgqPTmK36twJQiJTMNCvwk70PH9DOS2VDcIpfu
X-Gm-Gg: AR+sD119XPRWmCh5rmMUmhmRsCGIXxAew9yJxj7q8KUd5CbnOLnbfr3YGWGEicWZJQH
	C9FRKunATRH/e9rqcXtuIqHduBApP4AijqrJ5OR/vhY4fVlq2KNSRtuKf9qSG9LVko4iH7iQqBs
	UvRho6JYnR4b/1PLv7ElrEoXZ4qskBRjLpgOFrm2a3ubEkhF4UB0imPALlB/3pmWcxe5YWUHWk1
	/jPCyCP0jTH7IyT+iX/mi6hWyvwE8RiI5+/022TqHU112qEWkE6b8YyG/dFyTfGyPoWbGgqkyU5
	Nl5hXLegU/ZuQe8J82mCgR5IXIfLk2CU7lZxs42IUjXOhtbKXYizZhl5TQ9KiYVv8CFX2gxVGsh
	mNU+lgr2WB/VWa5n8l32KJ5aVEpcdm0smAsVxfdzVuKFkPUTpQaA1Io2H7RqeT3qegi4FACl1Ys
	Hbz7YGQkxLcABLUcRiQ/QhvA==
X-Received: by 2002:a05:6a20:43a9:b0:3c3:94a8:7c18 with SMTP id adf61e73a8af0-3c8ba5acf53mr3602162637.37.1785262461443;
        Tue, 28 Jul 2026 11:14:21 -0700 (PDT)
Received: from Vicious.localdomain ([117.96.147.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b15f77sm1145282eec.4.2026.07.28.11.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 11:14:21 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses from return
Date: Tue, 28 Jul 2026 18:13:50 +0000
Message-ID: <20260728181351.13243-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3..40793aa58d6 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -843,7 +843,7 @@ static int _netdev_open(struct net_device *pnetdev)
 	netif_carrier_off(pnetdev);
 	rtw_netif_stop_queue(pnetdev);
 
-	return (-1);
+	return -1;
 }
 
 int netdev_open(struct net_device *pnetdev)
-- 
2.43.0

