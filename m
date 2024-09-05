Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ACA47796
	for <linux-staging@lists.linux.dev>; Thu,  5 Sep 2024 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543962; cv=none; b=pL+LUMuFb/Y4ScwBah+XcYHszwUfJwDopj4r/FDQq5q+hb99MVwOio4CrvialZQh8qf6QpB7RhE3g0J7UyyjF8gcdk3vyjShbhCeXqqP7m9s9/Dx5d5OZ9oQxopsKRgK/MWSap5qiLWL+ZkHQqGJ87B7xdGexpEEwFAUnrjobck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543962; c=relaxed/simple;
	bh=m5IMTqd7YUvgmJ7vSwi2nF/paIY7e6NZR8sqtfCd/m4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JxuamsSHxtCJSHD5y4s4o1OwF+PFpRJPuy41k8N28KDV11fipCuIX1b8uA/pE1vnI4xq2s6D3eQHBn2yv0/OrHNxysT3Y4L57P+HTJd5v6oI8tatm0FE9u7yklV40eCShNAnnpCHVTmODkCZyjGOPtjZBiRoDm9HsKHME9mEiKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqLJAkqK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqLJAkqK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71790698b22so75373b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Sep 2024 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725543961; x=1726148761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLrIGtrjGMvYCAPgpSbeYnDN/jGY3WpFtOUDcb9b6FM=;
        b=kqLJAkqK1ibUCtFIPPPLoibtLMrCNevU6T6+AwU53wS9gKZpdZFLuQ63C1Q5L7uId4
         os3+cAvY19LRgTM7o4AfrRvBlmtxOhdQpLFOkr91rFmdQncfiGdwRDJzDiJaLD83Qcne
         HUy+kNurPQQl3rVQYvo/03maX2a6dKhFseeL2Hl7MVL9KZIbGw4KoHjmb/ud/CjOAyW4
         WC+ihFkHF64QP9r/PUlOOaHvC7HkvSrcbGzH4Dul4UfdkmHnjHYzZqo91rjPHlVAW5s/
         5JrxTkSpcvH/HMqyyT8JtyPEZOE0NCOxrtJKlVoER58VyNacOUinZyfYFX51qy53nKXx
         6S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725543961; x=1726148761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLrIGtrjGMvYCAPgpSbeYnDN/jGY3WpFtOUDcb9b6FM=;
        b=NC6dCK16Z8UpnwnwtbdNp6/rHvoomhtYnDrNChY1ddYsp14gk4oJ6CGmOQQoQ0p/7R
         L3LjCDuvJZ3m4wyTB3tyOWZRgZczoi9YYaGTZnBfRmbTiCHE2Y6RxM/x8UfQ3AmlciYi
         M2YiZDiHDImJBKbiaVa2KNHgkebpPDGcK63WZaoDHmJss7P5AsG2JHo6VHA0w9XAJcVp
         jqF58NlJ6xsJ688YIyd+lU6boTiAL5uAyGi2CGwPijiEJjSol3YZ3uVctrNLFHUKmP3u
         M9BP5Tgdr6CNecY0gOsbjtkygu22ZvTOVlVfyLclgfRaDJrfz/NLTkMPrkazkf+JXhYw
         AIkg==
X-Forwarded-Encrypted: i=1; AJvYcCVLBDmlU7CzoyvU9VRXjj7GlSgh8nkFrum9SAX7miBuU1NsqbbfOsJv7X2JpCJgQ4pt7I23LJHcWU0v3prD@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd8ILLYz5Xpa9swHVGF3f1zbaB+1PtJgqjQ6+vxEkGzlbnL7u9
	fm2UDJF+ISE6KkMwOyaXOaFpU9zHBNopdwudV1AF3ovAWcBiRUKE
X-Google-Smtp-Source: AGHT+IHTG6m5a+YqgJ378/nJai2f+IufcP4BKwMpjbBW2YiqD+QLiySRaTR200H30C/v3pS/TmUCYw==
X-Received: by 2002:a05:6a00:2d92:b0:714:2051:89ea with SMTP id d2e1a72fcca58-717305c80b4mr12306175b3a.1.1725543960712;
        Thu, 05 Sep 2024 06:46:00 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177858bfd5sm3224500b3a.133.2024.09.05.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:46:00 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in rtw_event.h
Date: Thu,  5 Sep 2024 19:30:36 +0545
Message-Id: <20240905134536.4364-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_event.h b/drivers/staging/rtl8723bs/include/rtw_event.h
index d48bae5416fe..62e0dec249ad 100644
--- a/drivers/staging/rtl8723bs/include/rtw_event.h
+++ b/drivers/staging/rtl8723bs/include/rtw_event.h
@@ -28,7 +28,7 @@ struct surveydone_event {
 };
 
 /*
-Used to report the link result of joinning the given bss
+Used to report the link result of joining the given bss
 
 
 join_res:
-- 
2.34.1

