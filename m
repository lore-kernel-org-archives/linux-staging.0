Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A026B4A21
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 00:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772064641; cv=none; b=tFfWWEa1OLSjyVIDQY+CfWL4Ve5BoSyEvJJO1TXTGt7HRWIjdrllhn5IPpDGWgZ6NrzMf7KVDqs1z9D7cHk7jGK2q6ieuhNJQlpgHs6GTG8MRufNarbw1/ppy+o946vq6Xvnwe/AmD+05DS/QJSlrRWvR5G4QUKBQbnXxzxZWL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772064641; c=relaxed/simple;
	bh=dUTqWl7iX48vjgMKWcYGpQLzfaiRhMqMtYykddBQkkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+M9z1DNLSrE3Vv/qx13xEkCYaVPcFVXCCmwj3d+AUPL1muJuYf6hABlX2GpCCGWz5Q3dREt/ObyoZxlzH0OkNK6tH0Q1mmQ6/31ukl5Kl4ZhzK/OL4FLGU9QH6wFlU9kDLnfnAD1x97qiTqMbBHmqcJGSYqHLlMv5hdPUD69F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKYvwJnV; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKYvwJnV"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8954c9daaeaso3644996d6.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 16:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772064639; x=1772669439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZke1CSO1LZpsA5QpU4kdJeTYwP4zT0gjA8xuX0t91k=;
        b=dKYvwJnVIEai1wOnEuOGUvUTTtcTxGqtS9OpDM0iQhXs3KjBDGsESfhwYqbDzHhl/z
         sCZ3kOYdZedHGZrgY+Kesm3fpbyJeCwUM8EgqPKGzF3yAjvtPSy/tcjNeQqK/RgoJ0H0
         uZM7gsSFxtkVCNDa3n/YEXOq4Orero3DbrSfloezOMIJOyo/rCIoGvFwp+oX7Oo4cWb6
         zBFcGvMte2PRESPZ6dEfhEbp6IleUXDqsqU4PqweNirhibIifak1EsOKuq4oZm0r6JyX
         6E0N6kX3aktMiEGD8uIQXwiqnU3b362gEz5okVSu1zTguQh8gYdYyVZJmuVrXuUDIPb8
         InJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772064639; x=1772669439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZke1CSO1LZpsA5QpU4kdJeTYwP4zT0gjA8xuX0t91k=;
        b=M5yCZv6pWRksK55QZTuId8TP4j/BCYvuK8+qvdWPjGyzQ+FAsRfMV/n7/xZqZlJ+m2
         PVgxITIeoZ6FL2SIiJI8wqzItrFuZw6jInz05OhB82DhYWaaFB/30gccGrddYJBvhILN
         ZzZZ3hZrPLD+OT8A7tYL+kAznqJvxzlhGfcXLm4JaAAXQA7LyqcuvIxkp6xTZlFomt8y
         2Qn+plE27n/GpdidweDbyIt8gkDXRIbyk2PxueFPGiPAeuiAhZ42bVY24QpsYzDvJbzM
         OlLmJsf1mTWympusthBas87ctjIQn2TP95XvYCQV+UtVgzm+7OGZJjdtVwG/dAzLYSyp
         Kn/Q==
X-Gm-Message-State: AOJu0Yz1eyb+gei0V5fGOyE/2D8Hh6SuhJ1ZDu7sS9Lt3evsnxbW/h9t
	AyvjNpSsbO9aR6SIoxTJBRdhuw0WuYp5c/Zs4VnnAeq7eMa+mBppUYWl
X-Gm-Gg: ATEYQzykAPrZi8WRcsn/BideS/xe9JMUxkgBZGdCO4G0ObZc+lYnMJ7vZViPfNxDX1w
	5BP/WkMT/KFzuPk+cvA9KivqyvmPqTzPEQCj17HDORtRDRBidGW8r1OmPbnq1X1tggTQVFwEvHe
	hykhLIqOmkhSGIqE/L6N+PG4niuSQR5t7HEp8W0BmR7vKd2S7kyNBl+Y4Mi7MbI6B4onDtwRlPD
	sruCmYkLKoPCea9XaYevy0iHQ4VZuaV47bMI5+V8QZ7W9yZ5VhpiU5dBrxxypYtc7Jj5tIUDOZx
	Av2+SrzWTsEA1/h8zooeZvhjOmAPJdZ6M2ygQefHz1o7zWn3yrJlzC4yvVCUC6e8xr7pYWUbDuK
	W2sM7wnbyqmV4+fseQtEalN1+Gtv1cCT/p5V52iUju4mjd2eccy34UAMAW47kUX4QfhjPXeDrXD
	bA4YTH2Fxlh5YBATu6hsEadBRlZq2VIQ1QUI9jFdDi9tgGzeE=
X-Received: by 2002:ad4:5aa6:0:b0:899:bda9:c711 with SMTP id 6a1803df08f44-899bda9e2e1mr38967666d6.39.1772064639525;
        Wed, 25 Feb 2026 16:10:39 -0800 (PST)
Received: from keith-pc.mynetworksettings.com ([72.70.5.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf71ac86sm59112785a.40.2026.02.25.16.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 16:10:39 -0800 (PST)
From: Keith Teeple <keithrteeple@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	s9430399@naver.com,
	andriy.shevchenko@intel.com,
	Keith Teeple <keithrteeple@gmail.com>
Subject: [PATCH] staging: rtl8723bs: split chained assignment in xmit_linux.c
Date: Wed, 25 Feb 2026 19:10:19 -0500
Message-ID: <20260226001019.1100684-1-keithrteeple@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch reports that multiple assignments should be avoided.
Split the chained assignment into two separate statements.

Signed-off-by: Keith Teeple <keithrteeple@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 0be3143fffe5..62243ab5fcd4 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-
 uint rtw_remainder_len(struct pkt_file *pfile)
 {
 	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
@@ -15,9 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
-
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pfile->buf_start;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pfile->buf_len;
 	pfile->cur_buffer = pfile->buf_start;
 }
 
-- 
2.53.0

