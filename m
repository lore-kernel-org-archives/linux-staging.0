Received: from cvsmtppost16.nm.naver.com (cvsmtppost16.nm.naver.com [114.111.35.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84BA2EEE79
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912703; cv=none; b=A+uoPp+8unAXg2WVvilW2RpHwPey/h/j8RL30NLb2zBo7AhW2Jp0HiX3zgOyglAUY7g1/gBZTmXXBKhDtfoH7UwCaGnfMlLpQH8FI6zF5ChxU+TG82jVPUI8Jt6VUUq0KyIZIIJXSGGp+rvqPCAb+n57e0k1QV2ma5NlYDMk7ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912703; c=relaxed/simple;
	bh=VC8vbT+0cXzLFnKMo4KP/MJ2YIhtNWWmdyV0W6R6R7c=;
	h=Subject:From:Date:Message-ID:To:Cc:Content-Type:MIME-Version; b=bwz0Sgqn8uHRjVKJDQR/M/OjbTohHwc4WQQv0FkcPTLC7Eo+PDOxFZTI375JN5o8G/noPkVK/b7OwFHhs5j1jQVr2/OAL5rrUbK+yBpTSbUuWOdQiy4Fsi0UGZNRpwEmRPT8V7gg0lOjtMsU9NJm1p+vBYuYSyT8yVoFaBGbSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=iiridj/K; arc=none smtp.client-ip=114.111.35.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="iiridj/K"
Received: from cvsendbo012.nm ([10.112.24.38])
  by cvsmtppost16.nm.naver.com with ESMTP id zi7mM4EqTo2qXLAztdXIOQ
  for <linux-staging@lists.linux.dev>;
  Sun, 20 Sep 2026 13:38:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1789911485; bh=VC8vbT+0cXzLFnKMo4KP/MJ2YIhtNWWmdyV0W6R6R7c=;
	h=Subject:From:Date:Message-ID:To:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=iiridj/K53tV+WYMYnJ4tDXElZv1Fuf+TqxWn9tYUL3ffuRCjOOq8J1EdCoAF49Md
	 P40ouqT+jtfV7zn4MmR5m30+fylYmznO6JPSaZHHGGd9QOJFaq3m+3cv4WyO02iCB0
	 h9LeO8fld2vawiJ+Z03pWxxGoE15uSlRJR4QuufoUHDTyBQL+rOzAYyATodkRH386l
	 eci2l3XaL24jaT78Vx2EtFDqcfIC/0XA/m1wBg1JoKFVrliwsdVEpjGqDtRq71qyaI
	 Gv77AWJXdlPMh/45++rgwayKmtv7IRune1RxGo1vYFCbTssF+wWFAfavdRhvrcnBJO
	 RcE/Je8oGbaDg==
X-Session-ID: 3hEAEuWZRT2xq+O2HmgHSQ
X-Works-Send-Opt: 7mKqaBFdjHmwjApYKHmmKqKwKqbqFxvwjJIFjAJYKg==
X-Works-Smtp-Source: UdbXaAv/FqJZ+HmdaAgl+6E=
Received: from PC2. ([175.193.106.181])
  by cvnsmtp003.nm.naver.com with ESMTP id 3hEAEuWZRT2xq+O2HmgHSQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 20 Sep 2026 13:38:04 -0000
Subject:
 [PATCH] staging: greybus: gbphy: use sysfs_emit() instead of sprintf()
From: ts930@naver.com
Date: Sun, 20 Sep 2026 22:38:02 +0900
Message-ID: <178991148260.29938.9272611738457436343@naver.com>
Reply-To: Park Tae-sun <ts930@dgu.ac.kr>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

From: Park Tae-sun <ts930@dgu.ac.kr>

The sysfs documentation (Documentation/filesystems/sysfs.rst) recommends
using sysfs_emit() instead of sprintf() in sysfs show() callbacks.

Replace sprintf() with sysfs_emit() in the protocol_id_show() callback.

This follows the standard kernel practice and existing use of
sysfs_emit() in other Greybus sysfs show functions.

No functional change.

Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bdb0f5164a6f..bb9a5b538e6e 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
-- 
2.43.0

