Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1220D4F4
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331936; cv=none; b=YQwlTex7aYr+FKBUZCfGcuYp2ibQX1YTr7FO+IN3M0aRJeIsbCJ8Tf0jFKFYkN6QaI3Oj73Vpvx8C5Kh0tZP1wNjh/u9XDCSEkmBD0/otWCLOjoMKvrEvu59MXdlh3atebPkzF6Mz04LDU72nAx1VM/VDKhz3UfVnca/Y6nlYEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331936; c=relaxed/simple;
	bh=SwdIkwAyBADHolNVHGKonu13CQKyD3zHMnYIOIO5/MU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ocq/tEWGNP9lx3FHhg4Sa0N4ufvK4t7QT391QLauWIO+FCONFeSUKm+ooS4txh1qnu2kotMgNFnv0cDeNQz7IvpM0ROi4GoIUg5xo09iRA5epdDNPz+hT+BTF53KT80Z1ZVfEdw0ZaGL57PvU6VQsH7WDe3jDknkA7+2TtZ/4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPMaEAVz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPMaEAVz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382610c7116so19356f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733331933; x=1733936733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cuQDS9XjCoh01d12eDFy34pmkiiHwb9j2F8JlmKFAE=;
        b=JPMaEAVz7XcHhgskUxsX5xwaleJlFredouMiVhYDvZ5GXtGIYwQ6JAkWeI7cGxQuCH
         OuwwhZP7g1+5Xvx1jMTnaMkE93cEIkVaFPgq5pshysf1IFFG4BCpdg4/GYevsdZOkpa3
         N6swD1KFmmV7l/ERMGMCn6GMlt1mo7JJmagh5HdMc7sQ+4O7ojQ7X8jcISGCTbE8EpBO
         uHA8Kup1+oJGF1fWRcBC+8cSNnd7HHyu7kYVcZxK6tYO9qchC/n+gB52hMnt+6Ia1E5c
         aSVr986BBBjBjW9eTgeWXrUUG+zImKCkjuPiMTvuBp2Tr1ccSa7UEdXlkIVO5YPSgkPP
         3uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733331933; x=1733936733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cuQDS9XjCoh01d12eDFy34pmkiiHwb9j2F8JlmKFAE=;
        b=GH4FRchWVetDtMnOHKrjv1LI9qUeGsEa19juA+1MRQAkMqyv6JBOgL8xXvDm+rYGu2
         7skmUPm1+1yUwrZ6b6+cIO1PyzsjuCanFp3v5NGZvHBurhYLxumenhiJBMd+0i95ZUBV
         XeVlZUdvyB99pAXKSbrUBYsz3yI+E3/ErTq6PzAcScBS1rd6SeRsz6VIDAzIukrUWMTM
         3Bx4+5Pbgc0JPtrUAhhuDq+hExdIgsAYcuHFK597J+8OA16cxbFTceFo660Udmwxeh5y
         Gn0Fu/3E6EuG+nZ+obwG+qsKAIXi9W+YgRE9J5Q2G/juCsLPYs06gSCADM4u5Fcn+64M
         ZfiA==
X-Forwarded-Encrypted: i=1; AJvYcCUmzj37XuUbFe3/zVHiW6E7/5o7j2kogGbhD0nBeDMZjV2kFeU1g5FCdDt2hvvDo3jGZHBR6CCs0cGxShrK@lists.linux.dev
X-Gm-Message-State: AOJu0YwauYxWYaniGUm8ytpOxqCwBq6+NVIF0miT39kKATzibNBHIhXT
	59zwqnvk81EZ/PDs5uWi3RHoIzGN1oxKIFImviSmt3pZcJg8O1lV
X-Gm-Gg: ASbGncslzAl/8nI6K27IbB8G1tCI39kKG3PzXGtWcMe8ob6p65mBrWZN4dCY2mYviom
	eW/lFZJrKaZdIBbXcLMlsXlwcYS4u5SQNwRbxmDOG4KB6dNpI28ybdefFLvxCBYtYJ8r5fwt03q
	kKezci1oA4zy8xjX5KTNOWOufeEnOliqa4I6NuMwhGDQMdDm/5HBd1aulxiv9intv3bJvC8qMvJ
	qmUFs6+iYMIGcoNj7ubZhQCvNs6U75w1ON0FyPXB4jcsViWl5FdhWaxJSl1HJ9Mp3oMrfYVP5yh
	nd9DNLkMhA==
X-Google-Smtp-Source: AGHT+IH6Z+DHxmfTB0THiad8h84UNVfaQ7Wmykz0fyCn8uzv/XiXEMhZdpHTCuKzRh2vvihTlptIgw==
X-Received: by 2002:a05:6000:4025:b0:382:31a2:17fd with SMTP id ffacd0b85a97d-385fd532b93mr6685415f8f.55.1733331932630;
        Wed, 04 Dec 2024 09:05:32 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d80a77a0sm17025470f8f.58.2024.12.04.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:05:31 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>,
	Marcello Carla' <marcello.carla@gmx.com>
Subject: [PATCH 3/4 v2] staging: gpib: Fix erroneous removal of blank before newline
Date: Wed,  4 Dec 2024 18:04:43 +0100
Message-ID: <20241204170443.28333-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original commit removed the blanks before the newline
in the protocol string constants to satisfy checkpatch.pl
This broke the driver since it relies on the correct length
of the string constants including the blank.
For example the original
  #define USB_GPIB_SET_LINES   "\nIBDC \n"
became
  #define USB_GPIB_SET_LINES   "\nIBDC\n"
which broke the driver.

The solution is to replace original blanks in protocol constants
with "."
e.g.:
  #define USB_GPIB_SET_LINES   "\nIBDC.\n"

Reported-by: Marcello Carla' <marcello.carla@gmx.com>
Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Co-developed-by: Marcello Carla' <marcello.carla@gmx.com>
Signed-off-by: Marcello Carla' <marcello.carla@gmx.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
v1 -> v2
  Add more details to the commit message
  Add Signed-off by co developer
  Add spaces around assignment
  Fix tabs
  
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 1a8eb3bfb61c..81c110f29e76 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -97,8 +97,8 @@ module_param(debug, int, 0644);
 #define USB_GPIB_DEBUG_ON    "\nIBDE\xAA\n"
 #define USB_GPIB_SET_LISTEN  "\nIBDT0\n"
 #define USB_GPIB_SET_TALK    "\nIBDT1\n"
-#define USB_GPIB_SET_LINES   "\nIBDC\n"
-#define USB_GPIB_SET_DATA    "\nIBDM\n"
+#define USB_GPIB_SET_LINES   "\nIBDC.\n"
+#define USB_GPIB_SET_DATA    "\nIBDM.\n"
 #define USB_GPIB_READ_LINES  "\nIBD?C\n"
 #define USB_GPIB_READ_DATA   "\nIBD?M\n"
 #define USB_GPIB_READ_BUS    "\nIBD??\n"
@@ -587,7 +587,7 @@ static int usb_gpib_command(gpib_board_t *board,
 			    size_t *bytes_written)
 {
 	int i, retval;
-	char command[6] = "IBc\n";
+	char command[6] = "IBc.\n";
 
 	DIA_LOG(1, "enter %p\n", board);
 
-- 
2.47.1

