Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6D1A8F84
	for <linux-staging@lists.linux.dev>; Thu,  5 Dec 2024 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733391291; cv=none; b=RLFwlFRlwKrWXhnUTVCzjP0DcCDy2KCzz3jdujca0FeNzF/7/F43fz7foxzfWaIQDCobkwZyRm6OWRmyUfawLHoHUYB/9FFVKlggWlP0J0eLnUO+UHtNowsUv3luyD3zbZUjIB7uFfqXvTI1GK5SguNtskNthig4MbbliF70+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733391291; c=relaxed/simple;
	bh=rltCx31fQpuLz7eccLuZZQoglSA0TqpZcDzEc45bE4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uHZ3tNPG8cW0J6yE0GRl1xE5m8u6+kmdxcclzlGY7pk5GsmRmC5USztyCj82RN77HH5GfjAB3LZHwUsZIPHmPT1kdt03gj7ttExmN2dd/Qcy87zW54fK092MwW/52B8Ev+aB3n6i5JNFSc5ofNNZLSWLOnfVWbasmIKpUjoRbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRqs2qMi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRqs2qMi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385df8815fcso320748f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Dec 2024 01:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733391288; x=1733996088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+97jMlCI1D0FZdR3+nbrjK/zuRlNUinJNWb46g4mfk=;
        b=VRqs2qMie0d9tEezYZojnMj2XwqhvyQdPc/+yE7ceX1+SsV+vAjxWWc/pSIoL7KJSV
         uHeZqyDhKZnYnklzwb+ddCTl7XonhnpOCyW4MX863iZoZ3XBWgB+bV5aPUfVRDVjqFm9
         r8YUyNA4FFCYhE1Qc7j620ayeQ3KcJ1ACy/2ZFrUsRV2ldroRPYrXdA8mExHUj/Zeij3
         bsk8Mzs0yy4maHGBfOLd2INbwQ10XivtZosrYCp+qM2uAMS6zC2yWcvfXvSN0fos579E
         m5mR5OdDBH0sTLg8++KXZrrQqkYFXAAXMoUTGw1z/AqGvVAHwK5ka5nm59N3nUNwyEA2
         27XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391288; x=1733996088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+97jMlCI1D0FZdR3+nbrjK/zuRlNUinJNWb46g4mfk=;
        b=Ms1nTHE6TWDL1Zc/KWEqWnOw500ezntptRDeZeDEJGb0LEi7PDcJl2henoVmOydDL1
         B0Wa5Ivg7vyuYT6AsVEAxWqKREG4GIw19m8asTDDUzNRqXdRFIguIal6NV7s/m4DLhrB
         FCahHrvOSWQ/952v1xynlcfP8sdXggM94kjp3GOvZpGu0pf/vyr+RqZ4YBfR/V09LDWR
         XaJupAl4N4XLSXSsSvfAXBTihn94Fb9Y3XBGg44Su3dYtdQ3ViCIKzPWa2xo9386wT4C
         I8WjCMCdrRlPghzBNSmz69t07KlC549zjMadMQt3E2SqRW/mLy0pHFZ7hgC1IkCWeI2p
         ZYpg==
X-Forwarded-Encrypted: i=1; AJvYcCX49ElTKKPXLkUqsG8M85UzCx7iJVvjgWE+03cjBAC0cWjKos5uIsM36LCq092mNIuha8lY/H9s5pdrX/MZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxVUCoCk1pHceFiGo7ePpN9Y92ttDwxlJsTSJRXfNpGTM46dZES
	uBJWznQgjfZYqKKi93kQaxpQp3He0In2RfvF3nPInmWZFDKDqFKt
X-Gm-Gg: ASbGncsHpMmJ/Tl0JQLb07iuoumzQ8qMNbxTYbwSnyHQqu96gpTdc2/JBJ/Cw/KRbjG
	HAOqNTxL5Z57O1mnXS/E2O2fDFOTcXSTzbVi9FN536k7zYpG7TMqfF3EIS5vDdjplmM9fJKvZpJ
	IwFQx9XYlfhUpRpxjWhUYavt+S0NLBm479Bhh7TdNeFHmmZV8saB4GUE7F56dDU2cp6U5p0pef3
	r07z/vPL49OdJmk4oeYAYd752tJp7/YZIMySqchIrO/mDBV9UTiYRB42AczCxkX9CEcA6Tv3H6+
	mHu7PIsCVw==
X-Google-Smtp-Source: AGHT+IGUbXbtXietuD43WTiX3xy6XxjT74K3zkI7eAyzgT8YxfTeQEjW0q/cIz9TwN/uMg9xMlFz7g==
X-Received: by 2002:a5d:6d89:0:b0:385:e429:e59a with SMTP id ffacd0b85a97d-385fd3f2febmr7339380f8f.25.1733391286595;
        Thu, 05 Dec 2024 01:34:46 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a8758sm1428180f8f.27.2024.12.05.01.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 01:34:45 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>,
	Marcello Carla' <marcello.carla@gmx.com>
Subject: [PATCH 3/4 v3] staging: gpib: Fix erroneous removal of blank before newline
Date: Thu,  5 Dec 2024 10:34:42 +0100
Message-ID: <20241205093442.5796-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB_GPIB_SET_LINES command string used to be: "\nIBDC \n" but when
we were merging this code into the upstream kernel we deleted the space
character before the newline to make checkpatch happy.  That turned
out to be a mistake.

The "\nIBDC" part of the string is a command that we pass to the
firmware and the next character is a variable u8 value.
It gets set in set_control_line().

 msg[leng - 2] = value ? (retval & ~line) : retval | line;

where leng is the length of the command string.

Imagine the parameter was supposed to be "8".
With the pre-merge code the command string would be "\nIBDC8\n"
With the post-merge code the command string became "\nIBD8\n"

The firmware doesn't recognize "IBD8" as a valid command and rejects it.

Putting a "." where the parameter is supposed to go fixes the driver
and makes checkpatch happy.  Same thing with the other define and
the in-line assignment.

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
v2 -> v3
Adopt and adapt the more explanatory commit message kindly
provided by Dan Carpenter

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

