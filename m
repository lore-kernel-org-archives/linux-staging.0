Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813C3093AD
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870922; cv=none; b=fLy4IWOE8rUIMlc93ozlTMFFFhocRmh0DdSuoyY5YbdMb4SdCjIkJHajR80oFCiM9B68bga4gmOx8kb7euIBUm/z3xmCsTIhd7XL8l2u8ytsri3965ZaPWZhyKgsoul5QqdoEb1oTTSbOh+cQze30lDKN+yXxq816+TvTej4Hz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870922; c=relaxed/simple;
	bh=iMxJ6lRTsZ/+ONdW6aaFlSyS67Ejco0VfoBbud1ISW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H52Abu4knKua1jn7TfFXCk31rKmJBang0UOU5QDekeRNev//ktJPphE9LysjfBHdVy2OFUWuLYqlVxJOv63JRIsunxmvB5ysJxM7KRPPng4fazGPkhwmECkshzfedbhFIhC/W388O335oArWemkv5pukImUsc7u6IH2e9TY195s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH9GgOUB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH9GgOUB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so317567966b.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870918; x=1756475718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izOus1pkUT/TrM+qzEvtIeTOKYw7pk9oz7PKskT0MOs=;
        b=HH9GgOUBbMr7uFSlovV5mxvf3tQ+FQzMkyUQKNLBZ5qEr5CttyvN3l2I7bolQC3Foa
         aafUoGLZqGtq0lM5lYHmQsy9pg2T60nCB9mlEujpb2/fYZt7Ojt/3X3BRmznt5Kdj+ol
         LqMcvjTSqczfZXWGN/N3WBhhCPLTwO9osaSVIZkJ5NQ/BMWtsMDCEI9ydmbEL2AeRaAw
         ai01R9KurSXyewbpe4wr/PNsv8S7DsHpKsY3Dfz0Rw1V0JaL8llwV7sxu9uZm/HE4pRH
         FVYBFEmZl9/AxS/qQo6In25xe/+qUM9S+Z6liw8Cbm21CdGURP2YoyHOX598qonZ0WNE
         xEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870918; x=1756475718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izOus1pkUT/TrM+qzEvtIeTOKYw7pk9oz7PKskT0MOs=;
        b=Z40mWu/R+NfW0L0tR1ivbhQI9k4L6enVF3yay+mQO5f0qekNi+K0IrgH/J86tUrtkk
         L2g2s7rCNhcMN/5+QX3pAF3n6DQRfpYf4caOIS2Cd5+tzkizcgML7KEC1terw6cK8Fz7
         YULo1bKQaBQdUqmZC3OAaGGA5m6P0SjLgFEnJp1Zt+v3e8ZCyaOZvCo89qHocMqDCZXk
         1V26xZs9aIkQPMa1PkZfaDVfhx6K4C0Gq0npOMComa649bXWAFvwvtSTntpEw2WD6Lxf
         nnSuwcGYu6+2SDmPBLLFlWGsNCn/zYaSAm5ALY9Ok48sgtkbh00hK7sWUpW4RUD4oQ1i
         P4pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYQBcweYI99zIAWcKplGTdKRB6MQD1/6ek4Yw1VolxqmadOC0QBd8GWv1oydtxtfAhC7wcHclWBJuKaODV@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5QRRIoplvHTdR7Hsugwn2PD9Mn8e3Zbvei/48yYM16G1BIcwL
	XIaNM9hR4zTiwpkE9f2Lq548VdCe0M5FmTbACFR+IsMZU6jUNxLGPbKoZhwegQ==
X-Gm-Gg: ASbGnctqOXc0FVZihX9dLmwIXSuH3kciuTe2Itq8CcwYYZPtRVS3RDTKp4H4oFMWbE7
	lYRto2F23nrkKixdedw0rHWuwsuMkKz93oruA2RhtKptTP3aOXZPoT834Je+b5CQsIjp48Ar2dg
	AbnGluojw7e4s0VChb0cv/9bK+pKLCGBe5yteS6EfGzoq7B81O1XZbE1y0Pg8G0iGq1rKRp8w0w
	UOLtdo7aJNOCpCQuR/2uckwUdntD/O0av0zv7h7i5LZsUi8c1hH/hGZCZLMNsxjbZPyxjHaZDC8
	vbwZq0GTIg7iJNE2LZFZFjazIIjgDLRAf5TJoRepKnaxuEb3ivX/xm/sqVazRkWWTObziBvzyWV
	N+02oRI1KHAXbuMARizIVtIh0c/g+QyuhFxLr
X-Google-Smtp-Source: AGHT+IGzOWE/MUzoEMMp5es42MONAAnkQmOqcY/iO34lssMR7iWmGBNBPijyi/3L6YIXM2hQwObTAw==
X-Received: by 2002:a17:906:d54f:b0:afc:a330:e423 with SMTP id a640c23a62f3a-afe29041e9emr249651166b.42.1755870917696;
        Fri, 22 Aug 2025 06:55:17 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/13] staging: rtl8723bs: rename rtw_os_recv_indicate_pkt
Date: Fri, 22 Aug 2025 15:54:16 +0200
Message-ID: <20250822135418.118115-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename rtw_os_recv_indicate_pkt to rtw_recv_indicate_pkt as the _os_
indicates operating system dependent code which is unnecessary for
in-tree linux kernel code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 924a0c415a1e..e893cb6fa273 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1662,7 +1662,7 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 	return sub_skb;
 }
 
-static void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
+static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
@@ -1771,7 +1771,7 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 
 		/* Indicate the packets to upper layer */
 		if (sub_pkt)
-			rtw_os_recv_indicate_pkt(padapter, sub_pkt, &prframe->u.hdr.attrib);
+			rtw_recv_indicate_pkt(padapter, sub_pkt, &prframe->u.hdr.attrib);
 	}
 
 	prframe->u.hdr.len = 0;
@@ -1890,7 +1890,7 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 
 	skb->len = precv_frame->u.hdr.len;
 
-	rtw_os_recv_indicate_pkt(padapter, skb, pattrib);
+	rtw_recv_indicate_pkt(padapter, skb, pattrib);
 
 	/* pointers to NULL before rtw_free_recvframe() */
 	precv_frame->u.hdr.pkt = NULL;
-- 
2.51.0

