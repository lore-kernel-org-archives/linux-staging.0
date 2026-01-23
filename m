Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F811F4180
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 05:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147249; cv=none; b=mfgf1AHTq1lNaUGkbh4Cs5R+zqBOhJBFlpZS+2YjckU6JCDVwUJIpgr0gPPqMtuLsNDna1+GMNXUXmD9+SnjkLtjFcOA0PTuwUKyr1wWjMvj1GffJazvrs6YoonQKJYpBYyhJUd+1tWSm1vs9AktwEerS9HDEQgwMmWc6W16E4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147249; c=relaxed/simple;
	bh=jBjebCzVyGhu9pMVkIQMX4aYtoPgjKzFTilzGQofvbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QE7RNEOagNK3fyrgC0ePv6xnoo/NFEoUl1s49jeTJSAR74d9kstT3cbrZx9xvbdKE6tJqfnxmhRYShCczFlWiRFN7p+vh4kjOpJ6eKJqDveS8UZ5R6brD+4OY8KHeMdxhZPLq4WCHUbbYPyPl8mraetO2VeV8SXVexnYVQ5p1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAzwzw+j; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAzwzw+j"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6495d592c45so424302d50.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 21:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769147242; x=1769752042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Opcnc5dGvJWo1BoZUfzlyhcRhD7x8IvfP/BNkkpQwQ=;
        b=NAzwzw+jMhD4nLP+U7JeP7Sj6K48rg4Gp+SvYQQ5vpoURqKCizs8VwFZ9ps+vw64lc
         ua5rPWyD58EGnExq3KEnkotOjXzb2eke1xH1dODV53GYVjL3SIXVEGzpkOKux8i5gpQu
         N96/WYpyENpWjlYyzT1j4DoHoOS3nl0LG/8tWYdmWaDQmJ6/Kui59IgCDnVQxIC1PYgc
         on5dEotEMqAxr5VlqaiCP472MK+Daa0uBOK4gAWjy3nseE8J2RXhMP4DBMbxxZdYsqk0
         1+QOWPn0JM9PXdEzq2Ajx/qzLYi+J0CSjnHap5KQtk0juJika2ta7Mow4IlcYMMqb45d
         CCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769147242; x=1769752042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Opcnc5dGvJWo1BoZUfzlyhcRhD7x8IvfP/BNkkpQwQ=;
        b=UwxrbRnjGUw275LVUyPdx67fgibDM5bh+iQOrfb5ShTVLOnFP3/GH60Wi0Wp1f4GP9
         vM5cQQeL7MHYAgr5n0GKDLUwRGG+D1pDYZTWCVShvWFscYO9J45CLztVTzseAXcgfPIk
         IyfPJVm5i1AJ+2X8Y7bbwRH9SvKuYtxUqihV3Ki3q/s17DXrOz0udJHcMAMAubvfDjca
         FqISsTpS9DsgYfxODyPQiRkRUxbAWswlFFY/0ZCUGyxIH5/tqw00BIgdF7XPGZ9BwWdm
         9Lpz+pD+LGhLESNd1FL5FDwRanYQ3W8aVlE8U4oqo9PSFRHv8yRt77wH5SKvDi0DG2ux
         /Xgw==
X-Gm-Message-State: AOJu0YyBLSkqz9+jlrVCbs7gAgHQT+o9OO3ZdLf/R9jTyajJYwIFV4i0
	pwuS4/K+mHjkZYiz9ytWXMF5STA4Xht7SbJubuwzMvjjoJvIWHHT5fEP
X-Gm-Gg: AZuq6aIUDqjAywHhYNCQxRnCazntU3Nfw7Da9CIWTaU/9/5vWriwXWcfD2L98nOZzzj
	ARWM6Y86fFJtUjogt9yX1tWYMrEE1PQno/W6EvuRs/EQztn+XiCYYn392JrxrpOta2TZqQe9lFN
	I1BZmNqoF3BLEGeY/ouXXtOcRdo2fYWAFRAd8Exv5k5ux0ZBin9lDFFmegzuUEQRSwUylgQpTmI
	xotbdqrSHskMQdmiLEPRsE4B+MvolqlCxoKdmHndb20nU0OjvZgoa4aqtwWjebz/e8kdzdGXq9D
	cb35rESssOvXb3Vz2eTv/K1YoRm9PsTH7c89ehz4ekEySaRkCLnraQp7u281jkHgAsRG7lfpTVy
	Iws+rc5CFmdypkM2HZePYgF388omXJZg6pm6TNq5WIcjUzEci2zVsiZ+trtTxl/wXYyc=
X-Received: by 2002:a53:5011:0:b0:644:60d9:8654 with SMTP id 956f58d0204a3-6495c03c610mr938196d50.87.1769147241756;
        Thu, 22 Jan 2026 21:47:21 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::ab64])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6495cfc1be1sm743385d50.19.2026.01.22.21.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 21:47:21 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v1] staging: most: dim2: replace macro with static inline function
Date: Thu, 22 Jan 2026 23:47:08 -0600
Message-ID: <20260123054708.11140-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe macro with static inline function to avoid side effects.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c0c9..a075a2df349e 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -113,10 +113,12 @@ static inline struct dim2_hdm *iface_to_hdm(struct most_interface *iface)
 	return container_of(iface, struct dim2_hdm, most_iface);
 }
 
-/* Macro to identify a network status message */
-#define PACKET_IS_NET_INFO(p)  \
-	(((p)[1] == 0x18) && ((p)[2] == 0x05) && ((p)[3] == 0x0C) && \
-	 ((p)[13] == 0x3C) && ((p)[14] == 0x00) && ((p)[15] == 0x0A))
+/* Identify a network status message */
+static inline bool packet_is_net_info(const u8 *p)
+{
+	return p[1] == 0x18 && p[2] == 0x05 && p[3] == 0x0C &&
+		p[13] == 0x3C && p[14] == 0x00 && p[15] == 0x0A;
+}
 
 static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -304,7 +306,7 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 
 		if (hdm_ch->data_type == MOST_CH_ASYNC &&
 		    hdm_ch->direction == MOST_CH_RX &&
-		    PACKET_IS_NET_INFO(data)) {
+		    packet_is_net_info(data)) {
 			retrieve_netinfo(dev, mbo);
 
 			spin_lock_irqsave(&dim_lock, flags);
-- 
2.52.0

