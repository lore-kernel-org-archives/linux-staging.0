Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0B2DEA76
	for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759059253; cv=none; b=UkwhIQ5gnmvohf8X7bTaJjyG0UHmV07SFDBLGXFQYqfYkksEEJFjq1+n0wVTIw4+rJiWjWw5etVDiuOLFAYbA7VbMHTGUtf2UKJazLPfqwq2VOXrI2+TGIQgTkUCkdGhy0x7Q4oCdUniItP6RNFE0V4aDosKbQ0J1IAY9cclCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759059253; c=relaxed/simple;
	bh=8ddmUCo0RkiFpMjJDEU/SY+VKBZq9Ul1pKd0v1NhVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQsCZveWe0YWLw3wXUBaWFyPETsapuMG8m1BJ8dbqcjm7+0lTeWN04tPK1SQ5oRKFeI5bkefJ54fIm5KzSuY5z5jEB1asPuPw8+OfKgBVSIauJjaQGdU2jbbzgm6rS+ikK++uk0qO6uZT7nl89FJ0ubKPZoPUa8KKwrBQM1Oghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhLwf0zi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhLwf0zi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-41174604d88so1767720f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 04:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759059250; x=1759664050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/brZK5qlrYAwJveH864FfVdXR8sYuWmR704zUR8n1o=;
        b=NhLwf0zi3gOIFO+d16HY0rqj0T7xFp6RCj3c0L+SMufsf4WtUPC4jjweyopj9S8HBy
         jTjrcZ7TQvUspQRyrfJGDa/m2owBdQDFhhk0ha44CzK+w/Xq2XnYox/9QIbhAD55CN7e
         +pFZQX1EDBlDaqEmjo6j/mzbbZWEq6eGazwb9snsmeTaszRnrza1U/wHIwA92btouf1j
         za16TW3ownEREvL5Qy0/poRTKXb7F84YJF0GtEc35w3T9fvBChwaxYPTP522xXpNW5lc
         b9gSOgbrYYn9bb9THmVXtTSnOtOYj1B86dQrpbcQX4mLjS3ST+a6EUN57zmGEgPBeLXB
         3Kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759059250; x=1759664050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/brZK5qlrYAwJveH864FfVdXR8sYuWmR704zUR8n1o=;
        b=HRWjJ/o2DX77U2o4wqWLE3QntoeF1Aegk1pyt/WEq1DDCKY13SXy1bNGekZg6IXjjm
         riEyeaYETws6VEVoCFVTMlf+p1hp7FZz4Y2LLcpGe5RD0G1iGdXOkLtxHeVcndlkV9Ih
         lLh2en2Ew/7qMm/DEQdL+SXWt3Vc+Xaym9M9XENH63wnn/5J9VZA1T5Bx1v27Skuxaam
         8ZfL55wpPlOwuW6yJ9q/tAR3COeOM12P51DNYdlmIpSrzjXDHntH3boAcwtgJ2DZD2zm
         0kQZmROhtXJi7EGpd02KDvo5RlHDPwHZQ3hmYtAc2KEjd9aiFI2Z5+0vzaBjCP0u9efb
         Uyzg==
X-Forwarded-Encrypted: i=1; AJvYcCWwtScj5S3HYce5itH82uLEliqcUvzyk+3Yw7I582syOCNX1NWUaMmF5aKeROOY87b1nEu6X26aUJx6vj2a@lists.linux.dev
X-Gm-Message-State: AOJu0YxAlkUf7aYzYZpLLb/OWjpLS8oKLejUMLzMT4WHuV+vszFcICCT
	tQBdeFGndwZaTpx+JGzn4GWr1wsr+ShFdQmFlUNyWZYE8yqmECBEC8qc
X-Gm-Gg: ASbGncvuFtWR6kE37Bf9GGf7HTbaEpeapNvJyd/vIgds8ENHyeYFAp7AOi2izqW5yLe
	iV2hUHSur7btbVXVJ/fevSBXjULixdBut4FoU/p4aj5hCYGYTmh3pijDxprrYF75hkXoc1DcJ38
	jEp8CMfQskguPK22NAasI77swXJNoWcK9SVedLFN4PeCi+betjFYt2RMLo5Wj0GN23R5YoJtE+c
	D0Z0mqISU5RVlfM46vMgulnO4kMU/3Fi5qTpnUsciCMgMDCnjfzNPyA8fmOmk7n0WuArZ/tI3qU
	Jc+YyxsQRRrBetnmluWGiX40jpTWxSBzIx+gviQmZZjLbIc5SsKIeqfw0leVyg721YTUTdUw1Ul
	LLB88VO4eZeKmByskq1ywVXWqtFFYAtB081fCcFEoI10VFvE4
X-Google-Smtp-Source: AGHT+IGiPWTYWAyv8Lm3Tcc9D4kIBKkJOKajbBpkfo6tPA7baawIt7o7+KctTbkc52CFMBbP2N2Vtg==
X-Received: by 2002:a05:6000:4313:b0:3fd:eb15:772 with SMTP id ffacd0b85a97d-40e44777382mr9306072f8f.9.1759059250377;
        Sun, 28 Sep 2025 04:34:10 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996c03sm187074365e9.3.2025.09.28.04.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 04:34:08 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/2] staging: gpib: Return -EINTR on device clear
Date: Sun, 28 Sep 2025 13:33:59 +0200
Message-ID: <20250928113359.6197-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250928113359.6197-1-dpenkler@gmail.com>
References: <20250928113359.6197-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the ATN (Attention) line is asserted during a read we get a
NIUSB_ATN_STATE_ERROR during a read. For the controller to send a
device clear it asserts ATN. Normally this is an error but in the case
of a device clear it should be regarded as an interrupt.

Return -EINTR when the Device Clear Active State (DCAS) is entered
else signal an error with dev_dbg with status instead of just dev_err.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index ea44a766fda2..1f8412de9fa3 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -697,8 +697,12 @@ static int ni_usb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		 */
 		break;
 	case NIUSB_ATN_STATE_ERROR:
-		retval = -EIO;
-		dev_err(&usb_dev->dev, "read when ATN set\n");
+		if (status.ibsta & DCAS) {
+			retval = -EINTR;
+		} else {
+			retval = -EIO;
+			dev_dbg(&usb_dev->dev, "read when ATN set stat: 0x%06x\n", status.ibsta);
+		}
 		break;
 	case NIUSB_ADDRESSING_ERROR:
 		retval = -EIO;
-- 
2.51.0

