Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E672
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 13:21:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so1125079wml.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZVGRDskmDYPzdeftiEChxL+8pjCbPwDx5dz49Ifopg=;
        b=Q0PCtmR0L6F5btX+R5Hfv9xq5MzN6nGw6J5iuD8a/favIQ5eYGtcvjbNnHrOrwxeRC
         ogScilg8e2dVTmhL3Gs2f3JUuA3uwSEPGA3ANRBMxg2L+QBzWoBkCN+8DKj2/M7S1NZ2
         y5IVFrblsZNGCmQUagP8A57ywq5Mf8IV60ER0w0/GisQQ+/Huyy3sMZDrlmEgBEajExs
         2dzdACx51jp1spYesfW2Q6/ZRvIUtE95aAGs9QMG04lqGPeUB42NYHWPHDhS7FOEiW4k
         kILqb+4bbgpd6f+r0783O7CWJRf90RBR+fQRJpryNEMOKk1dvYEtGaqAtDvj611Ekhm9
         bNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZVGRDskmDYPzdeftiEChxL+8pjCbPwDx5dz49Ifopg=;
        b=DQu69lQwAH3UVVHRRmNBuWnbx0iJBzQ7Vr5C/wp9INuO6ithtF1iQu9zzonpHW8oRS
         9R61CJMQ8Exq1AmhzR5dcRRUtZyIJLx1J1dn4B7F47sWojCsABRRPtZH5GuYFMzh4mlq
         JVuRH+PuRGYKD9TMeSTDYPBOBc7g3U6+b5n4g6khSrwZ9pPKFsSlqjJHH8dXKzzO1ATD
         BmrlSqnXqcy73UP+ux9PONA/EUerKc3lUGa4ZU6bk94JX8KG0ZHMchmYU8yx6Tsf1lfk
         WiSqTFul0ay85bIR9HhCIafaa1oa7zx3BT9uzbYKbiYgQ2SW0b0YFVQ9YBVmw34tlGl9
         99qg==
X-Gm-Message-State: AOAM5300zADI6oYLwmGHcZ+gxmBjfXZlt8zDTISsFpof87U7BYkwYOzE
	tiO38tWmk5ONHu6CK5jgkGpdBtz3c3A=
X-Google-Smtp-Source: ABdhPJzp3tkIzXP6JNiRSbT++SHr3fYHl/ylsd2avLoJ9AHERWYyqr2mcU0dd5Ig+zKdFBaMKOkmGA==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr4052145wmk.96.1628774507441;
        Thu, 12 Aug 2021 06:21:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id f2sm2041006wru.31.2021.08.12.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 06:21:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: replace custom hwaddr_aton_i() with mac_pton()
Date: Thu, 12 Aug 2021 15:20:57 +0200
Message-Id: <20210812132057.22579-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom hwaddr_aton_i() with mac_pton() in core/ioctl_linux.c
and remove the now unused functions hwaddr_aton_i() and hex2num_i().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 40 +-------------------
 1 file changed, 1 insertion(+), 39 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index d059b738b348..38ee41f9d2ba 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -89,44 +89,6 @@ static const char * const iw_operation_mode[] = {
 	"Secondary", "Monitor"
 };
 
-static int hex2num_i(char c)
-{
-	if (c >= '0' && c <= '9')
-		return c - '0';
-	if (c >= 'a' && c <= 'f')
-		return c - 'a' + 10;
-	if (c >= 'A' && c <= 'F')
-		return c - 'A' + 10;
-	return -1;
-}
-
-/**
- * hwaddr_aton - Convert ASCII string to MAC address
- * @txt: MAC address as a string (e.g., "00:11:22:33:44:55")
- * @addr: Buffer for the MAC address (ETH_ALEN = 6 bytes)
- * Returns: 0 on success, -1 on failure (e.g., string not a MAC address)
- */
-static int hwaddr_aton_i(const char *txt, u8 *addr)
-{
-	int i;
-
-	for (i = 0; i < 6; i++) {
-		int a, b;
-
-		a = hex2num_i(*txt++);
-		if (a < 0)
-			return -1;
-		b = hex2num_i(*txt++);
-		if (b < 0)
-			return -1;
-		*addr++ = (a << 4) | b;
-		if (i < 5 && *txt++ != ':')
-			return -1;
-	}
-
-	return 0;
-}
-
 void indicate_wx_scan_complete_event(struct adapter *padapter)
 {
 	union iwreq_data wrqu;
@@ -2512,7 +2474,7 @@ static int rtw_get_ap_info(struct net_device *dev,
 	while (phead != plist) {
 		pnetwork = container_of(plist, struct wlan_network, list);
 
-		if (hwaddr_aton_i(data, bssid)) {
+		if (!mac_pton(data, bssid)) {
 			DBG_88E("Invalid BSSID '%s'.\n", (u8 *)data);
 			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 			return -EINVAL;
-- 
2.32.0

