Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6B2EDD7D
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783149595; cv=none; b=mF7u+HN+ZWeoJx3Biic8BRF5spLkwDSAKwFBQwq+ealZ8YCq9dFGUIshM9vZBLQUxGBn5iUIqKxhg+OJ34ONSjWyALZdADCxbVYAYZVlsZhR5EHZJgG60v/uLN0Pt2osuHMFfYPf+MEuyQ3u96HrmNI10n+J3IqWkiPc2XmhqZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783149595; c=relaxed/simple;
	bh=XOFQ1VSoz8ClvZu74QVU2nepCuDy3Xaw/nKxBxUJkXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzGthlW+pGmhRn9y7jBfXuT9PeMi+oh9vtK7fBGXg6IryzZ/mmIUMQZFVr2TE2Jb9dvKykTAtYGJCDoFRMtOHtI18NhKnK4p6dyuxk6HfnaCdSMyVIGKWVSWalD7f8VcOffMTXRh9ePvAv/ryHoeLAttltUXAqsLnEz/Xl4W7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzdbNWo3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzdbNWo3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381891a9525so1026379a91.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 00:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783149583; x=1783754383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFAcIP7DOWAyvuQhvWswn0mxvtkPsgySjMfSxKhSxwk=;
        b=mzdbNWo3INgOqoF8R79zCf9IbCHnFlFZiAuDM4zRK8lq+SpLMWlDbzNi0rGog1AMdL
         I7zqi+qtE77T4lP9YA6a9TmBrX3/unHFFVhSYF7kRdU0uK7LoL11o2/CiYX6j3wT3PJG
         y6L0Dy+E+O4IJi1OONq64BhKkiPDkSq8WIAujKLXgkiAS+i7lNOBFYjoFnzNYxUnWCVe
         QwUnaPGx1j07sE2xeeoWLCjCIhPrJmwhlDHBaLo9EcA8TYTTAWUrZPYEHa0UiAppUmBB
         pyY9UZdH9rEw8iZeHTdGfbOokwA6YnlMwb7a5+qG+iYlRwBzCnLDnRkUqcLhmsbAbdps
         n8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783149583; x=1783754383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFAcIP7DOWAyvuQhvWswn0mxvtkPsgySjMfSxKhSxwk=;
        b=O456ocWAemLbZjCP3SgKPTWaPKVhJDYpf906GZopryh1XChsTkJsFF5pnWLaYYTWyk
         hKCDmLGkmJsNfrHrz5xbK8+W96oPgl31aHSlJenfZd9XzKxko6SI07gUvoYXWsadxQ2t
         Z57xOl9Cxe8zvVMTPwaywpdRt9y410dLq5OCNBq8fCI1Hzs+tTui1rZFuLx+aGPo2FLc
         +hkKjIyNe8TEKCPRe7klPZeeleNuykOsK2unuepCTc0iFhj81joeeMW4pT05W+5Tr9eW
         N5zF2eYZA0vEr1xYJ2sjc5lXW1eoUUGwUtT6CrgwhQ6W6NVrRieoZEvQoAmj09VeIeRU
         BBXg==
X-Forwarded-Encrypted: i=1; AHgh+RrTRicrEfA+ZCWDXRGQ7xLN9b4HfGmS77NjumS/+sP+s84vO/myZeSmor5xhI87qQlRwqjRJwqrYhPElxii@lists.linux.dev
X-Gm-Message-State: AOJu0YyojRYcuFQG/QH0DfaqC25XIVxFEwYeh9u0F6wzUDtF8mnawVgX
	cjWiTMDSrm3XKfMU6uxxfs5n3xYlir6K1xIB1PHlPkqKYaqk+YO+d9aw
X-Gm-Gg: AfdE7ckjatHA2o8ElnUOJ4g+kwU0kW9+ELNgpJ+WzjJup1iZACt8ih4wqI6JA0ucjAY
	kLij3xG9dz2B0gSGwvBDva9YtXXprUxNWX8632zGHsymr6Cpf9qMdWrE9YKScdNg0oTGp4xG6P7
	R9FeG53iStKMrWzm88F0R1WyT1znE6DsBWT/FKVMOEfK6sPx/vxQhaUq8ZAU8wikUos3ue4WwU2
	GT796hCwLb5id4GuIHdyRXA7WLIxa+ipqioqB5jh1/MiX2sukmRThwk+XN9w4DjEabCw/q4AfW1
	sTiJNUL8sZgg1/0lntWzK5V0ntNe+MJpeI786txkZQVB7FfCAlVtRloEQKgYzC37TTo/qLPUVoz
	U0117oRLnyhoEiEcNmqYc4oG7E8Jygq87XkPdyx+FUoaUSUXM/0uZRAyNn1r3sHtR64HJ05U/CJ
	jsRYthFhEccYs8iUnmoR9YjhKcUC7jtVRLXa0qLPyu2hSKr+GMh2Fs8Ow=
X-Received: by 2002:a17:90b:4c4c:b0:37f:9ce1:7366 with SMTP id 98e67ed59e1d1-3829f4f0e14mr2919837a91.28.1783149582517;
        Sat, 04 Jul 2026 00:19:42 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm9420435eec.4.2026.07.04.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:19:41 -0700 (PDT)
From: adi25charis@gmail.com
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari S <adi25charis@gmail.com>
Subject: [PATCH] staging: greybus: bootrom: power off module on timeout
Date: Sat,  4 Jul 2026 12:49:26 +0530
Message-ID: <20260704071926.6606-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aditya Chari S <adi25charis@gmail.com>

Previously, when a firmware size request, get firmware request, or
ready-to-boot request from a module timed out, the driver would log
an error and free any firmware buffer, but left the module powered
on in a potentially inconsistent state.

Fix this by ejecting the module's interface via the SVC when a
timeout occurs, forcing it to be power-cycled and re-detected rather
than left in limbo.

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..b564d2255 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -54,8 +54,12 @@ static void gb_bootrom_timedout(struct work_struct *work)
 	struct delayed_work *dwork = to_delayed_work(work);
 	struct gb_bootrom *bootrom = container_of(dwork,
 						  struct gb_bootrom, dwork);
-	struct device *dev = &bootrom->connection->bundle->dev;
+	struct gb_connection *connection = bootrom->connection;
+	struct device *dev = &connection->bundle->dev;
+	struct gb_interface *intf = connection->bundle->intf;
+	struct gb_svc *svc = connection->hd->svc;
 	const char *reason;
+	int ret;
 
 	switch (bootrom->next_request) {
 	case NEXT_REQ_FIRMWARE_SIZE:
@@ -82,7 +86,11 @@ static void gb_bootrom_timedout(struct work_struct *work)
 	free_firmware(bootrom);
 	mutex_unlock(&bootrom->mutex);
 
-	/* TODO: Power-off Module ? */
+	/* Power-off Module */
+	ret = gb_svc_intf_eject(svc, intf->interface_id);
+	if (ret)
+		dev_err(dev, "failed to eject interface %u (%d)\n",
+			intf->interface_id, ret);
 }
 
 static void gb_bootrom_set_timeout(struct gb_bootrom *bootrom,
-- 
2.53.0

