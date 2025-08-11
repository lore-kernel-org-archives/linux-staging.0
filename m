Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5564D284687
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896167; cv=none; b=uJroWM0xBv9Dq7LllUdLptFBKUT7qAHrYQkx2UlK0kbw/1eiQ1oO68iVEmFvjWRNX7snEHdP7MCZtsbS83HDyAaWPxy+iP+0OOylWPatlk20dl6jsjfJ6bWa1EOmsVWA6VUig26V49cXViXzhdhlUoPrRy3wm5frXowuIlIo9jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896167; c=relaxed/simple;
	bh=Inyo4hDhT9hE8Rthg0fYsgzCsTpltCp36wqWajPmam4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjP/Ssc7dMy4YpNvkbD8EsNFPrRo7aJEjHL75i4KWwloJxEGPo7UmEP6Cy7+lHuPqByL+XJA6/CNP4hUI4U6L2HiKytl7QcEqEz/ho0TblnB5dpeNVwEeRDBSyniCAa/N0KDjYMjVtWfVlbtnNz228iWFqFuGiw7WNR3bS0SoEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GukUBcOO; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GukUBcOO"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af96d097df5so734924066b.3
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 00:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754896163; x=1755500963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of8cT+ldczfqUeW3j/N0wm0OcN3GeNJisyos8EJwQ1Y=;
        b=GukUBcOO+bazLirjPg6RupOYjkyAXLoNFdl2Ss0KaeUTp1zkqIXE9YF0GUlVYD6r+2
         Ux0Qj2yKyZe351vyKUZmy1gw3lO18SERqyaHARr4+yVmoeRgRK1EbHiDHNRnZW988c1K
         /IV5KwD2f7zgKFEdKVFu0sCEYpCybbA2gUxeJQIzy8WHhgwdSOVrDd51m96gb9qPOPWB
         SRsFwWLnaQ79fRGJp37ro2yHzGHO7YkYs/Zk5YDJOf/HmEPpUOSWzBN5XNOwzfBYAy6X
         l0lR+uZ7nDKRyZdTGtLurXmG8D7qYJMBKj6xvTud8K/BTweniVPVtG46CRu+ESuiE2gM
         lbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754896163; x=1755500963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=of8cT+ldczfqUeW3j/N0wm0OcN3GeNJisyos8EJwQ1Y=;
        b=DJJkJRxQfpafbfIjZ/lw2klswPEHJeZ0Cq3Qv8uTRYbCdGAuor8wOKWCBUlei6fvpg
         Js+FHpv56xS6RTRqp7fQfs2hjoqpwM4twL9WzvdoO++45SEL6KkgKj++1opM5bIHprj1
         XsiSiInBCzx3o4YxuJc+fKNyM/iAuaVXR6i1rqcQSTuzxzyUwaaLcnosWWIAGXOVGC7z
         KH+WLKdhJ+EyQv/4z6IkEP70TsZ2f7CSNu0Ei3ndqZS0q8mljbTHR8Jjk7ENbdHmo8OU
         yQ4Dv8Jva5Ty6hOvBsPoSuAiJnMctk17F2YRTvkTb8iyTrTprbaVIYPPex9RHsSm9sVH
         gHlw==
X-Forwarded-Encrypted: i=1; AJvYcCUstmgE6udUWDsz9QvE21KVCPijUaiHvJx41nwXIazqsiCv5ae5a6FWY+WHMy+euOR6wvhAiRbG468g+Coz@lists.linux.dev
X-Gm-Message-State: AOJu0YwQmNbdPfykpncBG0E/9EuoJl3imYRYwCcSLaRzvBRp7rSuZR3d
	DvBCQZ8rqlMIVJbk0YP9VJ+beismdtllmEELJnMqURc5A0PT/jAePDIs
X-Gm-Gg: ASbGncu8ybQAIV9K9ASH7h5sDpe7Q+TTBfHpOUUD84GLXnlHn/ZVIZvCm+WlLEnJeiz
	dVnO2tnpSHBdjx/ECb4DLTxWEannneTlNaJbMnWmLsv2qAzqdeb2jTmCXDRIxldysZwyjc5uABu
	FgWo6SG4Mzdk4O/DI045MxA60HIBWQljrQacxh/4h3EkxnnepJiFVMKPjS3ZeTh/l+mJi7iPsPp
	S/GqT8zHar3jNuKyMV4F/8JtcLDRxZRyZCaq2KpWGQqkENja93gl4Njg/IzxSfEWLUufnhmLF7Y
	ZBGvYB9Zv9D3+FMo/2Q7c6Swhjw3tOoGY9rjAcx5OOd3rn6gDI88/FpqbPhwvYxrhKxb8Pb6cO6
	bGooGRHKVAOkzjF/cuF74Qodq+AAeMX/xddmelUzK2rIai4q7jxqbNvD0P7kIZ6pfvo42
X-Google-Smtp-Source: AGHT+IEBOmgis6moj9QkFX2WJEGdqyxWvnr8+J808OCf86HZnnCqeKlqK9BNLs8UX92YjCpMkCtzdA==
X-Received: by 2002:a17:907:7f9e:b0:af9:5e9a:b6a with SMTP id a640c23a62f3a-af9c65b04eamr1018317866b.42.1754896163489;
        Mon, 11 Aug 2025 00:09:23 -0700 (PDT)
Received: from tumbleweed (ip5f5ab8dc.dynamic.kabel-deutschland.de. [95.90.184.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a14a0sm1979188766b.33.2025.08.11.00.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:09:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unnecessary forward declarations
Date: Mon, 11 Aug 2025 09:09:06 +0200
Message-ID: <20250811070906.27232-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811070906.27232-1-straube.linux@gmail.com>
References: <20250811070906.27232-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary forward declarations of static functions to improve
readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 30 -------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 08d179857203..8367fd15c6b1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -638,36 +638,6 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 #define MAX_MSG_SIZE	2048
 
-/*****************************/
-/**** Function Prototypes ****/
-/*****************************/
-
-static void construct_mic_iv(u8 *mic_header1,
-			     signed int qc_exists,
-			     signed int a4_exists,
-			     u8 *mpdu,
-			     uint payload_length,
-			     u8 *pn_vector,
-			     uint frtype); /*  add for CONFIG_IEEE80211W, none 11w also can use */
-static void construct_mic_header1(u8 *mic_header1,
-				  signed int header_length,
-				  u8 *mpdu,
-				  uint frtype); /* for CONFIG_IEEE80211W, none 11w also can use */
-static void construct_mic_header2(u8 *mic_header2,
-				  u8 *mpdu,
-				  signed int a4_exists,
-				  signed int qc_exists);
-static void construct_ctr_preload(u8 *ctr_preload,
-				  signed int a4_exists,
-				  signed int qc_exists,
-				  u8 *mpdu,
-				  u8 *pn_vector,
-				  signed int c,
-				  uint frtype); /* for CONFIG_IEEE80211W, none 11w also can use */
-
-static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext);
-
-
 /****************************************/
 /* aes128k128d()                        */
 /* Performs a 128 bit AES encrypt with  */
-- 
2.50.1

