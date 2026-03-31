Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F274218A8
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971196; cv=none; b=m9IYlbXACw2x1jfm7DUuZPRIh2d2+aAcvBAZXRAlJgl4nY/D2iacH/y9neIX81rspWpbtN5VHrNMGmAXm36GkCNuywhkBCP4Mc+LY05yjehDUKi2pGxBH8cE4lpjVAVcoToRvdYgShK+KqzsRKpO6W9HR4SJewCZVwMTs32Gcnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971196; c=relaxed/simple;
	bh=qp2cnGIOvfGUlyVb7lBhxDQjhsF0kpQ/NLBt7h4yYU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUiMmt1SfJ8InoVd+mIBMRrfc6YuXlrcCa1VWBKMLTcqhSTNZjtNtM2sVFll/0dC1KjudPlD62RPTzrNPEnqc92a11DPwB+JS004idDwCoRP1AyvHnW2E6kvIMlvKvR8GXwxittEAGUwK7Ex4I/HPzxSyVvypqeZrG9K7NdEIyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBYGtyMj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBYGtyMj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so53767775e9.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971188; x=1775575988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wp8quepZFqze/sjFZFLCxsK6j2aXBhvO/wnQp/VrWjE=;
        b=LBYGtyMjPX2BI8EHIYzMpC9mC6CKa8SemRdTzqg7ov4WW/HFr4vo6h0LsBqWSOqKjL
         mWNNbCujO/7WcZDkBbQnva9Lsf/neMKKOCt8t5SnZxJs1L6J46Ipm4pjQm9GsbWRpPyX
         gtzNpWY+o4XoseRr3QnDliz1o6TTZ5KC6ZwIVJIc7F8A5oUtci68YnQFS9QjyU1vfrIm
         AkDImszYg4uGw0jR8/gd7+rO1bAThA7WC29eQmx8qxxawIOqPGar8GU7zPGUDJGruQZs
         YfZrtfxO37HIsHgxkjeV8ciLg9lDBEUgzXDhVZuH6GyjY9JAushW2x4WehUMZj1GnliS
         DCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971188; x=1775575988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wp8quepZFqze/sjFZFLCxsK6j2aXBhvO/wnQp/VrWjE=;
        b=K7Y1oWyB+2bFho2yXTHeSeRGZLKbmmZsKLZMbf24oK5fjs0b7DljPj8IUGhYXwMCXV
         o0gGWIeA7wKrzHtDkgELPVLj02LZjf0pV1/A4XW7BHKwKD2DWEkUgb7012vB4e4w6dnT
         Ecl8ckrns66ETftGCSg688pAF0YvIZSOSq5SHTVoGgLz1qC0SbWvg0LYiXA4YZpgqIaK
         FBJ6AuNqV2wMdoAL33jaW/+PvkRiASZTF/zN1wmUzqawd0icOGe8Ruo6smoPP0QLsicy
         G2bGWMaZu/W3TR12YO4urSsNWjYuCNpcAm0zCnp4CggcR9QbsUX1nKuAalY16V4/eE5G
         mY2g==
X-Gm-Message-State: AOJu0Yy9QsTBUI6IOW26Bec32bQwfX6PgvuA1Owfj/G3u8R3Fr17A4uO
	ifhTYyFIXk/dG6zNraDCeTEx/crW3SZE/1TwZ708LeJK1h3CGG7aMZGF
X-Gm-Gg: ATEYQzzEOGkWB/RJ0YFEcmOFRYel4TzSaOcBqseexqJiSuGzPDgn25lnXyWUqX9AV1g
	JLxFyjSFn8sqUtKdWLSiNjQ6EIAFleu037qrvQ/ohWh4V+H1BTH18K9yGymWDkAlXhkQ3Oud+g9
	TPDKHikBRRF0SzU6DYk2DsdHczOEgG7yVnrStF72bdXXHROhRwBeoXlB47+jMh7wQyg0RcvSldI
	H1c+6r0FHiFcnCGFKxb+/Pt/zGX+lnVkFyfDrotER+sF6DI8xIrfrNf7oy9I4BzqjVnyFd6QuJF
	H9gc3NvnwvGdzdIKINb3loH0frVsNZ0u8or0NXfThp2RHqNlZcwIU4q4bRSWI0wbuvicUqnYmQ0
	3OkO2wGCVGTjDQ9cxv+GGe+VwR7gtbUwjag4mU0kS5OKYAgSavXK0YangPZ+Jh6yO3o+CwdBNxd
	c9din/U6Zpg/FZgwsyCFx/TJj41LQPOpQJ
X-Received: by 2002:a05:600c:4e0e:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48727ef5508mr286870345e9.2.1774971187771;
        Tue, 31 Mar 2026 08:33:07 -0700 (PDT)
Received: from potato ([31.176.162.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aceb230sm21653485e9.4.2026.03.31.08.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:33:07 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: replace function with error handling alternative
Date: Tue, 31 Mar 2026 17:32:53 +0200
Message-ID: <20260331153255.22764-5-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the use of rtw_set_hal_ops with rtw_hal_data_init in
rtw_sdio_if1_init , which actually returns error or success and not
void.
rtw_set_hal_ops literally only calls rtw_hal_data_init and just ignores the
possibility of errors.

This is the only place this function is used, so remove it's unnecessary
definitions in include/sdio_hal.h as a prototype and os_dep/sdio_intf.c
as a function.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/include/sdio_hal.h |  1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 11 +++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/sdio_hal.h b/drivers/staging/rtl8723bs/include/sdio_hal.h
index 6538253765f1..4ad145d5d33f 100644
--- a/drivers/staging/rtl8723bs/include/sdio_hal.h
+++ b/drivers/staging/rtl8723bs/include/sdio_hal.h
@@ -9,6 +9,5 @@
 
 u8 sd_int_isr(struct adapter *padapter);
 void sd_int_dpc(struct adapter *padapter);
-void rtw_set_hal_ops(struct adapter *padapter);
 
 #endif /* __SDIO_HAL_H__ */
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 34ef40a86153..aea9b4e19874 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -197,12 +197,6 @@ static void sdio_dvobj_deinit(struct sdio_func *func)
 	}
 }
 
-void rtw_set_hal_ops(struct adapter *padapter)
-{
-	/* alloc memory for HAL DATA */
-	rtw_hal_data_init(padapter);
-}
-
 static void sd_intf_start(struct adapter *padapter)
 {
 	if (!padapter)
@@ -250,8 +244,9 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/* 3 3. init driver special setting, interface, OS and hardware relative */
 
 	/* 4 3.1 set hardware operation functions */
-	rtw_set_hal_ops(padapter);
-
+	/* allocates padapter->HalData */
+	if (rtw_hal_data_init(padapter))
+		goto free_adapter;
 
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
-- 
2.51.0

