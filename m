Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372673;
	b=Td8yjbMAtQNfKacohejtjTwNOeOujhQ3vV3enAVRIDaDBmpv6sdi27z+El8StkskQ8pr
	 RuXOwy789jvw13qysGPz9jWzsn8yb39bYouLvSit+PhhghqE1iuj7tG44FcGwNQHaM8H4
	 X2BUSphIZ7N0hOnPu3eDswd4FPBSIc6zXen9vzxGye2OGPuDFKlUuINjUlolPR6hE2PHS
	 2IYAjU4nxar3I7PEG9fwDmegpdI6jRNL6JYmhqgpIM8LzP/cMV8Ug3+baNj0hlZGPML9W
	 g1g++S6y8sdoEdRjEmtAx2wkKLJecGlK9WJPy/FOoOX6l4qgWoL/Ll32qlFvZMVQv4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372673;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=RQ+EWiIyRhW+UQsDlOuRrwxSPz/sdEOMTt74KYlggiE=;
	b=d6ZsV9uFE1lCyypenIIHMfr+AYBZ+4VwlfPpiVav0zRdsVmB5/pDl1hGdttrdYmvTQPH
	 oyXv4eKcvpEP4iuvkcniPPEYkm3FPHoYJzQD0RWPFQ1y8LI8TcqecF8cFlYV0YHIZvrqE
	 B8HZ0JaTk9EUFsY1IPyE7CWI5/eynbj67WEg2RxC/A+TpvJwdqUtvXUcxb/O922rivGHP
	 COqICJIMR1gSCXmYfQ5QRqb63L7CwhU5LeA61QLfWGjRy7bi5tqkOdKr35ExIqbqEeSVQ
	 wSqqFdldqNQfVV2+zh2iAL5eRtbc23E/aA2kD6W31Eq4ULtTNcwhaE2gwTBvN29lImA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="GzuQ/gCh";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB354606A31A
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 15:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB354606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GzuQ/gCh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RQ
	+EWiIyRhW+UQsDlOuRrwxSPz/sdEOMTt74KYlggiE=; b=GzuQ/gChKDA990t4Jn
	O3VethegJC5hzsWtS6vh15On7eTb1qiPAAn8t2pZx6s/cDDndK1z8Srnmvlr2yez
	gXmzBkdHEGyknD7FLgiUmC5hIS5V2qo4eOkAcpZJvn1ItP324Wn3H+FM5jaQ5eoJ
	cjZhaBoqirjhi91YmSBf6nuus=
Received: from iZbp142fio164970eurit1Z.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P8vbseRq+7D2EA--.26616S2;
	Fri, 30 Oct 2026 23:03:56 +0800 (CST)
From: linfordWu <linfordwu@163.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linfordWu <linfordwu@163.com>
Subject: [PATCH] staging: greybus: fix use-after-free in dump_module
Date: Fri, 30 Oct 2026 23:03:55 +0800
Message-ID: <20261030150355.1809319-1-linfordwu@163.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P8vbseRq+7D2EA--.26616S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw17Jw4DWr1kCr1kZrWkZwb_yoWkXrc_W3
	4aqryxWr1YqanxCrsFyFZxZryIva1xW3Za9FWrKFW3Cay3Aa4xAr1DCry3Xr9rJFW2krn5
	uFZ8ArnIqr1DCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiVyxtUUUUU==
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbCzxx3F2rksdxrggAA35

gb_audio_manager_dump_module() drops modules_rwsem before dereferencing
the module. A concurrent gb_audio_manager_remove() can free the module
between the lookup and the dump.

Keep the read lock held while dumping the module so removal cannot free
it during the access.

Signed-off-by: linfordWu <linfordwu@163.com>
---
 drivers/staging/greybus/audio_manager.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index 118ada9b909..1b91acc084f 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -117,12 +117,13 @@ int gb_audio_manager_dump_module(int id)
 
 	down_read(&modules_rwsem);
 	module = gb_audio_manager_get_locked(id);
-	up_read(&modules_rwsem);
-
-	if (!module)
+	if (!module) {
+		up_read(&modules_rwsem);
 		return -EINVAL;
+	}
 
 	gb_audio_manager_module_dump(module);
+	up_read(&modules_rwsem);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gb_audio_manager_dump_module);
-- 
2.43.0

