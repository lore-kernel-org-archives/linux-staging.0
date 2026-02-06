Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD4346AF1
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364507; cv=none; b=OL74p0tmLKPYYrZLtdvRI0G+Vy3VH0IDfhi6/vuAN3ef+0LLQgnVRIiPiLO63QcCLmFk3/7af0rVSOefsT08AYhVtdzl8mwrSwVapMOD0R/PAReSqusDwDSnfZhov2uKxsUV7rKjvgvRDq7HQdrO/83TXF5xkDZKIbYA7oP/plg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364507; c=relaxed/simple;
	bh=ZjvBpCFQ1B//ftFYrptk/FUxfcX/e95K1P1U91aq7Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3+HYX4sOhepvShC24rzpJbugLqKtcXUZwhLPicmySPM2nZyg90yXS0tcOdy72bFHZ3KffdNqJyvqiXMHmcmUVbrHKhWUl4T3+c9StXgGGRwbA6eoJ3dfNo+SmmR/eXfL6FggcbTUNt9ciMrfH15ZC4N7DIDStEKN0VsgCcILdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpNC/hMr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpNC/hMr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4359228b7c6so242818f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364505; x=1770969305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecufH48DhYebB1Di0+Th/0WORWTzCHxsQ3ePCYnbr4Q=;
        b=LpNC/hMrfPaZE7FLe4NasJAz86QJuSAlDsal3kaKAB3PoCIzB5JI75Zx6Sv6XGU7gx
         ozq1LVm5JXBI0RTuZUGGo+Fp4X9kaIKwwjWOs3aZhe8geO8JEAeG37TwNHC98l/CE5Ws
         RPkFJl0otzTRsqTZJe97WNapICCf9GMI7HnTWpD1pVIe27SpPABcPE5fGvZFYmlxWOm5
         0GssmRM53JHRUnU/vkpiZkiV1ETaHJrMXUYclJkoZreTSKlrTxPH4BDoft1rv1NJZvFs
         ABE+h/Oae5p/igVeijq5uIYwS+mzVeNiuW5umnKjfppsEAme9duojAT203UDtphfcGAJ
         MfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364505; x=1770969305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecufH48DhYebB1Di0+Th/0WORWTzCHxsQ3ePCYnbr4Q=;
        b=Vm9BT+MhDKCKYuEgVawsd6Z7rTlsjtkMQWEEcJy634+iHiCsoy6AMLHIeJ9/1hgAUk
         RCIoKGVyxsl7sSCvpM0NQXcgjSGfeFOhOpCKeeaObvbeEZkg+qQU3DV8+M5iLZSXhXxa
         HahVJ+miODFUxmzdG/C8rD1ZYNgnLPcRS/mFXrdaqKzlBkTfw33Teo45s2ll2h6gTGKY
         a8SQhPkde8DUoj8ZngEZJRixd4jZPZ/ly6zNIjGia0zDxMRgvsBucqgvU0qOXaGXYV9k
         WPlPhNdnk7F3ULfa6obdMZI55x1aFDvtroEgVhU9xaoNVhdd7/C9szo624gFRRrfUBFz
         J8GA==
X-Forwarded-Encrypted: i=1; AJvYcCXu2JihdzvABSjIwwVveAFg7rY/G3Ep+bwpe+iI12yAgg5V3j2JKwM69Ay2zi9fx/owSk4XMpD3+4yKPDvB@lists.linux.dev
X-Gm-Message-State: AOJu0YwYqu0JvmebLE0FxMiui85dL0Wu2Gl6i1CokOGKdwKEZqHkCnFH
	2pJXShvy16TB+eK6zVDqzqIYF10dO7eVksKd4o6KUEpntGKq8kLe0nU=
X-Gm-Gg: AZuq6aJufMQfBQPxyw67n9/XNm8cw3Moet4TX76mxDMgswzL1F8CUHfSgDXUJegLSVF
	0hPF3tEEt89oIuX4iIJerhcwyThYphiE/MYkVYz4qhhFJLWi81yzs+Gl0Yaq13aee9VKCNmPnEQ
	IdbFF1es4GVsK7mBt8t0bcbH7lYddYAJO1Vzu9Obz45uCqhQm4utyxeLw8Y4gd3VbwZX9OT2Vkc
	G3qN68f3zTxIZ9ASMldo19K/ny6TCIMnItJ06gN0BBh6jDzWG6AY/2kZikIEfyPVu8+jRzH3Pdu
	wroPqsoXo4pn8l/7frDe2Fsv3HAkiQfshEb40Aqt2uwbVDWjiAZee/ZFyn/80UoLjcz5tA+p6lG
	056ON5D2DZiyNYGC8RolZeZkx2V5YMcQCciMAJqOZYQ0T5rWP6ZDqEE6oSo62X4c55EDyoY1ILw
	1Zd7qt69bTVjbx+1GRoQrq53FW3UNLPtdrNYjRaWdRimFoBgr7LYaDr0NsHyIa+uMLQdSlwhPn/
	w==
X-Received: by 2002:a05:6000:2384:b0:435:bbde:dd43 with SMTP id ffacd0b85a97d-4362938efb9mr2882196f8f.61.1770364505072;
        Thu, 05 Feb 2026 23:55:05 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:04 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 05/26] staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
Date: Fri,  6 Feb 2026 08:54:18 +0100
Message-ID: <20260206075439.103287-6-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Remove the unused local variable 'pattrib' and the unreachable 'if (0)'
debug block in OnAction_sa_query to clean up the driver code.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..f2b0233627c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1848,7 +1848,6 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
@@ -1864,14 +1863,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
 
 	return _SUCCESS;
 }
-- 
2.52.0

