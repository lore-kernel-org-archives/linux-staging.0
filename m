Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699681CC149
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724337531; cv=none; b=Bbr3Del3XLP/RsREtlsPn9Nb+pHObTwh6XTXGMxruWkyFP5pj90rgyL+zKiz9tKFVuiNEnicopmU06qotNqGQ+xX0VQdTQsdbTLSG6+E6E/JqdyQaLZ1TxqlqD6FPbUFx84pmwEs2un9tauiunB4GVTGB0sS0da+Zh69Bc6mXEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724337531; c=relaxed/simple;
	bh=KWk7S77feO2+Su/Jz6JDlMEwYU/vnPbFufNMPGjuIEM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TRor+5h6zrmjnwGmbgGXjNPL/tclAQYe8xQbBv2pXFLlY7jTvHGHysMYKceCYiO+ny3GLsDrY+h0u1/ybmlofJaMZpfDmYoRIRkagKJUJjQ0Fo+Ao02AvCZ8C9+D/D6mwkVlKZqcQDNWn/MNXIQS+z1qoNQMDpKPRDFc64x3xvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFUmqmNz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFUmqmNz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2021537a8e6so8278965ad.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 07:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724337529; x=1724942329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2J+FZcObaK3ET3O6BG+nz121nx0VS8YMKU4mL/dyMXk=;
        b=SFUmqmNzWl+RFPfxR3XhR4II1q3RKSaAE5Via8mO1VWS1rbuuUmt9UI21KiIDnu5Yi
         Oh7zdT9B/A7Ip2TuWNoCLZMguJVdLbv1YhLs6+n/r3eGerlnUApxsedMYp7Gh4hR/o/j
         S+0nSxml4nfC+0BXPC21ocAUD4GlJzhO39k9WIA0H9m9aog9n7Khp3ErAOEXV5uK3b/j
         r0EsT5QYMYrNQY5A370wJhtYCvQ761xvGehYlDRbwEnmqH/oZM5ZfJfiWBBvorZjzIu9
         4TB6q6UhXmlahCArmf/4tsr69ZXtJYGAAHp9eJEsGXtsH+oRjkdx7iWQMk9XASIrm85U
         g9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724337529; x=1724942329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2J+FZcObaK3ET3O6BG+nz121nx0VS8YMKU4mL/dyMXk=;
        b=TjbmmI8ScMdrSGns/A+JoaYjlXoPrEtE7xen7D5ugs0JEl/G4bpOlXS2FYgcJfCYl+
         8OEvGWgDJXyMmAJJfNnaILfovMdiit77jSLoLSZezRm6+PHAloCDK7Os78l+DqAmYTcz
         hr4GnPZLk06POTzGCUr5UuFsleFVXir477m22aMwSmPWhGzYBhtLzTlZVhRqWrzYQYRN
         a6g6mWZqqUicS2fJD9DlHtojNoKPKPVIMw692367Q6gzdO1R/Ou1MpWTFh+JJdha2C+o
         MURegkDKs0VIpJOHVIKmT8vzMY8A2hgXOGAP6ZF4wYUZgc1GWOl22/mvg8Uo8fypqp5F
         nrTg==
X-Forwarded-Encrypted: i=1; AJvYcCUpKFJLOixi3f+py9ZYOsVeRqhf3cIRv5IucML8H6PvDIaFsUPtOo1L89cPE8Pdo0x0X2FoJwQl5w+84i7o@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0vxBb6eI5UJ/mLoQ8jYubZh85ZYuv0Z0Kh9jr6gICqbfQlMVg
	+nRdzklBLao+ffGnxfz4LD3Q+akjJl4NUj45+ork3Fs5WugQwumKq/6XgjG0tDg=
X-Google-Smtp-Source: AGHT+IGOzzZgvEII94d3yJqOtAs7Z7xQu21SDuCClkdjCjlSqW4yfbccwA4nxEvbCSCpUHiDXCeo1w==
X-Received: by 2002:a17:903:1c7:b0:1ff:393d:5e56 with SMTP id d9443c01a7336-2036809745emr73095155ad.36.1724337529310;
        Thu, 22 Aug 2024 07:38:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:baa2:9074::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385564adcsm13441005ad.10.2024.08.22.07.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 07:38:48 -0700 (PDT)
From: Hans Buss <hansbh123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3] staging: rtl8192e: Insert spaces around '|'
Date: Thu, 22 Aug 2024 11:36:55 -0300
Message-ID: <20240822143837.37768-1-hansbh123@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Buss <hans.buss@mailfence.com>

Insert spaces around '|' to adhre to Linux kernel coding style.

CHECK: spaces preferred around that '|' (ctx:VxV)

Signed-off-by: Hans Buss <hans.buss@mailfence.com>

---
Changes in v3:
 - inserted changes in the correct place

Changes in v2:
 - fixed typo in commit message

 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 1b444529b59c..e507593b939c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -229,7 +229,7 @@ enum _RTL8192PCI_HW {
 				RATR_MCS6 | RATR_MCS7)
 #define RATE_ALL_OFDM_2SS	(RATR_MCS8 | RATR_MCS9 | RATR_MCS10 |	\
 				RATR_MCS11 | RATR_MCS12 | RATR_MCS13 |	\
-				RATR_MCS14|RATR_MCS15)
+				RATR_MCS14 | RATR_MCS15)
 
 	DRIVER_RSSI		= 0x32c,
 	MCS_TXAGC		= 0x340,
-- 
2.46.0

