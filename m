Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A93C06
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 23:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781392526; cv=none; b=ahrWAgUG+OeqwaigSItGR7yly/nfDQZXsAbSKAPF37KQAs213+A+aI6OcoPekczJ0g7WBDyygyRG6P47xiAaLrXx/bIJbB1wKCSQG3co3hTHODoT7s7e9yFz+ILO65hgdeq6Vb4vDpDHpuLTJCB2dGFze+3vcGPfKH9ou0Jiuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781392526; c=relaxed/simple;
	bh=FyZjH1MyX7/pa7VvxK2LkaI1RS0Bx3bRlFfg03nh0LM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=meladUDs+V59hQ6/Bf9/jiFoJjG5QIgs0++eYW4kDRhzmJZ4ZwgmsnwiwodEMVCRd2bjfAIYXlyNi72tuFW6kVIV6i9osbXLW9RVpDa9gsmYiYlOj9QND1X9ehbujfYPbD1X8/8Y9BDLOHXVcpfiHGfS4tOxLNc7wlhLKycnUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXifqLhO; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXifqLhO"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-13810b63a1aso5116815c88.1
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 16:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781392524; x=1781997324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BO5MV7SLIIdHIh4Mq17EEekHONi1DPWlEOnVFa9ugME=;
        b=AXifqLhOt253p85MkNmosw7lFT0NnefKI6yMBX9wL4oKVer2e9N1DNP3sPkrTV59Yk
         cwD5odf1aumt6XVJ/dayH+B8J7OFo3PA+HoC2GI18W+ViYRrYnlXr5nF/Mvp5xfNRrvK
         WRzfTm9XSXpinRw/SaGq79ZdDvy8OQ0Fbx4WOPlZfnzCBoUCyCMnXKstNaUN4euKOjkj
         U8x22Gqa/RobA2XsZUaJV/z0ANjadIR9PlY5pJRCF6xefodqh/qGHfubg8UvQk+uPh49
         posVdR8clqD6KpoUMjrlAkcejcSl2MVvh8NW4MjabNBGawAvPca3eS6yErN6xL31OPEC
         8RIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781392524; x=1781997324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO5MV7SLIIdHIh4Mq17EEekHONi1DPWlEOnVFa9ugME=;
        b=SaLFYuJ70Hz7F4Ttsq2Kebl/W7Xa1OndmNaGJ+czuG59UJdrDW8n29paZ87YOOblFS
         Jg61qqQlVFQSQct69jUmbu35myeNFwX1qQB/iFvyBOjCCXJYO09LY4u6dzmB242u10H7
         pinxwEAeWPGfFVUq7R/5Ay/OI+gP0eDCmL3u+M4Xn/2s68XdAHETqo6pFMeDge3dLfIq
         5/LpihUxs6mDbOCpdm6D2NmAIUojsFzcir3TyYjeWPvFGxBMDEYdfoiGJUj4iwSM3OVG
         X8Bs20/WGwgQORyv4Euw0onM1uuLxR4lB3DonfLFJt/psj3Zy8k2i0I5aiCoWD94OBRW
         awNw==
X-Forwarded-Encrypted: i=1; AFNElJ/frMEScg1w/Qo/UtLngKtaE07s5cSDmP27ypwM0R8F7vaLBVkgKrtjjev3b4IzS+Px7RoO21bjslZGgkLG@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3OGBdQh3Vgvc74fTrQknI38ThiVNpC6Gl2Ygd510XODmn/D2o
	29tPjpO6oxPwBsk6LU6rzzK+BsdKHLXtaKcQTdW/f6lM4/4w+e6PR24J
X-Gm-Gg: Acq92OFHhIHDhu7mY/kcNlv92q6jPg6a47EJAp/0+8JpYFzJgSeHo0O4+rER1rXBt5a
	d7mDqf3Vxn9aTa5+Str4DJZx7ps6wFsUe2A9bMB/P1Nc2JGwx2hx0rarkDH511nzphKqVH9s1fM
	UGXXGwdxG2vY3J5tRLxRg5aEUoHyRhRhsNWwTbw5FlOMddFJT+dgxjnu2Eye4DpxRpB3q6f2xXN
	48r+2tNsPuHGBh57uR6wb18f/1O5x18rZXErfV0HRRmoFdxPSv5wdbRorEO+o0POQY4f/9sKl5d
	D/Y5EQviNXEp2T9dlvUk3obiaMpPrxT1o+C6PGsN/wi3YBfcDPi4cLOuoUvGm8rOLFloflUoOae
	amwVaC9rkBEuk22FCrff+bbQofMvuPEEXWrRBiJ2xhbFJEDhtq/qWYPW1QGvfV7Rn5DMX5yzv26
	DhEp7VdFH1/Kr18Ne+u5cQjvivZbyN1j+Vro5THteFO8CESJdwZS9HMfkASkaZ8Y7bNwIFDTVqL
	L4zA87AsDOof44qA/NCduWWY70a2GANo5JcvV0i5QRtoc2HdnCdNo5JM4qZ5H+k3HW0o2uqdjwL
	OzXnvY3JTS7j4aehGQ==
X-Received: by 2002:a05:7022:621:b0:138:4fb:f284 with SMTP id a92af1059eb24-1384bb38d6fmr3673518c88.15.1781392524164;
        Sat, 13 Jun 2026 16:15:24 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b91a4c7sm6220508c88.8.2026.06.13.16.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:15:23 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	linux-staging@lists.linux.dev
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove references to nonexistent CONFIG_IOCTL_CFG80211 option
Date: Sat, 13 Jun 2026 16:15:10 -0700
Message-ID: <20260613231514.145336-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comments in the rtl8723bs driver contain references to
CONFIG_IOCTL_CFG80211, which does not exist in the kernel. Remove these
references.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index ac3ba746b64c..d45258e4dea3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -217,12 +217,12 @@ struct mlme_priv {
 	u8 *wps_beacon_ie;
 	/* u8 *wps_probe_req_ie; */
 	u8 *wps_probe_resp_ie;
-	u8 *wps_assoc_resp_ie; /*  for CONFIG_IOCTL_CFG80211, this IE could include p2p ie / wfd ie */
+	u8 *wps_assoc_resp_ie; /* this IE could include p2p ie / wfd ie */
 
 	u32 wps_beacon_ie_len;
 	/* u32 wps_probe_req_ie_len; */
 	u32 wps_probe_resp_ie_len;
-	u32 wps_assoc_resp_ie_len; /*  for CONFIG_IOCTL_CFG80211, this IE len could include p2p ie / wfd ie */
+	u32 wps_assoc_resp_ie_len; /* this IE len could include p2p ie / wfd ie */
 
 	u8 *p2p_beacon_ie;
 	u8 *p2p_probe_req_ie;
-- 
2.43.0

