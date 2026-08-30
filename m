Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810012CDA5
	for <linux-staging@lists.linux.dev>; Sun, 30 Aug 2026 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106557; cv=none; b=kSkFiyTRbFlzokYrluykhzu2y5msgGSSvp2ycNovUFUe1B9cEWX2EjX5LUi+7o9ikCz/IP9t50NgoI+05p/2Iu+F17Y2aqItvqtiS+6/I2X1h3lAECPxB1AqPWcVLgtuWlUWbYIXp1vAeGDaLRVQFe9/yqe4SBibJmSJf2RwU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106557; c=relaxed/simple;
	bh=wT3w65sxSrm3I0WipIg4iDjDoWq1ddzUQosWgvwZ/5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wtk39lTjlSvSmEGLRohCGaOGFaDj/JmOvhmcUOxEAYZzNEixZPCKgzjjDRMhsZBQJFPRbGgXm49SHNF6l+lSy/1TILUndDRsuYts+BViHTsXHBXndstt/MEJiVLfrmLPuhR6eYOg3TLzsdAN1wZ6okqLnziM9FObC+5yJxJLEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1KDuILQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1KDuILQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so21256945ad.0
        for <linux-staging@lists.linux.dev>; Sun, 30 Aug 2026 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106556; x=1788711356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftpZeIMiNCY2OcgsJYMYoL7K7phvSKcRMGjOcwR8P9Y=;
        b=i1KDuILQsSpNdSiMy5QpgqcwGZnnlmOHj2JbYjL3BR4YLUBcF85QgFmY6s8BsfOaBW
         frlgqhMz6E/hATqru0VtjAgipPrZoJpUzHexLOXCJlgEZdE2lZcf6/Ndq2zd6uojKkDD
         No2jxxgSPwjHSGWf8Ozhp3mHvcvD/GaD6x/bUB6HHiOQyG8/gq9YYU8yG2bmygxk4dOL
         Sbbl398IUcexBv16DzET0dutkxf4sa/ICcYpAlk2Tfi4F8nZUDxaqyg82Pl1o/JwoS8+
         l4bCB81rI4TuQV/rMYMvzO8G9KjWZOrLf0mNalT78vFCnJ1Parhelu/DTQWT57rE55wm
         eaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106556; x=1788711356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftpZeIMiNCY2OcgsJYMYoL7K7phvSKcRMGjOcwR8P9Y=;
        b=M5C2puTSt1ttZ29TJM4uD6Ibx6iCO6dhIk5QrLgL8un+zCRnbvJpDUXIPu6/l2fbSz
         D8qZY+DkpAFKbEX2ozIbu0i/fd5YzPjHtVemZwoIsaOV6xD2H96tDiki4bJa+xitg2jN
         DlHVQZHTpFEHxGISQKz1wekq7FEobprl0yZl2ROkWUAIa/iBsuL4pdSE5kwu/5mQuOvg
         emnbZPIzHIZ9EDi0OdYzXj9dykqNhEzM1f3239N/oFAXXisx49wq/tteEHdN32Hpo5wQ
         RCvPhXSOrNeTl+BO2Ocf6v+mb6iheq7tJWH6x83zne/u1PqVRobsYgOiA7DtPb1fsnaj
         jGDA==
X-Forwarded-Encrypted: i=1; AKwUvBxW5NypG/thIkMcIxVrbnGzIhQOnXwkRm+cyLureC7Sz5yqJ+/yVNuHJSIEWmHrhFa3bu7p3tQlb36mkDuD@lists.linux.dev
X-Gm-Message-State: AFuF++mz2b46wiOR4ekQrjAzS41kRBaAxjpHQsAOmaP5vvkRdKSpO3VG
	bmlPxVlZBiLDpIAmwq0b9BjM04DWZ9csU1QAPIx9XlrPMH8xHVguT4T8JjdrEw9L
X-Gm-Gg: AYBFou2DiJIWPV4ndtRBiHqo+WoRcmX9b6oetIhI7wREWvcmyxT14pin9AWD1qMZivp
	gy2NPnK/ZIziDDrz1ejZcof5EceKvyQI+Kv8J3Pe5OERzoOwPXnPkFzGXBcTNk5vuK6UbbmNxKG
	T3TU+Yu/iVoQ/nuKSktDt3jaBMKNhX73UJ9KMD1ns3h1O0rrtCmQ/ZZEDNBdx9B8CQjnqBJmHWL
	faX+pD39unxaw4W7qzyUgd9t67K7cfSp9Ti/IZ/hDb2gz8ZFSIixIZgb4lA5TnKRchLJSqSn0wO
	a6n55O4EBJOowK9yN8Ig0oMzhGDiXQ4NGj623x5bjQ/uAhV4NKvxFz5r30VyF9Z/hWxL7TdJ1Bs
	Ux9cR4tdKTdNv2X7GHeNya1PeezYdguaPDWppnB5PiCkr8hQaGxI6bcZLIrF9qSdtmh7X4vNLuW
	NVIa/YYAWnp5eLt0nk67p5YYPvmn3yOXoyH4nL7Wo5bHoSmeBRbOMiinE6YM7Coh50u+MS8/38c
	44qgcVoRmqmZGah5vU=
X-Received: by 2002:a17:903:2c9:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2d906dba09cmr88661175ad.11.1788106555702;
        Sun, 30 Aug 2026 09:15:55 -0700 (PDT)
Received: from Kalpna.localdomain ([106.194.26.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598c3da2sm24396095ad.82.2026.08.30.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:15:55 -0700 (PDT)
From: anshika <anshikajain196872@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	anshika <anshikajain196872@gmail.com>
Subject: [PATCH] staging: fbtft: name the no-op endian modifier in define_fbtft_write_reg()
Date: Sun, 30 Aug 2026 21:45:29 +0530
Message-Id: <20260830161529.14500-1-anshikajain196872@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two of the three define_fbtft_write_reg() instantiations pass an empty
modifier argument, which checkpatch flags as a fragile empty macro
argument. Give the no-op case an explicit name instead of leaving it
blank.

No functional change.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2602.0/01917.html

Signed-off-by: anshika <anshikajain196872@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..e03aa251c 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -10,6 +10,7 @@
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
  *
  *****************************************************************************/
+#define cpu_to_cpu_endian(x) (x)
 
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
@@ -62,9 +63,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, cpu_to_cpu_endian)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, cpu_to_cpu_endian)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.34.1

