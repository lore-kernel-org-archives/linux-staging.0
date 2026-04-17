Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930134EEE3
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394981; cv=none; b=LKu48Yn5BdBzgXy3ePpTR8YUMKYuHlMTnEmYTkuRt9v1OEpDK27z9qp0ZrwYYuO/AuDmS8tJWLeUpdm4JQrmaX+amyt90kSLrH1TSr/Vrgq1y8uU5csRKj2Yu9u6mwlNcH8QgH494NMJvOxaxawCtqEuR/53C0xlCWksife+zTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394981; c=relaxed/simple;
	bh=f1VpgAuRFjAB6eoW8D6yTIh5CxnI/XQ9GddAe5a7FWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yg1qrUG241tdGQnW0GUPVR5fVhzIg6Y7280jt/ChYHODTKM3CnBWPTsQJPWsamDF2RZh6gT/uxs740kNLdoJQnpd2MDUJKBKHosgGUud4wbCj7z0MtdDL26jk/zHcNvCNAA3vnuIofEKoaH4OoRniyxYDwv9jIQR0ZojVzMuaDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6qX9m6I; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6qX9m6I"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so1176939e0c.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776394977; x=1776999777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7KTE4O+2+d+2qHtwnX+mTdh1bXJy9Vw8u/PEwC7xVE=;
        b=m6qX9m6Iu8vMaZi1+JQrjiN7itQ4eXJPDoROFXEC1aR5ltLvNWXh14h3moTLfy6hdm
         DQoFi6KbYRv+wmkiUcQhVSIHeb8uBBphgjS8mPDLycjT1dEig5ZULR6tTBzkoH4wEad5
         DS9nK2E34gWMg/QpupdauHkqkUPK2GrNGwDgdZSvcODuiOM0/xNmiSvAdjFPE0Wbjkx8
         k6oo/nL60fV6tJXIiRpsH9tRIDRV+4zmqEJyO+88C8H5rJH6rcLI90HW3lhgi5LvpS/Z
         Ku6L40d86aR9hC4wBxqImbRuZEI/R2iIZeuJaJfL31ugDmeXhVHFMAYQuQcVKnjy7/BO
         v++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776394977; x=1776999777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+7KTE4O+2+d+2qHtwnX+mTdh1bXJy9Vw8u/PEwC7xVE=;
        b=dhuw6n99YLps/wPDIWzZ/MWHH+PHJDt4EzVgwLw+rs1Kmqk4QPuRVV3Q3ikBHn9EVp
         txEiOrorFRN0NEMalEUOB12D9Ry53M7lm8MIN2/KZ65l1mrHxVNVGMoEzVrKUxk4z+9N
         MW4+LWyD3wZkdGRLjf3Q4q2+A9h9W4xPXxNC9JjSIswMgPH1EPlBjvAfJzethRV/szVB
         ee4zx3f3DyicAnwVH+Y2wiRpOUsRwrjuQENsEIqJhCLMMulTfYb99fugBPz8HiTAN4Ki
         /fVRBOTY3YnpO/3yE7E94iLFoWUgRlyK2QIaJVTTjE36GSa1BLoiBKzuPd7bxGOzpvt8
         9/pA==
X-Forwarded-Encrypted: i=1; AFNElJ9DwCJvDOnpp8f1lx+3hCbsMmQSrkNhG86XZ/0LkfTnDAk20JOZ408/0PzJvfoETqcZ2MG+1CjJXok5eM8s@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlq2o1wiRd3ID7wfIUWO4W7J171lwZ5rWvbBlZqXslWKu1bdC+
	YEY7BYasL1fz/+o17wZuI6F+KTeay4WGNpwpFjPLToWoIdDwFUFfJhbA
X-Gm-Gg: AeBDietcLe8vrVKhC1SYqj5uP1Zf6i0dy9GkYMcuRRZiqL6xKQCn3ShgsYSps0bxwpq
	q3I6OlAkxa11X+kR1Tj570/WbHCGmWScPZfe3lDQvcpgL9WfOO5rh5Pzc3NwuinFduqsvHtrCBy
	9oJr2BX/KN4BreBNlz+ggHACwLdGyTBlKleAfEl8ZrXgHN0hs5UH3BBc9wVaafvJe+Fp2xaivAu
	bUf8w4csHnmEMlktIKDpmRi/lyrBUeDIC1zmOiK6IP4s7uo0yWvvem+vS0qMH2yWQrlRr48DpSK
	dE0OcKhG/FDl249uhiNj5LlG8tY/kLZ3fmXM78eX1Ghwm77j8tBLXCS0Y/yWX8B97f+dTQhDLv+
	/Uil9udskpNJL95vCS5w7pody6ejjszAFsk8DeII+LmZXBxbg0uWBDmiuLnIPaAdybvisDDTCQN
	K6nd3Hi8MacSTDmriR43R3WSKO8YBU4dYvw1LnTYMFRXc5u/HmRX9q
X-Received: by 2002:a05:6122:168f:b0:559:6788:7b55 with SMTP id 71dfb90a1353d-56fa6673f07mr350594e0c.3.1776394977018;
        Thu, 16 Apr 2026 20:02:57 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm131275e0c.13.2026.04.16.20.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 20:02:56 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v5 3/5] staging: rtl8723bs: fix out-of-bounds read in portctrl()
Date: Fri, 17 Apr 2026 04:01:08 +0100
Message-ID: <20260417030110.42991-4-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417030110.42991-1-delenetchior1@gmail.com>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In portctrl(), when 802.1X port control is enabled and a non-EAPOL
frame is received, the ether_type is read from the LLC header
without verifying that the frame actually contains enough bytes to
hold the MAC header, IV and the LLC header plus two bytes of
ether_type. For sufficiently short frames, the memcpy() that loads
be_tmp reads past the end of the receive buffer.

An attacker within WiFi radio range can exploit this by sending a
crafted short frame. No authentication is required.

Validate the frame length before dereferencing the LLC header and
return early on short frames and on non-EAPOL frames, rather than
staging the result in prtnframe.

Found by reviewing length validation in the receive path.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v5: return NULL directly on the short-frame and non-EAPOL
    error paths instead of staging the result through
    prtnframe (Dan Carpenter).
v4: add Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did
    not apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 40884788a30d6..b11982fbe7e1f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -537,20 +537,25 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 			/* blocked */
 			/* only accept EAPOL frame */
 
-			prtnframe = precv_frame;
+			/* Ensure frame has LLC header and ether_type */
+			if (pfhdr->len < pattrib->hdrlen +
+			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
+				rtw_free_recvframe(precv_frame,
+						   &adapter->recvpriv.free_recv_queue);
+				return NULL;
+			}
 
 			/* get ether_type */
-			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
+			ptr += pattrib->hdrlen + pattrib->iv_len + LLC_HEADER_LENGTH;
 			memcpy(&be_tmp, ptr, 2);
 			ether_type = ntohs(be_tmp);
 
-			if (ether_type == eapol_type)
-				prtnframe = precv_frame;
-			else {
-				/* free this frame */
-				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
-				prtnframe = NULL;
+			if (ether_type != eapol_type) {
+				rtw_free_recvframe(precv_frame,
+						   &adapter->recvpriv.free_recv_queue);
+				return NULL;
 			}
+			prtnframe = precv_frame;
 		} else {
 			/* allowed */
 			/* check decryption status, and decrypt the frame if needed */
-- 
2.43.0

