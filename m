Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E38481B3
	for <linux-staging@lists.linux.dev>; Fri, 22 Mar 2024 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711120319; cv=none; b=CS2lRAPthbO8f4Fbl63AEh9W6JZbWf6MXs5qj6OVR55uif6NBC1085dgi63hFSV7woYCQYxmjxnTKVhwIiry7BY2Pu8Id3o0lXoF92HopAZiVWI7JXXIkVnR9J9NxKmlH2wLBSAJYJV+1sP+HyRIoRXnKxY4lsh9VMYP+TdcSiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711120319; c=relaxed/simple;
	bh=e26f5oBYl1V7sQG3UDIthvm988qnELAgzd5n3j9cLew=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oidb60PktwkSGh2YqFKIVWtUuJHYfdrS9gE4BnwuRxABKC7ScaxVxbERlTX4+Qs1Sry9eDEyQIYL+rct8sHdlKphEETdF5nKyiq2fRnT1oKnnSA333GcYZLnPGlHRUJ3my6Q6EiQZaN7UK0HGU741zZ729sZguLbNlMnr8qNWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCV4YdUH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCV4YdUH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42a0ba5098bso15585341cf.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Mar 2024 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711120316; x=1711725116; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=swSy6KPdMtuES3cNHj9q9SkIUTExBeYlvBJDd89Ngu8=;
        b=mCV4YdUHJeGCeNIGYsdBAY8UBVNjQtQljHfvxvkyC3vqgO4N3IyR0wAHCRse5293hY
         u2v3ddKYGrbbyezSNkDCgMHCeS6TG5eQY0XYqFEmx+qMjTM5P59oFXvDZGEus84526dI
         sJ9aGKgywQSJP6872XAq38Q1atVVoQ+9AngKoqZdvO2zZV/fAcg5QsNKrVNQ1QuppQ0k
         gse53k0JGtoGf6XBo4729BNP5RU5eD2tA8bSiIhVPNdc5l2nkLfxZet6SSsKZZSajOb6
         JqnJqdIF7SDDR1YsNS2l11WXlGLQnJUdSRUCoXntPeHU1gSxExR8E97EOQRHjWN2qBA2
         hrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711120316; x=1711725116;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swSy6KPdMtuES3cNHj9q9SkIUTExBeYlvBJDd89Ngu8=;
        b=qBKMDaOcRgf9xOTSt/RRd/NTUbauRgjzP3F4zBWXUOa4QOo2eODtH9zyeXRO0FmmSq
         bnXDoL7u6nAT8upNbLl+wTlI5DsdFK6A4qxwNOWQT9P5NbvXG5sW2XvuFU28HR9yOQoY
         GFHns0doUPBEvPuVkwF6EUizDEXE8B3iMSNNTryKEumH4iMKKN1jR5ZrVJiYCVTKS0gO
         1iPexHBSWByiZ604tR2o/bL6O7o1TwfmA3K/rbf8ROVz67Rb+HIhxR2eCpvC4BqTVTHI
         k5R08svth6EyaiWEcQD5r6g2xMz+VDLQcub9F8Vqj2sx9GSC3dAnrPldBRS3r4Skki6F
         oOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxpzhOxlPVjfG0x3uCE4sgmxookNv9Z3bxgnB/bfskwyiYjWaotXK2VSmtQcOKcOI5qishtYv4JmQUWgcMmWhH3D98GUimEOXCWoTRkw==
X-Gm-Message-State: AOJu0YzvAxO+21zUIGMsTtrYG9t+MoWUOV3fCbgANO2PC8QJIShgJTR6
	zl5XB3QPRpev4QO0Zz/bJKwskSqcbRz2nsjFVkgaw4AoLHwbp2wg
X-Google-Smtp-Source: AGHT+IGwmx8XOENCOWZn3tWl6dEYzPhYxPqy7UkM8ujgB0AZfux8SEqhs3WZtfkf6KTWcr49GGZr5A==
X-Received: by 2002:a05:622a:148d:b0:431:24a8:ab83 with SMTP id t13-20020a05622a148d00b0043124a8ab83mr2837032qtx.18.1711120315845;
        Fri, 22 Mar 2024 08:11:55 -0700 (PDT)
Received: from dev ([50.202.39.176])
        by smtp.gmail.com with ESMTPSA id y10-20020ac8128a000000b00430ef755b74sm938341qti.27.2024.03.22.08.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 08:11:55 -0700 (PDT)
Date: Fri, 22 Mar 2024 09:11:52 -0600
From: Brandon Crain <bcrain1606@gmail.com>
To: larry.finger@lwfinger.net, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: rtl8712: Removed unnecessary parentheses
Message-ID: <Zf2fuHV2gmSOSEnx@dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed uneccessary parentheses from source file

Signed-off-by: Brandon Crain <bcrain1606@gmail.com>
---
 drivers/staging/rtl8712/recv_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/recv_linux.c b/drivers/staging/rtl8712/recv_linux.c
index 215fca4abb3a..2bf4661432a9 100644
--- a/drivers/staging/rtl8712/recv_linux.c
+++ b/drivers/staging/rtl8712/recv_linux.c
@@ -105,7 +105,7 @@ void r8712_recv_indicatepkt(struct _adapter *adapter,
 	skb->data = recvframe->u.hdr.rx_data;
 	skb->len = recvframe->u.hdr.len;
 	skb_set_tail_pointer(skb, skb->len);
-	if ((attrib->tcpchk_valid == 1) && (attrib->tcp_chkrpt == 1))
+	if (attrib->tcpchk_valid == 1 && attrib->tcp_chkrpt == 1)
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 	else
 		skb->ip_summed = CHECKSUM_NONE;
-- 
2.34.1

