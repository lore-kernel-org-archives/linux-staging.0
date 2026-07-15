Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196344C674
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134804; cv=none; b=n+dE6WMdEah8Om/Qvy1wyXsssK4viNkFWovvJoK4/IWdKqevoQQ67Wh7PyVVc7gxage5+3tCq68+GHqmQV78kCBVXpnwYf3wpORV4Zmj/E/e5bJP7iQ1dggk0pcIketYCS84zDk8+N/YzsoF+GHJqXlbjVvpooojSSEhWcmv1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134804; c=relaxed/simple;
	bh=NX5lG9AQUs4yL+wImUjSzB594k0F5caEN+dx1RZp3+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L7gFZBdGtAihcfqMk3SiM7neuOSEEkUjc8DzE061qqbb9vm70Erw5jB2pkWTY/G6h5rCDJLjFFmHTK6QWnCcEyiZ+cu69lvTgKZxMuHBGw3u6lXE3JEE4Y6zuHmNbhVkY9MALzmc01PzEQsXNFtqjM0wbesoen4adOkXAr1KC5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxZeRZDL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxZeRZDL"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebd52488cso6086491e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134801; x=1784739601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbYwSU2CROnn9tLQs9PzZJ32/dusIJkCDRWr1n5+kOg=;
        b=cxZeRZDL2df1sdhLSdb5EVQdF5nMfa0ORZQkmMBPzkAyUkrwf862uMF86Ms4iZJJWh
         21coBdeIMGmv6sxBvZfClnwjTYqjYL04VNq7ABN3/0YkXdZR8l60blywTNsXNKQXSo3x
         WpNTvqpeD/DHASiqCwYK72PArjP70yOlu2vVauD/5NfX46tTZahr6EA40CSA8CpggGaw
         QCgi5DPvIs88B00H4pWVYLkhO3zSJutQMf7dSG+ZsmmUxwp+RSopejjBZZdNIRIE4TNy
         fMfzW7xEUTVeDnWchUMq8Rg1H2hxP8r0EowqZRjG88HuqzCm+RS3nAOSm99rRslsecPJ
         7tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134801; x=1784739601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbYwSU2CROnn9tLQs9PzZJ32/dusIJkCDRWr1n5+kOg=;
        b=JMyDnKrik2nTkSbUO52oEhW9WWYUcDf07yXm94XVCoVdtDwuEHIMRi+k68lTFQqzYI
         5kkmfxn6ZTgsElBviOfznjbZ38yX7GW/xT3pO/WCNdxHARplG+eF8sTqDYo0m/xVuake
         yZ19sJEPI5cIXpK0+anM5cJ+MvjE92YM7p5L0nMiMO6iHzGOg9eDPr/p74KI46iWjyAr
         tzQNfQ/4pyo1wZyz7M+Kd68B/bvu+fViGGcxjD2TE7Yeh+n9+8363WJDsVbarIa5eiJK
         8FAc20+Exofkzxa+VMzTJCKG+IwlSBSfZMYFsHynbCaLeZskiJGbOJbDOKCXtsIcdylW
         Q53w==
X-Gm-Message-State: AOJu0YzcZkhurKYiq3g5ywOucDh3xJQV332mmIjqZV5dGIURB9ir5t1T
	RGCw+96iE+SOohmfmWulOd+Xi5f6v5xwh4O8LiFQLOEB8mALdxrUocmW
X-Gm-Gg: AfdE7ckHX95E7xePGKmZgzhfDdd1ccI67nBZxnYkHzICCib0C1c1nNPjSlFQndsRgTU
	KyzNrjF0GnBUN8mIo67//bRdo3OXzyCN7fdTDJQG2BZhTkBXt3xKASj517fIo/CXdn4ga6YWcTR
	rfefUJxADC/JhEXGDQsMeQGuemfjguXgmlZiPwbR+CLXZZOx0A/6DeVWSIiWthoXiswwslT/17Y
	NK7A2C+E4AqzRfCYzR3wie0/6ygh3ZB2ZQKrMyQzfDR8CTd4YrXOemcjmaSGkmHWg8xuul+Hw0M
	cJ5heN4+AXOWjqLAVa4AcHpoEZ4LhOAvJ3e/eBZPjvKQ00CVDOxD87YZGvkv+QOOWGmPg0YYf9F
	DIwQoybR+u6v8x66G6vf7yVGIzAQLCzZCnxWKP4PlFi+2t34S8PUkemgP+UDowEvFAmX6omuhPI
	LghzrCFcfT4Sy94SR+RjlA+PWSUj/ctu/Hu4g8GQ==
X-Received: by 2002:a05:6512:61d5:10b0:5ae:aeeb:e902 with SMTP id 2adb3069b0e04-5b15d770799mr663615e87.13.1784134800662;
        Wed, 15 Jul 2026 10:00:00 -0700 (PDT)
Received: from DESKTOP-PGTNBU2.localdomain ([178.131.96.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55723sm4351746e87.35.2026.07.15.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:00:00 -0700 (PDT)
From: Amin Madani <aminmadani112@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Amin Madani <aminmadani112@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Split multiple assignments in _rtw_open_pktfile
Date: Wed, 15 Jul 2026 20:30:03 +0330
Message-ID: <20260715170003.94569-1-aminmadani112@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In _rtw_open_pktfile(), multiple variables are assigned on the same
line. According to the Linux kernel coding style, multiple assignments
on a single line should be avoided. Split them into separate lines to
improve readability.

Signed-off-by: Amin Madani <aminmadani112@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 4260ed5f4..598d94f1c 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -15,8 +15,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pfile->buf_start;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pfile->buf_len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
-- 
2.53.0

