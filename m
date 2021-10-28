Received: from klopfer.dv.fh-frankfurt.de (klopfer.dv.fh-frankfurt.de [194.95.81.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0DA2C82
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fra-uas.de;
	 s=klopfer; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KmC2f4hzNEZiAJ2cWt0jfAJBpvzVIJKDeY9QVzfizCE=; b=C8PE2QFEf/bc+ICB+sT5imzsIl
	zTaVbAzvu5WZHjH7wS9HYCABkpjN5Fn80QTtqlE9YufobcTscuEZZx3DN/Il59m78Qxg3SsOGXIMs
	Rnkm/2mpJ3cFHKzyBOzZoIfzKCble+7rhgu+iit8RD+0fxZ0AEwTTJELXPM2qHEFUgwBoBmBPK7u9
	PwyLHYNnQNhmHnwKrf+ucxDwrqMKZ071vhesqNbeMAC68DWqjoUgsqyyyZvhhwXdLxY2OGnb2Wnfb
	eCMW8jVfIjimhlMe4SQhU4IyGgTY+OMt0VsTQszBGJ9XJ5v1wZOtZ6sCOFt8Q5NWzlInguX3YwILv
	Yqy8ZUlQ==;
Received: from p4fc1712c.dip0.t-ipconnect.de ([79.193.113.44] helo=localhost.localdomain)
	by klopfer.dv.fh-frankfurt.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.89)
	(envelope-from <ssivaraj@stud.fra-uas.de>)
	id 1mg7Uy-00042I-4G; Thu, 28 Oct 2021 17:39:24 +0200
From: Senthu Sivarajah <ssivaraj@stud.fra-uas.de>
To: vaibhav.sr@gmail.com
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>
Subject: [PATCH] Staging: greybus: audio_codec: changed a void function to return 0
Date: Thu, 28 Oct 2021 17:38:08 +0200
Message-Id: <20211028153808.9509-1-ssivaraj@stud.fra-uas.de>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>

Fixed a coding style issue.

Signed-off-by: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>

---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..9f99862791dc 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1028,7 +1028,7 @@ static int gbcodec_probe(struct snd_soc_component *comp)
 static void gbcodec_remove(struct snd_soc_component *comp)
 {
 	/* Empty function for now */
-	return;
+	return 0;
 }
 
 static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
-- 
2.27.0

