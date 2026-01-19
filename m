Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F3B28136C
	for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850679; cv=pass; b=gelgjW3kCdTj4h68jHWUTV3E1h42kJDrBb/1ePC/dEon8GaYv20GiETp4ZnGsJezxRf9tkQ6drCFOWKhBvsVmTc3EO0XDdidy3cV1t4FWztEsJ2nUDzreqNNxu/ZHbxs4DLbLbWX3iQ/o+TRZe5wCoMcbjznXvzRkz31mcdcI0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850679; c=relaxed/simple;
	bh=gn5u869BuadDsI/W0mI+VeOvQyxPxfX+S2W4AeiusuM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eQUUI5UUnHUQbpQBMHoMjT3pZAdxhCNRYNGgEVWqBZCI04pgJ955uHCWn6U6AnOkfGlRXUGEZuacCGX+A6oKjKsSV1gD7yJ3+nAyZ/hqxDkVnsOCEEdwt5mzwuDsjI99H0/0YlX65dWrrQoNj0SgD3ru1imWsCxOYSn+XWwv8q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QS/JBSzG; arc=pass smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QS/JBSzG"
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-56352466d86so1412364e0c.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 11:24:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768850677; cv=none;
        d=google.com; s=arc-20240605;
        b=XhnYjCdwm0BlKX7zdhxEIR/EuYIMQcCN0sV2wsqbSHP/1TKPZ6mtKhIrQamj4yVrJj
         OP3xOn+2gkFGwYl9b73LA6S/i3z7Us8OAnoAlOiKkvbhmgy79bBD/yWpVt3aYe5gCOHG
         vzhX7g5zOR8wxqwawruwcd8AsZ5VtP5LWzWr/DhXSGzDPnazk8y2nz9aA3y1zdwwoqKq
         rl811zlfbztD3YtKy9iHj4vVY1VGJ+GfuhDOVmpm/RPH6EIIBLXvX/6i2Dat/tg/v4Ys
         35v93nw9NVwvABGQbaipXneRtlfTzWmV+Kai6s9ruuSTxxEWaMlLotMDnrm+E5PLmfvX
         FkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8bf8R/Vb/26hoLa/rsfcC+ZLDeiq/bUNJ6iafaDlij8=;
        fh=Z1qxXXJKxESq2lDd8MmiQ2/RIRMYK9TH2KzfsCRomkU=;
        b=UKvXMhZ6v91LOXI+rZP8IaqI4bR8qMsp00z/wld7nMRVqaPojhPOo2yukbHiilN9FO
         +ors3QEIJS2R7ZigG5Hbw0/TFTenz/Z4ZQyG/rcec7NHCKrF8/HblGJnjKCwspBkIal4
         jpIquwUHVnY/HaZpjbHMtGWzcCxh468dSAySyxwCPJ0BoIiAM+IqyvxvKH9ivMtcih6C
         mR2ixDppHMb3rBHoGHVInSuDaKZ+x9Gg9pMANjtWCxPHCNROQUwYXbWGuJeGRajeBqzh
         bwSmIj7HfBOzpTdGVJ0nw4p3en6xATxzVMVcVb1YK1ESPmftkSpMZc1/mlReknoUxVcG
         tDgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768850677; x=1769455477; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8bf8R/Vb/26hoLa/rsfcC+ZLDeiq/bUNJ6iafaDlij8=;
        b=QS/JBSzGWi+nx6tzz6lvE0g2pOlwY607KO1fRLhkyL/RFsGIMopdg+XQVQ0QaoLlb5
         Q4q5Ggij90KXN0lwSeCweD9QKgL/QJbtYAUrfpDvs4iircmmJ6yYIT/EXo2L2souOE3p
         NBrnosMOgVvIpvwucUXBFZw0QuDCMP6zR7GpcMmppKD+eNUQnFmo19BsV+M36JnD2hVV
         51KFSWUqbrBceQJGvltFExFGDLH8euPQNSzkBCzftN5zKKHtGkaO3hyObtdP7hFFkMOj
         FQfaGbKnCYoUdFLH+R89wu/y5HcL8xgvLbZChWYRQna9PCZ5oGZxiAXVbWgTPxC2Je+h
         4R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850677; x=1769455477;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bf8R/Vb/26hoLa/rsfcC+ZLDeiq/bUNJ6iafaDlij8=;
        b=UU8m9yrYdmoR4txk2sbuvL8MjfB+jd8Jwl7/KTc6gVq1ptDwMOcbB8MfvulSLhQpil
         cPU44jfYLm9WY/OCpJAA3RAZEHJCxQzTZwUr/q20MVuKQuV+jAhTXx1lVTygALmGbdgd
         JPu7qyyNQReeeZSN7TUzDT1/st/wnWSIB9mp2gNR9v1vg5G3zMUD4Au+9+Ovvxhoq1np
         exWUzEb1PxKwCqHMLw3dttilPJeOA+lGfUAwFZ2s5pWKcT2p+ENmlAIn7CqJYfubjtlC
         mWTzVKVF7THIrnxQBrrKWaH4d7Y3cPenDRw4lPDv7oavQPtF4A2GeKodD2lX3RgEhVep
         KAMg==
