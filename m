Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A52EAE0
	for <linux-staging@lists.linux.dev>; Sat, 26 Oct 2024 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729930760; cv=none; b=JEyI0b8G6jBkLYRYtOekwZ+26UA1SbSHCPfDQQGBvZfNjfB9Lid+MtcL9X8k8VvvYkxjjS4zDaA36R55jwXKB5s6ukaPsZdAN+flcGTMmJRXLGvblmNJyht1qxziTjYRMWoPmLeUA87W6d0epOLAm0J6nBBMqEmc+04V1OYlz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729930760; c=relaxed/simple;
	bh=brWIylGKvopFOK+LVqT+lpd7tEjJrbl9Hxfm2H9h6ps=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B7TCOjlNLJiMqsnNujRrhf11Brvaqf8frycFbqK4zJll6n9zwcBIrpjMYcLWRklsLxgWW8X5G6hRirYAhvrmg7lcWrHkxaTDEzpyb6nGC2h8sTHOhLFCuntwwj8gJ9ZqGdIi0+n56ndrbRDKK6Ts9DP/gkCHinjk1K+MCMqyu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XbCFR4QZpz1jvs0;
	Sat, 26 Oct 2024 16:17:47 +0800 (CST)
Received: from kwepemk200016.china.huawei.com (unknown [7.202.194.82])
	by mail.maildlp.com (Postfix) with ESMTPS id 4DB5C1400D3;
	Sat, 26 Oct 2024 16:19:14 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemk200016.china.huawei.com
 (7.202.194.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 26 Oct
 2024 16:19:13 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
	<elder@kernel.org>, <gregkh@linuxfoundation.org>,
	<ankov_svetlin@projectara.com>
CC: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
	<wangweiyang2@huawei.com>
Subject: [PATCH] staging: greybus: fix possible null-ptr-deref in gb_audio_manager_get_module()
Date: Sat, 26 Oct 2024 08:11:53 +0000
Message-ID: <20241026081153.2649890-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk200016.china.huawei.com (7.202.194.82)

The gb_audio_manager_get_module() is EXPORT_SYMBOL, and will return NULL
when incoming parameter id < 0, fix possible null-ptr-deref by add check
for return value.

Fixes: 8db00736d365 ("greybus: audio: Add Audio Manager")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/staging/greybus/audio_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index 27ca5f796c5f..1da8804e61ca 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)
 
 	down_read(&modules_rwsem);
 	module = gb_audio_manager_get_locked(id);
-	kobject_get(&module->kobj);
+	if (module)
+		kobject_get(&module->kobj);
 	up_read(&modules_rwsem);
 	return module;
 }
-- 
2.25.1

