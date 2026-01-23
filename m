Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13EF2620DE
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 19:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195534; cv=none; b=QiDdgBUI1i7W0u1Q290jY9jlf7r6OjBZ+Kgp/eNJegMvOIGNKkcRDssX65dRUGsdq2qWnvTWj2OMKVpUSmFf4VZiZVGdtAONW0aDdhPsllhASELcIDV2EUAOWqi5x42OpoFtyNg7eTBI8P+fSX0xOMz1A5SBEFDsnhy6rv7HpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195534; c=relaxed/simple;
	bh=J0mnRO2he91DDoQm01TRVQcaFvzHEGvtQgydeWbwku0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eF5dR/8/js7FfWolOS/SfydiqujHpDtgwt9kGYRYz/gMEYIs9annqwHJCH8u/3vQkNa9z92nqJbBAjtDuQhbDJsNn0FphgUHYEB38y2cTEa14CS0VKw2eZzFgcESl43zok+8FE+qWnGZ6ckVWhNZUJvFw/Ky6tEMU6gWpMs832k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jw9zoMVt; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jw9zoMVt"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6446d7a8eadso2302658d50.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 11:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769195532; x=1769800332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vM8RN8nWA2PYNxkbOoDg7XRLtaAPbNgr57UqjED6wwA=;
        b=Jw9zoMVtnvHYnGzZbwCi21GplvjKqeoVvBRuyiU2C1CKvoAPP7X7PTVeBu8sNbHrJJ
         3kCM3o/2Ypf4lAApUhjZU+Yh/HGA0kRiCNLAlXdjtdtaI+0ZWUjDvwDTIOfZLkYcRRee
         l5dGuQjjdZKcqsiXTGmQzxq2eIFzB1Ca7IF8FDODr8VYU0oSW6FENwhFUM3+RQilBgtN
         MjHB+UZtnITvkzc71AWNYJcDb2QCGZdsU9I8gkEgIL2LUEXhWbLiKDvOXtEzBDC7lwvr
         0wO+yF7McYhIQCIOYzQp8ik2EO/j94Dt/wbmge/cuyqHEixIliK+E0yWYPurAorJUe4j
         dm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195532; x=1769800332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM8RN8nWA2PYNxkbOoDg7XRLtaAPbNgr57UqjED6wwA=;
        b=B+Q9f/wXEA9fTwdZPhryUnK9NjZiwN/9jl1ea03HxzmZkuKp0qkP5aor8R8JiAzL3+
         XDdpd+1dnomYyF0kIZ7WA4DFwDBwLxvnNEBJa6DPjNkPRRkvRQFU0xd3eC1UPuEooZVV
         ggl/HBPkmKo/b/SjZS3FyEOllG3ENQygNCMMD2O7VOs4rQGn/yFZqjz+3Rz960cyFO41
         Vbp5yq7hsxGHKIvYiYW5/+Adp3GPF7Jj1mSBN6V1b/9v5T9amaVrSrnUVmhdx5k8iujy
         wwEy58U5cYLY5ZioQ0vJNul5nSOVRSOTI9CERpgH4K2w1Z/uRr8vw8K1IthqMwUjopyV
         6rAg==
X-Gm-Message-State: AOJu0YyZtaZgD1E4bMdg5NukSs+XHQVdS5mM6saf3fKJGyElFOYZ9AY+
	4BAjlQphKRS7y2WpW6LNlLiU3oaDJN3oVlChI+c6WppiTqNBgYAC8doR
X-Gm-Gg: AZuq6aITNQ9SoY3K/ui0yGO0Ki6XG7EQR3c87QhKcb6lq5FDp/rXOHLCGQWkuuwYvLg
	wKv1KTID+xnGUDRFAzBMygiM5vw0HKEjcS35eRfQr6gl1/FMjugyzkm4E7xl0BFJgjNd/r3rkDh
	wQ41OwKq4lWORkPhqLJdaN1QD1Iq6U2nmTX/6WrC6SQTQ3iSOyxphmfue+TjY3t/EnMWmcSDzbu
	K4t5WP7KAya3hA0RZ6fTl3TwdB0ZJYR/LJlAxTR+xhD6HL4eRb/IO65xmnIlOK39y8NbFqyI1Gq
	px/Qc3kYS9BOgcdNEIx+Seo56oOFlr9u7Wi3rKCUFykg5ZBz50TikjYoZfUzZ+ycEERioFQ3v4i
	Kbn1voK9YuBQJqfNLzgaXIhh4zI+Vj2QaPJwTUvDLtWkxTjIQSNpowch7FznYCesOxIQ=
X-Received: by 2002:a05:690e:1441:b0:646:7da0:3aa7 with SMTP id 956f58d0204a3-6495bf9baa3mr3154300d50.48.1769195531607;
        Fri, 23 Jan 2026 11:12:11 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6495cf9e597sm1557082d50.14.2026.01.23.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:12:11 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: dan.carpenter@linaro.org,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2] staging: most: dim2: replace macro with static function
Date: Fri, 23 Jan 2026 13:11:50 -0600
Message-ID: <20260123191150.3281-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe macro with function to avoid side effects.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
Changes in v2:
- Removed 'inline' keyword.
- Fix indentation alignment in return statement.
 drivers/staging/most/dim2/dim2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c0c9..80af965356d0 100644
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
+static bool packet_is_net_info(const u8 *p)
+{
+	return p[1] == 0x18 && p[2] == 0x05 && p[3] == 0x0C &&
+	       p[13] == 0x3C && p[14] == 0x00 && p[15] == 0x0A;
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