X-Forwarded-Encrypted: i=1; AJvYcCUHm2TvMdrXavLViOdH2u6lBn79FIvjyEgeeMO3XWbyHiMtlokzLiPJr1oSPoSykRv6nwCjQGqQI+dMXtBv@lists.linux.dev
X-Gm-Message-State: AOJu0YzQM+9pxYo/veDFP9hY8NvoldcqxXjvO/ApIHzeog/l6LsbyYJL
	OdPXQhQh5UmOGGMNznWZaaLuOmvxBBNwni2q4XU18fei2apr9YbjOHXYWZ0X7E7BBMGyoiVwCP+
	IfTqW4sJ2O5s291VmhLGUYGYTQOoda1maG3NdD23sxg==
X-Gm-Gg: AY/fxX6Up6xwZVI/5PtKcHlX0/eXu8IRHU63eGPQy0JFSjNV6NWq9+no+/WXIclBulW
	uQmvCizK+nO8j172jDJc3lEotH4iRr/mOUe41o+0bdVsZfHdEsgJlcR45umDchZAs1cSEQUFQtl
	DDrQX9HDOoGaC3fgpmlBglONgwIxyGN7sTIXvJ6OvaT8nEUjxzMSH+iFcQZeQguqQT24nXtaulu
	5cgcAIRi2oIYD8fWC8J+JGm09EIr/jF+cvkE67x7MQ48Mmn8Qmy1VjffrRS+kkw5PiqjW50sKA=
X-Received: by 2002:a05:6122:1695:b0:55b:305b:4e37 with SMTP id
 71dfb90a1353d-563b5ccb01emr3705106e0c.18.1768850676736; Mon, 19 Jan 2026
 11:24:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Meeri Kallio <meeri.kallio91@gmail.com>
Date: Mon, 19 Jan 2026 21:24:25 +0200
X-Gm-Features: AZwV_QiQwx5Y5gVhacAo9stHRmAcjFKSXl_DksWvczD_61txkC2px1NhMy-Q5rk
Message-ID: <CAAgJoVE0QejhLyFuQMm8_0TTzOj7O1CM+AKs4TpLJ9YrvJfb4w@mail.gmail.com>
Subject: [PATCH v2] staging/rtl8723bs: remove unused variable warning
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	Meeri Kallio <meeri.kallio91@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This is a resend of my first kernel patch, now CC'd to the staging maintainer.

The patch removes an unused variable in rtl8723bs to silence a compiler warning.
No functional changes.

Feedback welcome.

Signed-off-by: Meeri Kallio <meeri.kallio91@gmail.com>

---
drivers/staging/rtl8723bs/foo.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/foo.c b/drivers/staging/rtl8723bs/foo.c
index abcdef0..1234567 100644
--- a/drivers/staging/rtl8723bs/foo.c
+++ b/drivers/staging/rtl8723bs/foo.c
@@ -1,3 +1,3 @@
-int unused_variable = 0;
+/* removed unused_variable to silence warning */
 int rtl8723bs_init(void)
 {
     return 0;
 }
