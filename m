Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692753DE44E
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914834; cv=none; b=grZw4CmXR5cZj6nrCgIeveTv0fAzuhrNB+hm8bI2txkemuU+glwK33pzu98kvpB2buFhyiVFFrBLEAstM03T/b0/l/cpOW7Vw5Wdf6l/MqQgPSM1VZMrrAlzJKEV22DyOdwimuDZhohNj5jWB5AGk9pR9X+OLqKAD19uEcGZFN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914834; c=relaxed/simple;
	bh=j8i04D00ioHsprik3B8EdTafBAqo3Lytp2sXnUpJRu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d7L9fcxRV+0h0oVidenMjZAZMy02Zj50ilRazv1qTHd2tBCu0hK3ZlHW0iQCWBcn7O//t2DloKxepDVwZBkhwhF8RdaqBnIIdoNxPOiF/+as+0TYAC4HOrtuyabCpiStsw9foHkF8tL5DEtWpeb/p8rpLdj19z6E9yhtIWMcaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2uoJQd0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2uoJQd0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so29963615e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777914832; x=1778519632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVyX/l6EVBhcYm4HveFR/2Y6ddEwga1Q1M3z5qjkJEA=;
        b=Q2uoJQd0TITATRimnyK42Au/RaiJhcwZHhsKBwsB9u3lYsFzfj+m1zMW8WbnGnITfl
         uEGzBUpsL9sn8ncXrnxIOrteHnHOrDaXfFqN7v7/NZIlEOwFKLQ+LKDSFQyYCsmPgBpd
         I8x9WXbCcpZlW0s9p9G7hExOaBQPo5v38Q60AJMVgAi1uVPpSZPdy46A/hi3UTN9EJd7
         L1173b62K3BMpGdhni14c/8Fa2qezWZwp3WxM/fmLaT81G5KTRYMSRbTyEsQgjOZpV+2
         Q76b815BCzCBYCTWxsicpE45Q8PwDHZyeJn3GABzNeiDaqUZ7S685H88dGj6fj7K+oQE
         PAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914832; x=1778519632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVyX/l6EVBhcYm4HveFR/2Y6ddEwga1Q1M3z5qjkJEA=;
        b=etsE+5+vDNreny2mFcgFFCUc2EQwAgZ27UrYaRzgp0kVVhDTgotUSnRHy35I+7lMHD
         BchLdhJQIy+qZNa2Bkn01Kk2VlIiutFdW4hn8OrfVwpbUo1tQZ7GM7nMpUKYIN2EgFbT
         2iZGInD4f+AuZ+rgJwawIxocPYU+7vD5Q0PKhtCxU/hVpTufqkW7EQ3m0ZvZKZ3UsLB1
         DXIHv0Dt4yzRkTBorI1JSwQJ7U6VWFgIdR2N+QbjqskSd5sYD5x7RskOvyEN7nHOf6Fj
         k8F/nhiePAdyiWIjJNYjogJPwO35yn6VMDnuGYXPu5QpTMQ5snF1ZQte5X3jkCA2Zct5
         l2rQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ostKzraUYqQDcVZ55yDH6opjYqfW2092/mZZtpq0DWBAKLHw6Q5I9I+ZxkXT47R3yVP6DkuWET9TJR9lJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxCauVmo+tV0RSq79JkDFfKJTEuAgkRPUJ8wXM+BvUq/GQT1+1E
	BlbLtw/m61gbqAGFJCryzZTZhqEtEPv2QH8dORcTwVt67g1PoHvS+hSY84CglMiM
X-Gm-Gg: AeBDieuGN93zwSQp7I2I11sAaTGOtCPTt4uF/RwWJuuAX2iiiPviX0PSjjd1x6mFZA5
	xf//Qj1bwHrIJWLTnRrGkyNhSKf0ku/mg3av4w9gROz/hLUmvsIEJ85BpH72bdUKTkh28+edpZU
	f6A6EIAu1KySHs8AoV5cF70p3oQ7F8P4Fv8YCPhMK/e+0TpL17bHuRXdMFwbBXTpsMmvyLAEjx+
	KyrKUseSW8G0VznbPJIHrioLPekPvw5m29F/aQwQ6a/GibVDDGLxNwIavAkmgp8IurJQFKSej26
	aVKoq2IVNfb32ykJnQn0/wqn8G7YuL9xPpOxBGv+Hi3+5aPKUxFHXoswgyGe+8bTXCeoJ6dbA1O
	uxfwvkZJvyjoxyLjC+4HaKqRkykK25Mn+W69h5sL+f1iv08qrbFe1iDD9VVMmeixsmb1kA0UM5/
	8+qJ4s4+Gb6sHBQ2FvtKoieYRTD1RbaleEtFq/cZOLBRVf4HrfIz/pB2DTdNZ47rUQQOQHCwVoc
	Z5Ur9IF
X-Received: by 2002:a05:600c:4186:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48d14260d69mr3945825e9.11.1777914831633;
        Mon, 04 May 2026 10:13:51 -0700 (PDT)
Received: from localhost.localdomain ([105.39.209.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm603830925e9.2.2026.05.04.10.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:13:50 -0700 (PDT)
From: Khaled Saleh <khaled.saleh.req@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	khaled.saleh.req@gmail.com
Subject: [PATCH] staging: greybus: split gb_audio_gb_get_topology()
Date: Mon,  4 May 2026 19:13:30 +0200
Message-Id: <20260504171330.83727-1-khaled.saleh.req@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split gb_audio_gb_get_topology() into smaller helper functions
to improve readability and maintainability.

No functional change intended.

Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..b5ead09532c8 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,13 +8,10 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
@@ -22,10 +19,24 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
+	*size = le16_to_cpu(size_resp.size);
+	if (*size < sizeof(struct gb_audio_topology))
 		return -ENODATA;
 
+	return 0;
+}
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology **topology)
+{
+	struct gb_audio_topology *topo;
+	u16 size;
+	int ret;
+
+	ret = gb_audio_gb_get_topology_size(connection, &size);
+	if (ret)
+		return ret;
+
 	topo = kzalloc(size, GFP_KERNEL);
 	if (!topo)
 		return -ENOMEM;
-- 
2.34.1

