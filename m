Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FECB187FFD
	for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427263; cv=none; b=BR31rwrrzTVWZesIc3fa9JTHwI48cdZ/A5oHdvW880ritsRMl9teTRUsJ04gS7lEN6oGow+WVY4DSoS0EJNhP2SaUQkcgCDfunZEmpZwkR+d2yqUiLHM2krrCN2XGgtqwu30qKJ8FVRlVW9RKZCjiR4lhq6tnIu7X8VXwe7GaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427263; c=relaxed/simple;
	bh=9a2e+v3FT14bhuAj+QqfdFafJhUg0z4MjKBWadxqB0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pwPFqOQRIBcbIU0FqkVuAr00VtDQ9aRL7jSVYs74rQIgEJLGay65lqWrVC/ma41Wax8DJ1GBum6yGN8oS9Ao+mclI/A0rhnBEmzw+URR678kNftrUuRChYnfckAYYJQ1ZjJ6tg/uZELK9Zs1sdRouLD6SRVlGhBysV0tGgDox+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg+Vgdrg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg+Vgdrg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3c08541cdso1655652a91.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 08:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724427262; x=1725032062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvYT3UWBCKLp8ogLPWqf/Z+jzZrJA9UrUg3fh9E7FtM=;
        b=gg+Vgdrg10pwoQCNe6wLukwF6b73qxkvHi05H1OEOzKq2dZz2gGnxwQd86WIEjKkj+
         I1LmT43+7K/bFoY3P0pThrGsALEmfr5MGGikTt9olUL5pua4Tbxmr66vbhY97JDdCj2F
         oqoXlnWTU0aXsmZsPziIBj9yr+vgyXZWDYVzH/FYfZYLqnF+D1kSm+QQBF/XRNVcG54q
         jbK6aQdmQ9wU2tUQYJuI1+Xli7YrPhwff30aIhnebJJu4oD0DI4FNsAP+8dPXOs+o4DY
         T0CBJqcgiJoBGydnaC3TrkGRLEp7AXuV/chGxQNG6XjYXf+sPunUJx6+yZUxh72VJPD1
         ThPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427262; x=1725032062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvYT3UWBCKLp8ogLPWqf/Z+jzZrJA9UrUg3fh9E7FtM=;
        b=gWxgaQHBtAKhcY+cOi1t2ksJsDFDVio/bHNdULw3Cg1bQJg9X+DYHy8hT+p1K4j4mC
         PM+RHpYNFA70kGyLScGAhZmfLauOSbLxGIk9sP//xzBSbWT2HpYyrHwHGCj63o+ooUvP
         pSBLkwFVS8Ub3zZAVTfssMeX3VFa5oSlaYmG4q82yeFWv/MMAEe5tpCFccoTxHUxKK5K
         JegO3tSXa1GQpvQDDntbabQPtsSCLn8uLlUoG3wOYj1SKnPVIMsHMyWbLveWanSbh6PE
         2G9ytnfLGwuJwtzJvxUzSrXXVWf7EVsX54s//+jBSvif0igW5uP6/YkTu/RSfQaZZRnK
         BrwA==
X-Forwarded-Encrypted: i=1; AJvYcCUtKAOjxh6Xh8c8p0KIWma7YKFrOrJUdvSstp59yUPxuJmLtkJsZ0BQUoJf0DPFdUHs1QKcQi0LkIV87ju2@lists.linux.dev
X-Gm-Message-State: AOJu0YwU03uOBGOIV26PfjkS94AL+7VNDcCqk0p6KC5bwoJ739Zhddwp
	sxnTE66qnXMZmcSxGjzjPk+qcvv11C4AmSEEyK653C/UvBO5J4p6
X-Google-Smtp-Source: AGHT+IFd1+TQM65D80wpYcq/4gnpICwdY2KG3PE3VutyDwjVB0LL6tzDDULZQp/CxaGN9r8zIiKXjg==
X-Received: by 2002:a17:90a:77c5:b0:2d0:d82:60ae with SMTP id 98e67ed59e1d1-2d646d6f656mr2630453a91.37.1724427261685;
        Fri, 23 Aug 2024 08:34:21 -0700 (PDT)
Received: from embed-PC.. ([106.222.233.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb913460sm6550531a91.21.2024.08.23.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:34:21 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	dan.carpenter@linaro.org,
	christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in rtl819x_translate_scan
Date: Fri, 23 Aug 2024 21:04:11 +0530
Message-Id: <20240823153411.74142-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy() with strcat() in rtl819x_translate_scan()
Also Fix proto_name[] buffer size issue to accommodate all
network modes.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Revert the use of strscpy and replaced it with strcat.
- Remove the 'pname' and replace it's usage with direct
operations on 'proto_name' buffer.

 drivers/staging/rtl8192e/rtllib_wx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index fbd4ec824084..ec0c4c5bade7 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
 };

 #define MAX_CUSTOM_LEN 64
+#define MAX_PROTO_NAME_LEN 10
 static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 					   char *start, char *stop,
 					   struct rtllib_network *network,
 					   struct iw_request_info *info)
 {
 	char custom[MAX_CUSTOM_LEN];
-	char proto_name[6];
-	char *pname = proto_name;
+	char proto_name[MAX_PROTO_NAME_LEN];
 	char *p;
 	struct iw_event iwe;
 	int i, j;
@@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 	}
 	/* Add the protocol name */
 	iwe.cmd = SIOCGIWNAME;
+	/* Initialise proto_name as an empty string*/
+	memset(proto_name, '\0', sizeof(proto_name));
 	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
-		if (network->mode & BIT(i)) {
-			strcpy(pname, rtllib_modes[i]);
-			pname += strlen(rtllib_modes[i]);
+		if (network->mode & BIT(i))
+			strcat(proto_name, rtllib_modes[i]);
 		}
-	}
-	*pname = '\0';
 	snprintf(iwe.u.name, IFNAMSIZ, "IEEE802.11%s", proto_name);
 	start = iwe_stream_add_event(info, start, stop, &iwe, IW_EV_CHAR_LEN);
 	/* Add mode */
--
2.34.1

